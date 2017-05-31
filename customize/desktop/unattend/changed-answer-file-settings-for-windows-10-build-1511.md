---
title: Changed answer file settings for Windows 10 for desktop editions, build 1511
description: This topic describes Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) and Windows Server 2016 answer file settings that have changed since Windows 8.1 Update, Windows 8.1, and Windows Server 2012 R2.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 78CBC697-0E98-46D5-A2A1-1D2808C6AB37
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Changed answer file settings for Windows 10 for desktop editions, build 1511


This topic describes Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) and Windows Server 2016 answer file settings that have changed since Windows 8.1 Update, Windows 8.1, and Windows Server 2012 R2.

## In This Section


-   [New Windows settings](#newwindowssettings)

-   [Changed Windows settings](#changedwindowssettings)

-   [Deprecated Windows settings](#renamedordeprecatedsettings)

-   [Removed Windows settings](#removedsettings)

-   [Removed Internet Explorer settings](#removediesettings)

## <a href="" id="newwindowssettings"></a>New Windows settings


These Unattend settings are new in Windows 10:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>New setting</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>microsoft-windows-setup-\ImageInstall\OSImage\[Compact](compact.md)</p></td>
<td><p>Specifies whether the Windows image should be applied with compression enabled during installation. If set to <strong>true</strong>, files written to the disk during installation are compressed individually, which allows Windows to take up less disk space.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Wlansvc\[CoexistenceSupport](coexistencesupport.md)</p></td>
<td><p>Specifies the type of co-existence that's supported on the device:</p>
<ul>
<li><strong>Both</strong> - Both Wi-Fi and Bluetooth work at the same performance level during co-existence.</li>
<li><strong>Wi-Fi reduced</strong> - On a 2X2 system, Wi-Fi performance is reduced to 1X1 level.</li>
<li><strong>Bluetooth centered</strong> - When co-existing, Bluetooth has priority and restricts Wi-Fi performance.</li>
<li><strong>One</strong> - Either Wi-Fi or Bluetooth will stop working.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Wlansvc\[NumAntennaConnected](numantennaeconnected.md)</p></td>
<td><p>Specifies the number of antennas that are connected to the WLAN radio.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Wlansvc\[SimultaneousMultiChannelSupported](simultaneousmultichannelsupported.md)</p></td>
<td><p>Specifies the maximum number of channels that the Wi-Fi device can simultaneously operate on. For example, you can use this to specify support for Station mode and Wi-Fi Direct GO on separate channels simultaneously.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Wlansvc\[WLANFunctionalLevelDeviceResetSupported](wlanfunctionalleveldevicereset.md)</p></td>
<td><p>Specifies whether the device supports functional level device reset. The functional level device reset feature in the OS checks this system capability exclusively to determine if it can run.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Wlansvc\[WLANPlatformLevelDeviceResetSupported](wlanplatformleveldevicereset.md)</p></td>
<td><p>Specifies whether the device supports platform level device reset. The platform level device reset feature in the OS checks this system capability exclusively to determine if it can run.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-DeviceAccess](microsoft-windows-deviceaccess.md)\[SetRegionSpecificPrivacyAccessPolicy](setregionspecificprivacyaccesspolicy.md)</p></td>
<td><p>The <code>Microsoft-Windows-DeviceAccess</code> component specifies settings for enabling device policy, which includes enabling the China CTA policy through the <code>SetRegionSpecificPrivacyAccessPolicy</code> setting.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Printing-Spooler-Core\[Start](microsoft-windows-printing-spooler-core-start.md)</p></td>
<td><p>Indicates whether the spooler autologger will start by default when the system boots.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Printing-Spooler-Core\[RemoveMPDW](microsoft-windows-printing-spooler-core-removempdw.md)</p></td>
<td><p>Specifies whether to remove the Microsoft Print to PDF print queue and driver package from a Windows installation.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\OEMInformation\[SupportAppURL](microsoft-windows-shell-setup-oeminformation-supportappurl.md)</p></td>
<td><p>Specifies the OEM-built support app that will be launched instead of the web URL.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\[OfflineUserAccounts](microsoft-windows-shell-setup-offlineuseraccounts.md)</p></td>
<td><p>Specifies the account information used to join a domain during Windows Setup.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-UnattendedJoin\[OfflineIdentification](microsoft-windows-unattendedjoin-offlineidentification.md)</p></td>
<td><p>Specifies credentials for provisioning the account data during the offlineServicing configuration pass.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\OOBE\[UnattendEnableRetailDemo](microsoft-windows-shell-setup-oobe-unattendenableretaildemo.md)</p></td>
<td><p>Enables retail demo mode on the device. Retail demo mode is a special retail mode that can be activated in retail stores to run a demo on the device. The demo highlights key features of the OS and shows off the device user experience.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\OOBE\[VMModeOptimizations](microsoft-windows-shell-setup-oobe-vmmodeoptimizations.md)</p></td>
<td><p>Specifies settings you can use to customize the user experience when in VM mode.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\[SignInMode](microsoft-windows-shell-signinmode.md)</p>
<p>Microsoft-Windows-Shell-Setup\[ConvertibleSlateModePromptPreference](microsoft-windows-shell-convertibleslatemodepromptpreference.md)</p></td>
<td><p>OEMs can configure these settings to support Continuum, which is a new, adaptive user experience in Windows 10 that optimizes the look and behavior of apps and the Windows UI for a given physical form factor and the customer's usage preferences.</p>
<ul>
<li><p>To configure devices to boot straight into tablet mode, use <code>SignInMode</code>.</p></li>
<li><p>To support prompts triggered by changes to [ConvertibleSlateMode](microsoft-windows-gpiobuttons-convertibleslatemode.md), configure <code>ConvertibleSlateModePromptPreference</code>. OEMs must make sure that <code>ConvertibleSlateMode</code> is always accurate for their devices.</p></li>
</ul>
<p>OEMs may also specify the device form factor using <code>DeviceForm</code>.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Deployment\[DeviceForm](microsoft-windows-deployment-deviceform.md)</p></td>
<td><p>Use to specify the device form factor running Windows 10.</p>
<p>OEMs must set <code>DeviceForm</code> correctly to support the following features or components:</p>
<ul>
<li><strong>Retail demo mode</strong> - Relies on the setting value to dictate the demo content that will be shown on the device. For example, if an OEM wants to highlight Continuum, the OEM must accurately configure the value for <code>DeviceForm</code>.</li>
<li><strong>Cortana and Bing</strong> - Use the <code>DeviceForm</code> value to determine the accuracy of specific signals, such as location (GPS versus Wi-Fi versus reverse IP address lookup).</li>
<li>Windows 10 features - Some OS functionality, such as Bluetooth and camera, may require <code>DeviceForm</code> to be accurately configured for full functionality.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-TabletPC-Platform-Input-Core\[HandwritingPanelDockedModeSet](handwritingpaneldockedmodeset.md)</p></td>
<td><p>Use to specify whether the handwriting panel is initially docked by default.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-TabletPC-Platform-Input-Core\[TouchKeyboardAutoInvokeEnabled](touchkeyboardautoinvokeenabled.md)</p></td>
<td><p>Use to specify whether the touch keyboard is automatically invoked by default when there is no hardware keyboard connected and the device is in non-tablet mode.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-MapControl-Desktop](microsoft-windows-mapcontrol.md)\[ChinaVariantWin10](chinavariantwin10.md)</p></td>
<td><p>Use to specify that the Windows device is intended to ship in China. When enabled, maps approved by the State Bureau of Surveying and Mapping in China are used, which are obtained from a server located in China.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-DeviceGuard-Unattend](microsoft-windows-deviceguard-unattend.md)</p></td>
<td><p>Specifies settings for initializing and enforcing virtualization-based security, which helps protect system memory and kernel mode apps and drivers from possible tampering.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Embedded-BootExp](microsoft-windows-embedded-bootexp.md)</p></td>
<td><p>Specifies settings you can use to suppress OS elements that appear when the device starts or resumes, or you can suppress the crash screen when the OS encounters an error that it cannot recover from.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Embedded-EmbeddedLogon](microsoft-windows-embedded-embeddedlogon.md)</p></td>
<td><p>Specifies settings that you can use to suppress UI elements that relate to the Welcome screen and shutdown screen.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Embedded-ShellLauncher](microsoft-windows-embedded-shelllauncher.md)</p></td>
<td><p>Specifies settings you can use to replace the default OS shell with a custom shell.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Embedded-UnifiedWriteFilter](microsoft-windows-embedded-unifiedwritefilter.md)</p></td>
<td><p>Use unified write filter (UWF) settings in your enterprise device to help protect your physical storage media.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-WiFiNetworkManager](microsoft-windows-wifinetworkmanager.md)</p></td>
<td><p>Specifies settings that you can configure for Wi-Fi Sense.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="changedwindowssettings"></a>Changed Windows settings


