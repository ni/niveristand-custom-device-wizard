<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="NI VeriStand APIs" Type="Folder">
			<Item Name="Custom Device API.lvlib" Type="Library" URL="/&lt;vilib&gt;/NI VeriStand/Custom Device API/Custom Device API.lvlib"/>
			<Item Name="Custom Device Utility Library.lvlib" Type="Library" URL="/&lt;vilib&gt;/NI VeriStand/Custom Device Tools/Custom Device Utility Library/Custom Device Utility Library.lvlib"/>
		</Item>
		<Item Name="%ConfigurationLibraryFileName%" Type="Library" URL="../%ConfigurationLibraryFileName%"/>
		<Item Name="%XMLCustomDeviceFileName%" Type="Document" URL="../../../%XMLCustomDeviceFileName%"/>
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
			<Item Name="Configuration Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">{3ECB30A6-9676-497C-9292-3EC689BB6702}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Configuration Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{C7B72E93-8B50-487C-8B64-9F99DA0DED33}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%ConfigurationPPLFileName%</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath/Builds/%CustomDeviceName%/Windows/%ConfigurationPPLFileName%</Property>
				<Property Name="Destination[0].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[2].destName" Type="Str">Common Directory</Property>
				<Property Name="Destination[2].path" Type="Path">/%CDFolderPath/Builds/%CustomDeviceName%</Property>
				<Property Name="Destination[2].path.type" Type="Str">Absolute</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{31E7D456-84CA-4D14-BBEA-14F44C4FE1FB}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%ConfigurationLibraryFileName%</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/%XMLCustomDeviceFileName%</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">3</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/PluginCore_v1.lvlibp</Property>
				<Property Name="Source[3].preventRename" Type="Bool">true</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Configuration Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Configuration Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 </Property>
				<Property Name="TgtF_productName" Type="Str">Configuration Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">%ConfigurationPPLGUID%</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%CustomDeviceName% Configuration.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
