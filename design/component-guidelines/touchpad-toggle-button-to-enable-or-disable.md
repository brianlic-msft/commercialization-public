---
title: Enable, Disable Toggle Button
description: Windows Precision Touchpad devices (or legacy touchpad devices that were configured for enable/disable control in Windows 8.1), can have their enable/disable state toggled via a hardware button, or a keyboard combination.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C82D4DD3-F98E-4D45-BC5A-14E00CD237EB
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable, Disable Toggle Button


Windows Precision Touchpad devices (or legacy touchpad devices that were configured for enable/disable control in Windows 8.1), can have their enable/disable state toggled via a hardware button, or a keyboard combination.

For convertible devices that implement integrated touchpads on keyboards that can be folded back, a device driver that typically disables keyboard or button features can also disable the precision touchpad. To disable the precision touchpad, the device driver should first query the following registry key:

\[HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad\\Status\\Enabled\]

If this value is non-zero, the driver can issue a hotkey combination \[**CTRL + WIN + F24**\] to toggle the precision touchpad OFF. If the keyboard is no longer folded back, and the value of the registry key is zero, then the driver can toggle it back ON.

**Note**  This registry key is read only, and is not to be modified directly.

 

So in short, the state of the touchpad will be toggled when the **CTRL + WIN + F24** keyboard combination is reported to the host.

 

 