These Windows 10 for desktop editions and Windows Server 2016 settings have changed from Windows 8.1 Update, Windows 8.1, and Windows Server 2012 R2:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Changed setting</th>
<th>Description of setting</th>
<th>Description of change</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\[ComputerName](microsoft-windows-shell-setup-computername.md)</p></td>
<td><p>Specifies the computer name used to access the computer from the network.</p></td>
<td><p>Added offlineServicing to the list of valid configuration passes.</p>
<p>In Windows 10, users can no longer enter a computer name during OOBE as the name is auto-generated. To set a default computer name pre-OOBE, OEMs can configure <code>ComputerName</code> in the unattend file and specify a name for the computer.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\OOBE\[ProtectYourPC](microsoft-windows-shell-setup-oobe-protectyourpc.md)</p></td>
<td><p>Specifies whether Express settings are used.</p></td>
<td><p>Updated the description for the setting as well as the list of valid values and their descriptions for the values.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\[AutoLogon](microsoft-windows-shell-setup-autologon.md)</p></td>
<td><p>Specifies the account to use to log on to a computer automatically.</p></td>
<td><p>Added an important note that in Windows 10, if you configure <code>AutoLogon</code> the OS will skip the user account creation phase during OOBE and the account creation phase during OOBE is skipped in all versions of Windows when at least one user account is created through the <code>UserAccounts</code> section of the same unattend file.</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-setup--Shell\Deployment\FirstLogonCommands\[SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands.md)</p></td>
<td><p>Starts a command or script after the user completes OOBE.</p></td>
<td><p>This command now works like [LogonCommands\AsynchronousCommand](microsoft-windows-shell-setup-logoncommands.md): all commands using these unattend settings are now started at the same time, and no longer wait for the previous command to finish. </p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Deployment\[Reseal](microsoft-windows-deployment-reseal.md)</p></td>
<td><p>Indicates whether the computer runs in audit mode or Windows OOBE when the computer is next started.</p></td>
<td><p>Prior to Windows 10, <code>Reseal</code> was a special-case setting which caused all other settings in the same configuration pass to be skipped when specified in the auditSystem or oobeSystem configuration passes. In Windows 10, Reseal is always processed after all other settings in the same configuration pass.</p>
<p>For the &quot;auditSystem Audit true&quot; row, this scenario is now supported and the Result column has been updated.</p>
<p>For the &quot;oobeSystem OOBE true&quot; row, this scenario is now supported and the Result column has been updated.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="renamedordeprecatedsettings"></a>Deprecated Windows settings


