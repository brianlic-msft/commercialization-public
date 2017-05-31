---
author: Justinha
Description: Install Windows 10 using a previous version of Windows PE
ms.assetid: 8abda3c5-0689-4a61-ae3e-7fa51c7e2028
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Install Windows 10 using a previous version of Windows PE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Install Windows 10 using a previous version of Windows PE

To use some DISM features in WinPE, such as [siloed provisioning packages](siloed-provisioning-packages.md), you may run the latest version of DISM from a separate location.

Each time you boot WinPE and want to use these features, you'll need to install and configure the drivers needed for DISM, including the wimmount.sys and wofadk.sys drivers.

The CopyDandI.cmd script copies the version of DISM from your local installation of the ADK to a folder which you can use in WinPE. 

## <span id="Run_DISM_from_a_separate_location"></span>Option 1: Run DISM from a separate location

You'll need the Windows 10, version 1607 version of the Deployment and Imaging Tools from the ADK. 

**Important**   Don't overwrite the existing DISM files on the WinPE image.

1.  Start the Deployment and Imaging Tools Environment as an administrator.

2.  From the technician PC, copy the Deployment and Imaging Tools from the Windows ADK to the storage USB key.

    ``` syntax
    CopyDandI.cmd amd64 E:\ADKTools\amd64
	```

## <span id="Add_PE_to_the_RAMdisk"></span>Option 2: Add WinPE to the WinPE RAMDisk. 

Note: this will add roughly 4MB to the size of your DISM image, which may affect performance.

1.  On your technician PC, install the Windows ADK for Windows 10.

2.  Mount WinPE. For WinPE 3.x, mount the file: \\sources\\winpe.wim. For WinPE 4.x and 5.x, mount the file: \\sources\\boot.wim.

    ``` syntax
    md "C:\WinPE_amd64\mount"

    Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE_amd64\mount"
    ```

3.  Copy the DISM folder from the Windows ADK into a new folder in the mounted WinPE image.

    ``` syntax
    md C:\WinPE_amd64\mount\DISM

    robocopy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM" C:\WinPE_amd64\mount\DISM
    ```

    **Important**   Don't overwrite the existing DISM files from the **system32** folder in the WinPE image. Instead, create a new folder on the host computer to copy the Windows ADK files into.

4.  Unmount WinPE.

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /commit
    ```

5.  Create WinPE bootable media, or replace the WinPE image file on your existing removable media.

    ``` syntax
    MakeWinPEMedia /UFD C:\WinPE_amd64 F:
    ```

## <span id="Use DISM"></span>Use the new version of DISM

1.  Boot the reference PC to WinPE.

2.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).

3.  Install and configure DISM's required drivers by using either **wimmountadksetupamd64.exe /Install** or **wimmountadksetupx86.exe /Install**.

    ``` syntax
    W:\ADKTools\amd64\wimmountadksetupAmd64.exe /Install /q
    ```

    For the default (RAMDisk) version of WinPE, you'll need to run this command each time you boot WinPE. To learn how to run this command automatically when WinPE boots, see [Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md).

4.  Verify the new version of DISM:

    ``` syntax
    W:\ADKTools\amd64\DISM.exe /?
    ```

    The output shows the build number, for example:

    ``` syntax
    Deployment Image Servicing and Management tool
    Version: 10.0.14939.0
    ```

4.  Use the new version of DISM. Example:

    ``` syntax
    W:\ADKTools\amd64\DISM.exe /Apply-Image /ImageFile:install.wim /Index:1 /ApplyDir:W: /Compact
    W:\ADKTools\amd64\DISM.exe /Apply-SiloedPackage /ImagePath:W:\ /PackagePath:"e:\SPPs\fabrikam-id.spp" /PackagePath:"D:\SPPs\office16_base.spp" /PackagePath:"D:\SPPs\office16_fr-fr.spp" /PackagePath:"D:\SPPs\office16_de-de.spp"
    ```

## <span id="related_topics"></span>Related topics

[DISM Supported Platforms](dism-supported-platforms.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md)
