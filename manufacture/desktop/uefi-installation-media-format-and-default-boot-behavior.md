---
author: Justinha
Description: UEFI Installation Media Format and default boot behavior
ms.assetid: 983e25d4-ce72-463e-ad59-02467f19f4a4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: UEFI Installation Media Format and default boot behavior
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UEFI Installation Media Format and default boot behavior


This section describes the installation media formats and default boot behavior for UEFI platforms.

## <span id="Installation_media_guidelines"></span><span id="installation_media_guidelines"></span><span id="INSTALLATION_MEDIA_GUIDELINES"></span>Installation media guidelines


-   Windows installation media supports boot on both BIOS and UEFI platforms by taking advantage of multi-entry El Torito boot catalog support.
-   The default El Torito boot entry is a BIOS entry that includes the 80x86 Platform ID, which is defined as “0x00” in hexadecimal.
-   The second El Torito boot entry is an EFI entry that includes the Platform ID as “0xEF” in hexadecimal. The entry references a FAT partition that contains the bootable EFI application at \\EFI\\BOOT\\BOOTX64.EFI.

## <span id="Default_boot_behavior"></span><span id="default_boot_behavior"></span><span id="DEFAULT_BOOT_BEHAVIOR"></span>Default boot behavior


Firmware vendors must ensure that the following conditions exist:

-   The BIOS ignores boot entries that do not have the 80x86 Platform ID, which is defined as “0x00” in hexadecimal. Failure to ignore other boot entries results in the display of a confusing boot menu to the end user.
-   The BIOS boots based on the BIOS entry without prompt.
-   The UEFI boot manager ignores boot entries that do not have the “0xEF” Platform ID.
-   The UEFI boot manager boots based on the EFI entry without prompt.

To support the ability to boot from DVD media, the Windows installation DVD contains many El Torito boot entries that enable boot from either BIOS or UEFI. The default El Torito boot entry is for BIOS.

Windows supports the “Non-removable Media Boot Behavior” section from the UEFI 2.3 specification. During Windows installation and when updates are required for bootmgfw.efi, Windows copies the Windows boot application from \\efi\\microsoft \\boot\\bootmgfw.efi to \\efi\\boot\\boot*{arch}*.efi on the EFI system partition. This copy enables a default boot option for Windows if a nonvolatile RAM (NVRAM) boot entry is not available, such as when a hard disk is moved from one platform to another.

When upgrading Windows, Windows preserves the existing boot order. When you perform a clean install of Windows, Windows updates the boot order so that it's the first boot entry in the list.

## <span id="Other_media_information"></span><span id="other_media_information"></span><span id="OTHER_MEDIA_INFORMATION"></span>Other media information


The following additional guidelines apply for boot media:

-   Windows supports both CD and DVD boot from the Universal Disk Format (UDF) file system. Windows installation media also uses El Torito and is built by using the UDF bridge format to support both ISO 9660 and UDF version 1.02 file systems.
-   The Windows Assessment and Deployment Kit (Windows ADK) includes an updated version of Oscdimg.exe that supports the creation of a multi-entry El Torito boot catalog.

## <span id="related_topics"></span>Related topics


[UEFI Firmware](uefi-firmware.md)

[BCDBoot Command-Line Options](bcdboot-command-line-options-techref-di.md)

[Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md)

[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

 

 






