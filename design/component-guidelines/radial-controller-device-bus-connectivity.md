---
title: Windows Radial Controller Device Bus Connectivity
author: windows-driver-content
description: This topic discusses bus connectivity methods for a Windows radial controller device.
ms.assetid:
keywords: ["radial dial", "radial controller", "dial"]
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device bus connectivity

This topic discusses bus connectivity methods for a Windows radial controller device.

A Windows radial controller may use the Microsoft provided inbox drivers to connect to its Windows host using the following:
* HID over Bluetooth
* HID over USB
* HID over I<sup>2</sup>C

To utilize any other bus other than those listed above, a third-party HID mini-port driver is required. Microsoft strongly recommends using the Microsoft-provided inbox drivers.

We recommend using the Microsoft-provided inbox drivers. For devices that aggregate information from multiple input sources, a third-party HID filter driver may be required. If you elect to use a third-party mini-port or filter driver, the driver should be included in any OEM and system Restore images, and should also be made available through Windows Update.
