---
author: KPacquer
Description: 'WinPE: Optimize and shrink the image'
ms.assetid: 5d5c13e8-8754-4fff-afd1-dcc3fb757bb9
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Optimize and shrink the image'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Optimize and shrink the image

Speed up Windows Preinstallation Environment (WinPE) boot time by cleaning up the image after adding drivers, languages, or packages.

## <span id="Mount_the_Windows_PE_boot_image"></span>Mount the Windows PE boot image

``` syntax
Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE_amd64\mount"
```

## <span id="Add_customizations"></span><span id="add_customizations"></span><span id="ADD_CUSTOMIZATIONS"></span>Add customizations

Add [drivers](winpe-add-drivers.md), [packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md), and/or [any other customizations](winpe-mount-and-customize.md).

However, don't unmount the image just yet.

## <span id="Prepare_to_clean_the_image"></span>Prepare to clean the image

This process marks files that can be removed during the export process. 

``` syntax
DISM /Cleanup-Image /Image="C:\WinPE_amd64\mount" /StartComponentCleanup /ResetBase 
```

## <span id="Unmount_the_image"></span>Unmount the image
	
Commit the changes and unmount the WinPE image:
``` syntax
Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /Commit
```

## <span id="Export_and_then_replace_the_image"></span>Export and then replace the image

The exported image should be smaller than the old image. Replace the original image with the new one. 

``` syntax
Dism /Export-Image /SourceImageFile:"c:\winpe_amd64\media\sources\boot.wim" /SourceIndex:1 /DestinationImageFile:"c:\winpe_amd64\mount\boot2.wim"
Del "C:\WinPE_amd64\media\sources\boot.wim"
Copy "C:\WinPE_amd64\mount\boot2.wim" "c:\winpe_amd64\media\sources\boot.wim"
```

## <span id="Try_it_out"></span>Try it out

1.  Create bootable media, such as a USB flash drive.

    ``` syntax
    MakeWinPEMedia /UFD C:\WinPE_amd64 F:
    ```

2.  Boot the media. WinPE starts automatically. After the WinPE window appears, the wpeinit command runs automatically. This may take a few minutes. Verify your customizations.


## <span id="related_topics"></span>Related topics

[WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md)

 

 






