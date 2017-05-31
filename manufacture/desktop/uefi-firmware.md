---
author: Justinha
Description: UEFI Firmware
ms.assetid: 63cab521-9f35-4428-85b6-5561889243fd
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: UEFI Firmware
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UEFI Firmware


Here's some considerations when deploying Windows on Unified Extensible Firmware Interface (UEFI)-based devices.

## <span id="What_is_UEFI_"></span><span id="what_is_uefi_"></span><span id="WHAT_IS_UEFI_"></span>What is UEFI?


When the devices starts, the firmware interface controls the booting process of the PC, and then passes control to Windows or another operating system.

UEFI is a replacement for the older BIOS firmware interface and the Extensible Firmware Interface (EFI) 1.10 specifications.

More than 140 leading technology companies participate in the Unified EFI Forum, including AMD, AMI, Apple, Dell, HP, IBM, Insyde, Intel, Lenovo, Microsoft, and Phoenix Technologies.

## <span id="Benefits"></span><span id="benefits"></span><span id="BENEFITS"></span>Benefits of UEFI


Firmware that meets the UEFI 2.3.1 specifications provides the following benefits:

-   Faster boot and resume times.

-   Ability to use security features such as Secure Boot and factory encrypted drives that help prevent untrusted code from running before the operating system is loaded. For more information, see [Secure Boot Overview](secure-boot-overview.md) and [Factory Encrypted Drives](factory-encrypted-drives.md).

-   Ability to more easily support large hard drives (more than 2 terabytes) and drives with more than four partitions.

-   Compatibility with legacy BIOS. Some UEFI-based PCs contain a Compatibility Support Module (CSM) that emulates earlier BIOS, providing more flexibility and compatibility for end users. To use the CSM, Secure Boot must be disabled.

-   Support for multicast deployment, which allows PC manufacturers to broadcast a PC image that can be received by multiple PCs without overwhelming the network or image server.

-   Support for UEFI firmware drivers, applications, and option ROMs.

Additional advantages are described in the [Intel EFI and UEFI Overview and Specifications](http://www.intel.com/technology/efi/).

## <span id="Windows_support_of_UEFI"></span><span id="windows_support_of_uefi"></span><span id="WINDOWS_SUPPORT_OF_UEFI"></span>Windows support of UEFI


The following Windows editions include support for UEFI:

-   Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), Windows Server 2016 Technical Preview, Windows 8.1, and Windows 8 support native UEFI 2.0 or later on 32-bit (x86), 64-bit (x64), and ARM-based PCs. They also support BIOS-based PCs, and UEFI-based PCs running in legacy BIOS-compatibility mode.

    Some features such as Secure Boot require UEFI 2.3.1 Errata C or higher.

-   Windows Server 2012 R2 and Windows Server® 2012 support native UEFI 2.0 or later on 64-bit systems. Some features such as Secure Boot require UEFI 2.3.1.

-   Windows 7 and Windows Server 2008 R2:

    -   Support UEFI 2.0 or later on 64-bit systems. They also support BIOS-based PCs, and UEFI-based PCs running in legacy BIOS-compatibility mode.

    -   Support on Class 2 systems running in legacy BIOS-compatibility mode by using a CSM, so they can use the legacy BIOS INT10 features.

    -   Are not supported on Class 3 systems, because these operating systems assume the presence of legacy BIOS INT10 support in the firmware, which is not available in a Class-3 UEFI implementation.

    -   Windows Server 2008 R2 also supports EFI 1.10 on Itanium-based systems.

**Note**  
-   While in UEFI mode, the Windows version must match the PC architecture. A 64-bit UEFI PC can only boot 64-bit versions of Windows. A 32-bit PC can only boot 32-bit versions of Windows. In some cases, while in legacy BIOS mode, you may be able to run 32-bit Windows on a 64-bit PC, assuming the manufacturer supports 32-bit legacy BIOS mode on the PC.

-   Windows supports a subset of the functionality that is defined in the UEFI specification. Windows implementations do not explicitly check against higher revisions of the firmware

-   For additional UEFI requirements, see [UEFI Installation Media Format and default boot behavior](uefi-installation-media-format-and-default-boot-behavior.md) and [UEFI Requirements: Boot time, Runtime, Hibernation State (S4)](uefi-requirements-boot-time-runtime-hibernation-state--s4.md).

 

## <span id="Considerations"></span><span id="considerations"></span><span id="CONSIDERATIONS"></span>Before You Begin


Before you install Windows on a UEFI-based PC, note the following:

-   For some platforms or hardware configurations, you may need to perform additional steps to make sure that Windows is installed in UEFI mode or in legacy BIOS-compatibility mode. For more information, see [Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md).

-   UEFI hard disks require the GUID partition table (GPT) partition structure, instead of the master boot record (MBR) partition structure that is used in BIOS.

    When you install Windows by using the Windows product DVD, Windows Setup detects whether the PC was booted in UEFI mode or BIOS-compatibility mode, and it configures Windows based on this selection.

-   Windows Preinstallation Environment (Windows PE) can be configured to support both UEFI mode and BIOS-compatibility mode.

     **Note**  
    While the PC is in UEFI mode, the Windows PE version must match the PC architecture. A PC in 64-bit UEFI firmware mode can only boot 64-bit versions of Windows PE. A PC in 32-bit UEFI firmware mode can only boot 32-bit versions of Windows PE. On PCs that support both UEFI mode and legacy BIOS mode, you may be able to run 32-bit Windows PE on a 64-bit PC by changing BIOS menu settings from “UEFI mode” to “BIOS mode”, assuming the manufacturer supports legacy BIOS mode.

    For instructions, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md) or [WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md).
    
-   Note to firmware manufacturers: Do not use tools or applications to alter Windows-specific boot files, including files in the C:\\boot and C:\\EFI folders. Altering these files could interfere with the PC’s ability to boot up, to resume from hibernation, or to run system recovery tools. Instead, use tools such as BCDboot to set the boot order. For more info, see [BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md).

## <span id="Resources"></span><span id="resources"></span><span id="RESOURCES"></span>See Also


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>UEFI Requirements</p></td>
<td align="left"><p>[UEFI Installation Media Format and default boot behavior](uefi-installation-media-format-and-default-boot-behavior.md) | [UEFI Requirements: Boot time, Runtime, Hibernation State (S4)](uefi-requirements-boot-time-runtime-hibernation-state--s4.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p>UEFI Features</p></td>
<td align="left"><p>[Microsoft Hardware Developer Central: Firmware and Boot Environment](http://go.microsoft.com/fwlink/?LinkId=244007) | [Secure Boot Overview](secure-boot-overview.md) | [Factory Encrypted Drives](factory-encrypted-drives.md)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Booting a PC into UEFI or legacy BIOS mode</p></td>
<td align="left"><p>[Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md) | [WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Managing UEFI hard drives and boot configuration data</p></td>
<td align="left"><p>[Hard Drives and Partitions](hard-drives-and-partitions.md) | [Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md) | [BCD System Store Settings for UEFI](bcd-system-store-settings-for-uefi.md) | [UEFI Validation Option ROM Guidance](uefi-validation-option-rom-validation-guidance.md) | [Windows UEFI Firmware Update Platform](http://go.microsoft.com/fwlink/p/?linkid=523808) | [Validating Windows UEFI Firmware Update Platform Functionality](validating-windows-uefi-firmware-update-platform-functionality.md)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Forums</p></td>
<td align="left"><p>[Unified Extensible Firmware Interface Forum (UEFI Forum)](http://go.microsoft.com/fwlink/?LinkId=244009)</p></td>
</tr>
</tbody>
</table>

 

 

 






