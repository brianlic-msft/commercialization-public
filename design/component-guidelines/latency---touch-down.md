---
title: Latency - Touch Down
description: This is to test the reporting capabilities of the Windows Precision Touchpad device, with regard to latency and touch down.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 452005A7-49FF-468F-A436-19460132A643
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Latency - Touch Down


This is to test the reporting capabilities of the Windows Precision Touchpad device, with regard to latency and touch down.

**Test name**

-   Test.AudioTouch.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Latency

**Test purpose**

-   Verifies that the device is able to report the first contact down within the required latency window.

**Tools required**

-   RA Tool. For vendor information about the RA tool, see [Hardware Requirements and Vendor Information](touchscreen-hardware-requirements-and-vendor-information.md).

-   ptaudiotouch.exe

**Validation steps**

For detailed setup and test instructions, see [How to measure Touch Down Latency by using an Acoustic Measurement Tool](https://msdn.microsoft.com/library/windows/hardware/dn195876).
a. Note: use ptaudiotouch.exe, rather than the touch executable.

b. Only 50 taps during the collection phase are required for this class of device.

**Common error messages**

-   None.

**Passing criteria**

-   A recorded average touch-down latency of less than or equal to 35.0ms will result in a pass.

 

 






