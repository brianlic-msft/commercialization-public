---
title: Firmware Update Collection (Optional)
description: A Windows Precision Touchpad device can use the HID protocol to provide a vendor-specific top-level collection for performing device firmware and vendor configuration updates.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3D019810-A7E3-4CFC-B013-3276C016A18C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Firmware Update Collection (Optional)


A Windows Precision Touchpad device can use the HID protocol to provide a vendor-specific top-level collection for performing device firmware and vendor configuration updates.

The vendor-specific firmware update collection could provide an output report for transferring the firmware payload from the host to the device.

This is a big advantage because it makes it possible to perform firmware updates without requiring a driver on the host. After a firmware upgrade, you *must* increment **wVersionID**.

A Windows Precision Touchpad device should be able to recover from a firmware update that failed due to power loss (or some other error), if you shut down, and then reapply its power supply. It is highly recommended that basic functionality be available even after a failed firmware update.

 

 






