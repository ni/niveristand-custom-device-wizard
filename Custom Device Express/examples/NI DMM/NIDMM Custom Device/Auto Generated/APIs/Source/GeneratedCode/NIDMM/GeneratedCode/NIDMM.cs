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
    [JsonConverter(typeof(NIDMMConverter))]
    public partial class NIDMM : CustomDevice
    {
        /// <summary>
        /// The GUID associated with this type, as specified in the Custom Device XML file
        /// </summary>
        public const string TypeGuid = "AF03444C-E184-4AED-AD47-5152539F98C4";
        
        
        private readonly string _defaultResourceName = "PXI1Slot2";
        private readonly string _defaultModel = "";
        private readonly double _defaultScanPeriodMs = 0.000000;
        private readonly double _defaultResolutionDigits = 0.000000;
        private readonly double _defaultACMaxFrequency = 0.000000;
        private readonly double _defaultACMinFrequency = 0.000000;

        #region Constructors
        
        /// <summary>
        /// Initializes a new instance of the <see cref="NIDMM"/> class using the provided BaseNodeType object.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new NIDMM object.</param>
        public NIDMM(BaseNodeType node)
            : base(node)
        {
        }
    
        /// <summary>
        /// For VeriStand internal use only - System Explorer uses this constructor when creating instances.
        /// </summary>
        /// <param name="node">BaseNodeType node to use for the new object.</param>
        /// <param name="initialize">Add default members</param>
        internal NIDMM(BaseNodeType node, bool initialize)
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
        /// Initializes a new instance of the <see cref="NIDMM"/> class.
        /// </summary>
        /// <param name="name">The name associated with this object.</param>
        public NIDMM(string name)
            : base(name, TypeGuid)
        {
            InitializeFromXml();
            AddDefaultChannels();
            AddDefaultSections();
        }
    
        #endregion
    
        #region Properties
            
        /// <summary>
        /// 
        /// </summary>
        public virtual string ResourceName
        {
            get
            {
                GetStringProperty("ResourceName", out var result);
                return result;
            }
            set
            {
                SetStringProperty("ResourceName", value);
            }
        
        }
    
        /// <summary>
        /// 407x/408x
        /// </summary>
        public virtual string Model
        {
            get
            {
                GetStringProperty("Model", out var result);
                return result;
            }
            set
            {
                SetStringProperty("Model", value);
            }
        
        }
    
        /// <summary>
        /// in milliseconds
        /// </summary>
        public virtual double ScanPeriodMs
        {
            get
            {
                GetDoubleProperty("ScanPeriod(ms)", out var result);
                return result;
            }
            set
            {
                SetDoubleProperty("ScanPeriod(ms)", value);
            }
        
        }
    
        /// <summary>
        /// 
        /// </summary>
        public virtual double ResolutionDigits
        {
            get
            {
                GetDoubleProperty("ResolutionDigits", out var result);
                return result;
            }
            set
            {
                SetDoubleProperty("ResolutionDigits", value);
            }
        
        }
    
        /// <summary>
        /// 
        /// </summary>
        public virtual double ACMaxFrequency
        {
            get
            {
                GetDoubleProperty("ACMaxFrequency", out var result);
                return result;
            }
            set
            {
                SetDoubleProperty("ACMaxFrequency", value);
            }
        
        }
    
        /// <summary>
        /// 
        /// </summary>
        public virtual double ACMinFrequency
        {
            get
            {
                GetDoubleProperty("ACMinFrequency", out var result);
                return result;
            }
            set
            {
                SetDoubleProperty("ACMinFrequency", value);
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
                { "ResourceName", "ResourceName" },
                { "Model", "Model" },
                { "ScanPeriodMs", "ScanPeriod(ms)" },
                { "ResolutionDigits", "ResolutionDigits" },
                { "ACMaxFrequency", "ACMaxFrequency" },
                { "ACMinFrequency", "ACMinFrequency" }
            };
        }
    

        #region Initialize methods

        internal virtual void InitializeFromXml()
        {
            ResourceName = _defaultResourceName;
            Model = _defaultModel;
            ScanPeriodMs = _defaultScanPeriodMs;
            ResolutionDigits = _defaultResolutionDigits;
            ACMaxFrequency = _defaultACMaxFrequency;
            ACMinFrequency = _defaultACMinFrequency;
            SetBooleanProperty("IsInstanceOfGeneratedCustomDeviceClass", true);
        }

        #endregion
    
        #region Sections
        
        internal virtual void AddDefaultSections()
        {
            AddSection(new Voltage("Voltage"));
            AddSection(new Current("Current"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceSection"/> elements from the current <see cref="NIDMM"/>.
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
        /// Gets an array that contains <see cref="Voltage"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual Voltage[] GetVoltages()
        {
            return GetSectionsCore().OfType<Voltage>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="Current"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual Current[] GetCurrents()
        {
            return GetSectionsCore().OfType<Current>().ToArray();
        }
        
        #endregion
    
        #region Waveforms
        
        internal virtual void AddDefaultWaveforms()
        {
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceWaveform"/> elements from the current <see cref="NIDMM"/>.
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
            AddChannel(new Mode("Mode"));
            AddChannel(new ActiveMode("ActiveMode"));
            AddChannel(new DeviceStatus("DeviceStatus"));
            AddChannel(new Heartbeat("Heartbeat"));
        }
    
        /// <summary>
        /// Gets an array that contains the <see cref="CustomDeviceChannel"/> elements from the current <see cref="NIDMM"/>.
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
        /// Gets an array that contains <see cref="Mode"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual Mode[] GetModes()
        {
            return GetChannelsCore().OfType<Mode>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="ActiveMode"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual ActiveMode[] GetActiveModes()
        {
            return GetChannelsCore().OfType<ActiveMode>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="DeviceStatus"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual DeviceStatus[] GetDeviceStatuss()
        {
            return GetChannelsCore().OfType<DeviceStatus>().ToArray();
        }
        
        /// <summary>
        /// Gets an array that contains <see cref="Heartbeat"/> elements from the current <see cref="NIDMM"/>.
        /// </summary>
        public virtual Heartbeat[] GetHeartbeats()
        {
            return GetChannelsCore().OfType<Heartbeat>().ToArray();
        }
        
        #endregion
    

        #region JsonConversionMethods

        /// <summary>
        /// Exports the current instance of <see cref="NIDMM"/> to a JSON string.
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
        /// Exports the current instance of <see cref="NIDMM"/> to a JSON file.
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
                    deserializedCustomDevice = serializer.Deserialize<NIDMM>(reader);
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

        private sealed class NIDMMConverter : JsonConverter<NIDMM>
        {
            /// <inheritdoc/>
            public override NIDMM ReadJson(JsonReader reader, Type objectType, NIDMM existingValue, bool hasExistingValue, JsonSerializer serializer)
            {
                var jObject = JObject.Load(reader);
                var deviceName = jObject.Properties().First().Name;
                var members = jObject[deviceName];

                var node = new NIDMM(members["Name"].ToString());
                node.GetChildren().ToList().ForEach(x => x.BaseNodeType.RemoveNode());
                       
                var properties = members["Properties"] ?? new JObject();
        
                node.ResourceName = properties["ResourceName"]?.ToObject<string>() ?? node._defaultResourceName;
                node.Model = properties["Model"]?.ToObject<string>() ?? node._defaultModel;
                node.ScanPeriodMs = properties["ScanPeriod(ms)"]?.ToObject<double>() ?? node._defaultScanPeriodMs;
                node.ResolutionDigits = properties["ResolutionDigits"]?.ToObject<double>() ?? node._defaultResolutionDigits;
                node.ACMaxFrequency = properties["ACMaxFrequency"]?.ToObject<double>() ?? node._defaultACMaxFrequency;
                node.ACMinFrequency = properties["ACMinFrequency"]?.ToObject<double>() ?? node._defaultACMinFrequency;
                var channels = members["Channels"] ?? new JObject();
                foreach (var item in channels["Mode[]"]?.ToObject<Mode[]>() ?? Array.Empty<Mode>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["ActiveMode[]"]?.ToObject<ActiveMode[]>() ?? Array.Empty<ActiveMode>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["DeviceStatus[]"]?.ToObject<DeviceStatus[]>() ?? Array.Empty<DeviceStatus>())
                {
                    node.AddChannel(item);
                }
                foreach (var item in channels["Heartbeat[]"]?.ToObject<Heartbeat[]>() ?? Array.Empty<Heartbeat>())
                {
                    node.AddChannel(item);
                }
                var sections = members["Sections"] ?? new JObject();
                foreach (var item in sections["Voltage[]"]?.ToObject<Voltage[]>() ?? Array.Empty<Voltage>())
                {
                    node.AddSection(item);
                }
                foreach (var item in sections["Current[]"]?.ToObject<Current[]>() ?? Array.Empty<Current>())
                {
                    node.AddSection(item);
                }
        
                return node;
            }

            /// <inheritdoc/>
            public override void WriteJson(JsonWriter writer, NIDMM value, JsonSerializer serializer)
            {
                var properties = new JObject();
                value.ExportCommonPropertiesToJson(properties);
                properties.Add("ResourceName", JToken.FromObject(value.ResourceName));
                properties.Add("Model", JToken.FromObject(value.Model));
                properties.Add("ScanPeriod(ms)", JToken.FromObject(value.ScanPeriodMs));
                properties.Add("ResolutionDigits", JToken.FromObject(value.ResolutionDigits));
                properties.Add("ACMaxFrequency", JToken.FromObject(value.ACMaxFrequency));
                properties.Add("ACMinFrequency", JToken.FromObject(value.ACMinFrequency));
                var channels = new JObject
                {
                    { "Mode[]", JToken.FromObject(value.GetModes()) },
                    { "ActiveMode[]", JToken.FromObject(value.GetActiveModes()) },
                    { "DeviceStatus[]", JToken.FromObject(value.GetDeviceStatuss()) },
                    { "Heartbeat[]", JToken.FromObject(value.GetHeartbeats()) },
                };
                
                var sections = new JObject
                {
                    { "Voltage[]", JToken.FromObject(value.GetVoltages()) },
                    { "Current[]", JToken.FromObject(value.GetCurrents()) },
                };
                
                var members = new JObject
                {
                    { "Name", value.Name },
                    { "Properties", properties },
                    { "Channels", channels },
                    { "Sections", sections },
                };

                var jObject = new JObject
                {
                    { nameof(NIDMM), members }
                };

                jObject.WriteTo(writer);
            }
        }

        #endregion
    
    }
}
    