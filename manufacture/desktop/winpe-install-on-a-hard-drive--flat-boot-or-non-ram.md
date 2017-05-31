---
author: Justinha
Description: 'WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)'
ms.assetid: f4495adf-63db-4fdc-ae56-70166eed930c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)


Windows Preinstallation Environment (Windows PE) is a minimal operating system where you can prepare a PC for installation, deployment, and servicing of Windows. Here's how to download and install it to an internal or external hard drive.

These instructions show how to set up a basic Windows PE installation that runs from the drive. This can sometimes give you better performance than booting from memory, and can help you run Windows PE on PCs or virtual environments with low memory. This procedure is also known as a *non-RAMDISK boot*, or a *flat boot*.

**Note**  
When Windows PE is running from the drive, you must turn off the PC before disconnecting the drive to avoid losing your work.

 
## <span id="Install_the_Windows_ADK"></span> Install the Windows ADK

-   Get the [Windows Assessment and Deployment Kit (Windows ADK) Technical Reference](http://go.microsoft.com/fwlink/p/?LinkId=526803), including the Windows PE feature.

**Create a Set of Either 32-bit or 64-bit Windows PE Files**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  In the **Deployment and Imaging Tools Environment**, copy the Windows PE files for the PCs you want to boot.

    The 64-bit version of Windows PE can boot 64-bit UEFI and 64-bit BIOS PCs:

    ``` syntax
    copype amd64 C:\WinPE_amd64
    ```

    The 32-bit version of Windows PE can boot 32-bit UEFI, 32-bit BIOS, and 64-bit BIOS PCs:

    ``` syntax
    copype x86 C:\WinPE_x86
    ```

## <span id="Create_a_Working_Directory"></span> Create a Working Directory for Windows PE Files

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  From the **Deployment and Imaging Tools Environment**, create a working directory for the Windows PE files.

    ``` syntax
    copype amd64 C:\WinPE_amd64
    ```

## <span id="Install_Windows_PE"></span> Install Windows PE to the Media

1.  Use DiskPart to prepare the partitions.

    **Note**  
    The following commands prepare a USB hard drive that can boot on either a BIOS-based or UEFI-based PC.

    On UEFI-based PCs, Windows PE requires a boot partition formatted using the FAT32 file format, which only supports file sizes up to 4 GB. We recommend creating a separate partition on the drive, formatted using NTFS, so that you can store Windows images and other large files. To learn more, see [WinPE: Identify drive letters with a script](winpe-identify-drive-letters.md). 

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
    rem === Create a partition for images ===
    create partition primary
    format fs=ntfs quick label="Images"
    assign letter=I
    list vol
    exit
	```

    where *&lt;disk number&gt;* is the listed number of the external USB hard drive.

2.  Apply the Windows PE image to the hard drive.

    ``` syntax
    dism /Apply-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /Index:1 /ApplyDir:P:\
    ```

3.  Set up the boot files.

    ``` syntax
    BCDboot P:\Windows /s P: /f ALL
    ```

    **Note**  
    Ignore any warning messages that say "Warning: Resume application not found."

     

## <span id="Boot_to_Windows_PE"></span> Boot to Windows PE

1.  Connect the device (internal or external USB hard drive) into the PC you want to work on.

2.  Turn on the PC, and use the boot menus to select the Windows PE drive. Typically this requires pressing a hardware button or a key, such as the Esc key.

    **Note**  
    For UEFI-based PCs, you might need to find an option to manually select the UEFI boot files, for example, USBDrive01\\EFI\\BOOT\\BOOTX64.EFI.

    Windows PE starts automatically. After the command window appears, the wpeinit command runs automatically. This might take a few minutes.
	
## <span id="Troubleshooting"></span>Troubleshooting

1.  If the PC does not boot, try the following steps in sequence, and try to boot the PC after each step:

    1.  For external USB drives, try inserting the drive into a different USB port. Avoid using USB hubs or cables, because they might not be detected during the boot sequence. Avoid USB 3.0 ports if the firmware does not contain native support for USB 3.0.

    2.  If your PC requires drivers to boot, such as storage drivers or video drivers, or if your driver requires changes to the registry, add the driver to the Windows PE image. For more info, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

    3.  Update the firmware of the PC to the latest version.

2.  For tips on connecting to a network, see [WinPE Network Drivers: Initializing and adding drivers](winpe-network-drivers-initializing-and-adding-drivers.md).

**Running Windows Setup from Windows PE**

-   See [Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md) for tips on installing Windows on UEFI PCs that support both UEFI and legacy BIOS firmware modes, and for using the 32-bit (x86) version of Windows PE to install a 64-bit version of Windows.

## <span id="Related_topics"></span>Related topics

[WinPE for Windows 10](winpe-intro.md)

[WinPE: Identify drive letters with a script](winpe-identify-drive-letters.md)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)

 

 






