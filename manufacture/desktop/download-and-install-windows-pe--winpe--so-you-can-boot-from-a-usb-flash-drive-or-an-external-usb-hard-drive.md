---
author: Justinha
Description: 'Download and install Windows PE (WinPE) so you can boot from a USB flash drive or an external USB hard drive'
ms.assetid: 1799a91f-493a-4509-9937-ad6901358240
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Download and install Windows PE (WinPE) so you can boot from a USB flash drive or an external USB hard drive'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Download and install Windows PE (WinPE) so you can boot from a USB flash drive or an external USB hard drive


Boot your PC to a VHD file ("native boot") by using the BCDEdit tool. If you are adding the VHD to a computer that already has a Windows 10 or Windows 8 installation, you will have to add a boot entry to the menu. If you are adding the VHD to a computer that is running an older version of Windows, for example Windows Server 2008, you will have to update the system partition using the BCDboot tool and then modify the boot menu using the BCDedit tool.

Native boot for Windows 10 requires the **.vhdx** format, not the .vhd format.

## <span id="Update_the_Boot_Menu_to_Add_a_VHD"></span><span id="update_the_boot_menu_to_add_a_vhd"></span><span id="UPDATE_THE_BOOT_MENU_TO_ADD_A_VHD"></span>Update the Boot Menu to Add a VHD


**To update a BIOS-based computer to include a Windows 8 boot menu**

1.  Copy the .vhdx file to the destination computer. For example, at a command prompt, type:

    ``` syntax
    copy N:\VHDs\windows.vhdx C:
    ```

2.  Use the DiskPart tool in Windows PE to attach the VHD on the destination computer. You can attach a VHD by using the **Attach vdisk** command. This enables the VHD so that it appears on the host as a disk drive instead of as a .vhdx file. At a command prompt, type:

    ``` syntax
    diskpart
    select vdisk file=c:\windows.vhdx
    attach vdisk
    list volume
    select volume <volume_number_of_attached_VHD>
    assign letter=v
    exit
    ```

3.  Use the BCDboot tool, located in the **\\System32** directory of the VHD image or in Windows PE to copy the boot environment files and Boot Configuration Data (BCD) configuration from the **\\Windows** directory in the VHD to the system partition. On a computer that has BIOS firmware, the system partition is the active partition of the first hard disk. For example, to use BCDboot from the VHD image, at a command prompt, type:

    ``` syntax
    cd v:\windows\system32
    bcdboot v:\windows
    ```

The BCDboot tool automatically imports information from the existing installation when updating the BCD. The computer is now updated to include a Windows 8 boot environment. You can now follow the steps in the section "To add a native-boot VHD to an existing Windows 8 boot menu" later in this topic.

**To update a UEFI-based computer to include a Windows 8 boot menu**

1.  Copy the .vhdx file to the destination computer. For example, at a command prompt, type:

    ``` syntax
    copy N:\VHDs\windows.vhdx C:
    ```

2.  Use the DiskPart tool in Windows PE to attach the VHD on the destination computer. You can attach a VHD by using the **Attach vdisk** command. This enables the VHD so that it appears on the host as a disk drive instead of as a .vhdx file. At a command prompt, type:

    ``` syntax
    diskpart
    select vdisk file=C:\windows.vhdx
    attach vdisk
    list volume
    select volume <volume_number_of_attached_VHD>
    assign letter=v
    exit
    ```

3.  On a UEFI-based computer, the system partition is hidden by default and must be assigned a drive letter before you run the BCDboot tool. Use the DiskPart tool to locate the EFI system partition and assign a drive letter to it. At a command prompt, type:

    ``` syntax
    diskpart
    select disk 0
    list partition
    select partition <x>
    assign letter=s
    exit
    ```

    Where *&lt;x&gt;* is the 100 megabyte (MB) EFI system partition that is formatted with FAT.

4.  Use the BCDboot tool, located in the \\System32 directory of the VHD image or in Windows PE to copy the boot environment files and BCD configuration from the \\Windows directory in the VHD to the system partition. For example, to use BCDboot from the VHD image, at a command prompt, type:

    ``` syntax
    cd v:\windows\system32
    bcdboot v:\windows
    ```

The BCDboot tool automatically imports information from the existing installation when updating the BCD. The computer is now updated with a Windows 10 boot environment. You can now follow the steps to add a native-boot VHD to an existing boot menu.

**To add a native-boot VHD to an existing Windows 8 boot menu**

1.  Back up your BCD store using the BCDedit tool with the **/export** option. For example, at a command prompt, type: `bcdedit /export c:\bcdbackup`

2.  Copy an existing boot entry for a Windows installation. You will then modify the copy for use as the VHD boot entry. At a command prompt, type:

    ``` syntax
    bcdedit /copy {default} /d "vhd boot (locate)"
    ```

    When the BCDedit command is completed successfully, it returns a {GUID} as output in the **Command Prompt** window.

3.  Locate the {GUID} in the command-prompt output for the previous command. Copy the GUID, including the braces, to use in the following steps.

4.  Set the **device** and **osdevice** options for the VHD boot entry. At a command prompt, type:

    ``` syntax
    bcdedit /set {guid} device vhd=[locate]\windows.vhdx
    bcdedit /set {guid} osdevice vhd=[locate]\windows.vhdx
    ```

5.  Set the boot entry for the VHD as the default boot entry. When the computer restarts, the boot menu will display all of the Windows installations on the computer and boot into the VHD after the operating-system selection countdown is completed. At a command prompt, type:

    ``` syntax
    bcdedit /default {guid}
    ```

6.  Some x86-based systems require a boot configuration option for the kernel in order to detect certain hardware information and successfully native-boot from a VHD. At a command prompt, type:

    ``` syntax
    bcdedit /set {guid} detecthal on
    ```

For more information about how to use the BCDedit tool, see [this Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=128459).

## <span id="related_topics"></span>Related topics


[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

[Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu](boot-to-vhd--native-boot--add-a-virtual-hard-disk-to-the-boot-menu.md)

[Understanding Virtual Hard Disks with Native Boot](understanding-virtual-hard-disks-with-native-boot.md)

 

 






