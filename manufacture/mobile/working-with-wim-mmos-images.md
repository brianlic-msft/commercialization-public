---
author: kpacquer
Description: Working with WIM MMOS images
ms.assetid: c995e207-1b89-4d49-ad46-1ccc750737ec
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Working with WIM MMOS images
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Working with WIM MMOS images


You can temporarily copy a WIM (Windows Imaging) image over to a device and then boot to that image running in volatile RAM memory. This capability can be used to service the device using MMOS. For more info about MMOS, see [Microsoft Manufacturing OS](microsoft-manufacturing-os.md). The advantage of using this approach for servicing is that you will not need to reserve space on the retail OS for code that is only used in servicing. Minimizing the space that is consumed by the OS is an important consideration in low cost devices.

**Important**  
Only MMOS test images are currently supported. Retail signing is not currently supported.

 

## <span id="Creating_a_WIM_Image"></span><span id="creating_a_wim_image"></span><span id="CREATING_A_WIM_IMAGE"></span>Creating a WIM Image


Before you create a WIM image, you must complete the steps described in the following topics:

[MMOS image definition](mmos-image-definition.md)

In addition, follow these guidelines to prepare an image so that it will operate properly when converted to a WIM image.

-   The following XML shows an example of the Microsoft features that can be used in a test WIM Image.

    ``` syntax
    <Microsoft>
      <Feature>MOBILECOREBOOTSH</Feature>
      <Feature>ENABLE_BOOT_KEYS_TEST</Feature>
      <Feature>ENABLE_IP_OVER_USB</Feature>
    </Microsoft>
    ```

    You may want to add additional features such as battery charging (ENABLE\_MMOS\_CHARGING) depending on your needs. For additional info about the MMOS features, see [MMOS image definition](mmos-image-definition.md).

-   Do not include packages that access other partitions on the device. Because the WIM is loaded and running in RAM, it is not able to access other partitions and the OS cannot contain packages that reference other partitions.

After you complete the steps in the preceding topics, use the **ImgToWIM** command to convert the signed FFU image to a WIM image. The ImgToWim executable is located in %WPDKCONTENTROOT%\\Tools\\bin\\i386. The usage is summarized here.

``` syntax
ImgToWIM <FFUFileName> <WIMFileName> 
```

When you enter the **ImgToWim** command, you should see output that is similar to the following.

``` syntax
C:\TestWIM>ImgToWim MMOS.ffu MMOSWim.wim
Reading the image file: MMOS.ffu
ETW Log Path: C:\Users\USER1\AppData\Local\Temp\storage_session_1210.etl
OS Version: Microsoft Windows NT 6.2.9200.0
OpenDiskInternal: Creating empty virtual disk.
No mounted WP disks found.
Storage Service: Created a new image in 0.7 seconds.
AddAccessPath: Mount point for volume MainOS: C:\Users\USER1\AppData\Local\Temp
\oji20cvi.mq5.mnt\.

Creating WIM at 'C:\TestWIM\MMOSWim.wim' ...

Capturing 'MainOS'...
WIM creation complete.
DismountFullFlashImage:[2.87] Cleaning up temporary paths.
CleanupTemporaryPaths: Cleaning up temporary path C:\Users\USER1\AppData\Local\
Temp\oji20cvi.mq5.mnt\.
Storage Service: Dismounting the image in 2.9 seconds.
```

## <span id="Booting_from_a_WIM_Image"></span><span id="booting_from_a_wim_image"></span><span id="BOOTING_FROM_A_WIM_IMAGE"></span>Booting from a WIM Image


Use the FFUTool **WIM** option to boot from a WIM image. The usage is summarized here.

``` syntax
ffutool -WIM <WIMFileName.wim>
```

To boot the device from a WIM image, complete the following steps.

1.  Set up the PC side flashing tools.

2.  Put the device in flashing mode by holding the volume up button while powering up the device. After the device is in flashing mode, connect the USB cable to your computer.

3.  Use the **FFUTool** command with the **-WIM** option to boot a device from a WIM image. It is located in %WPDKCONTENTROOT%\\Tools\\bin\\i386. When you enter the **FFUTool -WIM** command, you should see output that is similar to the following.

    ``` syntax
    C:\> ffutool -wim MMOSWim.wim
    Found device:
    Name:   Contoso.MSM8960.JD301_ATT.3.2.1
    ID:     00000011-f151-a509-0000-000000000000
    Booting WIM: MMOSWim.wim
    WIM transfer completed in 26.550073 seconds.
    ```

The ffutool sends a WIM opcode to the device, along with information about the size of the image. Next a RAM buffer is allocated that will hold image. The ffutool then transfers the WIM image to the device. Once it’s fully transferred, the device boots into the WIM image in memory.

**Note**  
The current MMOS WIM images may not display the rotating disc graphic but MMOS is still functional.

 

 

 





