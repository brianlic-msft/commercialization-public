---
title: Predefined key combinations
description: Predefined key combinations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9fc86f03-6d9e-4899-a4b7-fa8ad7835c65
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Predefined key combinations


The following key combinations are predefined by keyboard filter:

-   [Accessibility keys](#accessibility)

-   [Application keys](#application)

-   [Shell keys](#shell)

-   [Modifier keys](#modifier)

-   [Security keys](#security)

-   [Extended shell keys](#exshell)

-   [Browser keys](#browser)

-   [Media keys](#media)

-   [Microsoft Surface keyboard keys](#surface)

You can use the values in the WEKF\_PredefinedKey.Id column to configure the Windows Management Instrumentation (WMI) class [WEKF\_PredefinedKey](wekf-predefinedkey.md).

## <a href="" id="accessibility"></a>Accessibility keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Left Alt+Left Shift+Print Screen</p></td>
<td><p><strong>LShift+LAlt+PrintScrn</strong></p></td>
<td><p>Open High Contrast</p></td>
</tr>
<tr class="even">
<td><p>Left Alt+Left Shift+Num Lock</p></td>
<td><p><strong>LShift+LAlt+NumLock</strong></p></td>
<td><p>Open Mouse Keys</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+U</p></td>
<td><p><strong>Win+U</strong></p></td>
<td><p>Open Ease of Access Center</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="application"></a>Application keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Alt+F4</p></td>
<td><p><strong>Alt+F4</strong></p></td>
<td><p>Close application</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+F4</p></td>
<td><p><strong>Ctrl+F4</strong></p></td>
<td><p>Close window</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+F1</p></td>
<td><p><strong>Win+F1</strong></p></td>
<td><p>Open Windows Help</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="shell"></a>Shell keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Alt+Spacebar</p></td>
<td><p><strong>Alt+Space</strong></p></td>
<td><p>Open shortcut menu for the active window</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+Esc</p></td>
<td><p><strong>Ctrl+Esc</strong></p></td>
<td><p>Open the Start screen</p></td>
</tr>
<tr class="odd">
<td><p>Ctrl+Windows logo key+F</p></td>
<td><p><strong>Ctrl+Win+F</strong></p></td>
<td><p>Open Find Computers</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Break</p></td>
<td><p><strong>Win+Break</strong></p></td>
<td><p>Open System dialog box</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+E</p></td>
<td><p><strong>Win+E</strong></p></td>
<td><p>Open Windows Explorer</p></td>
</tr>
<tr class="even">
<td><p>Windows+F</p></td>
<td><p><strong>Win+F</strong></p></td>
<td><p>Open Search</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+P</p></td>
<td><p><strong>Win+P</strong></p></td>
<td><p>Cycle through Presentation Mode. Also blocks the Windows logo key+Shift+P and the Windows logo key+Ctrl+P key combinations.</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+R</p></td>
<td><p><strong>Win+R</strong></p></td>
<td><p>Open Run dialog box</p></td>
</tr>
<tr class="odd">
<td><p>Alt+Tab</p></td>
<td><p><strong>Alt+Tab</strong></p></td>
<td><p>Switch task. Also blocks the Alt+Shift+Tab key combination.</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+Tab</p></td>
<td><p><strong>Ctrl+Tab</strong></p></td>
<td><p>Switch window</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Tab</p></td>
<td><p><strong>Win+Tab</strong></p></td>
<td><p>Cycle through Windows Store apps. Also blocks the Windows logo key+Ctrl+Tab and Windows logo key+Shift+Tab key combinations.</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+D</p></td>
<td><p><strong>Win+D</strong></p></td>
<td><p>Show desktop</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+M</p></td>
<td><p><strong>Win+M</strong></p></td>
<td><p>Minimize all windows</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Home</p></td>
<td><p><strong>Win+Home</strong></p></td>
<td><p>Minimize or restore all inactive windows</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+T</p></td>
<td><p><strong>Win+T</strong></p></td>
<td><p>Set focus on taskbar and cycle through programs</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+B</p></td>
<td><p><strong>Win+B</strong></p></td>
<td><p>Set focus in the notification area</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Minus Sign</p></td>
<td><p><strong>Win+-</strong></p></td>
<td><p>Zoom out</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Plus Sign</p></td>
<td><p><strong>Win++</strong></p></td>
<td><p>Zoom in</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Esc</p></td>
<td><p><strong>Win+Esc</strong></p></td>
<td><p>Close Magnifier application</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Up Arrow</p></td>
<td><p><strong>Win+Up</strong></p></td>
<td><p>Maximize the active window</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Down Arrow</p></td>
<td><p><strong>Win+Down</strong></p></td>
<td><p>Minimize the active window</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Left Arrow</p></td>
<td><p><strong>Win+Left</strong></p></td>
<td><p>Snap the active window to the left half of screen</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Right Arrow</p></td>
<td><p><strong>Win+Right</strong></p></td>
<td><p>Snap the active window to the right half of screen</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Shift+Up Arrow</p></td>
<td><p><strong>Win+Shift+Up</strong></p></td>
<td><p>Maximize the active window vertically</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Shift+Down Arrow</p></td>
<td><p><strong>Win+Shift+Down</strong></p></td>
<td><p>Minimize the active window</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Shift+Left Arrow</p></td>
<td><p><strong>Win+Shift+Left</strong></p></td>
<td><p>Move the active window to left monitor</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Shift+Right Arrow</p></td>
<td><p><strong>Win+Shift+Right</strong></p></td>
<td><p>Move the active window to right monitor</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Spacebar</p></td>
<td><p><strong>Win+Space</strong></p></td>
<td><p>Switch layout</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+O</p></td>
<td><p><strong>Win+O</strong></p></td>
<td><p>Lock device orientation</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Enter</p></td>
<td><p><strong>Win+Enter</strong></p></td>
<td><p>Start Narrator</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Page Up</p></td>
<td><p><strong>Win+PageUp</strong></p></td>
<td><p>Move a Windows Store app to the left monitor</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+Page Down</p></td>
<td><p><strong>Win+PageDown</strong></p></td>
<td><p>Move a Windows Store app to right monitor</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+Period</p></td>
<td><p><strong>Win+.</strong></p></td>
<td><p>Snap the current screen to the left or right gutter. Also blocks the Windows logo key+Shift+Period key combination.</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+C</p></td>
<td><p><strong>Win+C</strong></p></td>
<td><p>Open charms</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key +I</p></td>
<td><p><strong>Win+I</strong></p></td>
<td><p>Open Settings charm</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key +K</p></td>
<td><p><strong>Win+K</strong></p></td>
<td><p>Open Connect charm</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key +H</p></td>
<td><p><strong>Win+H</strong></p></td>
<td><p>Open Share charm</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key +Q</p></td>
<td><p><strong>Win+Q</strong></p></td>
<td><p>Open Search charm</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key +W</p></td>
<td><p><strong>Win+W</strong></p></td>
<td><p>Open Settings Search charm</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key +Z</p></td>
<td><p><strong>Win+Z</strong></p></td>
<td><p>Open app bar</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key +/</p></td>
<td><p><strong>Win+/</strong></p></td>
<td><p>Open input method editor (IME)</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key +J</p></td>
<td><p><strong>Win+J</strong></p></td>
<td><p>Swap between snapped and filled applications</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key +Comma</p></td>
<td><p><strong>Win+,</strong></p></td>
<td><p>Peek at the desktop</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key+V</p></td>
<td><p><strong>Win+V</strong></p></td>
<td><p>Cycle through toasts in reverse order</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="modifier"></a>Modifier keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked key</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Alt</p></td>
<td><p><strong>Alt</strong></p></td>
<td><p>Both Alt keys</p></td>
</tr>
<tr class="even">
<td><p>Application</p></td>
<td><p><strong>Application</strong></p></td>
<td><p>Application key</p></td>
</tr>
<tr class="odd">
<td><p>Ctrl</p></td>
<td><p><strong>Ctrl</strong></p></td>
<td><p>Both Ctrl keys</p></td>
</tr>
<tr class="even">
<td><p>Shift</p></td>
<td><p><strong>Shift</strong></p></td>
<td><p>Both Shift keys</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key</p></td>
<td><p><strong>Windows</strong></p></td>
<td><p>Both Windows logo keys</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="security"></a>Security keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key Combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Ctrl+Alt+Delete</p></td>
<td><p><strong>Ctrl+Alt+Del</strong></p></td>
<td><p>Open the Windows Security screen</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+Shift+Esc</p></td>
<td><p><strong>Shift+Ctrl+Esc</strong></p></td>
<td><p>Open Task Manager</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+L</p></td>
<td><p><strong>Win+L</strong></p></td>
<td><p>Lock the device</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="exshell"></a>Extended shell keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked key</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>LaunchMail</p></td>
<td><p><strong>LaunchMail</strong></p></td>
<td><p>Start Mail key</p></td>
</tr>
<tr class="even">
<td><p>LaunchMediaSelect</p></td>
<td><p><strong>LaunchMediaSelect</strong></p></td>
<td><p>Select Media key</p></td>
</tr>
<tr class="odd">
<td><p>LaunchApp1</p></td>
<td><p><strong>LaunchApp1</strong></p></td>
<td><p>Start Application 1 key</p></td>
</tr>
<tr class="even">
<td><p>LaunchApp2</p></td>
<td><p><strong>LaunchApp2</strong></p></td>
<td><p>Start Application 2 key</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="browser"></a>Browser keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked key</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>BrowserBack</p></td>
<td><p><strong>BrowserBack</strong></p></td>
<td><p>Browser Back key</p></td>
</tr>
<tr class="even">
<td><p>BrowserForward</p></td>
<td><p><strong>BrowserForward</strong></p></td>
<td><p>Browser Forward key</p></td>
</tr>
<tr class="odd">
<td><p>BrowserRefresh</p></td>
<td><p><strong>BrowserRefresh</strong></p></td>
<td><p>Browser Refresh key</p></td>
</tr>
<tr class="even">
<td><p>BrowserStop</p></td>
<td><p><strong>BrowserStop</strong></p></td>
<td><p>Browser Stop key</p></td>
</tr>
<tr class="odd">
<td><p>BrowserSearch</p></td>
<td><p><strong>BrowserSearch</strong></p></td>
<td><p>Browser Search key</p></td>
</tr>
<tr class="even">
<td><p>BrowserFavorites</p></td>
<td><p><strong>BrowserFavorites</strong></p></td>
<td><p>Browser Favorites key</p></td>
</tr>
<tr class="odd">
<td><p>BrowserHome</p></td>
<td><p><strong>BrowserHome</strong></p></td>
<td><p>Browser Start and Home key</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="media"></a>Media keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked key</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>VolumeMute</p></td>
<td><p><strong>VolumeMute</strong></p></td>
<td><p>Volume Mute key</p></td>
</tr>
<tr class="even">
<td><p>VolumeDown</p></td>
<td><p><strong>VolumeDown</strong></p></td>
<td><p>Volume Down key</p></td>
</tr>
<tr class="odd">
<td><p>VolumeUp</p></td>
<td><p><strong>VolumeUp</strong></p></td>
<td><p>Volume Up key</p></td>
</tr>
<tr class="even">
<td><p>MediaNext</p></td>
<td><p><strong>MediaNext</strong></p></td>
<td><p>Next Track key</p></td>
</tr>
<tr class="odd">
<td><p>MediaPrev</p></td>
<td><p><strong>MediaPrev</strong></p></td>
<td><p>Previous Track key</p></td>
</tr>
<tr class="even">
<td><p>MediaStop</p></td>
<td><p><strong>MediaStop</strong></p></td>
<td><p>Stop Media key</p></td>
</tr>
<tr class="odd">
<td><p>MediaPlayPause</p></td>
<td><p><strong>MediaPlayPause</strong></p></td>
<td><p>Play/Pause Media key</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="surface"></a>Microsoft Surface keyboard keys


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>WEKF_PredefinedKey.Id</th>
<th>Blocked key</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Left Alt + Windows logo key</p></td>
<td><p><strong>AltWin</strong></p></td>
<td><p>Share key</p></td>
</tr>
<tr class="even">
<td><p>Left Ctrl + Windows logo key</p></td>
<td><p><strong>CtrlWin</strong></p></td>
<td><p>Devices key</p></td>
</tr>
<tr class="odd">
<td><p>Left Shift + Windows logo key</p></td>
<td><p><strong>ShiftWin</strong></p></td>
<td><p>Search key</p></td>
</tr>
<tr class="even">
<td><p>F21</p></td>
<td><p><strong>F21</strong></p></td>
<td><p>Settings key</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Keyboard filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Predefined%20key%20combinations%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





