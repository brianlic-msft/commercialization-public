---
author: kpacquer
Description: 'This function is used to retrieve the boot mode and optional profile name from the UEFI firmware.'
ms.assetid: 389dab4d-9f74-4c33-9d02-9b6510581fd8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.GetBootModeInfo'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.GetBootModeInfo


This function is used to retrieve the boot mode and optional profile name from the UEFI firmware.

``` syntax
typedef EFI_STATUS
(EFIAPI *EFI_GET_BOOT_MODE_INFO)(
    IN  struct _EFI_BOOT_MODE_MGMT_PROTOCOL *This,
    OUT EFI_OS_BOOT_MODE                    *BootMode,
    IN OUT UINT32                           *ProfileNameElements,
    OUT CHAR16                              *ProfileName
    );
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="This"></span><span id="this"></span><span id="THIS"></span>*This*  
\[in\] A pointer to the **EFI\_BOOT\_MODE\_MGMT\_PROTOCOL** instance.

<span id="BootMode"></span><span id="bootmode"></span><span id="BOOTMODE"></span>*BootMode*  
\[out\] A pointer to the enumeration that holds the boot mode of the device.

<span id="ProfileNameElements"></span><span id="profilenameelements"></span><span id="PROFILENAMEELEMENTS"></span>*ProfileNameElements*  
\[in\] \[out\] A pointer to a UINT32 value that receives the number of characters in the profile name.

<span id="ProfileName"></span><span id="profilename"></span><span id="PROFILENAME"></span>*ProfileName*  
\[out\] A pointer to the name of the current profile.

## <span id="Return_values"></span><span id="return_values"></span><span id="RETURN_VALUES"></span>Return values


Returns one of the following status codes:

| Return code             | Description                                                      |
|-------------------------|------------------------------------------------------------------|
| EFI\_SUCCESS            | Success                                                          |
| EFI\_NOT\_FOUND         | The boot mode data was not found.                                |
| EFI\_VOLUME\_CORRUPTED  | A required storage partition is not initialized or is corrupted. |
| EFI\_INVALID\_PARAM     | An invalid parameter was passed to the function.                 |
| EFI\_BUFFER\_TOO\_SMALL | Not enough space in the provided buffer.                         |

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** User generated

## <span id="related_topics"></span>Related topics


[Boot mode management UEFI protocol](boot-mode-management-uefi-protocol.md)

 

 






