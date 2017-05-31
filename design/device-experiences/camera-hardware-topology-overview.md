---
title: Camera hardware topology overview
description: Provides an overview of camera hardware topology.
MS-HAID:
- 'cstandby.camera\_hardware\_topology\_overview'
- 'p\_weg\_hardware.camera\_hardware\_topology\_overview'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1a6d50cc-d61d-421f-a6c5-dbe64c499c1e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Camera hardware topology overview


In terms of Windows driver support, the camera subsystem contains off-System on a Chip (SoC) components such as the camera sensor, an optional auto-focus unit, and flash—and possibly other associated hardware. The camera hardware also includes the on-SoC image processing units.

The on-SoC image processing hardware must be power-managed by the power engine plug-in (PEP) supplied by the SoC vendor. The image processing hardware should be enumerated as a single device in ACPI and managed by a Windows Driver Framework (WDF) driver. Enable system management of the image processing device idle time-out so that the PEP can control any clock and power rail sharing topology that is unique to the SoC. Any on-SoC image processing hardware must be powered off whenever the camera device is turned off.

Some SoC designs have a shared function block that does both camera capture and other image and graphics processing. In a platform that uses such a SoC, the PEP supplied by the SoC vendor must reference-count the use of this shared block and power it off when all clients are idle.

In some platforms, the on-SoC image processing hardware might be shared between two or more camera devices. In this case, the image processing hardware is multiplexed between the camera devices. The components of each camera device should be described independently in the ACPI namespace and should be enumerated as separate device objects to the Windows Plug and Play manager.

Platforms that have two (or more) embedded cameras are required by Windows to be able to use (that is, stream content from) both (or all) cameras at the same time with any combination of the modes and resolutions that are supported by the individual cameras. SoC vendors who cannot meet this requirement must work with Microsoft directly for guidance on implementing their drivers and system firmware.

 

 






