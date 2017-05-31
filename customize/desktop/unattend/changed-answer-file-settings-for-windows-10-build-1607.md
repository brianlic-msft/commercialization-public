---
title: Changed answer file settings for Windows 10 for desktop editions, build 1607
description: This topic describes Windows 10, version 1607 answer-file settings that have changed since Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), Build 1511.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2F87B811-7E27-4CC4-8695-82423E25C95C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Changed answer file settings for Windows 10 for desktop editions, build 1607


This topic describes Windows 10, version 1607 answer-file settings that have changed since Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), Build 1511.

## In This Section


-   [New Windows settings](#newwindowsettings)

-   [Deprecated Windows settings](#renamedordeprecatedsettings)

-   [Removed Windows settings](#removedsettings)

-   [Removed Internet Explorer settings](#removediesettings)

## <a href="" id="newwindowsettings"></a>New Windows Settings


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
<td><p>[Microsoft-Windows-RemoteAssistance-Exe-fEnableChatControl](Microsoft-Windows-RemoteAssistance-Exe-fenablechatcontrol.md)</p></td>
<td><p>New.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Shell-Setup-EnableStartMenu](Microsoft-Windows-Shell-Setup-enablestartmenu.md)</p></td>
<td><p>New. Specifies whether the Start menu is enabled and users can click on it.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Shell-Setup-DesktopOptimization-GoToDesktopOnSignIn](https://msdn.microsoft.com/library/windows/hardware/dn953808)</p></td>
<td><p>New. Specifies to go to the desktop instead of Start Screen when signing in or when all the apps on a screen are closed.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Shell-Setup-DesktopOptimization-ShowWindowsStoreAppsOnTaskbar](https://msdn.microsoft.com/library/windows/hardware/dn953809)</p></td>
<td><p>New. Shows Window Store apps on taskbar.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareOrDesktopTile7](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile7.md) thru [Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareOrDesktopTile12](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile12.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> menu, in the given position 7-12.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareTiles-SquareorDesktopTile7-AppIdOrPath](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile7-appidorpath.md) thru [Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareTiles-SquareorDestopTile12-AppIdOrPath](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile12-appidorpath.md)</p></td>
<td><p>Specifies the <code>AppID</code> of the Windows Store apps, or the path to the desktop apps that appear as square tiles on the <strong>Start</strong> screen.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareOrDesktopTile7-FirstRunTask](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile7-firstruntask.md) through [Microsoft-Windows-Shell-Setup-StartTiles-SquareTiles-SquareOrDesktopTile12-FirstRunTask](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile12-firstruntask.md)</p></td>
<td><p>Specifies the background task that is active, or live, by default for a tile when a user signs in to Windows for the first time.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareorDesktopTile7](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squareordesktoptile7.md) thru [Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareorDesktopTile12](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squareordesktoptile12.md)</p></td>
<td><p>Specifies which application appears as a square tile on the <strong>Start</strong> menu, in the given position 7-12</p>
<p>If the region of the current user account is among those in the Start Tile regional overrides, you can use this setting. For more information, see [RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md).</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareorDesktopTile7-AppIdOrPath](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squareordesktoptile7-appidorpath.md) thru [Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareorDesktopTile12-AppIdOrPath](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squareordesktoptile12-appidorpath.md)</p></td>
<td><p>Specifies the <code>AppID</code> of the Windows Store apps, or the path to the desktop apps that appear as square tiles on the <strong>Start</strong> screen.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareTile7-FirstRunTask](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squaretile7-firstruntask.md) thru [Microsoft-Windows-Shell-Setup-StartTiles-RegionalOverrides-RegionalOveride-SquareTiles-SquareTiles-SquareTile12-FirstRunTask](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squaretile12-firstruntask.md)</p></td>
<td><p>Specifies the background task that is active, or live, by default for a tile when a user signs in to Windows for the first time.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-Shell-Setup-Themes-UWPAppsUseLightTheme](microsoft-windows-shell-setup-themes-uwpappsuselighttheme.md)</p></td>
<td><p>Specifies whether the dark mode is applied.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-TwinUI-CustomProtocol](microsoft-windows-twinui-customprotocol.md)</p></td>
<td><p>Specifies advanced pen settings.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="renamedordeprecatedsettings"></a>Deprecated Windows Settings


| Deprecated setting                                                               | Status or recomendation for Windows 10, version 1607                                               |
|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| [Microsoft-Windows-WiFiNetworkManager](microsoft-windows-wifinetworkmanager.md) | The Wi-Fi Sense credential sharing feature has been removed. This setting no longer does anything. |

 

## <a href="" id="removedsettings"></a>Removed Windows Settings


The following settings are no longer available in Windows 10, version 1607:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Removed setting from Windows 8 or Windows Server 2012</th>
<th>Recommendation for Windows 10, version 1607</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)\SensorPermissions\Sensor\Enable</p></td>
<td><p>The setting and its ancestor elements have been removed.</p></td>
</tr>
<tr class="even">
<td><p>[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)\SensorPermissions\Sensor\GUID</p></td>
<td><p>The setting and its ancestor elements have been removed.</p></td>
</tr>
<tr class="odd">
<td><p>[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)\SensorPermissions\Sensor\GUIDClassification</p></td>
<td><p>The setting and its ancestor elements have been removed.</p></td>
</tr>
<tr class="even">
<td><p>[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)\SensorPermissions\Sensor\Order</p></td>
<td><p>The setting and its ancestor elements have been removed.</p></td>
</tr>
<tr class="odd">
<td><p>[microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md)\InPlaceCrypto</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>[microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md)\ModifiedWriteMaximum</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="odd">
<td><p>[microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md) \ReadDoubleBuffering</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>[TextInput](https://msdn.microsoft.com/library/windows/hardware/mt219159)\AllowKoreanExtendedHanja</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="removediesettings"></a>Removed Internet Explorer Settings


These settings in the [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) component are removed:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Removed setting from Windows 8 or Windows Server 2012</th>
<th>Recommendation for Windows 10, version 1607</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\AllSitesCompatibilityMode</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\DisableWelcomePage</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\NoDial</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\ShowCompatibilityViewButton</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="odd">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\SmallCommandBarIcons</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
<tr class="even">
<td><p>[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)\Scope\DisplayQuickPick</p></td>
<td><p>The setting has been removed.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Changed%20answer%20file%20settings%20for%20Windows%2010%20for%20desktop%20editions,%20build%201607%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




