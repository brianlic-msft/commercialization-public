---
author: Justinha
Description: Create a WIM for Multiple Architecture Types Using DISM
ms.assetid: fcb1b461-72c1-40c5-8405-38a5db05dd34
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create a WIM for Multiple Architecture Types Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a WIM for Multiple Architecture Types Using DISM


When you plan your deployment scenarios, consider how you will deploy and maintain your images for different architecture types. There are several ways you can manage multiple Windows images for multiple architecture types. Because you can deploy both 32-bit and 64-bit Windows images from a 32-bit preinstallation environment, you can maintain 32-bit and 64-bit Windows images in the same Windows image (.wim) file or separate .wim files.

Because you can store multiple Windows images in a single .wim file, you can create architecture-specific .wim files or a single .wim file that contains images for multiple architecture types.

-   32-bit images only

    You can create a .wim file that contains Windows images for a single architecture type. In this scenario, you build a .wim file that contains one or more Windows images for 32-bit systems only. You create separate .wim files for different architecture types.

-   64-bit images only

    You can create a .wim file that contains one or more of the 64-bit Windows images that you deploy.

-   32-bit and 64-bit images

    You can create a.wim file that contains multiple Windows editions for multiple architecture types. For example, you can create a Windows image that contains two versions of Windows, one for 32-bit architectures, and one for 64-bit architectures.

## <span id="To_Create_a_Windows_Image_for_Multiple_Architecture_Types"></span><span id="to_create_a_windows_image_for_multiple_architecture_types"></span><span id="TO_CREATE_A_WINDOWS_IMAGE_FOR_MULTIPLE_ARCHITECTURE_TYPES"></span>To Create a Windows Image for Multiple Architecture Types


You can create a single .wim file that includes both 32-bit and 64-bit Windows images. You must have both a 32-bit Windows distribution and a 64-bit Install.wim file. (A Windows distribution is the collection of files on the Windows installation media that includes not only the Install.wim file, but the additional files and directories that are required for Setup.) Cross-platform deployment is supported only from 32-bit Windows Setup.

1.  Copy the entire 32-bit Windows distribution to a temporary directory on the local computer.

2.  Copy the 64-bit Install.wim file to a separate temporary directory on the local computer.

3.  At a command prompt, use the **Dism** command to export the 64-bit Windows images to the Install.wim file in the Windows distribution.

4.  Repeat the **Dism /Export-Image** command for each 64-bit Windows image that you want to add to the Windows distribution.

For example, if you copy the distribution to C:\\WindowsDistribution and the 64-bit Install.wim file to C:\\Windows64-bit, you would use the following at a command prompt.

``` syntax
Dism /Export-Image /SourceImageFile:c:\windows64-bit\install.wim /SourceIndex:1 /DestinationImageFile:c:\windowsdistribution\sources\install.wim /DestinationName:"Fabrikam 64-bit Image"
```

**Note**  
It is important to add the name of the Windows image to indicate that it is for 64-bit computers only.

 

The 64-bit Windows image and all accompanying metadata are copied to the Install.wim file to a new index during the export process. When you have added all Windows images to the Install.wim file, your Windows distribution is ready to be used in your environment.

During attended installations, users will be prompted to select which architecture-specific Windows image to install (x86 or x64 images).

In unattended installations, if you store multiple Windows editions for multiple architecture types in a single .wim file, you must explicitly specify which image to install during Windows Setup with the `MetaData` setting.

## <span id="related_topics"></span>Related topics


[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)

 

 






