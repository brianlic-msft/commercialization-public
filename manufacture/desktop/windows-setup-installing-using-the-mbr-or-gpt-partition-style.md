---
author: Justinha
Description: 'Windows Setup: Installing using the MBR or GPT partition style'
ms.assetid: d8d8901f-9e0c-4f73-b331-8c0d36a1ba47
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Windows Setup: Installing using the MBR or GPT partition style'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup: Installing using the MBR or GPT partition style


When installing Windows on UEFI-based PCs using Windows Setup, your hard drive partition style must be set up to support either UEFI mode or legacy BIOS-compatibility mode.

For example, if you receive the error message: “Windows cannot be installed to this disk. The selected disk is not of the GPT partition style”, it’s because your PC is booted in UEFI mode, but your hard drive is not configured for UEFI mode. You’ve got a few options:

1.  Reboot the PC in legacy BIOS-compatibility mode. This option lets you keep the existing partition style. For more info, see [Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md).

2.  Reformat the drive for UEFI by using the GPT partition style. This option lets you use the PC’s UEFI firmware features.

    You can do this yourself by reformatting the drive using the instructions below, or if you need to preserve the data, use a third-party utility to convert the drive to GPT format.

## <span id="Why_should_I_convert_my_drive_"></span><span id="why_should_i_convert_my_drive_"></span><span id="WHY_SHOULD_I_CONVERT_MY_DRIVE_"></span>Why should I convert my drive?


Many PCs now include the ability to use the UEFI version of BIOS, which can speed up boot and shutdown times and can provide additional security advantages. To boot your PC in UEFI mode, you'll need to use a drive formatted using the GPT drive format.

Many PCs are ready to use UEFI, but include a compatibility support module (CSM) that is set up to use the legacy version of BIOS. This version of BIOS was developed in the 1970s and provides compatibility to a variety of older equipment and network configurations, and requires a drive that uses the MBR drive format.

However, the basic MBR drive format does not support drives over 4TB. It's also difficult to set up more than four partitions. The GPT drive format lets you set up drives that are larger than 4 terabytes (TB), and lets you easily set up as many partitions as you need.

## <span id="Reformatting_the_drive_using_a_different_partition_style"></span><span id="reformatting_the_drive_using_a_different_partition_style"></span><span id="REFORMATTING_THE_DRIVE_USING_A_DIFFERENT_PARTITION_STYLE"></span>Reformatting the drive using a different partition style


**To wipe and convert the drive by using Windows Setup**

1.  Turn off the PC, and put in the Windows installation DVD or USB key.

2.  Boot the PC to the DVD or USB key in UEFI mode. For more info, see [Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md).

3.  When choosing an installation type, select **Custom**.

4.  On the **Where do you want to install Windows?** screen, select each of the partitions on the drive, and select **Delete**. The drive will show a single area of unallocated space.

5.  Select the unallocated space and click **Next**. Windows detects that the PC was booted into UEFI mode, and reformats the drive using the GPT drive format, and begins the installation.

**To manually wipe a drive and convert it to GPT:**

1.  Turn off the PC, and put in the Windows installation DVD or USB key.

2.  Boot the PC to the DVD or USB key in UEFI mode. For more info, see [Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md).

3.  From inside Windows Setup, press **Shift+F10** to open a command prompt window.

4.  Open the diskpart tool:

    ``` syntax
    diskpart
    ```

5.  Identify the drive to reformat:

    ``` syntax
    list disk
    ```

6.  Select the drive, and reformat it:

    ``` syntax
    select disk <disk number>
    clean
    convert gpt
    exit
    ```

7.  Close the command prompt window.

8.  Continue the Windows Setup installation.

    When choosing an installation type, select **Custom**. The drive will appear as a single area of unallocated space.

    Select the unallocated space and click **Next**. Windows begins the installation.

## <span id="Make_sure_Windows_Setup_boots_to_the_correct_firmware_mode"></span><span id="make_sure_windows_setup_boots_to_the_correct_firmware_mode"></span><span id="MAKE_SURE_WINDOWS_SETUP_BOOTS_TO_THE_CORRECT_FIRMWARE_MODE"></span>Make sure Windows Setup boots to the correct firmware mode


To automate this process, you'll need to run Windows Setup through Windows PE, and use a script to detect which mode you’re in before installing Windows. For more info, see [WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md).

## <span id="related_topics"></span>Related topics


[Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md)

 

 






