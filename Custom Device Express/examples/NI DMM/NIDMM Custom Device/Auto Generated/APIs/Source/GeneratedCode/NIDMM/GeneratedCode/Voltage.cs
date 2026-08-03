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
    [JsonConverter(typeof(VoltageConverter))]
    public partial class Voltage : CustomDeviceSection
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "0D103088-ED27-439F-AA89-CA4D12F63583";
        
        
        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="Voltage"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new Voltage object.</param>
        public Voltage(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="Voltage"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public Voltage(string name)
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
            AddChannel(new VoltageReading("VoltageReading"));
            AddChannel(new VoltageStatus("VoltageStatus"));
            AddChannel(new VoltageFunction("VoltageFunction"));
            AddChannel(new VoltageActualRange("VoltageActualRange"));
            AddChannel(new VoltageRange("VoltageRange"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="Voltage"/>.
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
        /// Gets an array that contains <see cref="VoltageReading"/> elements from the current <see cref="Voltage"/>.
        /// </summary>
        public virtual VoltageReading[] GetVoltageReadings()
        {
            return GetChannelsCore().OfType<VoltageReading>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="VoltageStatus"/> elements from the current <see cref="Voltage"/>.
        /// </summary>
        public virtual VoltageStatus[] GetVoltageStatuss()
        {
            return GetChannelsCore().OfType<VoltageStatus>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="VoltageFunction"/> elements from the current <see cref="Voltage"/>.
        /// </summary>
        public virtual VoltageFunction[] GetVoltageFunctions()
        {
            return GetChannelsCore().OfType<VoltageFunction>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="VoltageActualRange"/> elements from the current <see cref="Voltage"/>.
        /// </summary>
        public virtual VoltageActualRange[] GetVoltageActualRanges()
        {
            return GetChannelsCore().OfType<VoltageActualRange>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="VoltageRange"/> elements from the current <see cref="Voltage"/>.
        /// </summary>
        public virtual VoltageRange[] GetVoltageRanges()
        {
            return GetChannelsCore().OfType<VoltageRange>().ToArray();
        }
        
        #endregion
    

        #region JsonConverterClass

        private sealed class VoltageConverter : JsonConverter<Voltage>
        {
            /// <inheritdoc/>
            public override Voltage ReadJson(JsonReader reader, Type objectType, Voltage existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }

                var node = new Voltage(name);
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());                
                       
                var properties = jObject["Properties"] ?? new JObject();
        
                var channels = jObject["Channels"] ?? new JObject();
                foreach (var item in channels["VoltageReading[]"]?.ToObject<VoltageReading[]>() ?? Array.Empty<VoltageReading>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["VoltageStatus[]"]?.ToObject<VoltageStatus[]>() ?? Array.Empty<VoltageStatus>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["VoltageFunction[]"]?.ToObject<VoltageFunction[]>() ?? Array.Empty<VoltageFunction>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["VoltageActualRange[]"]?.ToObject<VoltageActualRange[]>() ?? Array.Empty<VoltageActualRange>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["VoltageRange[]"]?.ToObject<VoltageRange[]>() ?? Array.Empty<VoltageRange>())
                {
                    node.AddChannel(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, Voltage value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                value.ExportCommonPropertiesToJson(jObject);
                
                var channels = new JObject
                {
                    { "VoltageReading[]", JToken.FromObject(value.GetVoltageReadings()) },
                    { "VoltageStatus[]", JToken.FromObject(value.GetVoltageStatuss()) },
                    { "VoltageFunction[]", JToken.FromObject(value.GetVoltageFunctions()) },
                    { "VoltageActualRange[]", JToken.FromObject(value.GetVoltageActualRanges()) },
                    { "VoltageRange[]", JToken.FromObject(value.GetVoltageRanges()) },
                };
                
                jObject.Add("Channels", channels);
        
                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    