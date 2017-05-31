---
author: Justinha
Description: Hard Drives and Partitions
ms.assetid: bb453d9d-e819-4301-834d-09486d3e64e9
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Hard Drives and Partitions
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hard Drives and Partitions


In this section, you will learn methods to deploy Windows to different drives, including hard drives, solid-state drives (SSDs), or virtual hard drives (VHDs). You will also learn about factors that you must consider when you deploy Windows.

## <span id="What_s_new_in_Windows_10"></span><span id="what_s_new_in_windows_10"></span><span id="WHAT_S_NEW_IN_WINDOWS_10"></span>What's new in Windows 10


-   Use Compact OS and single-sourcing to save more space on the hard drive: [Compact OS, single-sourcing, and image optimization](compact-os.md).
-   Use the FFU image format to apply images faster to your devices: [Deploy Windows using Full Flash Update (FFU)](deploy-windows-using-full-flash-update--ffu.md)
-   In Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), we've changed the partition layout. While we still use a separate recovery tools image, Windows no longer needs a separate full-system recovery image to use push-button reset features. This can save several GB of drive space.

    We now recommend that you place the Windows recovery tools partition immediately after the Windows partition. This allows Windows to modify and recreate the partition later if future updates require a larger recovery image.

    If you use scripts to deploy Windows, check out the new sample scripts we've created for different device firmware types (the newer UEFI-based BIOS, or the legacy BIOS). To learn more, see [UEFI/GPT-based hard drive partitions](configure-uefigpt-based-hard-drive-partitions.md) and [BIOS/MBR-based hard drive partitions](configure-biosmbr-based-hard-drive-partitions.md).

-   It's no longer necessary to run the Windows System Assessment Tests (WinSAT) on SSD drives. Windows detects SSD drives and tunes itself accordingly.
-   On [UEFI/GPT-based drives](configure-uefigpt-based-hard-drive-partitions.md), we've reduced the recommended size of the MSR partition from 128MB to 16MB.

## <span id="HardDisks"></span><span id="harddisks"></span><span id="HARDDISKS"></span>Drive types


You can install Windows to a hard drive, such as a hard disk drive or a solid-state drive. For additional security, you can use hard drives that the factory has pre-encrypted. A single computer may contain multiple drives.

### <span id="SSDs"></span><span id="ssds"></span><span id="SSDS"></span>Solid-state drives

A solid-state drive (SSD) is a hard drive that uses solid-state memory to store persistent data. An SSD must have a minimum of 16 gigabytes (GB) of space to install Windows. For more information about drive space and RAM considerations, see [Compact OS, single-sourcing, and image optimization](compact-os.md).

**Note**   It's no longer necessary to run the Windows System Assessment Tests (WinSAT) on SSD drives. Windows now detects SSD drives and will tune itself accordingly.

 

### <span id="AdvancedFormat"></span><span id="advancedformat"></span><span id="ADVANCEDFORMAT"></span>Advanced format drives

You can use some Advanced Format Drives to provide additional drive space.

Advanced Format 512 emulation (512e) drives are supported on either BIOS-based or UEFI-based computers.

Advanced Format 4K Native (4Kn) drives are supported on UEFI-based computers only.

**Warning**  
For Advanced Format 4K Native drives (4-KB-per-sector) drives, the minimum partition size is 260 MB, due to a limitation of the FAT32 file format. The minimum partition size of FAT32 drives is calculated as sector size (4KB) x 65527 = 256 MB. For more information, see [Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md).

 

### <span id="EncryptedDisksAndPartitions"></span><span id="encrypteddisksandpartitions"></span><span id="ENCRYPTEDDISKSANDPARTITIONS"></span>Factory-encrypted hard drives

To help protect your deployment environment, you can use a factory pre-encrypted hard drive to prevent unauthorized access before you install Windows or any other software. For more information, see [Factory Encrypted Drives](factory-encrypted-drives.md).

### <span id="MultipleHardDisks"></span><span id="multipleharddisks"></span><span id="MULTIPLEHARDDISKS"></span>Multiple hard drives

If you install Windows on a device that has multiple hard drives, you can use the disk location path to make sure that your images are applied to the intended drives.

To do this, use the `diskpart SELECT DISK=<disk location path>` command to select each drive. For example:

`SELECT DISK=PCIROOT(0)#PCI(0100)#ATA(C00T00L00)`

**Note**  
The system drive might not appear as disk 0 in the DiskPart tool. The system might assign different numbers to drives when you reboot. Different computers that have the same drive configuration can have different disk numbers.

To learn more, see [Configure Multiple Hard Drives](configure-multiple-hard-drives.md) and [Hard Disk Location Path Format](hard-disk-location-path-format.md).

 

## <span id="Partitions"></span><span id="partitions"></span><span id="PARTITIONS"></span>Partitions


You can divide your hard drive into multiple partitions. You can create separate system, recovery, Windows, or data partitions.

To enhance the security of the Windows partition or a data partition, you can use BitLocker to encrypt the partition. For more information, see [BitLocker Drive Encryption](bitlocker-drive-encryption.md).

The partition types must match the firmware of the computer. You can install Windows on hard drives that are based on any of the following types of firmware:

-   **Basic Input/Output System (BIOS)**. Uses the Master Boot Record (MBR) partition structure.

-   **Extensible Firmware Interface (EFI) (Class 1)**: Uses the GUID Partition Table (GPT) partition structure.

-   **Unified Extensible Firmware Interface (UEFI) Class 2**: Uses the GPT partition structure. Also includes a compatibility support module (CSM) that enables you to use BIOS functions, including the MBR partition structure. This module can be enabled or disabled in the firmware.

