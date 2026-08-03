using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace NationalInstruments.Veristand
{   
    /// <summary>
    /// 
    /// </summary>
    [JsonConverter(typeof(CurrentReadingConverter))]
    public partial class CurrentReading : CustomDeviceChannel
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "7E9C7697-2AD8-458A-9731-C8D8B1A0B539";

        private readonly string _defaultGroupName = "CurrentOutputs";
        private readonly double _defaultValue = 0;
        private readonly string _defaultUnits = "";
        private readonly CDChannel_Type _defaultType = (CDChannel_Type)Enum.Parse(typeof(CDChannel_Type), "Output", ignoreCase: true);
        private readonly bool _defaultScalable = false;
        private readonly bool _defaultFaultable = false;

        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="CurrentReading"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new CurrentReading object.</param>
        public CurrentReading(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="CurrentReading"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public CurrentReading(string name)
            : base(name, TypeGuid)
        {
            InitializeFromXml();
        }
    
        #endregion
    
        
        /// <summary>
        /// Gets property name mappings containing both C# formatted names and original user-defined names.
        /// This method is used by configuration panels to show only API-defined properties with their display names.
        /// </summary>
        /// <returns>A dictionary mapping C# property names to display names.</returns>
        public IDictionary<string, string> GetAllUserDefinedPropertyNames()
        {
            return new Dictionary<string, string>
            {
            };
        }
    

        #region Initialize methods

        internal virtual void InitializeFromXml()
        {
            GroupName = _defaultGroupName;
            DefaultValue = _defaultValue;
            Units = _defaultUnits;
            Type = _defaultType;
            Scalable = _defaultScalable;
            Faultable = _defaultFaultable;
        }

        #endregion
    

        #region JsonConverterClass

        private sealed class CurrentReadingConverter : JsonConverter<CurrentReading>
        {
            /// <inheritdoc/>
            public override CurrentReading ReadJson(JsonReader reader, Type objectType, CurrentReading existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }
                var node = new CurrentReading(name);

                node.ImportCommonPropertiesFromJson(jObject);
                       
                var properties = jObject["Properties"] ?? new JObject();
        

                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, CurrentReading value, JsonSerializer serializer)
            {
                var jObject = new JObject();
                string result = GroupNameExpressionEvaluator.EvaluateGroupName(value.GroupName, value);
                jObject.Add("GroupName", JToken.FromObject(result));
                value.ExportCommonPropertiesToJson(jObject);
                
                jObject.WriteTo(writer);
            }
        }

        #endregion
    

    }
}
    