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
    [JsonConverter(typeof(CurrentConverter))]
    public partial class Current : CustomDeviceSection
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "C9CA0D87-B6CA-4E61-BDC4-EF445D60B0A2";
        
        
        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="Current"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new Current object.</param>
        public Current(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="Current"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public Current(string name)
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
            AddChannel(new CurrentReading("CurrentReading"));
            AddChannel(new CurrentStatus("CurrentStatus"));
            AddChannel(new CurrentFunction("CurrentFunction"));
            AddChannel(new CurrentActualRange("CurrentActualRange"));
            AddChannel(new CurrentRange("CurrentRange"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="Current"/>.
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
        /// Gets an array that contains <see cref="CurrentReading"/> elements from the current <see cref="Current"/>.
        /// </summary>
        public virtual CurrentReading[] GetCurrentReadings()
        {
            return GetChannelsCore().OfType<CurrentReading>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="CurrentStatus"/> elements from the current <see cref="Current"/>.
        /// </summary>
        public virtual CurrentStatus[] GetCurrentStatuss()
        {
            return GetChannelsCore().OfType<CurrentStatus>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="CurrentFunction"/> elements from the current <see cref="Current"/>.
        /// </summary>
        public virtual CurrentFunction[] GetCurrentFunctions()
        {
            return GetChannelsCore().OfType<CurrentFunction>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="CurrentActualRange"/> elements from the current <see cref="Current"/>.
        /// </summary>
        public virtual CurrentActualRange[] GetCurrentActualRanges()
        {
            return GetChannelsCore().OfType<CurrentActualRange>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="CurrentRange"/> elements from the current <see cref="Current"/>.
        /// </summary>
        public virtual CurrentRange[] GetCurrentRanges()
        {
            return GetChannelsCore().OfType<CurrentRange>().ToArray();
        }
        
        #endregion
    

        #region JsonConverterClass

        private sealed class CurrentConverter : JsonConverter<Current>
        {
            /// <inheritdoc/>
            public override Current ReadJson(JsonReader reader, Type objectType, Current existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }

                var node = new Current(name);
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());                
                       
                var properties = jObject["Properties"] ?? new JObject();
        
                var channels = jObject["Channels"] ?? new JObject();
                foreach (var item in channels["CurrentReading[]"]?.ToObject<CurrentReading[]>() ?? Array.Empty<CurrentReading>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["CurrentStatus[]"]?.ToObject<CurrentStatus[]>() ?? Array.Empty<CurrentStatus>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["CurrentFunction[]"]?.ToObject<CurrentFunction[]>() ?? Array.Empty<CurrentFunction>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["CurrentActualRange[]"]?.ToObject<CurrentActualRange[]>() ?? Array.Empty<CurrentActualRange>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["CurrentRange[]"]?.ToObject<CurrentRange[]>() ?? Array.Empty<CurrentRange>())
                {
                    node.AddChannel(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, Current value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                value.ExportCommonPropertiesToJson(jObject);
                
                var channels = new JObject
                {
                    { "CurrentReading[]", JToken.FromObject(value.GetCurrentReadings()) },
                    { "CurrentStatus[]", JToken.FromObject(value.GetCurrentStatuss()) },
                    { "CurrentFunction[]", JToken.FromObject(value.GetCurrentFunctions()) },
                    { "CurrentActualRange[]", JToken.FromObject(value.GetCurrentActualRanges()) },
                    { "CurrentRange[]", JToken.FromObject(value.GetCurrentRanges()) },
                };
                
                jObject.Add("Channels", channels);
        
                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    