-   **Unified Extensible Firmware Interface (UEFI) Class 3**: Uses the GPT partition structure.

To determine your system type, consult your hardware manufacturer.

### <span id="SystemPartition"></span><span id="systempartition"></span><span id="SYSTEMPARTITION"></span>System and utility partitions

A *system partition* is a partition that contains the hardware-specific files that are needed to load Windows.

By default, during Windows Setup, Windows stores these hardware-specific files in a separate partition. This enables the computer to use the following:

-   **Security tools**. Some security tools, such as BitLocker, require a separate system partition.

-   **Recovery tools**. Some recovery tools, such as Windows Recovery Environment (Windows RE), require a separate system partition.

-   **Multiple operating systems**. If a computer has multiple operating systems, such as Windows 10 for desktop editions and Windows 7, the computer displays a list of operating systems. The user can then select which operating system to boot. When the system boot files are on a separate partition, it is easier to remove a Windows partition or replace the partition with a new copy of Windows.

We recommend adding system utility partitions before the Windows partition, because in the event that a full-system recovery is needed, this partition order helps to prevent the recovery tools from overwriting the system and utility partitions.

For information about how to configure system partitions while you apply images, see [Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md).

### <span id="MicrosoftRecoveryPartitions"></span><span id="microsoftrecoverypartitions"></span><span id="MICROSOFTRECOVERYPARTITIONS"></span>Microsoft reserved partition (MSR)

The MSR is used on UEFI/GPT systems, to support software components that formerly used hidden sectors.

For more information about configuring MSR partitions, see [Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md).

For more information about MSR partitions, see [Windows and GPT FAQ](http://go.microsoft.com/fwlink/?LinkId=267523)

### <span id="RecoveryPartition"></span><span id="recoverypartition"></span><span id="RECOVERYPARTITION"></span>Recovery partitions

We recommend adding a separate partition for the Windows Recovery Environment (Windows RE) at the end of the hard drive. With this partition order, if future updates require adding to or replacing the Windows RE tools partition, Windows will be able to manage the partition size automatically.

For BIOS/MBR-based systems, it's still possible to combine the Windows RE tools partition with the system partition. To save drive space, consider creating logical partitions to get around the four-partition limit. For more info, see [Configure more than four partitions on a BIOS/MBR-based hard disk](configure-more-than-four-partitions-on-a-biosmbr-based-hard-disk.md).

For Windows 10 for desktop editions, it's no longer necessary to create and maintain a separate full-system recovery image. Windows can perform a refresh or reset using built-in tools.

### <span id="DataPartition"></span><span id="datapartition"></span><span id="DATAPARTITION"></span>Data partitions

A data partition is a partition that stores user data. A separate data partition can enable easier maintenance for situations where either the primary operating system is likely to be replaced, or when multiple operating systems exist on the same device, such as Windows 10 and Windows 7. When a device has multiple hard drives, a data partition may be stored on another drive.

**Warning**  
For typical single-drive configurations, we do not recommend that you use a separate data partition. There are two main reasons:

-   The partition may not automatically protect data that is stored outside the user profile folders. For example, a guest user might have access to files in an unprotected data partition.
-   If you change the default location of the user profile folders to any volume other than the system volume, you cannot service your image. The computer may not apply updates, fixes, or service packs to the installation. For a list of known issues related to changing the default folder locations, see [Description of known issues with the FolderLocation settings](http://go.microsoft.com/fwlink/?LinkId=142275).

 

## <span id="BKMK_LINKS"></span><span id="bkmk_links"></span>See also


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Content type</th>
<th align="left">References</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Deployment</strong></p></td>
<td align="left"><p>[Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md) | [Configure BIOS/MBR-Based Hard Drive Partitions](configure-biosmbr-based-hard-drive-partitions.md) | [Configure More than Four Partitions on a BIOS/MBR-Based Hard Disk](configure-more-than-four-partitions-on-a-biosmbr-based-hard-disk.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Multiple drives</strong></p></td>
<td align="left"><p>[Configure Multiple Hard Drives](configure-multiple-hard-drives.md) | [Hard Disk Location Path Format](hard-disk-location-path-format.md) | [Internal and External SATA Port Configuration](http://go.microsoft.com/fwlink/p/?LinkId=321830) | [Configuring Disk Mirroring](http://go.microsoft.com/fwlink/?LinkId=733824)</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Using smaller drives</strong></p></td>
<td align="left"><p>[Compact OS, single-sourcing, and image optimization](compact-os.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Operations</strong></p></td>
<td align="left"><p>[Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md) | [Deploy Windows using Full Flash Update (FFU)](deploy-windows-using-full-flash-update--ffu.md) | [Deploy Windows on a VHD (Native Boot)](deploy-windows-on-a-vhd--native-boot.md) | [Factory Encrypted Drives](factory-encrypted-drives.md) | [BitLocker Drive Encryption](bitlocker-drive-encryption.md)</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Troubleshooting</strong></p></td>
<td align="left"><p>[Repair the boot menu on a dual-boot PC](repair-the-boot-menu-on-a-dual-boot-pc.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Tools and settings</strong></p></td>
<td align="left"><p>[UEFI Firmware](uefi-firmware.md) | [The Windows and GPT FAQ](http://go.microsoft.com/fwlink/?LinkId=88211) | [BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md) | [DiskPart Command line syntax](http://go.microsoft.com/fwlink/?LinkId=128458) | [WIM vs. VHD vs. FFU: comparing image file formats](wim-vs-ffu-image-file-formats.md)</p></td>
</tr>
</tbody>
</table>

 

 

 






