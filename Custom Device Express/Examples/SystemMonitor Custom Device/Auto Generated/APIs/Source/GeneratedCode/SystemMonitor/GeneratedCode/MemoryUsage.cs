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
    [JsonConverter(typeof(MemoryUsageConverter))]
    public partial class MemoryUsage : CustomDeviceSection
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "108C37EA-BB68-4392-BEE4-1A2ECD32F472";
        
        
        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="MemoryUsage"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new MemoryUsage object.</param>
        public MemoryUsage(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="MemoryUsage"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public MemoryUsage(string name)
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
            AddChannel(new TotalMemoryType("Total Memory"));
            AddChannel(new AvailableType("Available"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="MemoryUsage"/>.
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
        /// Gets an array that contains <see cref="TotalMemoryType"/> elements from the current <see cref="MemoryUsage"/>.
        /// </summary>
        public virtual TotalMemoryType[] GetTotalMemoryTypes()
        {
            return GetChannelsCore().OfType<TotalMemoryType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="AvailableType"/> elements from the current <see cref="MemoryUsage"/>.
        /// </summary>
        public virtual AvailableType[] GetAvailableTypes()
        {
            return GetChannelsCore().OfType<AvailableType>().ToArray();
        }
        
        #endregion
    

        #region JsonConverterClass

        private sealed class MemoryUsageConverter : JsonConverter<MemoryUsage>
        {
            /// <inheritdoc/>
            public override MemoryUsage ReadJson(JsonReader reader, Type objectType, MemoryUsage existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }

                var node = new MemoryUsage(name);
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());                
                       
                var properties = jObject["Properties"] ?? new JObject();
        
                var channels = jObject["Channels"] ?? new JObject();
                foreach (var item in channels["TotalMemoryType[]"]?.ToObject<TotalMemoryType[]>() ?? Array.Empty<TotalMemoryType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["AvailableType[]"]?.ToObject<AvailableType[]>() ?? Array.Empty<AvailableType>())
                {
                    node.AddChannel(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, MemoryUsage value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                value.ExportCommonPropertiesToJson(jObject);
                
                var channels = new JObject
                {
                    { "TotalMemoryType[]", JToken.FromObject(value.GetTotalMemoryTypes()) },
                    { "AvailableType[]", JToken.FromObject(value.GetAvailableTypes()) },
                };
                
                jObject.Add("Channels", channels);
        
                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    