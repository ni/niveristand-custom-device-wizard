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
    [JsonConverter(typeof(CurrentActualRangeConverter))]
    public partial class CurrentActualRange : CustomDeviceChannel
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "5676D9EB-5B34-4C73-B2B3-FA845A284478";

        private readonly string _defaultGroupName = "CurrentOutputs";
        private readonly double _defaultValue = 0;
        private readonly string _defaultUnits = "";
        private readonly CDChannel_Type _defaultType = (CDChannel_Type)Enum.Parse(typeof(CDChannel_Type), "Output", ignoreCase: true);
        private readonly bool _defaultScalable = false;
        private readonly bool _defaultFaultable = false;

        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="CurrentActualRange"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new CurrentActualRange object.</param>
        public CurrentActualRange(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="CurrentActualRange"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public CurrentActualRange(string name)
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

        private sealed class CurrentActualRangeConverter : JsonConverter<CurrentActualRange>
        {
            /// <inheritdoc/>
            public override CurrentActualRange ReadJson(JsonReader reader, Type objectType, CurrentActualRange existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var name = jObject["Name"]?.Value<string>();
                if (string.IsNullOrEmpty(name))
                {
                    throw new JsonSerializationException("Name property not found or is empty in JSON.");
                }
                var node = new CurrentActualRange(name);

                node.ImportCommonPropertiesFromJson(jObject);
                       
                var properties = jObject["Properties"] ?? new JObject();
        

                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, CurrentActualRange value, JsonSerializer serializer)
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
    