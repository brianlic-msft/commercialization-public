---
title: Windows Radial controller Firmware Update Collection
author: windows-driver-content
description: TBD
ms.assetid:
keywords: radial dial, radial controller, dial
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows radial controller firmware update collection (optional)

This topic discusses an optional HID top-level collection that can be used for radial controller firmware updates in Windows 10, version 1607 and later operating systems.

A Windows radial controller device can use the HID protocol to provide a vendor-specific top-level collection for performing device firmware, and vendor configuration updates.

The vendor-specific firmware update collection can provide an output report for transferring the firmware payload from the host to the device.

This is highly advantageous as it allows for firmware updates to be performed without requiring a driver on the host. It is mandatory for the *wVersionID* device attribute to be incremented after a firmware upgrade.

A Windows radial controller device should be able to recover from a firmware update that failed due to power loss (or some other error), if the device is powered down, and then its power supply is reapplied. It is highly recommended that basic functionality be available even after a failed firmware update.
