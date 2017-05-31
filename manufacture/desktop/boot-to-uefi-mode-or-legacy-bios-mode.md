---
author: Justinha
Description: Boot to UEFI Mode or Legacy BIOS mode
ms.assetid: 04ad6b97-b41d-40fd-88a7-d63d4722c336
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Boot to UEFI Mode or Legacy BIOS mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Boot to UEFI Mode or Legacy BIOS mode


Boot into UEFI mode or legacy BIOS-compatibility mode when installing Windows from your USB, DVD, or network location.

If you install Windows using the wrong mode, you won’t be able to use the features of that firmware mode without reformatting the drive.

**Select the firmware mode during bootup**

1.  Boot the PC. As the firmware starts to run, press the key that opens the boot device menu. For example, press the Esc, F2, F9, F12, or other key to enter the firmware or boot menus.

2.  On the boot device menu, select the command that identifies both the firmware mode and the device. For example, select **UEFI USB Drive** or **Network - BIOS**.

    **Note**  
    You might see separate commands for the same device. For example, you might see **UEFI USB Drive** and **BIOS USB Drive**. Each command uses the same device and media, but boots the PC in a different firmware mode.

     

**If a boot device option does not appear for your device:**

-   Check the options in the firmware menus to enable or disable BIOS-compatibility mode.

-   To use BIOS-compatibility mode, check for options in the firmware menus to disable UEFI SecureBoot features.

-   For older PCs (Windows® 7-era or earlier), look for options to **Boot from file**, and browse to the \\EFI\\BOOT\\BOOTX64.EFI file on that device.

**Use any of these methods to help make sure that Windows is installed using the correct firmware mode**

1.  If you install Windows by using Windows Setup or the Windows installation DVD, use preformatted hard drive on your destination PCs. Use the GPT file format for UEFI mode, or the MBR file format for BIOS mode. When Windows Setup runs, if the PC is booted to the wrong mode, Windows will fail to install. For more info, see [Windows Setup: Installing using the MBR or GPT partition style](windows-setup-installing-using-the-mbr-or-gpt-partition-style.md).

2.  You can remove the UEFI or BIOS boot files from either Windows PE or Windows Setup. For example, if you only include boot files for UEFI mode on the Windows installation DVD, and during manufacturing you accidentally attempt to boot the PC to BIOS mode, the PC will immediately fail to boot, and you can begin troubleshooting right away.

    -   **UEFI**: To prevent Windows Setup or Windows PE from booting in BIOS mode, remove the **bootmgr** file on the root of the media.

    -   **BIOS**: To prevent Windows Setup or Windows PE from booting in UEFI mode, remove the **efi** folder on the root of the media.

3.  From Windows PE, you can check the [GetFirmwareEnvironmentVariable function](http://go.microsoft.com/fwlink/p/?LinkId=698644). For more info, see [WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md).

## <span id="related_topics"></span>Related topics


[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

 

 






