---
author: kpacquer
Description: 'The boot mode management protocol is used to determine which boot mode the operating system should use when it starts.'
ms.assetid: 9782c51d-8915-43ef-8a64-9c8be9dc228d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Boot mode management UEFI protocol
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Boot mode management UEFI protocol


The boot mode management protocol is used to determine which boot mode the operating system should use when it starts.

## <span id="EFI_BOOT_MODE_MGMT_PROTOCOL"></span><span id="efi_boot_mode_mgmt_protocol"></span>EFI\_BOOT\_MODE\_MGMT\_PROTOCOL


This section provides a detailed description of the **EFI\_BOOT\_MODE\_MGMT\_PROTOCOL**.

**GUID**

``` syntax
#define EFI_BOOT_MODE_MGMT_PROTOCOL_GUID \
   { 0xBE464946, 0x9787, 0x4FEB, { 0xBD, 0x71, 0x14, 0xC1, 0xC5, 0x2D, 0x69, 0xD1 } }
```

**Revision number**

``` syntax
#define EFI_BOOT_MODE_MGMT_PROTOCOL_REVISION 0x00010000
```

**Protocol interface structure**

``` syntax
typedef struct _EFI_BOOT_MODE_MGMT_PROTOCOL {
    UINT32                 Revision;
    EFI_SET_BOOT_MODE_INFO SetBootModeInfo;
    EFI_GET_BOOT_MODE_INFO GetBootModeInfo;
} EFI_BOOT_MODE_MGMT_PROTOCOL;
```

**Members**

<span id="Revision"></span><span id="revision"></span><span id="REVISION"></span>**Revision**  
The revision to which the **EFI\_BOOT\_MODE\_MGMT\_PROTOCOL** adheres. All future revisions must be backward compatible. If a future version is not backward compatible, a different GUID must be used.

<span id="GetBootModeInfo"></span><span id="getbootmodeinfo"></span><span id="GETBOOTMODEINFO"></span>**GetBootModeInfo**  
Determines the boot mode which the operating system should use when it starts. See [EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.GetBootModeInfo](efi-boot-mode-mgmt-protocol-getbootmodeinfo.md)

<span id="SetBootModeInfo"></span><span id="setbootmodeinfo"></span><span id="SETBOOTMODEINFO"></span>**SetBootModeInfo**  
Specifies the boot mode the operating system should use when it starts, including an optional profile name. See [EFI\_BOOT\_MODE\_MGMT\_PROTOCOL.SetBootModeInfo](efi-boot-mode-mgmt-protocol-setbootmodeinfo.md)

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** User generated

## <span id="related_topics"></span>Related topics


[Manufacturing Mode](manufacturing-mode.md)

 

 






