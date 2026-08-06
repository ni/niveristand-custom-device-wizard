using System;
using System.Collections.Generic;
using System.Globalization;
using System.Reflection;
using NationalInstruments.VeriStand;
using NationalInstruments.VeriStand.SystemDefinitionAPI;

namespace NationalInstruments.Veristand
{
    /// <summary>
    /// Evaluates group name expressions by replacing property names with property values.
    /// </summary>
    internal class GroupNameExpressionEvaluator
    {
        /// <summary>
        /// Evaluates a group name expression by replacing property names with values from the specified node.
        /// </summary>
        /// <param name="groupNameExpression">The template string containing property names (e.g., "{PropertyName}" or "{{Parent.PropertyName}}").</param>
        /// <param name="currentNode">The node from which to retrieve property values.</param>
        /// <returns>The evaluated group name with all names replaced by actual property values.</returns>
        /// <exception cref="VeriStandException">Thrown when a property cannot be evaluated.</exception>
        public static string EvaluateGroupName(string groupNameExpression, BaseNode currentNode)
        {
            if (string.IsNullOrEmpty(groupNameExpression))
            {
                return string.Empty;
            }

            var evaluatedGroupName = groupNameExpression;
            var index = 0;

            while (index < evaluatedGroupName.Length)
            {
                if (evaluatedGroupName[index] == '{')
                {
                    // Count consecutive opening braces
                    var braceCount = 0;
                    var braceStart = index;
                    while (index < evaluatedGroupName.Length && evaluatedGroupName[index] == '{')
                    {
                        braceCount++;
                        index++;
                    }

                    // Find the property name (everything until we hit closing braces)
                    var propertyStart = index;
                    var propertyEnd = index;
                    while (propertyEnd < evaluatedGroupName.Length && evaluatedGroupName[propertyEnd] != '}')
                    {
                        propertyEnd++;
                    }

                    var propertyName = evaluatedGroupName.Substring(propertyStart, propertyEnd - propertyStart);

                    // Verify we have matching closing braces
                    var closeBraceCount = 0;
                    while (propertyEnd < evaluatedGroupName.Length && evaluatedGroupName[propertyEnd] == '}')
                    {
                        closeBraceCount++;
                        propertyEnd++;
                    }

                    var propertyValue = GetPropertyValueFromNode(currentNode, propertyName, braceCount);
                    evaluatedGroupName = evaluatedGroupName.Substring(0, braceStart) + propertyValue + evaluatedGroupName.Substring(propertyEnd);
                    // Reset index to account for the replacement
                    index = braceStart + propertyValue.Length;
                }
                else
                {
                    index++;
                }
            }

            return evaluatedGroupName;
        }

        private static string GetPropertyValueFromNode(BaseNode startNode, string propertyName, int parentLevel)
        {
            BaseNode targetNode = startNode;

            if (parentLevel > 1)
            {
                var parentsToTraverse = parentLevel - 1;

                for (int i = 0; i < parentsToTraverse; i++)
                {
                    if (targetNode is CustomDevices)
                    {
                        throw new VeriStandException(ErrorCode.UnexpectedError,$"Group name expression does not support properties of custom device ancestors.");
                    }
                    var parent = targetNode.GetParent();
                    targetNode = parent;
                }
            }

            return GetPropertyValueAsString(targetNode, propertyName);
        }

        private static string GetPropertyValueAsString(BaseNode node, string propertyName)
        {
            string value;
            value = GetPropertyValueByReflection(node, propertyName);
            if (!string.IsNullOrEmpty(value))
            {
                return value;
            }

            return string.Empty;
        }

        private static string GetPropertyValueByReflection(BaseNode baseNode, string propertyName)
        {
            try
            {
                var csharpPropertyName = ResolveCSharpPropertyName(baseNode, propertyName);
                PropertyInfo property = baseNode.GetType().GetProperty(csharpPropertyName, BindingFlags.Public | BindingFlags.Instance);
                
                object value = property.GetValue(baseNode, null);
                return ConvertValueToString(value);
            }
            catch (Exception)
            {
                throw new VeriStandException(ErrorCode.UnexpectedError,$"Failed to read value for the property '{propertyName}' from the '{baseNode.Name}' node.");
            }
        }

        /// <summary>
        /// Resolves a user-defined property name to its corresponding C# property name.
        /// </summary>
        /// <param name="baseNode">The node to query for property mappings.</param>
        /// <param name="userPropertyName">The user-defined property name.</param>
        /// <returns>The C# property name if found; otherwise, the original name.</returns>
        private static string ResolveCSharpPropertyName(BaseNode baseNode, string userPropertyName)
        {
            var propertyMappings = GetPropertyMappings(baseNode);
            foreach (var kvp in propertyMappings)
            {
                if (string.Equals(kvp.Value, userPropertyName))
                {
                    return kvp.Key;
                }
            }

            return userPropertyName;
        }

        /// <summary>
        /// Retrieves property mappings (C# property name -> user-defined name) from the node.
        /// </summary>
        /// <param name="baseNode">The node to query.</param>
        /// <returns>A dictionary mapping C# property names to user-defined names.</returns>
        private static Dictionary<string, string> GetPropertyMappings(BaseNode baseNode)
        {
            var methodInfo = baseNode.GetType().GetMethod("GetAllUserDefinedPropertyNames", BindingFlags.Public | BindingFlags.Instance);
            if (methodInfo?.ReturnType.IsAssignableFrom(typeof(IDictionary<string, string>)) == true
                && methodInfo.GetParameters().Length == 0)
            {
                var propertyMappings = (IDictionary<string, string>)methodInfo.Invoke(baseNode, null);
                return new Dictionary<string, string>(propertyMappings);
            }
            return new Dictionary<string, string>();
        }

        private static string ConvertValueToString(object value)
        {
            if (value == null)
            {
                return string.Empty;
            }

            if (value is bool boolValue)
            {
                return boolValue.ToString(CultureInfo.InvariantCulture);
            }

            if (value is IFormattable formattable)
            {
                return formattable.ToString(null, CultureInfo.InvariantCulture);
            }

            return value.ToString();
        }
    }
}
