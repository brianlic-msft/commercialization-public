---
title: Camera power management checklist
description: System integrators, camera sensor vendors, and System on a Chip (SoC) vendors should use the checklist in this article to ensure that their system power management design is compatible with Windows 10.
MS-HAID:
- 'cstandby.camera\_power\_management\_checklist'
- 'p\_weg\_hardware.camera\_power\_management\_checklist'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 18CD32A3-17CD-4007-AD7E-EDF4B4B60550
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Camera power management checklist


System integrators, camera sensor vendors, and System on a Chip (SoC) vendors should use the checklist in this article to ensure that their system power management design is compatible with Windows 10.

-   The system integrator must communicate and collaborate with the SoC vendor when selecting camera sensor components and integrating camera devices.
-   The camera controller driver developer must do the following:
    -   Turn off power to the camera hardware when applications are no longer streaming content from the camera device. (This occurs when all capture pins are in the KSSTATE\_STOP state.)
    -   Turn on power to the camera hardware when an application starts streaming from any of the capture pins on the camera device.
    -   Develop one KMDF driver that manages the on-SoC image processing unit. The camera controller driver should use custom driver interfaces to tell the image processing unit driver to initiate or end camera capture.
    -   Ensure the image processing unit driver is registered with the Windows power management framework (PoFx) so that the SoC vendor-provided PEP can control the power management of the image processing unit hardware.
    -   Develop one Windows Driver Frameworks (WDF) driver to manage each hardware component that manages the off-SoC camera hardware, including the camera sensor, auto-focuser, and optional flash. The camera controller driver should use custom driver interfaces to tell the drivers for the off-SoC camera hardware to initiate or end camera capture.
    -   Ensure that the drivers that manage the off-SoC camera hardware initiate a D3 transition when the camera components should be powered down so that ACPI is informed of the D3 transition and can remove power from the components. • Ensure that the drivers that manage the off-SoC camera hardware initiate a D0 transition when the camera components should be powered on so that ACPI is informed of the D0 transition and can apply power to the components.
    -   Develop any driver code for managing the configuration of the camera sensor hardware or the flash device.
    -   Inform the system integrator about the expected ordering of any GPIO and I2C resources that are required to manage the camera sensor hardware or the flash device.
    -   Ensure that all of the drivers that comprise the camera subsystem are enumerated in the same driver installation (.inf) file.
    -   Ensure that all of the drivers that comprise the camera subsystem are members of the imaging PnP device setup class. The ClassGuid for imaging devices is {6bdd1fc6-810f-11d0-bec7-08002be2092f}.
-   The system integrator must design the platform ACPI firmware to do the following:
    -   Enumerate each camera device as a separate device in the ACPI namespace.
    -   Include a \_PLD object under each camera device in the ACPI namespace to indicate whether the camera is on the front or back of the computer.
    -   Include a power resource in the root of the ACPI namespace for each camera device. All of the off-SoC hardware components for a given camera device (sensor, AF, flash, and so on) should be in one power resource.
    -   Implement the \_ON and \_OFF control methods for each power resource to change the state of the GPIO pin from the SoC that drives the power rail switching hardware.
    -   Provide the \_PR0 and \_PR3 methods under each camera device in the namespace to reference the power resource for each camera device and its associated hardware.
    -   Provide a \_CRS object under each camera device in the ACPI namespace to enumerate the GPIO and I2C resources for the camera sensor and flash hardware. The GPIO and I2C resources must be in the order that is specified by the camera sensor driver developer.
-   The system integrator should design the platform hardware and power routing so that:
    -   Each camera device has its own power rail, which can be controlled independently of the power rails for the other camera devices, and which can be switched on and off by a GPIO pin from the SoC.
-   The system integrator must test and verify that:
    -   The camera device hardware consumes no power (zero watts) when the camera device is not in use by an application. The system integrator should use instrumented hardware to measure this power consumption.

 

 






