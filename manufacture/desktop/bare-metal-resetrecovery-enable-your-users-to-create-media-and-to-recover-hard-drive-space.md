---
author: Justinha
Description: 'Bare metal reset/recovery: enable your users to create recovery media'
ms.assetid: 2f12f7aa-2259-453a-a433-4fa56b03b375
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Bare metal reset/recovery: enable your users to create recovery media'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Bare metal reset/recovery: enable your users to create recovery media


Recovery media (bare metal recovery) helps restore a Windows device to the factory state, even if the user needs to replace the hard drive or completely wipe the drive clean.

Windows uses the built-in Windows files, including recent Windows and driver updates, plus any customizations included in the OEM provisioning package, to create the recovery media.

If you deploy Windows using the default partition layout, your users will be able to create bare metal recovery media by default.

If you're deploying Windows with a custom partition layout, you'll need to add a few configuration files to enable your users to create bare metal recovery media:

-   A **partition reset script**, which is a modified DiskPart script that resets your custom partition layout.
-   A **push-button reset configuration file** ([ResetConfig XML](resetconfig-xml-reference-s14.md)) that identifies the Windows and Windows RE partitions.

**Note:** In Windows 10, version 1607, desktop applications and settings captured in [siloed provisioning packages](siloed-provisioning-packages.md) will not be restored using this media. Regular customizations packages (.ppkg) captured using the ScanState tool are not affected by this issue. 

## <span id="CreateConfigFiles"></span><span id="createconfigfiles"></span><span id="CREATECONFIGFILES"></span>Creating configuration files


**Partition reset script**

