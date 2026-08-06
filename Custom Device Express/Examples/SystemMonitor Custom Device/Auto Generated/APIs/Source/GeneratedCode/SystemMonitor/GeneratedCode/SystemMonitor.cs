using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using NationalInstruments.VeriStand;
using NationalInstruments.VeriStand.SystemDefinitionAPI;
using NationalInstruments.VeriStand.SystemStorage;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace NationalInstruments.Veristand
{   
    /// <summary>
    /// 
    /// </summary>
    [JsonConverter(typeof(SystemMonitorConverter))]
    public partial class SystemMonitor : CustomDevice
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "83C5DD7A-68C5-4260-8FC3-8ECCA1D25122";
        
        
        private readonly double _defaultUpdateRateHz = 10.000000;

        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="SystemMonitor"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new SystemMonitor object.</param>
        public SystemMonitor(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// For VeriStand internal use only - System Explorer uses this constructor when creating instances.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new object.</param>
        /// <param name="initialize">Add default members</param>
        internal SystemMonitor(BaseNodeType node, bool initialize)
            : base(node)
        {
            if (initialize)
            {
                TypeGUID = TypeGuid;
                InitializeFromXml();
                AddDefaultChannels();
                AddDefaultWaveforms();
                AddDefaultSections();
            }
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="SystemMonitor"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public SystemMonitor(string name)
            : base(name, TypeGuid)
        {
            InitializeFromXml();
            AddDefaultSections();
        }
    
        #endregion
    
        #region Properties
            
        /// <summary>
        /// 
        /// </summary>
        public virtual double UpdateRateHz
        {
            get
            {
                GetDoubleProperty("Update Rate (Hz)", out var result);
                return result;
            }
            set
            {
                SetDoubleProperty("Update Rate (Hz)", value);
            }
        
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
                { "UpdateRateHz", "Update Rate (Hz)" }
            };
        }
    

        #region Initialize methods

        internal virtual void InitializeFromXml()
        {
            UpdateRateHz = _defaultUpdateRateHz;
            SetBooleanProperty("IsInstanceOfGeneratedCustomDeviceClass", true);
        }

        #endregion
    
        #region Sections
        
        internal virtual void AddDefaultSections()
        {
            AddSection(new CPUOverall("CPU Overall"));
            AddSection(new MemoryUsage("Memory Usage"));
        }
    
        /// <summary>
        /// Adds the specified <see cref="CPU"/> to the <see cref="SystemMonitor"/>.
        /// </summary>
        /// <param name="node">The <see cref="CPU"/> to add.</param>
        public virtual void AddCPU(CPU node)
        {
            AddSection(node);
        }
        
        /// <summary>
        /// Returns an existing <see cref="CPU"/> instance with the specified name if it exists.
        /// Otherwise creates a new instance, adds it as a child node, and returns it.
        /// </summary>
        /// <param name="name">The name of the <see cref="CPU"/> node to add.</param>
        /// <param name="newItem">Indicates whether a new item was created.</param>
        /// <param name="error">The error object to capture any errors.</param>
        /// <returns>The <see cref="CPU"/> instance.</returns>
        public virtual CPU AddCPU(string name, out bool newItem, out Error error)
        {
            newItem = false;
            var childNode = (CPU)BaseNodeUtilities.FindChildNode(name, BaseNodeType, NodeType.K_SECTION, out error);
            if (!error.IsError && childNode == null)
            {
                newItem = true;
                childNode = new CPU(name);
                AddSection(childNode);
            }
            return childNode;
        }
        
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceSection"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual CustomDeviceSection[] GetSections()
        {
            return GetSectionsCore().ToArray();
        }

        private IEnumerable<CustomDeviceSection> GetSectionsCore()
        {
            return GetCustomDeviceSections();
        }
    
        /// <summary>
        /// Gets an array that contains <see cref="CPUOverall"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual CPUOverall[] GetCPUOveralls()
        {
            return GetSectionsCore().OfType<CPUOverall>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="MemoryUsage"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual MemoryUsage[] GetMemoryUsages()
        {
            return GetSectionsCore().OfType<MemoryUsage>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="CPU"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual CPU[] GetCPUs()
        {
            return GetSectionsCore().OfType<CPU>().ToArray();
        }
        
        #endregion
    
        #region Waveforms
        
        internal virtual void AddDefaultWaveforms()
        {
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceWaveform"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual CustomDeviceWaveform[] GetWaveforms()
        {
            return GetWaveformsCore().ToArray();
        }

        private IEnumerable<CustomDeviceWaveform> GetWaveformsCore()
        {
            return GetCustomDeviceWaveforms();
        }
    
        #endregion
    
        #region Channels
        
        internal virtual void AddDefaultChannels()
        {
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="SystemMonitor"/>.
        /// </summary>
        public virtual CustomDeviceChannel[] GetChannels()
        {
            return GetChannelsCore().ToArray();
        }

        private IEnumerable<CustomDeviceChannel> GetChannelsCore()
        {
            return GetCustomDeviceChannels();
        }
    
        #endregion
    

        #region JsonConversionMethods

        /// <summary>
        /// Exports the current instance of <see cref="SystemMonitor"/> to a JSON string.
        /// </summary>
        /// <param name="jsonString">The JSON string representing the custom device configuration.</param>
        /// <returns>The error that prevented the export operation, if one occurred.</returns>
        public override Error ExportToJson(out string jsonString)
        {
            jsonString = null;
            try
            {
                jsonString = JsonConvert.SerializeObject(this, Formatting.Indented);
                return Error.NoError;
            }
            catch (Exception ex)
            {
                return new Error(
                    ErrorCode.UnexpectedError,
                    ex.Message,
                    "Failed to serialize custom device configuration to JSON");
            }
        }
        
        /// <summary>
        /// Exports the current instance of <see cref="SystemMonitor"/> to a JSON file.
        /// </summary>
        /// <param name="jsonFilePath">The file path where the JSON file will be created.</param>
        /// <returns>The error that prevented the export operation, if one occurred.</returns>
        public override Error ExportToJson(string jsonFilePath)
        {
            try
            {
                var directoryPath = Path.GetDirectoryName(jsonFilePath);
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                using (var stream = File.CreateText(jsonFilePath))
                {
                    var serializer = new JsonSerializer() { Formatting = Formatting.Indented };
                    serializer.Serialize(stream, this);
                }
                return Error.NoError;
            }
            catch (Exception ex)
            {
                return new Error(
                    ErrorCode.UnexpectedError,
                    ex.Message,
                    "Failed to write custom device configuration to JSON file");
            }
        }

        /// <summary>
        /// Imports a <see cref="CustomDevice"/> from a JSON file.
        /// </summary>
        /// <param name="jsonFilePath">The file path of the JSON file to read.</param>
        /// <param name="deserializedCustomDevice">The imported custom device.</param>
        /// <returns>The error that prevented the import operation, if one occurred.</returns>
        protected override Error ImportFromJson(string jsonFilePath, out CustomDevice deserializedCustomDevice)
        {
            deserializedCustomDevice = null;
            try
            {
                if (!File.Exists(jsonFilePath))
                {
                    return new Error(
                        ErrorCode.UnexpectedError,
                        $"File not found: {jsonFilePath}",
                        "Failed to read custom device configuration from JSON file");
                }

                using (var stream = File.OpenText(jsonFilePath))
                using (var reader = new JsonTextReader(stream))
                {
                    var serializer = new JsonSerializer();
                    deserializedCustomDevice = serializer.Deserialize<SystemMonitor>(reader);
                }
                
                return Error.NoError;
            }
            catch (Exception ex)
            {
                return new Error(
                    ErrorCode.UnexpectedError,
                    ex.Message,
                    "Failed to read custom device configuration from JSON file");
            }
        }

        #endregion
    

        #region JsonConverterClass

        private sealed class SystemMonitorConverter : JsonConverter<SystemMonitor>
        {
            /// <inheritdoc/>
            public override SystemMonitor ReadJson(JsonReader reader, Type objectType, SystemMonitor existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var deviceName = jObject.Properties().First().Name;
                var members = jObject[deviceName];

                var node = new SystemMonitor(members["Name"].ToString());
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());
                       
                var properties = members["Properties"] ?? new JObject();
        
                node.UpdateRateHz = properties["Update Rate (Hz)"]?.ToObject<double>() ?? node._defaultUpdateRateHz;
                var sections = members["Sections"] ?? new JObject();
                foreach (var item in sections["CPUOverall[]"]?.ToObject<CPUOverall[]>() ?? Array.Empty<CPUOverall>())
                {
                    node.AddSection(item);
                }
                foreach (var item in sections["MemoryUsage[]"]?.ToObject<MemoryUsage[]>() ?? Array.Empty<MemoryUsage>())
                {
                    node.AddSection(item);
                }
                foreach (var item in sections["CPU[]"]?.ToObject<CPU[]>() ?? Array.Empty<CPU>())
                {
                    node.AddSection(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, SystemMonitor value, JsonSerializer serializer)
            {
                var properties = new JObject();
                value.ExportCommonPropertiesToJson(properties);
                properties.Add("Update Rate (Hz)", JToken.FromObject(value.UpdateRateHz));
                var sections = new JObject
                {
                    { "CPUOverall[]", JToken.FromObject(value.GetCPUOveralls()) },
                    { "MemoryUsage[]", JToken.FromObject(value.GetMemoryUsages()) },
                    { "CPU[]", JToken.FromObject(value.GetCPUs()) },
                };
                
                var members = new JObject
                {
                    { "Name", value.Name },
                    { "Properties", properties },
                    { "Sections", sections },
                };

                var jObject = new JObject
                {
                    { nameof(SystemMonitor), members }
                };

                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    