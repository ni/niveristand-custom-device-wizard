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
    [JsonConverter(typeof(VoltageRangeConverter))]
    public partial class VoltageRange : CustomDeviceChannel
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "7286BA1F-1B14-476C-8412-7EF73EB8FCB8";

        private readonly string _defaultGroupName = "VoltageInputs";
        private readonly double _defaultValue = -1.0;
        private readonly string _defaultUnits = "";
        private readonly CDChannel_Type _defaultType = (CDChannel_Type)Enum.Parse(typeof(CDChannel_Type), "Input", ignoreCase: true);
        private readonly bool _defaultScalable = false;
        private readonly bool _defaultFaultable = false;

        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="VoltageRange"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new VoltageRange object.</param>
        public VoltageRange(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="VoltageRange"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public VoltageRange(string name)
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

        private sealed class VoltageRangeConverter : JsonConverter<VoltageRange>
        {
            /// <inheritdoc/>
            public override VoltageRange ReadJson(JsonReader reader, Type objectType, VoltageRange existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }
                var node = new VoltageRange(name);

                node.ImportCommonPropertiesFromJson(jObject);
                       
                var properties = jObject["Properties"] ?? new JObject();
        

                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, VoltageRange value, JsonSerializer serializer)
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
    