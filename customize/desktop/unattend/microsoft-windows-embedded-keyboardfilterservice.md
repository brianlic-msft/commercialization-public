---
title: Microsoft-Windows-Embedded-KeyboardFilterService
description: Microsoft-Windows-Embedded-KeyboardFilterService
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 40C43C76-AB54-44D4-8547-401F8235B48E
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-Embedded-KeyboardFilterService


You can use KeyboardFilterService in to suppress undesirable key presses or key combinations. Normally, a customer can use certain Windows key combinations like Ctrl+Alt+Delete or Ctrl+Shift+Tab to alter the operation of a device by locking the screen or using Task Manager to close a running application. This may not be desirable if your device is intended for a dedicated purpose. However, you can use KeyboardFilterService to suppress any key press or key combination that causes an undesirable system behavior.

## Child elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Alt](Microsoft-Windows-Embedded-KeyboardFilterService-alt.md)</p></td>
<td><p>Blocks both Alt keys.</p></td>
</tr>
<tr class="even">
<td><p>[AltF4](Microsoft-Windows-Embedded-KeyboardFilterService-altf4.md)</p></td>
<td><p>Blocks the Alt+F4 key combination used to close applications.</p></td>
</tr>
<tr class="odd">
<td><p>[AltSpace](Microsoft-Windows-Embedded-KeyboardFilterService-altspace.md)</p></td>
<td><p>Blocks the Alt+Space key combination used to open the shortcut menu for the active window.</p></td>
</tr>
<tr class="even">
<td><p>[AltTab](Microsoft-Windows-Embedded-KeyboardFilterService-alttab.md)</p></td>
<td><p>Blocks the Alt+Tab key combination used to switch tasks. Also blocks the Alt+Shift+Tab key combination.</p></td>
</tr>
<tr class="odd">
<td><p>[AltWin](Microsoft-Windows-Embedded-KeyboardFilterService-altwin.md)</p></td>
<td><p>Blocks all keyboard combinations beginning with Alt + Windows logo key, for example Alt + Win + S.</p></td>
</tr>
<tr class="even">
<td><p>[BrowserBack](Microsoft-Windows-Embedded-KeyboardFilterService-browserback.md)</p></td>
<td><p>Blocks the Browser Back key.</p></td>
</tr>
<tr class="odd">
<td><p>[BrowserFavorites](Microsoft-Windows-Embedded-KeyboardFilterService-browserfavorites.md)</p></td>
<td><p>Blocks the Browser Favorites key.</p></td>
</tr>
<tr class="even">
<td><p>[BrowserForward](Microsoft-Windows-Embedded-KeyboardFilterService-browserforward.md)</p></td>
<td><p>Blocks the Browser Forward key.</p></td>
</tr>
<tr class="odd">
<td><p>[BrowserHome](Microsoft-Windows-Embedded-KeyboardFilterService-browserhome.md)</p></td>
<td><p>Blocks the Browser Home key.</p></td>
</tr>
<tr class="even">
<td><p>[BrowserRefresh](Microsoft-Windows-Embedded-KeyboardFilterService-browserrefresh.md)</p></td>
<td><p>Blocks the Browser Refresh key.</p></td>
</tr>
<tr class="odd">
<td><p>[BrowserSearch](Microsoft-Windows-Embedded-KeyboardFilterService-browsersearch.md)</p></td>
<td><p>Blocks the Browser Search key.</p></td>
</tr>
<tr class="even">
<td><p>[BrowserStop](Microsoft-Windows-Embedded-KeyboardFilterService-browserstop.md)</p></td>
<td><p>Blocks the Browser Stop key.</p></td>
</tr>
<tr class="odd">
<td><p>[ControlAltDelete](Microsoft-Windows-Embedded-KeyboardFilterService-controlaltdelete.md)</p></td>
<td><p>Blocks the Control+Alt+Delete key combination used to open the Windows Security screen.</p></td>
</tr>
<tr class="even">
<td><p>[ControlEscape](Microsoft-Windows-Embedded-KeyboardFilterService-controlescape.md)</p></td>
<td><p>Blocks the Control+Escape key combination used to open the Start screen.</p></td>
</tr>
<tr class="odd">
<td><p>[ControlTab](Microsoft-Windows-Embedded-KeyboardFilterService-controltab.md)</p></td>
<td><p>Blocks the Control+Tab key combination used to switch windows.</p></td>
</tr>
<tr class="even">
<td><p>[ControlWindowsF](Microsoft-Windows-Embedded-KeyboardFilterService-controlwindowsf.md)</p></td>
<td><p>Blocks the Control+Windows logo key+F key combination used to open the Find Computers dialog box.</p></td>
</tr>
<tr class="odd">
<td><p>[Ctrl](Microsoft-Windows-Embedded-KeyboardFilterService-ctrl.md)</p></td>
<td><p>Blocks both Ctrl keys.</p></td>
</tr>
<tr class="even">
<td><p>[CtrlF4](Microsoft-Windows-Embedded-KeyboardFilterService-ctrlf4.md)</p></td>
<td><p>Blocks the Control+F4 key combination used to close the active window.</p></td>
</tr>
<tr class="odd">
<td><p>[CtrlWin](Microsoft-Windows-Embedded-KeyboardFilterService-ctrlwin.md)</p></td>
<td><p>Blocks the Ctrl + Windows logo key keyboard combination.</p></td>
</tr>
<tr class="even">
<td><p>[CustomFilters](Microsoft-Windows-Embedded-KeyboardFilterService-customfilters.md)</p></td>
<td><p>Blocks the list of custom keys.</p></td>
</tr>
<tr class="odd">
<td><p>[CustomScancodes](Microsoft-Windows-Embedded-KeyboardFilterService-customscancodes.md)</p></td>
<td><p>Blocks the list of custom scan codes.</p></td>
</tr>
<tr class="even">
<td><p>[DisableKeyboardFilterForAdministrators](Microsoft-Windows-Embedded-KeyboardFilterService-disablekeyboardfilterforadministrators.md)</p></td>
<td><p>Disables the keyboard filter for administrators.</p></td>
</tr>
<tr class="odd">
<td><p>[Escape](Microsoft-Windows-Embedded-KeyboardFilterService-escape.md)</p></td>
<td><p>Blocks the Escape key.</p></td>
</tr>
<tr class="even">
<td><p>[F21](Microsoft-Windows-Embedded-KeyboardFilterService-f21.md)</p></td>
<td><p>Blocks the F21 key.</p></td>
</tr>
<tr class="odd">
<td><p>[ForceOffAccessibility](Microsoft-Windows-Embedded-KeyboardFilterService-forceoffaccessibility.md)</p></td>
<td><p>Disables all Ease of Access features and prevents users from enabling them.</p></td>
</tr>
<tr class="even">
<td><p>[LaunchApp1](Microsoft-Windows-Embedded-KeyboardFilterService-launchapp1.md)</p></td>
<td><p>Blocks the Start Application 1 key.</p></td>
</tr>
<tr class="odd">
<td><p>[LaunchApp2](Microsoft-Windows-Embedded-KeyboardFilterService-launchapp2.md)</p></td>
<td><p>Blocks the Start Application 1 key.</p></td>
</tr>
<tr class="even">
<td><p>[LaunchMail](Microsoft-Windows-Embedded-KeyboardFilterService-launchmail.md)</p></td>
<td><p>Blocks the Start Mail key.</p></td>
</tr>
<tr class="odd">
<td><p>[LaunchMediaSelect](Microsoft-Windows-Embedded-KeyboardFilterService-launchmediaselect.md)</p></td>
<td><p>Blocks the Media Select key.</p></td>
</tr>
<tr class="even">
<td><p>[LeftShiftLeftAltNumLock](Microsoft-Windows-Embedded-KeyboardFilterService-leftshiftleftaltnumlock.md)</p></td>
<td><p>Blocks the Left Shift+Left Alt+Num Lock key combination used to open the Mouse Keys dialog box.</p></td>
</tr>
<tr class="odd">
<td><p>[LeftShiftLeftAltPrintScreen](Microsoft-Windows-Embedded-KeyboardFilterService-leftshiftleftaltprintscreen.md)</p></td>
<td><p>Blocks the Left Shift+Left Alt+Print Screen key combination used to open the High Contrast dialog box.</p></td>
</tr>
<tr class="even">
<td><p>[MediaNext](Microsoft-Windows-Embedded-KeyboardFilterService-medianext.md)</p></td>
<td><p>Blocks the Next Track key.</p></td>
</tr>
<tr class="odd">
<td><p>[MediaPlayPause](Microsoft-Windows-Embedded-KeyboardFilterService-mediaplaypause.md)</p></td>
<td><p>Blocks the Play/Pause Media key.</p></td>
</tr>
<tr class="even">
<td><p>[MediaPrev](Microsoft-Windows-Embedded-KeyboardFilterService-mediaprev.md)</p></td>
<td><p>Blocks the Previous Track key.</p></td>
</tr>
<tr class="odd">
<td><p>[MediaStop](Microsoft-Windows-Embedded-KeyboardFilterService-mediastop.md)</p></td>
<td><p>Blocks the Stop media key.</p></td>
</tr>
<tr class="even">
<td><p>[Shift](Microsoft-Windows-Embedded-KeyboardFilterService-shift.md)</p></td>
<td><p>Blocks both Shift keys.</p></td>
</tr>
<tr class="odd">
<td><p>[ShiftControlEscape](Microsoft-Windows-Embedded-KeyboardFilterService-shiftcontrolescape.md)</p></td>
<td><p>Blocks the Shift+Control+Escape key combination used to open Task Manager.</p></td>
</tr>
<tr class="even">
<td><p>[ShiftWin](Microsoft-Windows-Embedded-KeyboardFilterService-shiftwin.md)</p></td>
<td><p>Blocks the Shift + Windows logo key.</p></td>
</tr>
<tr class="odd">
<td><p>[VolumeDown](Microsoft-Windows-Embedded-KeyboardFilterService-volumedown.md)</p></td>
<td><p>Blocks the Volume Down key.</p></td>
</tr>
<tr class="even">
<td><p>[VolumeMute](Microsoft-Windows-Embedded-KeyboardFilterService-volumemute.md)</p></td>
<td><p>Blocks the Volume Mute key.</p></td>
</tr>
<tr class="odd">
<td><p>[VolumeUp](Microsoft-Windows-Embedded-KeyboardFilterService-volumeup.md)</p></td>
<td><p>Blocks the Volume Up key.</p></td>
</tr>
<tr class="even">
<td><p>[Windows](Microsoft-Windows-Embedded-KeyboardFilterService-windows.md)</p></td>
<td><p>Blocks both Windows logo keys.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsB](Microsoft-Windows-Embedded-KeyboardFilterService-windowsb.md)</p></td>
<td><p>Blocks the Windows logo key+B key combination used to set focus in the Notification area.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsBreak](Microsoft-Windows-Embedded-KeyboardFilterService-windowsbreak.md)</p></td>
<td><p>Blocks the Windows logo key+Break key combination used to open the System dialog box.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsC](Microsoft-Windows-Embedded-KeyboardFilterService-windowsc.md)</p></td>
<td><p>Blocks the Windows logo key+C key combination used to open charms.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsComma](Microsoft-Windows-Embedded-KeyboardFilterService-windowscomma.md)</p></td>
<td><p>Blocks the Windows logo key+Comma key combination used to peek at the desktop.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsD](Microsoft-Windows-Embedded-KeyboardFilterService-windowsd.md)</p></td>
<td><p>Blocks the Windows logo key+D key combination used to show the desktop.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsDown](Microsoft-Windows-Embedded-KeyboardFilterService-windowsdown.md)</p></td>
<td><p>Blocks the Windows logo key+Down Arrow key combination used to minimize the active window.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsE](Microsoft-Windows-Embedded-KeyboardFilterService-windowse.md)</p></td>
<td><p>Blocks the Windows logo key+E key combination used to open Windows Explorer.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsEnter](Microsoft-Windows-Embedded-KeyboardFilterService-windowsenter.md)</p></td>
<td><p>Blocks the Windows logo key+Enter key combination used to start Narrator.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsEscape](Microsoft-Windows-Embedded-KeyboardFilterService-windowsescape.md)</p></td>
<td><p>Blocks the Windows logo key+Esc key combination used to close the Magnifier application.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsF](Microsoft-Windows-Embedded-KeyboardFilterService-windowsf.md)</p></td>
<td><p>Blocks the Windows logo key+F key combination used to open Search.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsF1](Microsoft-Windows-Embedded-KeyboardFilterService-windowsf1.md)</p></td>
<td><p>Blocks the Windows logo key+F1 key combination used to open Windows Help.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsH](Microsoft-Windows-Embedded-KeyboardFilterService-windowsh.md)</p></td>
<td><p>Blocks the Windows logo key+H key combination used to open the Share charm.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsHome](Microsoft-Windows-Embedded-KeyboardFilterService-windowshome.md)</p></td>
<td><p>Blocks the Windows logo key+Home key combination used to minimize or restore all inactive windows.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsI](Microsoft-Windows-Embedded-KeyboardFilterService-windowsi.md)</p></td>
<td><p>Blocks the Windows logo key+I key combination used to open the Settings charm.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsJ](Microsoft-Windows-Embedded-KeyboardFilterService-windowsj.md)</p></td>
<td><p>Blocks the Windows logo key+J key combination used to swap between snapped and filled applications.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsK](Microsoft-Windows-Embedded-KeyboardFilterService-windowsk.md)</p></td>
<td><p>Blocks the Windows logo key+K key combination used to open the Connect charm.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsL](Microsoft-Windows-Embedded-KeyboardFilterService-windowsl.md)</p></td>
<td><p>Blocks the Windows logo key+L key combination used to lock the device.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsLeft](Microsoft-Windows-Embedded-KeyboardFilterService-windowsleft.md)</p></td>
<td><p>Blocks the Windows logo key+Left Arrow key combination used to snap the active window to the left half of the screen.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsM](Microsoft-Windows-Embedded-KeyboardFilterService-windowsm.md)</p></td>
<td><p>Blocks the Windows logo key+M key combination used to minimize all windows.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsMinus](Microsoft-Windows-Embedded-KeyboardFilterService-windowsminus.md)</p></td>
<td><p>Blocks the Windows logo key+Minus key combination used to zoom out.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsO](Microsoft-Windows-Embedded-KeyboardFilterService-windowso.md)</p></td>
<td><p>Blocks the Windows logo key+O key combination used to lock device orientation.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsP](Microsoft-Windows-Embedded-KeyboardFilterService-windowsp.md)</p></td>
<td><p>Blocks the Windows logo key+P key combination used to cycle through Presentation Mode. Also blocks the Windows logo key+Shift+P and Windows logo key+Ctrl+P key combinations.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsPageDown](Microsoft-Windows-Embedded-KeyboardFilterService-windowspagedown.md)</p></td>
<td><p>Blocks the Windows logo key+Page Down key combination used to move a Windows Store app to the right monitor.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsPageUp](Microsoft-Windows-Embedded-KeyboardFilterService-windowspageup.md)</p></td>
<td><p>Blocks the Windows logo key+Page Up key combination used to move a Windows Store app to the left monitor.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsPeriod](Microsoft-Windows-Embedded-KeyboardFilterService-windowsperiod.md)</p></td>
<td><p>Blocks the Windows logo key+Period key combination used to snap the current screen to the left or right gutter. Also blocks the Windows logo key+Shift+Period key combinations.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsPlus](Microsoft-Windows-Embedded-KeyboardFilterService-windowsplus.md)</p></td>
<td><p>Blocks the Windows logo key+Plus key combination used to zoom in.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsQ](Microsoft-Windows-Embedded-KeyboardFilterService-windowsq.md)</p></td>
<td><p>Blocks the Windows logo key+Q key combination used to open the Search charm.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsR](Microsoft-Windows-Embedded-KeyboardFilterService-windowsr.md)</p></td>
<td><p>Blocks the Windows logo key+R key combination used to open the Run dialog box.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsRight](Microsoft-Windows-Embedded-KeyboardFilterService-windowsright.md)</p></td>
<td><p>Blocks the Windows logo key+Right Arrow key combination used to snap the active windows to the right half of the screen.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsShiftDown](Microsoft-Windows-Embedded-KeyboardFilterService-windowsshiftdown.md)</p></td>
<td><p>Blocks the Windows logo key+Shift+Down Arrow key combination used to minimize the active window.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsShiftLeft](Microsoft-Windows-Embedded-KeyboardFilterService-windowsshiftleft.md)</p></td>
<td><p>Blocks the Windows logo key+Shift+Left Arrow key combination used to move the active window to the left monitor.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsShiftRight](Microsoft-Windows-Embedded-KeyboardFilterService-windowsshiftright.md)</p></td>
<td><p>Blocks the Windows logo key+Shift+Right Arrow key combination used to move the active window to the right monitor.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsShiftUp](Microsoft-Windows-Embedded-KeyboardFilterService-windowsshiftup.md)</p></td>
<td><p>Blocks the Windows logo key+Shift+Up Arrow key combination used to maximize the active window vertically.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsSlash](Microsoft-Windows-Embedded-KeyboardFilterService-windowsslash.md)</p></td>
<td><p>Blocks the Windows logo key+Slash key combination used to open the Input Method Editor (IME).</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsSpace](Microsoft-Windows-Embedded-KeyboardFilterService-windowsspace.md)</p></td>
<td><p>Blocks the Windows logo key+Spacebar key combination used to switch layout.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsT](Microsoft-Windows-Embedded-KeyboardFilterService-windowst.md)</p></td>
<td><p>Blocks the Windows logo key+T key combination used to set focus on taskbar and cycle through programs.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsTab](Microsoft-Windows-Embedded-KeyboardFilterService-windowstab.md)</p></td>
<td><p>Blocks the Windows logo key+Tab key combination used to cycle through Windows Store apps. Also blocks the Windows logo key+Ctrl+Tab and Windows logo key+Shift+Tab key combinations.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsU](Microsoft-Windows-Embedded-KeyboardFilterService-windowsu.md)</p></td>
<td><p>Blocks the Windows logo key+Comma key combination used to peek at the desktop.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsUp](Microsoft-Windows-Embedded-KeyboardFilterService-windowsup.md)</p></td>
<td><p>Blocks the Windows logo key+Up Arrow key combination used to maximize the active window.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsV](Microsoft-Windows-Embedded-KeyboardFilterService-windowsv.md)</p></td>
<td><p>Blocks the Windows logo key+V key combination used to cycle through toasts in reverse order.</p></td>
</tr>
<tr class="odd">
<td><p>[WindowsW](Microsoft-Windows-Embedded-KeyboardFilterService-windowsw.md)</p></td>
<td><p>Blocks the Windows logo key+W key combination used to open the Settings Search charm.</p></td>
</tr>
<tr class="even">
<td><p>[WindowsZ](Microsoft-Windows-Embedded-KeyboardFilterService-windowsz.md)</p></td>
<td><p>Blocks the Windows logo key+Z key combination used to open the app bar.</p></td>
</tr>
</tbody>
</table>

 

## Applies to


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Keyboard filter](https://msdn.microsoft.com/library/windows/hardware/mt587088)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-Embedded-KeyboardFilterService%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





