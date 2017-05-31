---
author: Justinha
Description: Configure Multiple Hard Drives
ms.assetid: 2cb7386a-b3f6-40dd-b084-fce52a7aed9b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure Multiple Hard Drives
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure multiple hard drives


If you are deploying Windows to a computer that has multiple hard drives, you can verify that the image is applied to a specific hard drive by using hardware-specific identifiers such as the location path or the hardware interrupt value.

The location path is a string that specifies the physical location that each drive is connected to the computer, for example: `PCIROOT(0)#PCI(0100)#ATA(C00T00L00)`. When manufacturing a computer, use a consistent physical location when connecting your drives, and then use the location path string to identify each hard drive.

For BIOS-based computers or a computer that is running Virtual Disk Service (VDS), you can use the **SELECT DISK=SYSTEM** and **SELECT DISK=NEXT** commands to select the appropriate hard drive.


## <span id="IdentifyingDiskLocationPath"></span><span id="identifyingdisklocationpath"></span><span id="IDENTIFYINGDISKLOCATIONPATH"></span>Identifying a drive location path


-   Use the DiskPart commands: **list disk** and **select disk &lt;disk number&gt;** (Example: **select disk 1**) to navigate between the drives on your computer.

    To show the location path of a selected drive, use the DiskPart command `detail disk`.

    In the following example, the location path of the selected drive is PCIROOT(0)\#PCI(0100)\#ATA(C00T00L00).

```
    DISKPART> detail disk

    HITACHI HTS722016K9SA00
    Disk ID: 5E27161A
    Type   : ATA
    Bus    : 0
    Target : 0
    LUN ID : 0
    Location Path : PCIROOT(0)#PCI(0100)#ATA(C00T00L00)
    Read-only  : No
    Boot Disk  : Yes
    PagefileDisk  : Yes
    Hibernation File Disk  : No
    CrashdumpDisk  : Yes
    Clustered Disk  : No


      Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
      ----------  ---  -----------  -----  ----------  -------  ---------  --------
      Volume 1     C                NTFS   Partition    149 GB  Healthy    System

    DISKPART>
```

## <span id="Selecting_Drives"></span><span id="selecting_drives"></span><span id="SELECTING_DRIVES"></span>Selecting Drives


### <span id="SelectingSystemDisk"></span><span id="selectingsystemdisk"></span><span id="SELECTINGSYSTEMDISK"></span>Selecting the system drive


1.  **BIOS-based computers**: Use the command **SELECT DISK=SYSTEM** to select the default system drive.

    This command selects the drive that has an interrupt 13h value of 80h. If the value 80h is assigned to a USB flash drive, this command selects a hard drive that has a value of 81h.

2.  **UEFI-based computers**: To select a drive, use the DiskPart command **SELECT DISK=&lt;location path&gt;**.

    **Note**  
    Do not use the **SELECT DISK=SYSTEM** command or the GetSystemDiskNTPath API on Unified Extensible Firmware Interface (UEFI)-based computers to select the system drive. The **SELECT DISK=SYSTEM** command and the GetSystemDiskNTPath API identify the drive that the operating system was booted from as the system drive. If you boot from Windows® PE, this command selects the Windows PE drive as the system drive. If you boot from a system that has multiple drives that include an EFI system partition (ESP), this command may select the wrong drive.

     

### <span id="SelectingNonSystemDisks"></span><span id="selectingnonsystemdisks"></span><span id="SELECTINGNONSYSTEMDISKS"></span>Selecting a non-system drive
 

1.  **Select the drive by location path.** To select a drive, use the DiskPart command **SELECT DISK=&lt;location path&gt;**, where &lt;*location path*&gt; is the location path of your drive. This command helps specify a drive by location.

    Example:

    ``` syntax
    SELECT DISK=PCIROOT(0)#PCI(0100)#ATA(C00T00L00)
    ```

2.  **Select the drive by using the "NEXT" drive.** Use the DiskPart command **SELECT DISK=NEXT**. This command helps specify any remaining hard drives, regardless of location. To select more drives, repeat the **SELECT DISK=NEXT** command to select each drive in order. If there are no more drives to select, DiskPart returns an error.

    **Note**  
    The computer maintains the context for the **SELECT DISK=NEXT** command as long as DiskPart continues running. If DISKPART exits, the computer loses this context.

     

    UEFI-based example:

    ``` syntax
    SELECT DISK=PCIROOT(0)#PCI(0100)#ATA(C00T00L00)
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
    rem                (winre.wim)                    **
    rem ==    c. Prepare the Windows partition ========= 
    format quick fs=ntfs label="Windows"
    assign letter="W"
    rem === 4. Recovery tools partition ================
    create partition primary
    format quick fs=ntfs label="Recovery tools"
    assign letter="R"
    set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
    gpt attributes=0x8000000000000001
    rem NON-SYSTEM DRIVE ===============================
    SELECT DISK=NEXT
    clean
    convert gpt
    rem == 1. Microsoft Reserved (MSR) partition =======
    create partition msr size=16
    rem == 2. Data partition ===========================
    create partition primary
    format quick fs=ntfs label="Data"
    assign letter=z
    ```

### <span id="ExampleIdentifyingSystemDiskAfterReboot"></span><span id="exampleidentifyingsystemdiskafterreboot"></span><span id="EXAMPLEIDENTIFYINGSYSTEMDISKAFTERREBOOT"></span>Identifying the system drive after a reboot

After you reboot, drive lettering may change. You can use the following example script to select the system drive and then reassign letters to the ESP, recovery, and Windows partitions.

``` syntax
SELECT DISK=PCIROOT(0)#PCI(0100)#ATA(C01T01L00)
select partition=1
assign letter=s
select partition=2
assign letter=t
select partition=3
assign letter=w
```

### <span id="ExampleFormattingNonSystemDisks"></span><span id="exampleformattingnonsystemdisks"></span><span id="EXAMPLEFORMATTINGNONSYSTEMDISKS"></span>Formatting non-system drives

This example script selects the system drive and then skips past the drive without modifying the contents of the drive. The script then selects two non-system drives and creates a single, formatted, empty partition on each drive. The partitions do not receive an image, so it is not necessary to specifically identify them.

UEFI-based example:

``` syntax
SELECT DISK=PCIROOT(0)#PCI(0100)#ATA(C01T01L00)
SELECT DISK=NEXT
clean
convert gpt
create partition msr size=16
create partition primary
format quick fs=ntfs label="DataDrive1"
SELECT DISK=NEXT
clean
convert gpt
create partition primary
format quick fs=ntfs label="DataDrive2"
```

## <span id="related_topics"></span>Related topics


[Hard Disk Location Path Format](hard-disk-location-path-format.md)

[DiskPart Command line syntax](http://go.microsoft.com/fwlink/?LinkId=128458)

 

 






