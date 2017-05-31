---
Description: 'Flashing is the process of getting a mobile image into a mobile device.'
ms.assetid: 40d64242-b299-4cc5-ac6d-6b154c90d8b2
MSHAttr: 'PreferredLib:/library'
title: Flash an image to a mobile device
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Flash an image to a mobile device


Flashing is the process of getting a mobile image into a mobile device. Each manufacturer has different techniques and tooling that they'll use to manufacture and service a Windows mobile device and this means that each OEM needs to determine which flashing and manufacturing process works best for them. For more information, see [Flashing tools](../mobile/flashing-tools.md).

In this walkthrough, we'll use ffutool.exe, which is installed as part of the Windows ADK, to flash the image to a mobile device. For more information about flashing and to learn more about what you need to get your device ready for flashing, see [Use the flashing tools provided by Microsoft](https://msdn.microsoft.com/library/windows/hardware/dn789235).

**To flash an image**

1.  Boot the device into FFU flashing mode while it is connected to the host computer.

    If you didn't include the LABIMAGE optional feature when generating your test image, you can force the device into FFU flashing mode manually by pressing and releasing the power button to boot the device and then immediate pressing and holding the volume up button. However, note that this option is only available if an FFU has been initially flashed to the device.

2.  Open a command prompt with administrator rights.

3.  Run ffutool.exe from the command line to flash the image.

    **ffutool -flash TestFlash.ffu**

It will take a few minutes for the image to be fully flashed to the device. Once flashing is done, go through device setup and verify that your customizations appear as part of the image.

 

 



