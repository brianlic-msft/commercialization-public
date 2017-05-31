---
author: themar
Description: 'Deploy Windows faster on the factory floor by using the Full Flash Update (FFU) image format.'
ms.assetid: af2b402f-9a5c-4c6a-8852-61039e5bec2a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Deploy Windows using Full Flash Update (FFU)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy Windows using Full Flash Update (FFU)


Deploy Windows faster on the factory floor by using the Full Flash Update (FFU) image format. With FFU images, you can apply a Windows image and partition information directly to a drive or an SD card.

To create and apply FFU images for Windows 10, Version 1607 and earlier, you can use [Windows Imaging and Configuration Designer (ICD)](https://msdn.microsoft.com/library/windows/hardware/dn916112.aspx) which is included in the Windows Assessment and Deployment Kit (ADK) for Windows 10, Version 1607. You can use the Windows 10 version of DISM, which is included in the Windows 10 version of Windows Preinstallation Environment (WinPE)to apply FFU images. FFU workflows are not part of the ADK for Windows 10, Version 1703. 

Once you've created an FFU image, it can't be modified or edited offline.

To use Compact OS with an FFU image, you must prepare the original FFU image as a compressed image.

FFU images are often too large to fit on a standard WinPE FAT32-formatted USB flash drive. To get around this, you can either use a separate storage drive or network location, or you can split the image into smaller .SFU files.

## <span id="Using___FFUs"></span><span id="using___ffus"></span><span id="USING___FFUS"></span>Using FFUs


### To create an FFU image

1.  On your technician PC, open Windows ICD and create your project.
2.  Plug in a USB flash drive and note the drive letter (example: D:).
3.  Click **Create** &gt; **Production Media** &gt; **FFU** &gt; **Enable OS File Compression:** (**Yes** or **No**)&gt; name the file, for example, D:\\install.ffu &gt; **Build**.

### To deploy Windows directly to an SD card or removable drive

1.  From Windows ICD, click **Deploy** &gt; (either **To USB connected device** or **To removable drive**) &gt; **Browse** &gt; browse to the FFU image &gt; **Next** &gt; Select the SD card or device &gt; **Next** &gt; **Flash**.
2.  If you're deploying to SD cards, then after the flashing process is finished, insert the SD card into your target device.

### To deploy Windows from WinPE

1.  Boot your destination device to WinPE.
2.  Connect a storage drive or a network location and note the drive letter, for example, N.

    ``` syntax
    net use N: \\server\share
    ```

3.  Identify the drive to which you'll be applying the image. You can use diskpart, or [add Windows PowerShell support to WinPE](winpe-adding-powershell-support-to-windows-pe.md) and use [Get-Disk](https://technet.microsoft.com/library/hh848657.aspx) for scriptability and more complex setups such as a server with multiple disks. 

    ``` syntax
    diskpart 
    list disk
    exit
    ```

4.  Apply the image to a drive. For a physical drive *X:*, the string should be the following form: "\\\\.\\PhysicalDrive*X*", where *X* is the disk number that diskpart provides, such as \\\\.\\PhysicalDrive0. Hard disk numbers start at zero. For more information about PhysicalDrive*X*, see [CreateFile function](https://msdn.microsoft.com/library/windows/desktop/aa363858.aspx).
    
    For more information about /SkipPlatformCheck, see [/Apply-Image in DISM image management command-line options](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/desktop/dism-image-management-command-line-options-s14#apply-image) 

    ``` syntax
    DISM /Apply-Image /ImageFile:N:\flash.ffu /ApplyDrive:\\.\PhysicalDrive0 /SkipPlatformCheck
    ```

### To use a single drive for both WinPE and an FFU image

1.  Split the FFU image into smaller files:

    ``` syntax
    DISM.exe /Split-Image /ImageFile:flash.ffu /SFUFile:flash.sfu /FileSize:3500
    ```

2.  Copy the files to the WinPE USB key.
3.  Boot your destination device to WinPE.
4.  Identify the letter of the Windows PE drive, for example, E.

    ``` syntax
    diskpart
    list volume
    ```

5.  While in the diskpart menu, identify the drive to which you'll be applying the image, for example, \\\\.\\PhysicalDrive0.

    ``` syntax 
    list disk
    exit
    ```

6.  Apply the image to a drive.

    ``` syntax
    DISM.exe /Apply-Image /ImageFile:E:\flash.sfu /SFUFile:flash*.sfu /ApplyDrive:\\.\PhysicalDrive0 /SkipPlatformCheck
    ```

### To use a previous version of WinPE

1.  Plug in a WinPE USB key and note the drive letter, for example, E.
2.  Add the Windows 10 version of DISM to the WinPE drive. To learn more, see [Install Windows 10 using a previous version of Windows PE](copy-dism-to-another-computer.md).

    ``` syntax
    copy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM" E:\DISM_Win10 /s
    ```

3.  Boot the destination device using the Windows PE USB key.
4.  Identify the letter of the drive where the FFU is stored, for example, E.

    ``` syntax
    diskpart
    list volume
    ```

5.  While in the diskpart menu, identify the drive to which you'll be applying the image, for example, \\\\.\\PhysicalDrive0.

    ``` syntax
    list disk
    exit
    ```

6.  Install the Windows 10 version of DISM.

    ``` syntax
    E:\DISM_Win10\WimMountAdkSetupAmd64.exe /Install /q
    ```

7.  Apply the image to a drive.

    ``` syntax
    E:\DISM_Win10\DISM.exe /Apply-Image /ImageFile:E:\flash.sfu /SFUFile:E:\flash*.sfu /ApplyDrive:\\.\PhysicalDrive0 /SkipPlatformCheck
    ```

## <span id="related_topics"></span>Related topics

[Download and install the Windows ADK](https://msdn.microsoft.com/windows/hardware/commercialize/adk-install)

[Windows Imaging and Configuration Designer](https://msdn.microsoft.com/library/windows/hardware/dn916113)

[FFU image format](../mobile/ffu-image-format.md)

[WIM vs. VHD vs. FFU: comparing image file formats](wim-vs-ffu-image-file-formats.md)

[Planning a Multicast Strategy in Configuration Manager](http://go.microsoft.com/fwlink/?LinkId=286313)

[Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[CreateFile function](https://msdn.microsoft.com/library/windows/desktop/aa363858.aspx)