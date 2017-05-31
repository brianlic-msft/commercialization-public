---
author: kpacquer
Description: 'This function supplies a boot mode and optional profile name to the firmware to use on subsequent boots.'
ms.assetid: b4cc9267-0237-41eb-bce3-ced8247c42b5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.SetBootModeInfo'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.SetBootModeInfo


This function supplies a boot mode and optional profile name to the firmware to use on subsequent boots.

``` syntax
typedef EFI_STATUS
(EFIAPI *EFI_SET_BOOT_MODE_INFO)(
    IN  struct _EFI_BOOT_MODE_MGMT_PROTOCOL *This,
    IN EFI_OS_BOOT_MODE                    *BootMode,
    IN UINT32                           *ProfileNameElements OPTIONAL,
    IN CHAR16                              *ProfileName OPTIONAL
    );
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="This"></span><span id="this"></span><span id="THIS"></span>*This*  
\[in\] A pointer to the **EFI\_BOOT\_MODE\_MGMT\_PROTOCOL** instance.

<span id="BootMode"></span><span id="bootmode"></span><span id="BOOTMODE"></span>*BootMode*  
\[in\] A pointer to the enumeration that holds the boot mode of the device.

<span id="ProfileNameElements"></span><span id="profilenameelements"></span><span id="PROFILENAMEELEMENTS"></span>*ProfileNameElements*  
\[in\] A pointer to a UINT32 value of the number of characters in the profile name to set.

<span id="ProfileName"></span><span id="profilename"></span><span id="PROFILENAME"></span>*ProfileName*  
\[in\] A pointer to the name of the boot mode profile to set.

## <span id="Return_values"></span><span id="return_values"></span><span id="RETURN_VALUES"></span>Return values


Returns one of the following status codes:

| Return code            | Description                                                      |
|------------------------|------------------------------------------------------------------|
| EFI\_SUCCESS           | Success                                                          |
| EFI\_NOT\_FOUND        | The boot mode data was not found.                                |
| EFI\_VOLUME\_CORRUPTED | A required storage partition is not initialized or is corrupted. |
| EFI\_INVALID\_PARAM    | An invalid parameter was passed to the function.                 |
| EFI\_BAD\_BUFFER\_SIZE | The ProfileName name string is too long.                         |

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** User generated

## <span id="related_topics"></span>Related topics


[Boot mode management UEFI protocol](boot-mode-management-uefi-protocol.md)

 

 






