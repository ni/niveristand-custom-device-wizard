using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using System.ComponentModel.Composition;

namespace NationalInstruments.Veristand
{
    [Export(typeof(IPluginNodeFactory))]
    public class VoltageReadingFactory : IPluginNodeFactory
    {
        public bool TryCreateBaseNodeFromSystemStorageNode(BaseNodeType storageNode, out BaseNode baseNode)
        {
            baseNode = null;

            if (storageNode == null)
            {
                return false;
            }

            if (storageNode.TypeGUID == VoltageReading.TypeGuid)
            {
                baseNode = new VoltageReading(storageNode);
                return true;
            }

            return false;
        }
    }
}
  