---
author: Justinha
Description: Get the tools needed to customize Windows
ms.assetid: a52b4efe-ead0-4319-ae19-799d4e9d9e7b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Get the tools needed to customize Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get the tools needed to customize Windows


Here's what you'll need to start testing and deploying devices:

## <span id="pc"></span><span id="PC"></span>PCs


Here's how we'll refer to them:

-   **Technician PC**: Your work PC. This PC should have at least 15GB of free space for installing the [Windows Assessment and Deployment Kit (Windows ADK)](http://go.microsoft.com/fwlink/?LinkId=526803) and for modifying Windows images. 

    We recommend using Windows 10 for this PC. The minimum requirement is Windows 7 SP1, though this requires additional tools or workarounds for tasks such as running PowerShell scripts and mounting .ISO images.

    For most tasks, you can use either an x86 or x64 PC. If you're creating x86 images, you'll need an x86-based PC (or virtual machine) for a one-time task of [generating a catalog file](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md).

-   **Reference device**: A test PC or tablet that represents all of the devices in a single model line; for example, the *Fabrikam Notebook PC Series 1*. This device must meet the Windows 10 minimum hardware requirements.

    You'll reformat this device as part of the walkthrough.

## <span id="hw"></span><span id="HW"></span>Storage

-   **WinPE USB key**: Must be at least 512MB and at most 32GB. This drive will be formatted, so save your data off of it first. It should not be a Windows-to-Go key or a key marked as a non-removable drive.

-   **Storage USB key** (USB-B): A second USB key or an external USB hard drive for storing files. Minimum free space: 8GB, using NTFS, ExFAT, or any other file system that allows files over 4GB.  If your hardware allows it, use USB 3.0 keys/drives and USB 3.0 ports to speed up file copy procedures. Note, some USB 3.0 keys don't work with some USB 2.0 ports. We won't be reformatting this drive, so as long as you have enough free space, you can reuse an existing storage drive.

To use a single storage drive, see [WinPE: Store or split images to deploy Windows using a single USB drive](winpe--use-a-single-usb-key-for-winpe-and-a-wim-file---wim.md) 

## <span id="sw"></span><span id="SW"></span>Software

Copy the following source files to the technician PC, rather than using external sources like network shares or removable drives. This reduces the risk of interrupting the build process from a temporary network issue or from disconnecting the USB device.

To complete this guide, get the recommended downloads in this section from <https://www.microsoftoem.com>. 

The version numbers of the Windows ADK, the Windows image you're deploying, and the languages and features you're adding must match.

This lab assumes the 64-bit architecture, so if you’re using the 32-bit version, change all mentions of x64 to x86.

### Windows 10, version 1703 image (install.wim)

|             |                                                      |
| ----------- | ---------------------------------------------------- |
| X21-34314   | Windows Home 10, version 1703 32/64 English OPK      |
| X21-34317   | Windows Home SL 10, version 1703 32/64 English OPK   |
| X21-34321   | Windows Pro 10, version 1703 32/64 English OPK       |

-   Mount the ISO file to a drive, and note the drive letter, for example, D.

-   Copy the D:\\sources\\install.wim file, and save it to the local drive, in the folder: **C:\\Images\\Win10\_x64\\**.

### Windows Assessment and Deployment Kit (ADK) for Windows 10, version 1703

[Windows ADK for Windows 10, version 1703](https://developer.microsoft.com/windows/hardware/windows-assessment-deployment-kit#winADK) or X21-34325: Win 10 1703 32/64 OPK ADK.

### Customizations: Windows updates, languages, features, apps, and Microsoft Office

|             |                                                     |
| ----------- | --------------------------------------------------- |
| X21-34323   | Win 10 1703 32/64 MultiLang OPK LangPackAll/LIP     |
| X21-34324   | Win 10 1703 32/64 MultiLang OPK Feat on Demand      |
| X21-34329   | Win 10 1703 32/64 MultiLang OPK App Update          |
| X20-98485   | Office Mobile MultiLang v1.3 OPK                    |
| X21-05453   | Office 2016 v16.2 Deployment Tool for OEM OPK       |
| X21-05414   | Office 2016 v16.2 English OPK                       |                           |
| X21-05508   | Office v16.2 German OPK |

We also discuss how to add hardware drivers and other Windows apps in this guide, get those from the hardware/software manufacturers.

### Product keys

Get the default product keys for each Windows version from the Kit Guide Windows 10 Default Manufacturing Key OEM PDF, which is on the ISO with the Windows image.

Get the distribution product keys that match the Windows 10 image.

### Sample files: Create a deployment USB drive

1.  Format a USB Drive with the NTFS file format, name it USB-B.

    ![Extract USB](images/extract-usb.png) 

2.  Download most of the lab samples from [USB-B.zip](http://download.microsoft.com/download/5/8/4/5844EE21-4EF5-45B7-8D36-31619017B76A/USB-B.zip), and extract the files to the drive.

    Add to this the [newer version of the deployment sample scripts](http://go.microsoft.com/fwlink/p/?LinkId=800657). 

## <span id="prepare"></span><span id="PREPARE"></span>Prepare your technician PC

Here’s how to set up your PC.

**Copy the Windows image to the local drive**

1.  Mount the Windows ISO file that you downloaded (Right-click the file &gt; **Mount**), and note the drive letter, for example, D.

2.  In File Explorer, create a new folder (example: **C:\\Images\\Win10\_x64**), and copy the Windows image (D:\\sources\\install.wim) file into the folder. This will help speed file creation procedures later on.

**Install the Windows ADK for Windows 10**

1.  If you have a previous version of the Windows Assessment and Deployment Kit (ADK), uninstall it.

2.  Download the version of the [Windows ADK](https://developer.microsoft.com/windows/hardware/windows-assessment-deployment-kit#winADK) that matches the version of Windows that you’re installing. **Run** the installer.

3.  Click **Next** &gt; **Next** &gt; **Accept** to accept the defaults and to join the Customer Experience Improvement Program.

4.  Select the following tools:

    -   **Deployment Tools**

    -   **Windows Preinstallation Environment (Windows PE)**

    -   **User State Migration Tool (USMT)**

    For these labs, you won't need the **Windows Performance Toolkit** or the **Windows Assessment Toolkit**. You can clear those check boxes.

5.  Click **Install**, and then click **Yes** to confirm. This may take a few minutes.

6.  When the installation is finished, click **Close**.

**Next steps**
* [Get the sample scripts](windows-deployment-sample-scripts-sxs.md)



