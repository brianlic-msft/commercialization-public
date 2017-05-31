---
author: kpacquer
Description: 'Windows 10 IoT Core (IoT Core) devices will automatically receive OS updates via Windows Update when connected to the internet.'
ms.assetid: d8298c99-6fa7-4825-a0b8-181b99e40975
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: IoT Core Update
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IoT Core Update


Windows 10 IoT Core (IoT Core) devices automatically receive OS updates via Windows Update when connected to the internet.

-   **OS updates.** OS updates includes security updates for all Microsoft packages (releasetype=Production) present in the ESP (EFI System Partition) and Main OS partition. These updates are performed automatically. OEM and enterprise customers have the option to manage the OS updates using the Windows 10 IoT Core Pro SKU. To learn more, see [Manage Updates](managing-iot-device-update.md).

-   **Windows Store app updates.** Submit your updated signed package to the Windows Store. When your devices are connected to the internet, they'll periodically check for updates from the Windows Store, and install the updates automatically. 

<!---   **OEM updates.** These are also referred to as Board Support Package (BSP) updates. OEMs develop specific BSP updates for their devices such as the Raspberry Pi 2 and the Minnowboard Max. These are then published to the Microsoft Update server where specified IoT Core devices can download and receive the OEM updates automatically. -->
