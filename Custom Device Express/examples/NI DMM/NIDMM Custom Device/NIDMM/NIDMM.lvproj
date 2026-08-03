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
		<Item Name="Compiled.Settings.ctl" Type="VI" URL="../Shared/Compiled.Settings.ctl"/>
		<Item Name="Custom Device Interfaces_v1.lvlibp" Type="LVLibp" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp">
			<Item Name="Custom Device" Type="Folder">
				<Item Name="Custom Device.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/CustomDevice/Custom Device.lvclass"/>
			</Item>
			<Item Name="Custom Device API" Type="Folder">
				<Item Name="Custom Device API.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/CustomDeviceAPI/Custom Device API.lvclass"/>
			</Item>
			<Item Name="Custom Device Deployment Hooks" Type="Folder">
				<Item Name="Custom Device Deployment Hooks.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/CustomDeviceDeploymentHooks/Custom Device Deployment Hooks.lvclass"/>
			</Item>
			<Item Name="Utility" Type="Folder">
				<Item Name="Custom Device Utility.lvclass" Type="LVClass" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/Utility/Custom Device Utility.lvclass"/>
			</Item>
			<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/error.llb/Error Cluster From Error Code.vi"/>
			<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVClass/Get LV Class Default Value.vi"/>
			<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;userlib&gt;/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
		</Item>
		<Item Name="Debug PPL Post-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Debug PPL Post-Build Action.vi"/>
		<Item Name="Debug PPL Pre-Build Action.vi" Type="VI" URL="../Engine/BuildVIs/Debug PPL Pre-Build Action.vi"/>
		<Item Name="NIDMM Deployment Hooks.lvlib" Type="Library" URL="../Deployment Hooks/NIDMM Deployment Hooks.lvlib"/>
		<Item Name="NIDMM Engine.lvlib" Type="Library" URL="../Engine/NIDMM Engine.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Custom Device Engine Debug PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">9928F126-ACA5-42DA-AF4D-B97CD7E4AABA</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Custom Device Engine Debug PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Debug PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Debug PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">3EA3DBFD-1F66-4CB8-B66F-8F909ED708A4</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">9D46A1BD-B971-491D-A4AF-8A1F5BFD4296</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib</Property>
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
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Logging</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Overrides</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="Source[5].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[5].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Processes</Property>
				<Property Name="Source[5].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[5].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[5].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[5].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[5].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[5].type" Type="Str">Container</Property>
				<Property Name="Source[6].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/Custom Device Interfaces_v1.lvlibp</Property>
				<Property Name="Source[6].preventRename" Type="Bool">true</Property>
				<Property Name="Source[7].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass</Property>
				<Property Name="Source[7].newName" Type="Str">NIDMM.lvclass</Property>
				<Property Name="Source[7].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[7].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">8</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_enableDebugging" Type="Bool">true</Property>
				<Property Name="TgtF_fileDescription" Type="Str">CustomDeviceEngine Debug PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">CustomDeviceEngine Debug PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">CustomDeviceEngine Debug PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">D765D219-A471-4F24-BEFC-8F7E7E348F20</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Custom Device Engine Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">D7935CBD-C7B1-4744-8FC8-44BE02DF3BFD</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Custom Device Engine Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Debug PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Debug PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">3DB1307F-FE5D-4222-AC28-AFDBE4B4D8EA</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">18A4C582-9CD9-44E9-ACE8-335519C38209</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Logging</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="Source[3].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[3].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Overrides</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Processes</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass</Property>
				<Property Name="Source[5].newName" Type="Str">NIDMM.lvclass</Property>
				<Property Name="Source[5].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[5].type" Type="Str">Library</Property>
				<Property Name="Source[6].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Utilities</Property>
				<Property Name="Source[6].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[6].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[6].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[6].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[6].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[6].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">7</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">CustomDeviceEngine Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">CustomDeviceEngine Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">CustomDeviceEngine Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">89BB4156-1396-409A-BF0E-AFACA62D7F4E</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Deployment Hooks Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">8B7FC29E-D6DF-40B0-95BE-5933D1B543A2</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">62C0200A-3636-4041-9D01-225601B0B8B8</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">NIDMM Deployment Hooks.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/NIDMM Deployment Hooks.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">Absolute</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">Absolute</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">68A792F3-051F-4047-852C-F370BA1ED809</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/NIDMM Deployment Hooks.lvlib</Property>
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
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/Custom Device Interfaces_v1.lvlibp</Property>
				<Property Name="Source[3].preventRename" Type="Bool">true</Property>
				<Property Name="SourceCount" Type="Int">4</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">82229E34-06EF-427B-B295-079FC746DD80</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM Deployment Hooks.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
