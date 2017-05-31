---
author: KPacquer
Description: Install Windows PE
ms.assetid: e6e571df-8b4f-43f8-9a8c-cb5f25969a5d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Install Windows PE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 1: Install Windows PE


Windows Preinstallation Environment (WinPE) is a small, command-line based operating system. You can use it to capture, update, and optimize Windows images, which you'll do in later sections. In this section, you'll prepare a basic WinPE image on a bootable USB flash drive and try it out.

The Windows PE USB must be at least 512MB and at most 32GB. It should not be a Windows-to-Go key or a key marked as a non-removable drive.

## <span id="Prepare_the_WinPE_files"></span>Prepare the WinPE files

1.  On your technician PC, start the **Deployment and Imaging Tools Environment**  as an administrator:
    -  Click **Start**, type **Deployment and Imaging Tools Environment**. Right-click **Deployment and Imaging Tools Environment** and select **Run as administrator**.

2.  Copy the base WinPE files into a new folder:

    ``` syntax
    copype amd64 C:\winpe_amd64
    ```

    Repeat if you’re also deploying x86 devices:

    ``` syntax
    copype x86 C:\winpe_x86
    ```

   **Troubleshooting**: If this doesn't work, make sure you're in the Deployment and Imaging Tools Environment, and not the standard command prompt. 
	
## <span id="Add_to_WinPE"></span>Add to WinPE (Usually not needed)

Note, when you add more packages to WinPE, it slows WinPE performance and boot time. Only add additional packages when necessary.  

**Common customizations**:

* **Add a video or network driver**. (WinPE includes generic video and network drivers, but in some cases, additional drivers are needed to show the screen or connect to the network.). To learn more, see [WinPE: Add drivers](winpe-add-drivers.md).

* **Add PowerShell scripting support**. To learn more, see [WinPE: Adding Windows PowerShell support to Windows PE](winpe-adding-powershell-support-to-windows-pe.md). PowerShell scripts are not included in this lab.

* **Set the power scheme to high-performance**. Speeds deployment. Note, our sample deployment scripts already set this scheme automatically. See  [WinPE: Mount and Customize: High Performance](winpe-mount-and-customize.md#highperformance).

* **Optimize WinPE**: Recommended for devices with limited RAM and storage (for example, 1GB RAM/16GB storage). After you add drivers or other customizations to Windows PE, see [WinPE: Optimize and shrink the image](winpe-optimize.md) to help reduce the boot time.

## <span id="Create_a_bootable_drive"></span>Create a bootable drive

1.  Plug in a USB key that you don't mind formatting. Note the drive letter it uses, for example, D.

2.  Install WinPE to an empty USB drive:

    ``` syntax
    MakeWinPEMedia /UFD C:\winpe_amd64 D:
    ```

    When prompted, press **Y** to format the drive and install WinPE.

    Repeat if necessary, plugging in a separate USB key for use when deploying x86 devices:

    ``` syntax
    MakeWinPEMedia /UFD C:\winpe_x86 E:
    ```

    When prompted, press **Y** to format the drive and install WinPE.

3.  In File Explorer, right-click the drive and select **Eject**.

## <span id="Try_it_out"></span>Try it out

1.  Connect the WinPE USB drive to your reference device.

2.  Turn off the device, and then boot to the USB drive. You usually do this by powering on the device and quickly pressing a key (for example, the **Esc** key or the **Volume up** key).

    **Note**   On some devices, you might need to go into the boot menus to choose the USB drive. If you're given a choice between booting in UEFI mode or BIOS mode, choose UEFI mode. To learn more, see [Boot to UEFI Mode or Legacy BIOS mode](http://go.microsoft.com/fwlink/?LinkId=526943).
    If the device does not boot from the USB drive, see the troubleshooting tips in [WinPE: Create USB Bootable drive](http://go.microsoft.com/fwlink/?LinkId=526944).

    WinPE starts at a command line, and runs **wpeinit** to set up the system. This can take a few minutes.

Leave this PC booted to Windows PE for now. 

**Next steps**
* [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md)
 