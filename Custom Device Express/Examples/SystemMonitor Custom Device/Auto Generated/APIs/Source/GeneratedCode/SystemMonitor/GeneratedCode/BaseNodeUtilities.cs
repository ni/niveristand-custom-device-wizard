using NationalInstruments.VeriStand;
using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;

namespace NationalInstruments.Veristand
{
    internal static class BaseNodeUtilities
    {
        public static BaseNode FindChildNode(string name, BaseNodeType parentNode, NodeType nodeType, out Error error)
        {
            error = Error.NoError;
            BaseNode childNode = null;
            if (parentNode.FindNode(new string[] { name }, out var foundNode))
            {
                if (foundNode.GetNodeType() == nodeType)
                {
                    childNode = Utilities.CreateBaseNodeFromSystemStorageNode(foundNode);
                }
                else
                {
                    error = new Error(ErrorCode.NodeAlreadyExistsByName, $"Node with the name '{name}' already exists but it is not a '{nodeType.ToString().Substring(2)}'.");
                }
            }
            return childNode;
        }
    }
}
    