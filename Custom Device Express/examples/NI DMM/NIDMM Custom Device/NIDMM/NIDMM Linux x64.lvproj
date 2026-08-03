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
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Deployment Hooks Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">B25BD56A-7232-4BD3-A7C0-892FA0147228</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Deployment Hooks Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds/NIDMM/Windows</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">6B0EFF12-882E-497C-B48D-590C7DD10FB0</Property>
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
				<Property Name="Source[0].itemID" Type="Str">FAAD443C-8BBA-4180-8C21-569ED1634D37</Property>
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
				<Property Name="TgtF_targetfileGUID" Type="Str">12122BF8-7F2C-4B7C-B49C-3FA388873609</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM Deployment Hooks.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
	<Item Name="RT PXI Target" Type="RT PXI Chassis">
		<Property Name="alias.name" Type="Str">RT PXI Target</Property>
		<Property Name="alias.value" Type="Str">0.0.0.0</Property>
		<Property Name="CCSymbols" Type="Str">TARGET_TYPE,RT;OS,Linux;CPU,x64;</Property>
		<Property Name="host.ResponsivenessCheckEnabled" Type="Bool">true</Property>
		<Property Name="host.ResponsivenessCheckPingDelay" Type="UInt">5000</Property>
		<Property Name="host.ResponsivenessCheckPingTimeout" Type="UInt">1000</Property>
		<Property Name="host.TargetCPUID" Type="UInt">9</Property>
		<Property Name="host.TargetOSID" Type="UInt">19</Property>
		<Property Name="target.cleanupVisa" Type="Bool">false</Property>
		<Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
		<Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
		<Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.IOScan.Faults" Type="Str"></Property>
		<Property Name="target.IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="target.IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="target.IOScan.Period" Type="UInt">10000</Property>
		<Property Name="target.IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="target.IOScan.Priority" Type="UInt">0</Property>
		<Property Name="target.IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="target.IsRemotePanelSupported" Type="Bool">true</Property>
		<Property Name="target.RTCPULoadMonitoringEnabled" Type="Bool">true</Property>
		<Property Name="target.RTDebugWebServerHTTPPort" Type="Int">8001</Property>
		<Property Name="target.RTTarget.ApplicationPath" Type="Path">/c/ni-rt/startup/startup.rtexe</Property>
		<Property Name="target.RTTarget.EnableFileSharing" Type="Bool">true</Property>
		<Property Name="target.RTTarget.IPAccess" Type="Str">+*</Property>
		<Property Name="target.RTTarget.LaunchAppAtBoot" Type="Bool">false</Property>
		<Property Name="target.RTTarget.VIPath" Type="Path">/home/lvuser/natinst/bin</Property>
		<Property Name="target.server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.tcp.access" Type="Str">+*</Property>
		<Property Name="target.server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="target.server.tcp.paranoid" Type="Bool">true</Property>
		<Property Name="target.server.tcp.port" Type="Int">3363</Property>
		<Property Name="target.server.tcp.serviceName" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.tcp.serviceName.default" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.vi.access" Type="Str">+*</Property>
		<Property Name="target.server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="target.server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.WebServer.Enabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogEnabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogPath" Type="Path">/c/ni-rt/system/www/www.log</Property>
		<Property Name="target.WebServer.Port" Type="Int">80</Property>
		<Property Name="target.WebServer.RootPath" Type="Path">/c/ni-rt/system/www</Property>
		<Property Name="target.WebServer.TcpAccess" Type="Str">c+*</Property>
		<Property Name="target.WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.WebServer.ViAccess" Type="Str">+*</Property>
		<Property Name="target.webservices.SecurityAPIKey" Type="Str">PqVr/ifkAQh+lVrdPIykXlFvg12GhhQFR8H9cUhphgg=:pTe9HRlQuMfJxAG6QCGq7UvoUpJzAzWGKy5SbZ+roSU=</Property>
		<Property Name="target.webservices.ValidTimestampWindow" Type="Int">15</Property>
		<Item Name="Compiled.Settings.ctl" Type="VI" URL="../Shared/Compiled.Settings.ctl"/>
		<Item Name="Custom Device Interfaces_v1.lvlibp" Type="LVLibp" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp">
			<Item Name="Custom Device" Type="Folder">
				<Item Name="Custom Device.lvclass" Type="LVClass" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/CustomDevice/Custom Device.lvclass"/>
			</Item>
			<Item Name="Custom Device API" Type="Folder">
				<Item Name="Custom Device API.lvclass" Type="LVClass" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/CustomDeviceAPI/Custom Device API.lvclass"/>
			</Item>
			<Item Name="Custom Device Deployment Hooks" Type="Folder">
				<Item Name="Custom Device Deployment Hooks.lvclass" Type="LVClass" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/CustomDeviceDeploymentHooks/Custom Device Deployment Hooks.lvclass"/>
			</Item>
			<Item Name="Utility" Type="Folder">
				<Item Name="Custom Device Utility.lvclass" Type="LVClass" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/Utility/Custom Device Utility.lvclass"/>
			</Item>
			<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
			<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/error.llb/Error Cluster From Error Code.vi"/>
			<Item Name="Get LV Class Default Value.vi" Type="VI" URL="../../../../../../../Program Files/NI/LVAddons/nivscustomdeviceexpress/1/Targets/NI/RT/Linux/PXI/user.lib/Custom Device Interfaces_v1.lvlibp/1abvi3w/vi.lib/Utility/LVClass/Get LV Class Default Value.vi"/>
		</Item>
		<Item Name="NIDMM Engine.lvlib" Type="Library" URL="../Engine/NIDMM Engine.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Custom Device Engine Debug PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">349B61E2-4394-48B0-9B31-30881C01D897</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Custom Device Engine Debug PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/Debug PPL Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Debug PPL Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">DCD0FC0A-E4D6-4C7A-B74A-A49CCE5C95CD</Property>
				<Property Name="Bld_targetDestDir" Type="Path">/NIDMM/Linux_x64</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/NIDMM/Linux_x64/NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/NIDMM/Linux_x64/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">5B057CE1-0D4C-4EF8-8F39-F6543DB37FC5</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Logging</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="Source[3].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[3].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Overrides</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Processes</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="Source[5].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass</Property>
				<Property Name="Source[5].newName" Type="Str">NIDMM.lvclass</Property>
				<Property Name="Source[5].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[5].type" Type="Str">Library</Property>
				<Property Name="Source[6].Container.applySaveSettings" Type="Bool">true</Property>
				<Property Name="Source[6].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[6].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass/Utilities</Property>
				<Property Name="Source[6].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[6].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[6].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[6].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[6].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[6].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">7</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_enableDebugging" Type="Bool">true</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Custom Device Engine Debug PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Custom Device Engine Debug PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Custom Device Engine Debug PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">6B0B57EE-0BE0-4420-AF08-1D0C9C844AF8</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Custom Device Engine Release PPL" Type="Packed Library">
				<Property Name="Bld_buildCacheID" Type="Str">E900DE16-9A57-477F-B8DC-8C387201F325</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Custom Device Engine Release PPL</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/User/Desktop/New CD DMM/NIDMM Custom Device/Builds</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">2E558A61-7C15-4433-909E-3E3E74BF5067</Property>
				<Property Name="Bld_targetDestDir" Type="Path">/NIDMM/Linux_x64</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">/NIDMM/Linux_x64/NIDMM.lvlibp</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/NIDMM/Linux_x64/Adapter</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">EEFC70AF-FAA9-4AEF-9F35-30DAA1B339F6</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/RT PXI Target/Compiled.Settings.ctl</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[3].itemID" Type="Ref">/RT PXI Target/Custom Device Interfaces_v1.lvlibp</Property>
				<Property Name="Source[3].preventRename" Type="Bool">true</Property>
				<Property Name="Source[4].itemID" Type="Ref">/RT PXI Target/NIDMM Engine.lvlib/NIDMM Engine.lvclass</Property>
				<Property Name="Source[4].newName" Type="Str">NIDMM.lvclass</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[4].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">5</Property>
				<Property Name="TgtF_companyName" Type="Str">NI (now part of Emerson)</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Custom Device Engine Release PPL</Property>
				<Property Name="TgtF_internalName" Type="Str">Custom Device Engine Release PPL</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026 NI (now part of Emerson)</Property>
				<Property Name="TgtF_productName" Type="Str">Custom Device Engine Release PPL</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">B4F95701-9132-4415-83E9-B75626B0058A</Property>
				<Property Name="TgtF_targetfileName" Type="Str">NIDMM.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
