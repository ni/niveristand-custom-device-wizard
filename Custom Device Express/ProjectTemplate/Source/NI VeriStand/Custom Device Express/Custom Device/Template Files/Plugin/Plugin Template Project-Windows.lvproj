<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Property Name="CCSymbols" Type="Str">ENABLE_PERFETTO,FALSE;</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="%DeploymentHooksFileName%.lvlib" Type="Library" URL="../Deployment Hooks/%DeploymentHooksFileName%.lvlib"/>
		<Item Name="%PluginLibraryFileName% Engine.lvlib" Type="Library" URL="../Engine/%PluginLibraryFileName% Engine.lvlib"/>
		<Item Name="Compiled.Settings.ctl" Type="VI" URL="../Shared/Compiled.Settings.ctl"/>
		<Item Name="Perfetto PPL Post-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Perfetto PPL Post-Build Action.vi"/>
		<Item Name="Perfetto PPL Pre-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Perfetto PPL Pre-Build Action.vi"/>
		<Item Name="Debug PPL Post-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Debug PPL Post-Build Action.vi"/>
		<Item Name="Debug PPL Pre-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Debug PPL Pre-Build Action.vi"/>
		<Item Name="CustomDeviceInterfaces_v1.lvlibp" Type="LVLibp" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp">
			<Item Name="Custom Device" Type="Folder">
				<Item Name="CustomDevice.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/custom-device-express-framework/Source/Custom Device Interfaces/CustomDevice/CustomDevice.lvclass"/>
			</Item>
			<Item Name="Custom Device API" Type="Folder">
				<Item Name="CustomDeviceAPI.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/custom-device-express-framework/Source/Custom Device Interfaces/CustomDeviceAPI/CustomDeviceAPI.lvclass"/>
			</Item>
			<Item Name="Custom Device Deployment Hooks" Type="Folder">
				<Item Name="CustomDeviceDeploymentHooks.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/custom-device-express-framework/Source/Custom Device Interfaces/CustomDeviceDeploymentHooks/CustomDeviceDeploymentHooks.lvclass"/>
			</Item>
			<Item Name="Utility" Type="Folder">
				<Item Name="CustomDeviceUtility.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/custom-device-express-framework/Source/Custom Device Interfaces/Utility/CustomDeviceUtility.lvclass"/>
			</Item>
			<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/error.llb/Error Cluster From Error Code.vi"/>
			<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVClass/Get LV Class Default Value.vi"/>
			<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;userlib&gt;/CustomDeviceInterfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Deployment Hooks Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">{2afdb4e0-d969-41a0-bc36-b5cc8f7a3e7d}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{1aee73f0-bfe0-4433-8fe6-34d0433f7cf9}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%DeploymentHooksFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins/%DeploymentHooksFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">Absolute</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{06137edd-4993-460f-9ced-50ce7bf49bcf}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%DeploymentHooksFileName%.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Compiled.Settings.ctl</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/CustomDeviceInterfaces_v1.lvlibp</Property>
				<Property Name="Source[3].preventRename" Type="Bool">true</Property>
				<Property Name="SourceCount" Type="Int">4</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{0a642a21-babe-45dc-9ec3-7dbfc2aa8953}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%DeploymentHooksFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Plugin Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">{DE88CF76-CDAE-443A-BEC7-8B9BD32608EB}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Plugin Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Debug PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Debug PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{7213C062-B70E-40E2-AB93-74FAE631CF6D}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins/%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{7B8C7AD7-D10C-44E6-89E5-A47CA8161700}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Compiled.Settings.ctl</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[3].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Logging</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Plugin</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="Source[5].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[5].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Processes</Property>
				<Property Name="Source[5].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[5].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[5].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[5].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[5].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[5].type" Type="Str">Container</Property>
				<Property Name="Source[6].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/CustomDeviceInterfaces_v1.lvlibp</Property>
				<Property Name="Source[6].preventRename" Type="Bool">true</Property>
				<Property Name="Source[7].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass</Property>
				<Property Name="Source[7].newName" Type="Str">%CustomDeviceName%.lvclass</Property>
				<Property Name="Source[7].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[7].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">8</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Plugin Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Plugin Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Plugin Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C9060B75-07F4-4F21-B91C-18C293235D56}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Plugin Debug PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">{DE88CF76-CDAE-443A-BEC7-8B9BD32608EB}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Plugin Debug PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Debug PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Debug PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{7213C062-B70E-40E2-AB93-74FAE631CF6D}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins/%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{7B8C7AD7-D10C-44E6-89E5-A47CA8161700}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Compiled.Settings.ctl</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[3].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Logging</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Plugin</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="Source[5].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[5].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass/Processes</Property>
				<Property Name="Source[5].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[5].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[5].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[5].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[5].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[5].type" Type="Str">Container</Property>
				<Property Name="Source[6].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/CustomDeviceInterfaces_v1.lvlibp</Property>
				<Property Name="Source[6].preventRename" Type="Bool">true</Property>
				<Property Name="Source[7].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass</Property>
				<Property Name="Source[7].newName" Type="Str">%CustomDeviceName%.lvclass</Property>
				<Property Name="Source[7].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[7].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">8</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_enableDebugging" Type="Bool">true</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Plugin Debug PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Plugin Debug PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Plugin Debug PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C9060B75-07F4-4F21-B91C-18C293235D56}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Plugin Perfetto Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">{2D0B379C-8A1F-405C-8FCB-6B32FF8AD222}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Plugin Perfetto Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Plugins</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Perfetto PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Perfetto PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{ACEC2B14-490D-4916-AFBC-23D8D6C73D47}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CustomDeviceName%/Linux_x64/Plugins/%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{242F31D0-89D7-4A7D-8A5F-720D5E5515DE}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Compiled.Settings.ctl</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/CustomDeviceInterfaces_v1.lvlibp</Property>
				<Property Name="Source[3].preventRename" Type="Bool">true</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/%PluginLibraryFileName% Engine.lvlib/%PluginLibraryFileName% Engine.lvclass</Property>
				<Property Name="Source[4].newName" Type="Str">%CustomDeviceName%.lvclass</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[4].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">5</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Plugin Perfetto Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Plugin Perfetto Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Plugin Perfetto Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{A3C52FB7-88D1-40DB-A382-922D3EAB40F5}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%PluginPPLWindowsFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
