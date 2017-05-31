---
title: Changed answer file settings for Windows 8.1 and Windows Server 2012 R2
description: This topic describes Windows 8.1 and Windows Server 2012 R2 answer-file settings that have changed since Windows 8 and Windows Server 2012.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6b64c934-6be0-4897-be89-041bf86e46f9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Changed answer file settings for Windows 8.1 and Windows Server 2012 R2


This topic describes Windows 8.1 and Windows Server 2012 R2 answer-file settings that have changed since Windows 8 and Windows Server 2012.

## In This Section


-   [New Windows Settings](#newwindowssettings)

-   [Changed Windows Settings](#changedwindowssettings)

-   [Deprecated Windows Settings](#renamedordeprecatedsettings)

-   [Deprecated Internet Explorer Settings](#deprecatediesettings)

-   [Removed Windows Settings](#removedsettings)

-   [Removed Internet Explorer Settings](#removediesettings)

## <a href="" id="newwindowssettings"></a>New Windows Settings


These settings are new in Windows 8.1 Update, Windows 8.1 and Windows Server 2012 R2:

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
<td><p>Microsoft-Windows-CoreMmRes\[CameraSoundLevel](microsoft-windows-coremmres-camerasoundlevel.md)</p></td>
<td><p>Sets the volume of the sound played when a user starts a recording, stops a recording, takes a photo or starts a photo sequence. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-CoreMmRes\[NoPhysicalCameraLED](microsoft-windows-coremmres-nophysicalcameraled.md)</p></td>
<td><p>Indicates that there is no physical LED for the device’s camera. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-GPIOButtons\[ConvertibleSlateMode](microsoft-windows-gpiobuttons-convertibleslatemode.md)</p></td>
<td><p>Sets the touchscreen behavior for a laptop, a PC with permanently attached keyboard available at any time for typing comfortably</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-securestartup-filterdriver-\[PreventDeviceEncryption](microsoft-windows-securestartup-filterdriver-preventdeviceencryption.md)</p></td>
<td><p>Prevents encrypting the operating system drive and any fixed data drive using Windows BitLocker Drive Encryption.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\[DesktopOptimization](microsoft-windows-shell-setup-desktopoptimization.md)</p></td>
<td><p>Specifies display settings that affect the desktop. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup \[ShowPowerButtonOnStartScreen](microsoft-windows-shell-setup-showpowerbuttononstartscreen.md)</p></td>
<td><p>Specifies that the Power Options button is displayed on the Start Screen. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile7](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile7.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile7. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile8](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile8.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile8. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile9](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile9.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile9. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile10](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile10.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile10. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile11](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile11.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile11. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\SquareTiles\[SquareOrDesktopTile12](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile12.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> screen, in position SquareOrDesktopTile12. New for Windows 8.1 Update.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-SystemSettings\[DisplayNetworkSelection](microsoft-windows-systemsettingsdisplaynetworkselection.md)</p></td>
<td><p>Specifies whether to always show the Network Selection control in the <strong>Mobile Broadband Properties</strong> dialog.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-SystemSettings\[WiFiToWlan](microsoft-windows-systemsettings-wifitowlan.md)</p></td>
<td><p>Replaces the. &quot;Wi-Fi&quot; heading in the Networks list with &quot;WLAN&quot;.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-WwanUI\[NotInOOBE](microsoft-windows-wwanui-notinoobe.md)</p></td>
<td><p>Hides mobile broadband devices and networks in OOBE.</p></td>
</tr>
<tr class="even">
<td><p>Security-Malware-Windows-Defender\[DefinitionUpdateFileSharesSources](security-malware-windows-defender-definitionupdatefilesharessources.md)</p></td>
<td><p>Configures UNC file share sources for downloading definition updates for Windows Defender.</p></td>
</tr>
<tr class="odd">
<td><p>Security-Malware-Windows-Defender\[EnableRemoteManagedDefaults](security-malware-windows-defender-enableremotemanageddefaults.md)</p></td>
<td><p>Specifies whether to configure Windows Defender to be remotely managed using recommended default settings.</p></td>
</tr>
<tr class="even">
<td><p>Security-Malware-Windows-Defender\[FallbackOrder](security-malware-windows-defender-fallbackorder.md)</p></td>
<td><p>Specifies the order in which different definition update sources should be contacted by Windows Defender.</p></td>
</tr>
<tr class="odd">
<td><p>Security-Malware-Windows-Defender\[Scan](security-malware-windows-defender-scan.md)</p></td>
<td><p>Specifies settings that configure the scheduled scan for Windows Defender.</p></td>
</tr>
<tr class="even">
<td><p>Security-Malware-Windows-Defender\[SignatureUpdateInterval](security-malware-windows-defender-signatureupdateinterval.md)</p></td>
<td><p>Specifies the interval Windows Defender checks for definition updates.</p></td>
</tr>
<tr class="odd">
<td><p>Security-Malware-Windows-Defender\[ThreatSeverityDefaultAction](security-malware-windows-defender-threatseveritydefaultaction.md)</p></td>
<td><p>Specifies settings that define the default action to be taken for specific threat alert levels.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="changedwindowssettings"></a>Changed Windows Settings


These Windows 8.1 and Windows Server 2012 R2 settings have changed from Windows 8 and Windows Server 2012:

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
<td><p>Microsoft-Windows-Shell-Setup\StartTiles\RegionalOverrides\RegionalOverride\[Order](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-order.md)</p></td>
<td><p>Specifies a unique id for a set of regions. In the specified set of regions, Windows displays a customized set of apps that appear on the Start and Lock screens.</p></td>
<td><p>Changed the maximum value of unique IDs for the regional override from 19 to 199.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\VisualEffects\[SystemDefaultBackgroundColor](microsoft-windows-shell-setup-visualeffects-systemdefaultbackgroundcolor.md)</p></td>
<td><p>Specifies the system default Windows background color scheme appearing on first boot, and on LogonUI if no user is selected.</p></td>
<td><p>Added new color scheme for Windows 8.1.</p></td>
</tr>
<tr class="odd">
<td><p>Networking-MPSSVC-Svc: [DomainProfile_DisableNotifications](networking-mpssvc-svcdomainprofile-disablenotifications.md), [PrivateProfile_DisableNotifications](networking-mpssvc-svcprivateprofile-disablenotifications.md), and [PublicProfile_DisableNotifications](networking-mpssvc-svcpublicprofile-disablenotifications.md).</p></td>
<td><p>Multiple settings</p></td>
<td><p>Changed default value for Windows RT 8.1.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="renamedordeprecatedsettings"></a>Deprecated Windows Settings


The following Windows 8 and Windows Server 2012 settings are not supported in Windows 8.1 and Windows Server 2012 R2, and may be removed in a future release. The following table includes status of the setting, and recommendations for new settings to use when applicable:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Deprecated setting from Windows 8 or Windows Server 2012</th>
<th>Status or recommendation for Windows 8.1 or Windows Server 2012 R2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>microsoft-windows-mobilepc-sensors-api-\SensorPermissions\Sensor\Enable</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-mobilepc-sensors-api-\SensorPermissions\Sensor\GUID</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="odd">
<td><p>microsoft-windows-mobilepc-sensors-api-\SensorPermissions\Sensor\GUIDClassification</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-mobilepc-sensors-api-\SensorPermissions\Sensor\Order</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="odd">
<td><p>microsoft-windows-securestartup-filterdriver-\InPlaceCrypto</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-securestartup-filterdriver-\ModifiedWriteMaximum</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
<tr class="odd">
<td><p>microsoft-windows-securestartup-filterdriver- \ReadDoubleBuffering</p></td>
<td><p>This is not applicable for Windows 8.1.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="deprecatediesettings"></a>Deprecated Internet Explorer Settings


These settings in the Microsoft-Windows-IE-InternetExplorer component are deprecated:

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
<td><p>Microsoft-Windows-IE-InternetExplorer\AllSitesCompatibilityMode</p></td>
<td><p>This setting is not supported.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-IE-InternetExplorer\DisableWelcomePage</p></td>
<td><p>This setting was deprecated in Windows 8 and is no longer supported.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-IE-InternetExplorer\NoDial</p></td>
<td><p>Internet Explorer 9 through Internet Explorer 11 do not include an IEAK-based sign-up process.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-IE-InternetExplorer\[PreApprovedAddons](microsoft-windows-ie-internetexplorer-preapprovedaddons.md)</p></td>
<td><p>Add-ons can still be installed but they will be disabled, by default. Users will be able to choose the add-ons to enable.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-IE-InternetExplorer\ShowCompatibilityViewButton</p></td>
<td><p>This setting is not supported.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-IE-InternetExplorer\SmallCommandBarIcons</p></td>
<td><p>This setting is not supported.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-IE-InternetExplorer\Scope\DisplayQuickPick</p></td>
<td><p>This setting is not supported.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="removedsettings"></a>Removed Windows Settings


We recommend these replacements for Windows 8 and Windows Server 2012 settings that have been removed from Windows 8 and Windows Server 2012:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Removed setting from Windows 8 or Windows Server 2012</th>
<th>Recommendation for Windows 8.1 or Windows Server 2012 R2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft-Windows-PerfCenterCPL\WindowsExperienceIndexOemInfo\HardwareUpgradeURL</p></td>
<td><p>No recommendation.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-PerfCenterCPL\WindowsExperienceIndexOemInfo\Logo</p></td>
<td><p>No recommendation.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-AllUserInstallAgent\LogonWaitForPackageRegistration</p></td>
<td><p>No recommendation.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="removediesettings"></a>Removed Internet Explorer Settings


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
<td><p>Microsoft-Windows-IE-InternetExplorer: EnableLinksBar, ShowCommandBar, ShowMenuBar, and ShowStatusBar.</p></td>
<td><p>Users can still make these bars appear in Internet Explorer for the desktop.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-IE-InternetExplorer\IEWelcomeMsg</p></td>
<td><p>To skip the First Run wizard and the welcome page when Internet Explorer starts for the first time, use the [DisableFirstRunWizard](microsoft-windows-ie-internetexplorer-disablefirstrunwizard.md) settings.</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft-Windows-IE-InternetExplorer\PrintBackground</p></td>
<td><p>This setting is not supported.</p></td>
</tr>
</tbody>
</table>


[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Changed%20answer%20file%20settings%20for%20Windows%208.1%20and%20Windows%20Server%202012%20R2%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





