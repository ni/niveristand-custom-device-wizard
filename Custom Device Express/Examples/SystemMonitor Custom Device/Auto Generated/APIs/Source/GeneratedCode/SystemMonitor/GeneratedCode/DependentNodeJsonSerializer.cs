using System;
using System.Collections.Generic;
using System.Linq;
using NationalInstruments.VeriStand.Compiler;
using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using Newtonsoft.Json.Linq;

namespace NationalInstruments.Veristand
{
    internal static class DependentNodeJsonSerializer
    {
        public static JObject FromObject(BaseNode resolvedDependentNodeObject, Dictionary<string, string> userDefinedProperties)
        {
            if (resolvedDependentNodeObject?.BaseNodeType == null)
            {
                throw new InvalidOperationException("Dependent node path is not resolved to a valid node in system definition tree. Verify the path is correct.");
            }

            var result = new JObject
            {
                ["Path"] = resolvedDependentNodeObject.NodePath
            };

            var nodeType = resolvedDependentNodeObject.BaseNodeType.GetNodeType();
            result["NodeType"] = nodeType.ToString();

            switch (nodeType)
            {
                case NodeType.K_CHANNEL:
                    SerializeChannelNode(result, resolvedDependentNodeObject.BaseNodeType as ChannelType);
                    break;
                case NodeType.K_WAVEFORM:
                    SerializeWaveformNode(result, resolvedDependentNodeObject.BaseNodeType as WaveformType);
                    break;
                case NodeType.K_ALIAS:
                    var aliasNode = resolvedDependentNodeObject.BaseNodeType as AliasType;
                    var referencedNode = aliasNode?.ResolveAliasReference as ChannelType;
                    if (referencedNode != null)
                    {
                        SerializeChannelNode(result, referencedNode);
                    }
                    break;
            }

            var targetObject = SerializeUserDefinedProperties(resolvedDependentNodeObject.BaseNodeType, userDefinedProperties);
            result.Add("UserDefinedProperties", targetObject);
            return result;
        }

        public static DependentNode ToObject(JObject jObject)
        {
            if (jObject == null)
            {
                return null;
            }

            var path = jObject["Path"]?.ToObject<string>() ?? string.Empty;
            return new DependentNode(path);
        }

        private static void SerializeChannelNode(JObject result, ChannelType channel)
        {
            uint bitField = channel.BitFields;
            uint isWritable = bitField & Channel.K_WRITABLE;
            var channelType = isWritable != 0 ? CDChannel_Type.Input : CDChannel_Type.Output;
            result["Type"] = channelType.ToString();

            result["Units"] = channel.Units;

            var deviceID = GetDeviceID(channel);
            ChannelLookupUtils.GetChannelDataReference(channel.ID, deviceID, channel.IsWritable, out var channelDataReference);
            result["ChannelDataReference"] = channelDataReference;
        }

        private static void SerializeWaveformNode(JObject result, WaveformType waveform)
        {
            result["DataType"] = waveform.DataType.ToString();
            result["Units"] = waveform.Units;

            waveform.GetI32Property("_rt.Wave.Offset", out var waveformDataReference);
            result["WaveformDataReference"] = waveformDataReference;
        }

        private static ulong GetDeviceID(BaseNodeType nodeType)
        {
            ulong targetID = 0;
            var parentEnumerator = nodeType.TravParentEnumerator;
            while (parentEnumerator.MoveNext())
            {
                var currentNode = parentEnumerator.Current;
                currentNode.GetU32Property("CD Status", out var cdStatus);
                if ((cdStatus == 1) || (cdStatus == 2))
                {
                    return currentNode.ID;
                }

                if (targetID == 0 && currentNode.GetNodeType() == NodeType.K_TARGET)
                {
                    targetID = currentNode.ID;
                }
            }
            return targetID;
        }

