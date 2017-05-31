---
author: themar
Description: 'WinPE: Create USB Bootable drive'
ms.assetid: 9e7216ed-5a12-4f26-a0cb-da303589c806
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Create USB Bootable drive'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Create USB Bootable drive


Create a Windows PE (WinPE) bootable USB flash drive or an external USB hard drive.

The default installation runs from memory (RAM disk), so you can remove the drive while Windows PE is running. Do not remove the USB drive if you are applying an image from it.

## Install the Windows ADK

-   Install the following features from the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/?LinkId=526803):

    -   **Deployment Tools**: includes the **Deployment and Imaging Tools Environment**.

    -   **Windows Preinstallation Environment** : includes the files used to install Windows PE.

## Prepare a USB drive

### Windows 10, Version 1703
In Windows 10, Version 1703 you can create multiple partitions on a USB drive, allowing you to have a single USB key with a combination of FAT32 and and NTFS partitions. To work with USB drives that have multiple partitions, your technician PC has to be Windows 10, Version 1703, with the most recent version of the ADK installed.

`MakeWinPEMedia` formats the drive as FAT32 which has a filesize limit of 4GB, and custom images can easily exceed that limitation. Creating a USB drive with both FAT32 and NTFS partitions allows you to have a single physical drive that can boot to Windows PE as well store large custom images.

To prepare your USB drive, you'll create separate FAT32 and NTFS partitions. The following creates two partitions on a USB drive; one 2GB FAT32 partition, and one NTFS partition that uses the rest of the available space on the drive. You want to make sure that your USB drive has enough free space for the 2GB WinPE partiton and to hold large images on the NTFS partition:

   ``` syntax
    diskpart
      list disk
      select <disk number>
      clean
      rem === Create the Windows PE partition. ===
      create partition primary size=2000
      format quick fs=fat32 label="Windows PE"
      assign letter=P
      active
      rem === Create a data partition. ===
      create partition primary
      format fs=ntfs quick label="Other files"
      assign letter=O
      list vol
      exit

   ```


### Windows 10, Version 1607 and earlier
You won't typically be able to store or capture Windows images on a Windows PE USB flash drive because most USB flash drives support only a single drive partition. The `MakeWinPEMedia` command formats the drive as FAT32, which supports booting both BIOS-based and UEFI-based PCs. This file format only supports individual file sizes up to 4 GB, which is normally not large enough to hold custom Windows images.

In the next steps you'll use `MakeWinPEMedia` to format your USB drive, so you don't have to do anything else to prepare the drive for WinPE.

## Create a WinPE drive

1.  Start the **Deployment and Imaging Tools Environment** as an **administrator**.

2.  Create a working copy of the Windows PE files. Specify either x86, amd64, or arm:

    ``` syntax
    copype amd64 C:\WinPE_amd64
    ```

3.  Install Windows PE to the USB flash drive, specifying the WinPE drive letter:

    ``` syntax
    MakeWinPEMedia /UFD C:\WinPE_amd64 P:
    ```

    **Warning**  
    This command reformats the partition.

     

## Boot to Windows PE

1.  Connect the USB device to the PC you want to work on.

2.  Turn on the PC, and press the key that opens the firmware boot menus.

3.  Select the USB drive. Windows PE starts automatically.

    After the command window appears, the `wpeinit` command runs, which sets up the system. This might take a few minutes.

## Troubleshooting

- If you're using a USB key with more than one partition, make sure that your WinPE partition is Partition 1 on the USB drive.

-  If the `copype` command isn't recognized, make sure you're running the command from the Deployment and Imaging Tools Environment, which is part of the Windows ADK.

-  If Windows PE doesn't appear, try the following workarounds, rebooting the PC each time:

    -   To boot a PC that supports UEFI mode, in the firmware boot menus, try manually selecting the boot files: \\EFI\\BOOT\\BOOTX64.EFI.

    -   Try a different USB port. Avoid hubs or cables.

    -   Avoid USB 3.0 ports if the firmware doesn't contain native support for USB 3.0.

    -   Clean the USB flash drive, and then reinstall Windows PE. This can help remove extra boot partitions or other boot software.

        ``` syntax
        diskpart
          list disk
          select disk <disk number>
          clean
          create partition primary
          format quick fs=fat32 label="Windows PE"
          assign letter="P"
          exit

        MakeWinPEMedia /UFD C:\winpe_amd64 P:
        ```

    -   Try booting Windows PE from a DVD instead. Create an ISO file that you can burn onto a DVD:

        ``` syntax
        MakeWinPEMedia /ISO C:\winpe_amd64 c:\winpe_amd64\winpe.iso
        ```

        In File Explorer, navigate to C:\\winpe\_amd64, right-click **winpe.iso**, and select **Burn to disc**. Follow the prompts to create a DVD.

    -   If your PC requires storage or video drivers to boot, try adding those same drivers to the Windows PE image. For more info, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

    -   Update the firmware of the PC to the latest version.

3.  If the PC doesn't connect to network locations, see [WinPE Network Drivers: Initializing and adding drivers](winpe-network-drivers-initializing-and-adding-drivers.md).


## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Create a Boot CD, DVD, ISO, or VHD](winpe-create-a-boot-cd-dvd-iso-or-vhd.md)

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)