1.  In Notepad, create a configuration file that partitions the hard drive after the hard drive has been reset. This script should be the same as the script used to create partitions on the hard drive, with the following exceptions:

    -   The script should not contain commands to select or clean the drive. Windows identifies the system drive automatically. To learn more, see [Identifying the System Drive](#identifyingthesystemdrive) later in this topic.

    -   The script should assign letters to the system partition, the Windows partition, and the Windows RE tools partition.

    Examples:

    UEFI (based on [UEFI/GPT-based hard drive partitions](configure-uefigpt-based-hard-drive-partitions.md)):

    ``` syntax
    rem == ResetPartitions-UEFI.txt ==
    rem == These commands are used with DiskPart to
    rem    reset the drive and recreate five partitions
    rem    for a UEFI/GPT-based computer.
    rem    Adjust the partition sizes to fill the drive
    rem    as necessary. ==
    rem == The differences between this file and
    rem    CreatePartitions-UEFI.txt
    rem    are noted in parenthesis.
    rem       (NOT USED: select disk 0)
    rem       (NOT USED: clean)
    convert gpt
    rem == 1. System partition =========================
    create partition efi size=100
    rem    ** NOTE: For Advanced Format 4Kn drives,
    rem               change this value to size = 260 ** 
    format quick fs=fat32 label="System"
    assign letter="S"
    rem == 2. Microsoft Reserved (MSR) partition =======
    create partition msr size=128
    rem == 3. Windows partition ========================
    rem ==    a. Create the Windows partition ==========
    create partition primary 
    rem ==    b. Create space for the recovery tools ===
    shrink minimum=500
    rem       ** NOTE: Update this size to match the
    rem                size of the recovery tools 
    rem                (winre.wim)                    **
    rem ==    c. Prepare the Windows partition ========= 
    format quick fs=ntfs label="Windows"
    assign letter="C"
    rem === 4. Recovery tools partition ================
    create partition primary
    format quick fs=ntfs label="Recovery tools"
    assign letter="R"
    set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
    gpt attributes=0x8000000000000001
    list volume
    ```

    BIOS (based on [BIOS/MBR-based hard drive partitions](configure-biosmbr-based-hard-drive-partitions.md)):

    ``` syntax
    rem == ResetPartitions-BIOS.txt ==
    rem == These commands are used with DiskPart to
    rem    reset the drive and create three partitions
    rem    for a BIOS/MBR-based computer.
    rem    Adjust the partition sizes to fill the drive
    rem    as necessary. ==
    rem == The differences between this file and
    rem    CreatePartitions-BIOS.txt
    rem    are noted in parenthesis.
    rem       (NOT USED: select disk 0 )
    rem       (NOT USED: clean )
    rem == 1. System partition ======================
    create partition primary size=100
    format quick fs=ntfs label="System"
    assign letter="S"
    active
    rem == 2. Windows partition =====================
    rem ==    a. Create the Windows partition =======
    create partition primary
    rem ==    b. Create space for the recovery tools  
    shrink minimum=500
    rem       ** NOTE: Update this size to match the
    rem                size of the recovery tools 
    rem                (winre.wim)                 **
    rem ==    c. Prepare the Windows partition ====== 
    format quick fs=ntfs label="Windows"
    assign letter="C"
    rem == 3. Recovery tools partition ==============
    create partition primary
    format quick fs=ntfs label="Recovery"
    assign letter="R"
    set id=27
    list volume
    ```

2.  Save your file, for example, E:\\Recovery\\RecoveryImage\\ResetPartitions-UEFI.txt.

**Push-button reset configuration file (ResetConfig.xml)**

1.  In Notepad, create a configuration file that points to your push-button reset partition script.

    For information about configuring this file, see [ResetConfig XML Reference](resetconfig-xml-reference-s14.md).

    UEFI:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <!-- ResetConfig.xml for UEFI -->
    <Reset>
        <!-- May be combined with custom scripts – insert Run Phase elements here -->
        <SystemDisk>
            <DiskpartScriptPath>ResetPartitions-UEFI.txt</DiskpartScriptPath>
            <MinSize>75000</MinSize>
            <WindowsREPartition>4</WindowsREPartition>
            <WindowsREPath>Recovery\WindowsRE</WindowsREPath>
            <OSPartition>3</OSPartition>
        </SystemDisk>
    </Reset>
    ```

    BIOS:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <!-- ResetConfig.xml for BIOS -->
    <Reset>
        <!-- May be combined with custom scripts – insert Run Phase elements here -->
        <SystemDisk>
            <DiskpartScriptPath>ResetPartitions-BIOS.txt</DiskpartScriptPath>
            <MinSize>75000</MinSize>
            <WindowsREPartition>3</WindowsREPartition>
            <WindowsREPath>Recovery\WindowsRE</WindowsREPath>
            <OSPartition>2</OSPartition>
        </SystemDisk>
    </Reset>
    ```

2.  Save the file using the UTF-8 file format:

    Click **File**, and then click **Save As**. In the **Encoding** box, select **UTF-8**, and save this file as E:\\Recovery\\RecoveryImage\\ResetConfig.xml.

## <span id="EnableEndUsers"></span><span id="enableendusers"></span><span id="ENABLEENDUSERS"></span>Enable users to create media


Users can use this option to create recovery media, and to reclaim the hard drive space from the recovery image partition when needed.

**Step 1: Add the configuration files to the destination computer**

1.  On your destination computer, insert the USB flash drive with the configuration files.

2.  Copy the configuration files to the destination computer:

    ``` syntax
    Copy E:\Recovery\RecoveryImage\* R:\RecoveryImage\*
    ```

    where *E* is the drive letter of the USB flash drive and *R* is the drive letter of the recovery image partition.

**Step 2: Test that Windows can create recovery media**

1.  Restart the destination computer, and complete Out-Of-Box Experience (OOBE).

2.  Click **Start**, type **create a recovery drive**, and select **Create a recovery drive**, and click **Yes** at the UAC prompt.

3.  Insert a USB flash drive.

4.  Select **Copy the recovery partition from the PC to the recovery drive** &gt; **Next** &gt; **Next** &gt; **Create**.

**Step 3: Test the recovery media**

1.  On a computer that has no operating system, insert your recovery media.
2.  Start the computer, press a key to open the firmware boot menus, and then select the appropriate boot device.
3.  At the **Windows RE Tools** menus, select a keyboard layout, for example, **US**.
4.  Click **Troubleshoot** &gt; **Reset your PC** &gt; **Next**. If you're prompted to clean the drive, select **Yes**.
5.  Select **Yes, repartition the drives** &gt; **Just remove my files** &gt; **Reset**.

**Troubleshooting:**

-   Make sure that ResetConfig.xml is saved as a UTF-8 file.
-   Make sure that the filename listed in the &lt;DiskpartScriptPath&gt; element of the ResetConfig.xml file matches the filename in the Diskpart script.
-   Make sure that the Diskpart script doesn't include commands to select the drive or clean the drive (`select disk 0`, `clean`).

## <span id="IdentifyingTheSystemDrive"></span><span id="identifyingthesystemdrive"></span><span id="IDENTIFYINGTHESYSTEMDRIVE"></span>Identifying the system drive


Windows identifies the system drive using the following methods:

**BIOS-based computers**: the BIOS-reported system drive is used.

**UEFI-based computers**: When Windows RE is enabled by using the `reagentc /setreimage` command, Windows writes the adaptor location path and GUID of the system disk to a UEFI variable. This step is only performed when both the system and OS partitions are on the system drive. The variable is updated if necessary when Windows RE gets disabled and then re-enabled.

**If multiple local drives are detected, Windows identifies the system drive by searching in the following order:**

1.  Windows searches for a drive with a GUID matching the value stored in firmware.

2.  Windows searches for a drive with a location path matching the value stored in firmware.

3.  Windows searches for a drive with an existing ESP.

    If multiple drives with ESP are found, the recovery process will not proceed.

4.  Windows searches for an uninitialized (raw) disk.

    If multiple uninitialized disks are found, the recovery process will not proceed.

## <span id="related_topics"></span>Related topics


[Push-Button Reset Overview](push-button-reset-overview.md)

[ResetConfig XML Reference](resetconfig-xml-reference-s14.md)

[Bare metal reset/recovery: create recovery media while deploying new devices](create-media-to-run-push-button-reset-features-s14.md)

[UEFI/GPT-based hard drive partitions](configure-uefigpt-based-hard-drive-partitions.md)

[BIOS/MBR-based hard drive partitions](configure-biosmbr-based-hard-drive-partitions.md)

 

 






