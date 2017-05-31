---
author: kpacquer
Description: 'Defines the possible boot modes that the operating system can use when it starts.'
ms.assetid: cb78662f-8ce0-4adb-97ad-e8520c8513fd
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'EFI\_BOOT\_MODE\_INFO enumeration'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EFI\_BOOT\_MODE\_INFO enumeration


Defines the possible boot modes that the operating system can use when it starts.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
typedef enum _EFI_OS_BOOT_MODE {
    EfiOsBootModeFullOs = 0,
    EfiOsBootModeManufacturingOs = 1
    EfiOsBootModeMax
} EFI_OS_BOOT_MODE, *PEFI_OS_BOOT_MODE;
```

## <span id="Constants"></span><span id="constants"></span><span id="CONSTANTS"></span>Constants


<span id="EfiOsBootModeFullOs"></span><span id="efiosbootmodefullos"></span><span id="EFIOSBOOTMODEFULLOS"></span>**EfiOsBootModeFullOs**  
The device should boot normally into the operating system.

<span id="EfiOsBootModeManufacturingOs"></span><span id="efiosbootmodemanufacturingos"></span><span id="EFIOSBOOTMODEMANUFACTURINGOS"></span>**EfiOsBootModeManufacturingOs**  
The device is in manufacturing mode.

## <span id="related_topics"></span>Related topics


[Boot mode management UEFI protocol](boot-mode-management-uefi-protocol.md)

 

 






