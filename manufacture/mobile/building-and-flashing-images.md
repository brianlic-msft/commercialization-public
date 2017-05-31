---
title: Building and flashing mobile images
description: Here's information to help you build and flash images to your Windows 10 Mobile device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4862b9a9-3619-45cd-a612-77bd4ebb6ca2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Building and flashing mobile images


Here's information to help you build and flash images to your Windows 10 Mobile device.

## <a href="" id="1---define--customize--and-build-an-image"></a>1. Define, customize, and build an image


To build a customized image that can be flashed to mobile devices, you can use either the new Windows Imaging and Configuration Designer (ICD) or classic ImgGen.cmd, or a hybrid of these methods using the Windows ICD command-line interface. See [Customizations for Windows 10 Mobile](https://msdn.microsoft.com/library/windows/hardware/mt481438) to help you decide which method you need to use to meet your device customization needs.

-   **Using Windows ICD**: This tool walks you through the process of creating images for Windows 10 Mobile using the Windows provisioning framework. Use this tool if you are building a device that is based on a reference design from a SoC vendor. To learn more about the tool, see [Windows Imaging and Configuration Designer](https://msdn.microsoft.com/library/windows/hardware/dn916113). To start building a mobile image, see [Build a mobile image using Windows ICD](build-a-mobile-image-using-windows-icd.md).

-   **Using ImgGen.cmd**: If you're building a device based on your own hardware design or using MCSF customization answer files and other assets that were generated using the legacy tools that shipped in Windows Phone 8.1, you can generate a customized mobile image using this tool. To get started, see [Building a mobile image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).

-   **Using a hybrid method**: If you want to use an OEMInput.xml file to fully define the contents of your image, take advantage of all the new runtime settings, enterprise policies, and enrollment settings available in Windows provisioning and also be able to fully customize the device hardware and connectivity settings, preload apps, and add assets such as ringtones and localized strings through MCSF, you can use a hybrid approach using the Windows ICD CLI to build your image. To learn more, see [Build a mobile image using a hybrid method](build-a-mobile-image-using-windows-provisioning-and-mcsf-answer-files.md).

## 2. Sign an image


No matter which method you used to customize and build your image, you'll need to cryptographically sign your image before you can deploy it to a device.

-   [Sign a full flash update (FFU) image](sign-a-full-flash-update--ffu--image.md)

## 3. Flash an image to a device


Use the information in the following topics to learn about flashing and update tools:

-   [Use the flashing tools provided by Microsoft](use-the-flashing-tools-provided-by-microsoft.md)

-   [Update packages on a device and get package update logs](update-packages-on-a-phone-and-get-package-update-logs.md)

-   [Update packages in an .FFU image file](update-packages-in-an-ffu-image-file.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Building%20and%20flashing%20mobile%20images%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




