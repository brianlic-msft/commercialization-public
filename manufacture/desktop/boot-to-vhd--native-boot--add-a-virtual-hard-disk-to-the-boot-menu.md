---
author: Justinha
Description: 'Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu'
ms.assetid: e00d7f8f-502c-40e5-904c-8cc653c1899e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu


Native Boot allows you to create a virtual hard disk (VHD), install Windows to it, and then boot it up, either on your PC side-by-side with your existing installation, or on a new device.

A native-boot VHD can be used as the running operating system on designated hardware without any other parent operating system. This differs from a scenario where a VHD is connected to a virtual machine on a computer that has a parent operating system.

VHDs can be applied to PCs or devices that have no other installations of Windows, without a virtual machine or hypervisor. (A hypervisor is a layer of software under the operating system that runs virtual computers.) This enables greater flexibility in workload distribution because a single set of tools can be used to manage images for virtual machines and designated hardware.

You can also deploy the VHD to a PC that already has Windows installed on it, and use a boot menu to select between the existing version of Windows, or the version on the VHD.

To learn more about using VHDs in an enterprise environment, see [Understanding Virtual Hard Disks with Native Boot](understanding-virtual-hard-disks-with-native-boot.md).

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


-   A technician PC with the Windows Assessment and Deployment Kit (Windows ADK) tools installed on it.

-   A generalized Windows image (.WIM file). To learn more, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

-   A bootable Windows PE drive. To learn more, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

-   A destination PC or device on which to install the VHD. This device requires 30 gigabytes (GB) or more of free disk space. You can install the VHD to a device already running other operating system installations, or as the only operating system on a device.

## <span id="Step_1__Create_a_VHD_from_diskpart"></span><span id="step_1__create_a_vhd_from_diskpart"></span><span id="STEP_1__CREATE_A_VHD_FROM_DISKPART"></span>Step 1: Create a VHD from diskpart


1.  On the technician PC, open Diskpart.

    ``` syntax
    diskpart
    ```

2.  Create and prepare a new VHD. In this example, we create a 25 GB fixed-type VHD.

    ``` syntax
    create vdisk file=C:\windows.vhd maximum=25600 type=fixed
    ```

3.  Attach the VHD. This adds the VHD as a disk to the storage controller on the host.

    ``` syntax
    attach vdisk
    ```

4.  Create a partition for the Windows files, format it, and assign it a drive letter. This drive letter will appear in File Explorer.

    ``` syntax
    create partition primary
    format quick label=vhd
    assign letter=v
    ```

5.  Exit Diskpart

    ``` syntax
    exit
    ```

## <span id="Step_2__Apply_a_Windows_image_to_the_VHD"></span><span id="step_2__apply_a_windows_image_to_the_vhd"></span><span id="STEP_2__APPLY_A_WINDOWS_IMAGE_TO_THE_VHD"></span>Step 2: Apply a Windows image to the VHD


-   Apply a generalized Windows image to the primary partition of the VHD.

    ``` syntax
    Dism /Apply-Image /ImageFile:install.wim /index:1 /ApplyDir:V:\
    ```

## <span id="Step_3__Detach_the_VHD__copy_it_to_a_new_device__and_attach_it__optional_"></span><span id="step_3__detach_the_vhd__copy_it_to_a_new_device__and_attach_it__optional_"></span><span id="STEP_3__DETACH_THE_VHD__COPY_IT_TO_A_NEW_DEVICE__AND_ATTACH_IT__OPTIONAL_"></span>Step 3: Detach the VHD, copy it to a new device, and attach it (optional)


You can deploy the VHD to a device that already has a copy of Windows installed on it, or you can clean and prepare the drive to just use the VHD.

**Detach the VHD and save it to a network share or storage drive**

1.  Detach the virtual disk.

    ``` syntax
    diskpart
    select vdisk file=C:\windows.vhd
    detach vdisk
    exit
    ```

2.  Copy the VHD to a network share or removable storage drive.

    ``` syntax
    net use n: \\server\share\
    md N:\VHDs
    copy C:\windows.vhd n:\VHDs\
    ```

**Clean and prepare a new device for native boot**

1.  Boot the destination device to Windows Preinstallation Environment (WinPE).
2.  Clean and prepare the drive. Create a system partition (S), and a main partition (M) where the VHD will be stored.

    BIOS:

    ``` syntax
    diskpart
    select disk 0
    clean
    rem == 1. System partition ======================
    create partition primary size=100
    format quick fs=ntfs label="System"
    assign letter="S"
    active
    rem == 2. Main partition ========================
    create partition primary
    format quick fs=ntfs label="Main"
    assign letter="M"
    exit
    ```

    UEFI:

    ``` syntax
    diskpart
    select disk 0
    clean
    convert gpt
    rem == 1. System partition =========================
    create partition efi size=100
    format quick fs=fat32 label="System"
    assign letter="S"
    rem == 2. Microsoft Reserved (MSR) partition =======
    create partition msr size=128
    rem == 3. Main partition ===========================
    create partition primary 
    format quick fs=ntfs label="Main"
    assign letter="M"
    exit
    ```

3.  Connect to a network drive or storage location, and note the drive letter.

    ``` syntax
    net use N: \\server\share
    ```

4.  Copy the VHD to the main partition.

    ``` syntax
    copy N:\VHDs\Windows.vhd M:
    ```

**Attach the VHD**

1.  Attach the VHD.

    ``` syntax
    diskpart
    select vdisk file=M:\windows.vhd
    attach vdisk
    ```

2.  Identify the volume letter. (Optional: Change it to another letter that makes more sense, for example V, and leave the diskpart command line open for the next step).

    ``` syntax
    list volume
    select volume 3
    assign letter=v
    ```

## <span id="Step_4__Add_a_boot_entry"></span><span id="step_4__add_a_boot_entry"></span><span id="STEP_4__ADD_A_BOOT_ENTRY"></span>Step 4: Add a boot entry


1.  Open Diskpart (if necessary) and identify the drive letters of the VHD and the system partition, for example, V and S.

    ``` syntax
    diskpart
    list volume
    exit
    ```

2.  Add a boot entry to the device. You can add multiple VHD files using this method.

    BIOS:

    ``` syntax
    V:
    cd v:\windows\system32
    bcdboot v:\windows /s S: /f BIOS
    ```

    UEFI:

    ``` syntax
    V:\
    cd v:\windows\system32
    bcdboot v:\windows /s S: /f UEFI
    ```

3.  Remove the Windows PE USB key.

4.  Restart the device.

    If there's only one boot entry, the device immediately boots to Windows. If there's more than one boot entry, you'll see a boot menu where you can choose between the available versions of Windows on the device.

## <span id="related_topics"></span>Related topics


[Understanding Virtual Hard Disks with Native Boot](understanding-virtual-hard-disks-with-native-boot.md)

[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

 

 