        private static string QualifyPropName(BaseNodeType baseNodeType, string name)
        {
            if (baseNodeType.Properties.Any(x => string.Equals(x.Name, name)) || baseNodeType.TempProperties.Any(x => string.Equals(x.Name, name)))
            {
                return name;
            }

            string CustomDevicePropertyPrefix = "user.CD.";
            if (name.StartsWith("_"))
            {
                return "_" + CustomDevicePropertyPrefix + name;
            }
            else
            {
                return CustomDevicePropertyPrefix + name;
            }
        }

        private static DependentFileType DFPTtoDFT(DependentFilePropertyType p)
        {
            if (p == DependentFilePropertyType.Relative)
            {
                return DependentFileType.Relative;
            }
            else if (p == DependentFilePropertyType.ToApplicationDataDir)
            {
                return DependentFileType.ToAppDataDir;
            }
            else if (p == DependentFilePropertyType.ToCommonDocDir)
            {
                return DependentFileType.ToCommonDocDir;
            }
            else
            {
                return DependentFileType.Absolute;
            }
        }

        private static JObject SerializeUserDefinedProperties(
            BaseNodeType dependentNodeObject,
            Dictionary<string, string> userDefinedProperties)
        {
            JObject targetObject = new JObject();
            foreach (var kvp in userDefinedProperties)
            {
                string propertyName = kvp.Key;
                string propertyType = kvp.Value.ToUpper();
                try
                {
                    switch (propertyType)
                    {
                        case "BINARYSTRING":
                            dependentNodeObject.GetBinaryStringProperty(QualifyPropName(dependentNodeObject, propertyName), out byte[] binaryStringResult);
                            binaryStringResult = binaryStringResult ?? Array.Empty<byte>();
                            targetObject.Add(propertyName, JToken.FromObject(binaryStringResult));
                            break;

                        case "BOOLEAN":
                            dependentNodeObject.GetBooleanProperty(QualifyPropName(dependentNodeObject, propertyName), out bool boolResult);
                            targetObject.Add(propertyName, boolResult);
                            break;

                        case "BOOLEANARRAY":
                            dependentNodeObject.GetBooleanArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out bool[] boolArrayResult);
                            boolArrayResult = boolArrayResult ?? Array.Empty<bool>();
                            targetObject.Add(propertyName, JToken.FromObject(boolArrayResult));
                            break;

                        case "U16":
                            dependentNodeObject.GetU16Property(QualifyPropName(dependentNodeObject, propertyName), out ushort u16Result);
                            targetObject.Add(propertyName, u16Result);
                            break;

                        case "U16ARRAY":
                            dependentNodeObject.GetU16ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out ushort[] u16ArrayResult);
                            u16ArrayResult = u16ArrayResult ?? Array.Empty<ushort>();
                            targetObject.Add(propertyName, JToken.FromObject(u16ArrayResult));
                            break;

                        case "U32":
                            dependentNodeObject.GetU32Property(QualifyPropName(dependentNodeObject, propertyName), out uint u32Result);
                            targetObject.Add(propertyName, u32Result);
                            break;

                        case "U32ARRAY":
                            dependentNodeObject.GetU32ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out uint[] u32ArrayResult);
                            u32ArrayResult = u32ArrayResult ?? Array.Empty<uint>();
                            targetObject.Add(propertyName, JToken.FromObject(u32ArrayResult));
                            break;

                        case "U64":
                            dependentNodeObject.GetU64Property(QualifyPropName(dependentNodeObject, propertyName), out ulong u64Result);
                            targetObject.Add(propertyName, u64Result);
                            break;

                        case "U64ARRAY":
                            dependentNodeObject.GetU64ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out ulong[] u64ArrayResult);
                            u64ArrayResult = u64ArrayResult ?? Array.Empty<ulong>();
                            targetObject.Add(propertyName, JToken.FromObject(u64ArrayResult));
                            break;

                        case "I16":
                            dependentNodeObject.GetI16Property(QualifyPropName(dependentNodeObject, propertyName), out short i16Result);
                            targetObject.Add(propertyName, i16Result);
                            break;

