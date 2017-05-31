---
author: Justinha
Description: 'WinPE: Create a Boot CD, DVD, ISO, or VHD'
ms.assetid: d60de9b6-6775-41e7-bc52-dfafede554df
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Create a Boot CD, DVD, ISO, or VHD'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Create a Boot CD, DVD, ISO, or VHD


Create a Windows PE (WinPE) bootable DVD, CD, ISO file, or virtual hard drive (VHD).

The default installation runs from memory (also known as a RAM disk), which allows you to remove the USB drive while Windows PE is running.

**Install the Windows ADK**

-   Install the following features from the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/p/?LinkID=526803):

    -   **Deployment Tools**: includes the **Deployment and Imaging Tools Environment**.

    -   **Windows Preinstallation Environment** : includes the files used to install Windows PE.

**Install Windows PE to a DVD, a CD, or an ISO file**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  Create a working copy of the Windows PE files. Specify either x86 or amd64:

    ``` syntax
    copype amd64 C:\WinPE_amd64
    ```

3.  Create an ISO file containing the Windows PE files:

    ``` syntax
    MakeWinPEMedia /ISO C:\WinPE_amd64 C:\WinPE_amd64\WinPE_amd64.iso
    ```

4.  To burn a DVD or CD: In Windows Explorer, right-click the ISO file, and select **Burn disc image** &gt; **Burn**, and follow the prompts.

## <span id="Using_Hyper-V"></span><span id="using_hyper-v"></span><span id="USING_HYPER-V"></span>Using Hyper-V


When running Windows PE in Hyper-V, consider using an ISO file format instead of a VHD, to enable quick setup of the virtual PC. For more information, see the previous section.

**To install Windows PE to a VHD**

1.  Create a virtual hard drive (.vhd or .vhdx):

    ``` syntax
    diskpart
    create vdisk file="C:\WinPE.vhdx" maximum=1000
    attach vdisk
    create partition primary
    assign letter=V
    format fs=ntfs quick
    exit
    ```

2.  Prepare the drive by using MakeWinPEMedia:

    ``` syntax
    MakeWinPEMedia /UFD C:\WinPE_amd64 V:
    ```

3.  Detach the drive:

    ``` syntax
    diskpart
    select vdisk file="C:\WinPE.vhdx"
    detach vdisk
    exit
    ```

**Troubleshooting**

1.  If Windows PE doesn't appear, try the following workarounds, rebooting the PC each time:

    -   To boot a PC that supports UEFI mode: In the firmware boot menus, try manually selecting the boot files: \\EFI\\BOOT\\BOOTX64.EFI.

    -   If your PC requires storage or video drivers to boot, try adding those same drivers to the Windows PE image. For more information, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

2.  If the PC doesn't connect to network locations, see [WinPE Network Drivers: Initializing and adding drivers](winpe-network-drivers-initializing-and-adding-drivers.md).

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)

 

 






