using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using NationalInstruments.VeriStand;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace NationalInstruments.Veristand
{   
    /// <summary>
    /// 
    /// </summary>
    [JsonConverter(typeof(CPUOverallConverter))]
    public partial class CPUOverall : CustomDeviceSection
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "B1AD58B7-82B2-4510-985C-757166E6253C";
        
        
        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="CPUOverall"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new CPUOverall object.</param>
        public CPUOverall(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="CPUOverall"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public CPUOverall(string name)
            : base(name, TypeGuid)
        {
            InitializeFromXml();
            AddDefaultChannels();
        }
    
        #endregion
    

        #region Initialize methods

        internal virtual void InitializeFromXml()
        {
        }

        #endregion
    
        #region Channels
        
        internal virtual void AddDefaultChannels()
        {
            AddChannel(new AverageType("Average"));
            AddChannel(new MaximumType("Maximum"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="CPUOverall"/>.
        /// </summary>
        public virtual CustomDeviceChannel[] GetChannels()
        {
            return GetChannelsCore().ToArray();
        }

        private IEnumerable<CustomDeviceChannel> GetChannelsCore()
        {
            return GetCustomDeviceChannels();
        }
    
        /// <summary>
        /// Gets an array that contains <see cref="AverageType"/> elements from the current <see cref="CPUOverall"/>.
        /// </summary>
        public virtual AverageType[] GetAverageTypes()
        {
            return GetChannelsCore().OfType<AverageType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="MaximumType"/> elements from the current <see cref="CPUOverall"/>.
        /// </summary>
        public virtual MaximumType[] GetMaximumTypes()
        {
            return GetChannelsCore().OfType<MaximumType>().ToArray();
        }
        
        #endregion
    

        #region JsonConverterClass

        private sealed class CPUOverallConverter : JsonConverter<CPUOverall>
        {
            /// <inheritdoc/>
            public override CPUOverall ReadJson(JsonReader reader, Type objectType, CPUOverall existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }

                var node = new CPUOverall(name);
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());                
                       
                var properties = jObject["Properties"] ?? new JObject();
        
                var channels = jObject["Channels"] ?? new JObject();
                foreach (var item in channels["AverageType[]"]?.ToObject<AverageType[]>() ?? Array.Empty<AverageType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["MaximumType[]"]?.ToObject<MaximumType[]>() ?? Array.Empty<MaximumType>())
                {
                    node.AddChannel(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, CPUOverall value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                value.ExportCommonPropertiesToJson(jObject);
                
                var channels = new JObject
                {
                    { "AverageType[]", JToken.FromObject(value.GetAverageTypes()) },
                    { "MaximumType[]", JToken.FromObject(value.GetMaximumTypes()) },
                };
                
                jObject.Add("Channels", channels);
        
                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    