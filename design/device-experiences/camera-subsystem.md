---
title: Camera subsystem
description: Describes the requirements of the camera subsystem in managing camera power on modern standby platforms.
MS-HAID:
- 'cstandby.camera\_subsystem'
- 'p\_weg\_hardware.camera\_subsystem'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8c4b3dae-1227-4b0b-b2a8-5dbcbec7e15b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Camera subsystem


In terms of power management, cameras are one of the most complex device subsystems in a mobile platform. This complexity is a result of the tight coordination required between the digital and image signal processing units, which are integrated into the System on a Chip (SoC), and the camera sensor, auto-focus, and flash components, which are external to the SoC chip.

In the following discussion, the term on-SoCcomponent describes a component that is integrated into the SoC chip. An off-SoC component is external to the SoC chip.

Camera subsystem design becomes even more complex if the on-SoC image processing hardware must be multiplexed between two or more camera subsystems.

Tablet PCs are expected to have both a front-facing and a rear-facing camera, and these cameras share the same on-SoC image processing hardware. Hardware sharing implies multiplexing at both hardware and software layers. Because of this complexity, the system integrator should work closely with the SoC silicon vendor to integrate the cameras into the platform and implement camera device power management.

When the system is in modern standby (display off), the camera sensor, camera processing unit, optional auto-focuser, and flash components must have their power removed and consume zero watts. For the camera components on the SoC, the SoC vendor must provide a driver that manages the image processing components. The image processing driver coordinates power management of the on-SoC components with the power engine plug-in (PEP).

For the off-SoC camera components, which include the sensor, auto-focuser, and flash, the system integrator must provide power rail switching capability and associated GPIO control signaling, which are controlled by the ACPI firmware.

The system integrator must also provide one or more device drivers to directly manage the sensor, auto-focuser, and flash hardware. Due to camera subsystem complexity and the dependencies between the on-SoC and off-SoC components, the camera sensor and flash drivers are typically provided by the SoC vendor. The system integrator must also provide a camera controller driver, which is a kernel-mode AVStream minidriver. The camera controller driver is responsible for exposing the camera devices to the Windows multimedia subsystem. However, we recommend that this driver not directly control any platform hardware due to complexities in the AVStream minidriver model. Instead, we recommend that the camera controller driver should rely on the other camera component drivers for access to hardware resources and device power management. That is, the camera controller driver should communicate with the driver that controls the on-SoC image processing hardware and the driver or drivers that control the off-SoC sensor and flash units.

 

 