                        case "I16ARRAY":
                            dependentNodeObject.GetI16ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out short[] i16ArrayResult);
                            i16ArrayResult = i16ArrayResult ?? Array.Empty<short>();
                            targetObject.Add(propertyName, JToken.FromObject(i16ArrayResult));
                            break;

                        case "I32":
                            dependentNodeObject.GetI32Property(QualifyPropName(dependentNodeObject, propertyName), out int i32Result);
                            targetObject.Add(propertyName, i32Result);
                            break;

                        case "I32ARRAY":
                            dependentNodeObject.GetI32ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out int[] i32ArrayResult);
                            i32ArrayResult = i32ArrayResult ?? Array.Empty<int>();
                            targetObject.Add(propertyName, JToken.FromObject(i32ArrayResult));
                            break;

                        case "I64":
                            dependentNodeObject.GetI64Property(QualifyPropName(dependentNodeObject, propertyName), out long i64Result);
                            targetObject.Add(propertyName, i64Result);
                            break;

                        case "I64ARRAY":
                            dependentNodeObject.GetI64ArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out long[] i64ArrayResult);
                            i64ArrayResult = i64ArrayResult ?? Array.Empty<long>();
                            targetObject.Add(propertyName, JToken.FromObject(i64ArrayResult));
                            break;

                        case "DOUBLE":
                            dependentNodeObject.GetDoubleProperty(QualifyPropName(dependentNodeObject, propertyName), out double doubleResult);
                            targetObject.Add(propertyName, doubleResult);
                            break;

                        case "DOUBLEARRAY":
                            dependentNodeObject.GetDoubleArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out double[] doubleArrayResult);
                            doubleArrayResult = doubleArrayResult ?? Array.Empty<double>();
                            targetObject.Add(propertyName, JToken.FromObject(doubleArrayResult));
                            break;

                        case "STRING":
                            dependentNodeObject.GetStringProperty(QualifyPropName(dependentNodeObject, propertyName), out string stringResult);
                            targetObject.Add(propertyName, stringResult);
                            break;

                        case "STRINGARRAY":
                            dependentNodeObject.GetStringArrayProperty(QualifyPropName(dependentNodeObject, propertyName), out string[] stringArrayResult);
                            stringArrayResult = stringArrayResult ?? Array.Empty<string>();
                            targetObject.Add(propertyName, JToken.FromObject(stringArrayResult));
                            break;

                        case "DEPENDENTFILE":
                            dependentNodeObject.GetDependentFileValue(QualifyPropName(dependentNodeObject, propertyName), out string filePath, out DependentFilePropertyType dependentType, out string version, out bool forceDownload, out string rtDest, out string supportedTarget, out string MD5);
                            var dependentFileResult = new DependentFile(filePath, DFPTtoDFT(dependentType), version, forceDownload, rtDest, supportedTarget, MD5);
                            targetObject.Add(propertyName, JToken.FromObject(dependentFileResult));
                            break;

                        case "DEPENDENTNODE":
                            dependentNodeObject.GetDependentNodeValue(QualifyPropName(dependentNodeObject, propertyName), out string dependentNodePath);
                            targetObject.Add(propertyName, JToken.FromObject(new DependentNode(dependentNodePath)));
                            break;

                        case "VARIANT":
                            dependentNodeObject.GetVariantValue(QualifyPropName(dependentNodeObject, propertyName), out byte[] variantType, out byte[] variantData);
                            variantType = variantType ?? Array.Empty<byte>();
                            variantData = variantData ?? Array.Empty<byte>();
                            var variant = new Variant(variantType, variantData);
                            targetObject.Add(propertyName, JToken.FromObject(variant));
                            break;

                        default:
                            throw new NotSupportedException($"Type {propertyType} not supported.");
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Failed to serialize property '{propertyName}' of type '{propertyType}': {ex.Message}");
                }
            }

            return targetObject;
        }
    }
}
