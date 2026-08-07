using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using System.ComponentModel.Composition;

namespace NationalInstruments.Veristand
{
    [Export(typeof(ICustomDevicePluginNodeFactory))]
    [Export(typeof(IPluginNodeFactory))]
    public class SystemMonitorFactory : ICustomDevicePluginNodeFactory
    {
        public bool TryCreateBaseNodeFromSystemStorageNode(BaseNodeType storageNode, out BaseNode baseNode)
        {
            baseNode = null;

            if (storageNode == null)
            {
                return false;
            }

            if (storageNode.TypeGUID == SystemMonitor.TypeGuid)
            {
                baseNode = new SystemMonitor(storageNode);
                return true;
            }

            return false;
        }

        public bool TryInitializeBaseNodeTypeToCustomDevice(BaseNodeType node)
        {
            if (node == null)
            {
                return false;
            }

            if (node.TypeGUID == SystemMonitor.TypeGuid)
            {
                var _ = new SystemMonitor(node, true);
                return true;
            }

            return false;
        }
    }
}
  