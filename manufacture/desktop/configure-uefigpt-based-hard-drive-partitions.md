---
author: themar
Description: 'UEFI/GPT-based hard drive partitions'
ms.assetid: a6c97be2-1d1f-4639-9771-3b17234370e6
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'UEFI/GPT-based hard drive partitions'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UEFI/GPT-based hard drive partitions


Create custom partition layouts for your hard disk drives (HDDs), solid-state drives (SSDs), and other drives when deploying Windows to Unified Extensible Firmware Interface (UEFI)–based devices.

**Note**  If you use a custom partition layout on Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), update the push-button recovery script so the recovery tools can recreate the custom partition layout when needed.

 

In this topic:

-   [Drive partition rules](#diskpartitionrules)
-   [Default layout](#recommendedpartitionconfigurations)
-   [Sample Diskpart script](#relatedsamplefiles)

## <span id="DiskPartitionRules"></span><span id="diskpartitionrules"></span><span id="DISKPARTITIONRULES"></span>Drive Partition Rules


When you deploy Windows to a UEFI-based device, you must format the hard drive that includes the Windows partition by using a GUID partition table (GPT) file system. Additional drives may use either the GPT or the master boot record (MBR) file format.

A GPT drive may have up to 128 partitions.

Each partition can have a maximum of 18 exabytes (~18.8 million terabytes) of space.

**Windows partition requirements:**

-   **System partition**

    The device must contain a system partition. On GPT drives, this is known as the EFI System Partition, or the ESP. This partition is usually stored on the primary hard drive. The device boots to this partition.

    The minimum size of this partition is 100 MB, and must be formatted using the FAT32 file format.

    This partition is managed by the operating system, and should not contain any other files, including Windows RE tools.

    **Note**  
    For Advanced Format 4K Native drives (4-KB-per-sector) drives, the minimum size is 260 MB, due to a limitation of the FAT32 file format. The minimum partition size of FAT32 drives is calculated as sector size (4KB) x 65527 = 256 MB.

    Advanced Format 512e drives are not affected by this limitation, because their emulated sector size is 512 bytes. 512 bytes x 65527 = 32 MB, which is less than the 100 MB minimum size for this partition.

     

-   **Microsoft® reserved partition (MSR)**

    Beginning in Windows 10, the size of the MSR is 16 MB.

    Add an MSR to each GPT drive to help with partition management. The MSR is a reserved partition that does not receive a partition ID. It cannot store user data.

-   **Other utility partitions**

    Any other utility partitions not managed by Windows must be located before the Windows, data, and recovery image partitions. This allows end users to perform actions such as resizing the Windows partition without affecting system utilities.

    Protect end users from accidentally modifying utility partitions by identifying them using a GPT attribute. This prevents these partitions from appearing in File Explorer.

    **To set partitions as utility partitions**

    -   When you are deploying Windows by using the **DiskPart** tool, use the **attributes volume set GPT\_ATTRIBUTE\_PLATFORM\_REQUIRED** command after you create the partition to identify the partition as a utility partition. For more information, see the MSDN topic: [PARTITION\_INFORMATION\_GPT structure](http://go.microsoft.com/fwlink/p/?linkid=240300).

    **To verify that system and utility partitions exist**

    1.  Click **Start**, right-click **This PC**, and then click **Manage**. The **Computer Management** window opens.
    2.  Click **Disk Management**. The list of available drives and partitions appears.
    3.  In the list of drives and partitions, confirm that the system and utility partitions are present and are not assigned a drive letter.
-   **Windows partition**
    -   The partition must have at least 20 gigabytes (GB) of drive space for 64-bit versions, or 16 GB for 32-bit versions.
    -   The Windows partition must be formatted using the NTFS file format.
    -   The Windows partition must have enough 10 GB of free space after the user has completed the Out Of Box Experience (OOBE).
-   **Recovery tools partition**

    This partition must be at least 300 MB.

    This partition must have enough space for the Windows Recovery Environment tools image (winre.wim, typically between 250-300MB, depending on base language and customizations added), plus enough free space so that the partition can be captured by backup utilities:

    -   If the partition is less than 500 MB, it must have at least 50 MB of free space.
    -   If the partition is 500 MB or larger, it must have at least 320 MB of free space.
    -   If the partition is larger than 1 GB, we recommend that it should have at least 1 GB free.
    -   This partition must use the Type ID: DE94BBA4-06D1-4D40-A16A-BFD50179D6AC.
    -   The recovery tools should be in a separate partition than the Windows partition to support automatic failover and to support booting partitions encrypted with Windows BitLocker Drive Encryption.

    We recommend that you place this partition immediately after the Windows partition. This allows Windows to modify and recreate the partition later if future updates require a larger recovery image.

-   **Data partitions**

    The recommended partition layout for Windows 10 does not include data partitions. However, if data partitions are required, they should be placed after the Windows RE partition. This allows future updates to Windows RE to grow the Windows RE partition by shrinking the Windows partition.

    This layout makes it more difficult for end users to remove the data partition and merge the space with the Windows partition. To do so, the Windows RE partition must be moved to the end of the unused space reclaimed from the data partition, so that the Windows partition can be extended.

    Windows 10 does not include functionality or utility to facilitate this process. However, manufacturers can develop and provide such a utility if PCs are shipped with data partitions.

## <span id="RecommendedPartitionConfigurations"></span><span id="recommendedpartitionconfigurations"></span><span id="RECOMMENDEDPARTITIONCONFIGURATIONS"></span>Partition layout


The default partition layout for UEFI-based PCs is: a system partition, an MSR, a Windows partition, and a recovery tools partition. 

![diagram of default partition layout: system, msr, windows, and recovery](images/dep-win10-partitions-uefi.png)

This layout lets you use Windows BitLocker Drive Encryption through both Windows and through the Windows Recovery Environment.

## <span id="RelatedSampleFiles"></span><span id="relatedsamplefiles"></span><span id="RELATEDSAMPLEFILES"></span>Sample files: configure drive partitions by using Windows PE and DiskPart scripts


For image-based deployment, boot the PC to [Windows PE](winpe-intro.md), and then use the **DiskPart** tool to create the partition structures on your destination PCs.

**Note**  
In these **DiskPart** examples, the partitions are assigned the letters: System=S, Windows=W, and Recovery=R. The MSR partition does not receive a drive letter.

We recommend changing the Windows drive letter to a letter that’s near the end of the alphabet, such as W, to avoid drive letter conflicts. Do not use X, because this drive letter is reserved for Windows PE. After the device reboots, the Windows partition is assigned the letter C, and the other partitions don’t receive drive letters.

If you reboot, Windows PE reassigns disk letters alphabetically, starting with the letter C, without regard to the configuration in Windows Setup. This configuration can change based on the presence of different drives, such as USB flash drives.

 

The following steps describe how to partition your hard drives and prepare to apply images. You can use the code in the sections that follow to complete these steps.

**To partition hard drives and prepare to apply images**

1.  Save the following code in the as a text file (CreatePartitions-UEFI.txt) on a USB flash drive.

    ``` syntax
    rem == CreatePartitions-UEFI.txt ==
    rem == These commands are used with DiskPart to
    rem    create four partitions
    rem    for a UEFI/GPT-based PC.
    rem    Adjust the partition sizes to fill the drive
    rem    as necessary. ==
    select disk 0
    clean
    convert gpt
    rem == 1. System partition =========================
    create partition efi size=100
    rem    ** NOTE: For Advanced Format 4Kn drives,
    rem               change this value to size = 260 ** 
    format quick fs=fat32 label="System"
    assign letter="S"
    rem == 2. Microsoft Reserved (MSR) partition =======
    create partition msr size=16
    rem == 3. Windows partition ========================
    rem ==    a. Create the Windows partition ==========
    create partition primary 
    rem ==    b. Create space for the recovery tools ===
    shrink minimum=500
    rem       ** NOTE: Update this size to match the
    rem                size of the recovery tools 
    rem                (winre.wim) plus free space                   **
    rem ==    c. Prepare the Windows partition ========= 
    format quick fs=ntfs label="Windows"
    assign letter="W"
    rem === 4. Recovery tools partition ================
    create partition primary
    format quick fs=ntfs label="Recovery tools"
    assign letter="R"
    set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
    gpt attributes=0x8000000000000001
    list volume
    exit
    ```

2.  Use Windows PE to boot the destination PC.

3.  Clean and partition the drive. In this example, *F* is the letter of the USB flash drive.

    ``` syntax
    DiskPart /s F:\CreatePartitions-UEFI.txt
    ```

4.  If you use a custom partition layout on Windows 10 for desktop editions, update the push-button recovery script so the recovery tools can recreate the custom partition layout when needed.

## <span id="NextSteps"></span><span id="nextsteps"></span><span id="NEXTSTEPS"></span>Next steps


Use a deployment script to apply the Windows images on the newly created partitions. For more information, see [Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md).

## <span id="related_topics"></span>Related topics


[Configure BIOS/MBR-Based Hard Drive Partitions](configure-biosmbr-based-hard-drive-partitions.md)

[BitLocker Drive Encryption](bitlocker-drive-encryption.md)

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md)

[Configuring Disk Mirroring](http://go.microsoft.com/fwlink/?LinkId=733824)

[The Windows and GPT FAQ](http://go.microsoft.com/fwlink/?LinkId=88211)

 

 






