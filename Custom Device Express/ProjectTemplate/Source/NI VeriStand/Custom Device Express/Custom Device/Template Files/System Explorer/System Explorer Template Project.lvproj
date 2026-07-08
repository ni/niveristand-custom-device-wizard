<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">26.0</Property>
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
		<Item Name="%XMLCustomDeviceFileName%" Type="Document" URL="../../../%XMLCustomDeviceFileName%"/>
		<Item Name="Post-Build Action.vi" Type="VI" URL="../Utilities/Post-Build Action.vi"/>
		<Item Name="%SystemExplorerFileName%.lvlib" Type="Library" URL="../%SystemExplorerFileName%.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="System Explorer Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">%SystemExplorerGUID1%</Property>
				<Property Name="Bld_buildSpecName" Type="Str">System Explorer Release PPL</Property>
				<Property Name="Bld_excludeDependentDLLs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Post-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">%SystemExplorerGUID2%</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%SystemExplorerFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/%SystemExplorerFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Destination[1].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[2].destName" Type="Str">Common Directory</Property>
				<Property Name="Destination[2].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%</Property>
				<Property Name="Destination[2].path.type" Type="Str">Absolute</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">%SystemExplorerGUID3%</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%SystemExplorerFileName%.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/%XMLCustomDeviceFileName%</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">System Explorer Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">System Explorer Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">System Explorer Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">%SystemExplorerGUID4%</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%SystemExplorerFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
