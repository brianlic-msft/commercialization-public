---
author: Justinha
Description: Repair a Windows Image
ms.assetid: 4ca60b08-6801-4af4-a504-3e88ec0c8fb8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Repair a Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Repair a Windows Image


Repair a Windows image using DISM. You can repair offline Windows image in a WIM or VHD file, or an online Windows image. An online Windows image will also attempt to repair itself if it becomes unserviceable. The repair source for this operation is the same source that is used for Features on Demand and is determined by Group Policy settings. For more information, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md). When you use the DISM tool to repair an online or offline image, you can use the */Source* argument with the */RestoreHealth* argument to specify additional repair source locations to use to search for the required files.

For a quick check of an online image, you may be able to use the command: `sfc /scannow` to scan and repair files.

For a more extensive check that can repair issues with the store, use `DISM /Cleanup-Image`.

**To check if an image is repairable**

1.  Scan the image to check for corruption. This operation will take several minutes. For example, at a command prompt, type the following command:

    ``` syntax
    Dism /Online /Cleanup-Image /ScanHealth
    ```

2.  Check the image to see whether any corruption has been detected. For example, at a command prompt, type:

    ``` syntax
    Dism /Online /Cleanup-Image /CheckHealth
    ```

When you use the */CheckHealth* sfc argument, the DISM tool will report whether the image is healthy, repairable, or non-repairable. If the image is non-repairable, you should discard the image and start again. If the image is repairable, you can use the */RestoreHealth* argument to repair the image.

**To repair an image**

-   Use the */RestoreHealth* argument to repair the image. For example, to repair an offline image using a mounted image as a repair source, at a command prompt, type the following command:

    ``` syntax
    Dism /Image:C:\offline /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows
    ```

    Or to repair an online image using some of your own sources instead of Windows Update, type:

    ``` syntax
    Dism /Online /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows /LimitAccess
    ```

    If you do not specify a */Source* for the repair files, the default location for Features on Demand is used. For more information, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md). If you specify more than one */Source*, the files are copied from the first location where they are found and the rest of the locations are ignored. You can use */LimitAccess* to prevent the DISM tool from using Windows Update as a repair source or as a backup repair source for online images.

## <span id="Repairing_images_during_servicing"></span><span id="repairing_images_during_servicing"></span><span id="REPAIRING_IMAGES_DURING_SERVICING"></span>Repairing images during servicing


In some cases, an image can be corrupted while modifying it with DISM. Use */Cleanup-MountPoints* to repair it. This command will not unmount images that are already mounted, nor will it delete images that can be recovered using the /Remount-Image command.

``` syntax
Dism /Cleanup-Mountpoints
```

## <span id="related_topics"></span>Related topics


[Use the System File Checker tool to repair missing or corrupted system files](http://go.microsoft.com/fwlink/p/?LinkId=717888)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

[Configure a Windows Repair Source](configure-a-windows-repair-source.md)

 

 






