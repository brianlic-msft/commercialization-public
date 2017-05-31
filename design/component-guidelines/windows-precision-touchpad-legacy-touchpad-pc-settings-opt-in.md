---
title: Legacy Touchpad PC Settings Opt-In
description: This topic describes how devices that are not Windows Precision Touchpads can opt in to various settings that are exposed in Windows 8.1 to provide a simple and easy-to-navigate inbox solution to manage the most common touchpad settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7F943A6D-6DC4-4DBA-9EE2-2E3CF54B88E8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

#  Legacy Touchpad PC Settings Opt-In


This topic describes how devices that are not Windows Precision Touchpads can opt in to various settings that are exposed in Windows 8.1 to provide a simple and easy-to-navigate inbox solution to manage the most common touchpad settings.

PC Settings in Windows 8.1 exposes the following four settings for Windows Precision Touchpads:

-   Enable/disable
-   Edge gesture enable/disable
-   Scroll direction normal/inverted
-   Strength of inbox accidental activation prevention (AAP)

Legacy touchpad helper applications can opt-in to the enable/disable setting, and optionally the edgy enable/disable and scroll direction settings.

## Opt-in requirements


1.  To participate in the opt-in program, a touchpad applet must be able to toggle the enable/disable touchpad setting.
2.  The opt-in program requires setting a registry value and consuming registry changes at run-time to change touchpad behavior. This mechanism is only available to user-mode helper applications that are associated with legacy touchpads, and is therefore not supported on WoA (Windows on ARM) platforms.
3.  This opt-in program is specifically targeted to clamshell and convertible systems and is not supported on slate systems that provide an external dock with a legacy touchpad, because those systems can switch accessories that can have differing capability levels.

## Opt-in mechanism


To specify which settings a touchpad applet can consume through the opt-in program, you must specify a DWORD under the following registry key, with the name string equal to the HWID string for the device for which it is opting in. This opt-in is global; that is, all users will see the opted-in settings as available in the modern settings applet.

**HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad\\LegacyControlled\\**

The value of that DWORD specifies which settings are to be consumed by the applet in the form of a bitmask.

| Setting             | Value      | Mandatory/Optional |
|---------------------|------------|--------------------|
| Enable/Disable      | 0x00000001 | Mandatory          |
| Edgy Enable/Disable | 0x00000002 | Optional           |
| Scroll Direction    | 0x00000004 | Optional           |

 

For example, for a device that has HWID (ACPI\\MSFT0001) to opt in to just enable/disable and scroll direction, it would create a DWORD as follows:

**ACPI\\MSFT0001 0x00000005**

If a modern touchpad with HWID (HID\\VID\_045E&PID\_003F&REV\_03FF) wanted to opt in to all settings, it would create a DWORD as follows:

**HID\\VID\_045E&PID\_003F&REV\_03FF 0x00000007**

**Note**  
If you import or export from the registry, the “\\” will be duplicated as “\\\\” because this is a delimiting character. If you paste by using the Registry Editor, ignore the extra delimiter.

 

``` syntax
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad\LegacyControlled]
"HID\\VID_045E&PID_003F&REV_03FF"=dword:00000007
"ACPI\\MSFT0001"=dword:00000005
```

For more information, see [HIDClass Hardware IDs for Top-Level Collections](http://msdn.microsoft.com/library/ff538842.aspx).

## Settings change consumption


Although the opt-in by the touchpad helper application is global, the settings themselves are customized on a per-user basis. To consume the settings changes, the helper application must register for registry change notifications that are associated with the following key and its sub-keys and act on those changes.

If there is no logged-on user, default settings should be used so that the touchpad is enabled and scroll direction is normal (not inverted).

**HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad**

To do this, use the RegNotifyChangeKey() function and specify the bWatchSubtree parameter as TRUE.

Whenever a touchpad setting is modified by the user by using the inbox PC settings, the event handle that the call specifies to RegNotifyChangeKey() is used to notify the caller.

When that event occurs, the touchpad applet shall read each of the following values as appropriate per opt-in value specified.

**HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad\\Status\\**

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Setting</th>
<th>Name</th>
<th>Type</th>
<th>Values</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Enable/Disable</td>
<td>Enabled</td>
<td>DWORD</td>
<td><p>0 – Disabled</p>
<p>Non-0 – Enabled</p></td>
</tr>
</tbody>
</table>

 

**HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad\\**

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Setting</th>
<th>Name</th>
<th>Type</th>
<th>Values</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Edgy Enable/Disable</td>
<td>EnableEdgy</td>
<td>DWORD</td>
<td><p>0 – Disabled</p>
<p>Non-0 – Enabled</p></td>
</tr>
<tr class="even">
<td>Scroll Direction</td>
<td>ScrollDirection</td>
<td>DWORD</td>
<td><p>0 – Standard</p>
<p>Non-0 – Reverse</p></td>
</tr>
</tbody>
</table>

 

**Note**  
The values that are named in the preceding tables should only be read and never overwritten by the opt-in entity; see the following section about third-party touchpad control panels.

 

## <a href="" id="third-party-touchpad-control-panels-"></a>Third-party touchpad control panels


Any touchpad setting that has been opted in by the helper application can be displayed by a third-party control panel. However, to ensure consistency and synchronization with the inbox settings user interface (UI), the display should not be modifiable. Any custom hotkeys that were used to change settings (for example, enable/disable) should be non-functional if they impact any opted-in setting. Windows provides an inbox hotkey for enable/disable control (**CTRL+WIN+F24**), which an OEM can support .

## Uninstall


If the touchpad helper application that handles the settings changes is uninstalled, the uninstall procedure should remove the opt-in that was specified under **HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad\\LegacyControlled\\**.

 

 






