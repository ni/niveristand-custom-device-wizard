<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
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
		<Item Name="Run Test Bench.vi" Type="VI" URL="../Test Bench/Run Test Bench.vi"/>
		<Item Name="Test Bench Constants.vi" Type="VI" URL="../Test Bench/Test Bench Constants.vi"/>
		<Item Name="%DeploymentHooksFileName%.lvlib" Type="Library" URL="../Deployment Hooks/%DeploymentHooksFileName%.lvlib"/>
		<Item Name="%CustomDeviceEngineLibraryFileName% Engine.lvlib" Type="Library" URL="../Engine/%CustomDeviceEngineLibraryFileName% Engine.lvlib"/>
		<Item Name="%TestHooksFileName%.lvlib" Type="Library" URL="../Test Bench/Test Hooks/%TestHooksFileName%.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Test Hooks Debug PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">%TestBenchGUID1%</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Test Hooks Debug PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">%TestBenchGUID2%</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">%TestHooksFileName%.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/%TestHooksFileName%.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">Absolute;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/%CDFolderPath%/Builds/%CustomDeviceName%/Windows/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">Absolute</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">%TestBenchGUID3%</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/%TestHooksFileName%.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/%TestHooksFileName%.lvlib/Test Hooks</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_enableDebugging" Type="Bool">true</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Test Hooks Debug PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Test Hooks Debug PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 </Property>
				<Property Name="TgtF_productName" Type="Str">Test Hooks Debug PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">%TestBenchGUID4%</Property>
				<Property Name="TgtF_targetfileName" Type="Str">%TestHooksFileName%.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