The following Windows 8.1 Update, Windows 8.1, and Windows Server 2012 R2 settings are not supported in Windows 10 for desktop editions or Windows Server 2016 , and may be removed in a future release. The following table includes status of the setting, and recommendations for new settings to use when applicable:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Deprecated setting from Windows 8.1 or Windows Server 2012 R2</th>
<th>Status or recommendation for Windows 10 for desktop editions or Windows Server 2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\OOBE\[NetworkLocation](microsoft-windows-shell-setup-oobe-networklocation.md)</p></td>
<td><p>This is not applicable for Windows 10.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\VisualEffects\[SystemDefaultBackgroundColor](microsoft-windows-shell-setup-visualeffects-systemdefaultbackgroundcolor.md)</p></td>
<td><p>This setting is deprecated in Windows 10 and should not be used. The default background color during OOBE is always dark. To align with this change, partners can no longer change the default screen background color during OOBE.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-HelpAndSupport\[HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md)</p></td>
<td><p>In Windows 10, the [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information about the HelpAndSupport settings are provided for reference only.</p>
<p>In Windows 10, the OS disables the help components that shipped in Windows 8 and Windows 8.1 including the Help and Support Windows desktop application (HelpPane.exe). HelpPane.exe will continue to exist in the box, but calls to its interfaces will result in one of two outcomes:</p>
<ul>
<li>If the user is offline, the OS launches the Getting Started app.</li>
<li>If the user is online, the OS opens a browser instance and redirects the browser to an online topic.</li>
</ul>
<p>For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="removedsettings"></a>Removed Windows settings


The following components and/or settings are no longer available in Windows 10:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Removed setting from Windows 8.1 or Windows Server 2012 R2</th>
<th>Recommendation for Windows 10 for desktop editions</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft-Windows-Store-Client-UI\StoreContentModifier</p></td>
<td><p>The component and setting have been removed.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-MigrationWizardApplication\HideDiscontinuedComponents</p></td>
<td><p>The component and setting have been removed.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-ehome-reg-inf component and settings</p></td>
<td><p>Windows Media Center is no longer supported as of Windows 10. The component and settings have been removed.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="removediesettings"></a>Removed Internet Explorer settings


These settings in the Microsoft-Windows-IE-InternetExplorer component are removed:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Deprecated setting name</th>
<th>Status or recommendation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft-Windows-IE-InternetExplorer\SearchScopes\Scope\ShowTopResult</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-IE-InternetExplorer\SearchScopes\Scope\TopResultURL</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Changed answer files from Windows 8 and Windows Server 2012](changed-answer-file-settings-from-windows-8-and-windows-server-2012-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Changed%20answer%20file%20settings%20for%20Windows%2010%20for%20desktop%20editions,%20build%201511%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





