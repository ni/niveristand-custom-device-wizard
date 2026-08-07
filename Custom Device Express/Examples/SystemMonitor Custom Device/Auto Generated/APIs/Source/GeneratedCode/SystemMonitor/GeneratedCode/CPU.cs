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
    [JsonConverter(typeof(CPUConverter))]
    public partial class CPU : CustomDeviceSection
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "F7F852D2-14D4-40C0-9630-D9D0B24B5C74";
        
        
        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="CPU"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new CPU object.</param>
        public CPU(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="CPU"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public CPU(string name)
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
            AddChannel(new TotalType("Total"));
            AddChannel(new TimeCriticalType("Time Critical"));
            AddChannel(new TimedStructuresType("Timed Structures"));
            AddChannel(new HighType("High"));
            AddChannel(new AboveNormalType("Above Normal"));
            AddChannel(new NormalType("Normal"));
            AddChannel(new BackgroundType("Background"));
            AddChannel(new IdleType("Idle"));
            AddChannel(new ISRType("ISR"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="CPU"/>.
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
        /// Gets an array that contains <see cref="TotalType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual TotalType[] GetTotalTypes()
        {
            return GetChannelsCore().OfType<TotalType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="TimeCriticalType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual TimeCriticalType[] GetTimeCriticalTypes()
        {
            return GetChannelsCore().OfType<TimeCriticalType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="TimedStructuresType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual TimedStructuresType[] GetTimedStructuresTypes()
        {
            return GetChannelsCore().OfType<TimedStructuresType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="HighType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual HighType[] GetHighTypes()
        {
            return GetChannelsCore().OfType<HighType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="AboveNormalType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual AboveNormalType[] GetAboveNormalTypes()
        {
            return GetChannelsCore().OfType<AboveNormalType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="NormalType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual NormalType[] GetNormalTypes()
        {
            return GetChannelsCore().OfType<NormalType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="BackgroundType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual BackgroundType[] GetBackgroundTypes()
        {
            return GetChannelsCore().OfType<BackgroundType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="IdleType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual IdleType[] GetIdleTypes()
        {
            return GetChannelsCore().OfType<IdleType>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="ISRType"/> elements from the current <see cref="CPU"/>.
        /// </summary>
        public virtual ISRType[] GetISRTypes()
        {
            return GetChannelsCore().OfType<ISRType>().ToArray();
        }
        
        #endregion
    

        #region JsonConverterClass

        private sealed class CPUConverter : JsonConverter<CPU>
        {
            /// <inheritdoc/>
            public override CPU ReadJson(JsonReader reader, Type objectType, CPU existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }

                var node = new CPU(name);
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());                
                       
                var properties = jObject["Properties"] ?? new JObject();
        
                var channels = jObject["Channels"] ?? new JObject();
                foreach (var item in channels["TotalType[]"]?.ToObject<TotalType[]>() ?? Array.Empty<TotalType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["TimeCriticalType[]"]?.ToObject<TimeCriticalType[]>() ?? Array.Empty<TimeCriticalType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["TimedStructuresType[]"]?.ToObject<TimedStructuresType[]>() ?? Array.Empty<TimedStructuresType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["HighType[]"]?.ToObject<HighType[]>() ?? Array.Empty<HighType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["AboveNormalType[]"]?.ToObject<AboveNormalType[]>() ?? Array.Empty<AboveNormalType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["NormalType[]"]?.ToObject<NormalType[]>() ?? Array.Empty<NormalType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["BackgroundType[]"]?.ToObject<BackgroundType[]>() ?? Array.Empty<BackgroundType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["IdleType[]"]?.ToObject<IdleType[]>() ?? Array.Empty<IdleType>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["ISRType[]"]?.ToObject<ISRType[]>() ?? Array.Empty<ISRType>())
                {
                    node.AddChannel(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, CPU value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                value.ExportCommonPropertiesToJson(jObject);
                
                var channels = new JObject
                {
                    { "TotalType[]", JToken.FromObject(value.GetTotalTypes()) },
                    { "TimeCriticalType[]", JToken.FromObject(value.GetTimeCriticalTypes()) },
                    { "TimedStructuresType[]", JToken.FromObject(value.GetTimedStructuresTypes()) },
                    { "HighType[]", JToken.FromObject(value.GetHighTypes()) },
                    { "AboveNormalType[]", JToken.FromObject(value.GetAboveNormalTypes()) },
                    { "NormalType[]", JToken.FromObject(value.GetNormalTypes()) },
                    { "BackgroundType[]", JToken.FromObject(value.GetBackgroundTypes()) },
                    { "IdleType[]", JToken.FromObject(value.GetIdleTypes()) },
                    { "ISRType[]", JToken.FromObject(value.GetISRTypes()) },
                };
                
                jObject.Add("Channels", channels);
        
                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    