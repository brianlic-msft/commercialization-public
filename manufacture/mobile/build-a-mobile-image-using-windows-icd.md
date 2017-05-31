---
title: Build a mobile image using Windows ICD
description: Use Windows ICD if you are building a device that is based on a reference design from a SoC vendor or if you are looking for a simple and streamlined process for creating a mobile image.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9F7346F3-688F-4DB7-B535-1A4A86DEB3B4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Build a mobile image using Windows ICD


Windows Imaging and Configuration Designer (ICD) is a Windows provisioning tool that lets you streamline customizing and provisioning a Windows image. It offers both a GUI or command-line interface that you can use to:

-   Configure settings and policies for a mobile image, including new customizations primarily focused on enterprise and education-specific scenarios such as bulk enrollment and enterprise policies, and then build the customized image.
-   Create a multivariant image by creating a provisioning package that defines targets and adds conditions that specify when settings for a variant will be applied, and then using the provisioning package as input to building a mobile image.

Use Windows ICD if you are building a device that is based on a reference design from a SoC vendor or if you are looking for a simple and streamlined process for creating a mobile image.

## To build a mobile image using the Windows ICD UI


The Windows ICD user interface (UI) provides an easy-to-use interface to build a customized mobile image. The UI shows all the settings that you can configure for a single variant mobile image and it then guides you through a step-by-step process to build, and even flash, the customized image.

However, be aware that there are some settings that are not available through the Windows provisioning framework and so these are not available to configure using Windows ICD. This includes [MCSF settings not supported in Windows Provisioning](https://msdn.microsoft.com/library/windows/hardware/mt573153) as well as the support for data assets (such as ringtones, localized strings, and so on).

If you don't need to configure these settings or assets for your image, you can use the Windows ICD UI to build your customized, single variant mobile image by following the instructions in [Build and deploy an image for Windows 10 Mobile](https://msdn.microsoft.com/library/windows/hardware/dn916106).

## To build a mobile image using the Windows ICD CLI


If you want to configure the available mobile settings in the Windows provisioning framework but want more flexibility in building your image, you can use the Windows ICD command-line interface (CLI). Using the Windows ICD CLI, you can:

-   Choose how you define the packages and features contained in your image—either by using an OEMInput.xml file or a BSP.config.xml file as one of the inputs.
-   Build a single variant mobile image.
-   Create a provisioning package with multivariant settings, which you can use as one of the inputs for creating a multivariant mobile image.

Whether you're building a multivariant or single variant image, you must choose how you want to define the contents of the image. This determines the packages or features that will be part of the image and can include hardware support, languages, market-specific apps or functionality, and so on.

**Define the contents of the image**

1.  **Using a BSP.config.xml file**. You can download these as part of the BSP kit or you can generate your own BSP.config.xml file by running the BSP kit configuration tools from the SoC vendor and selecting your component drivers.

    The BSP.config.xml file is required if you tried or want to use the Windows ICD UI to build your image. If you are building a mobile image for a hardware reference design, you should already have the BSP.config.xml file for your hardware reference design.

2.  **Using an OEMInput.xml file**. An OEMInput.xml file describes the required and optional elements that are used to define the mobile image. If you are creating a mobile image for a hardware reference design or for your own hardware design, and you also want to add your own features as part of the image, the OEMInput.xml file allows you to do this.

    The mobile kit includes OEMInput.xml samples that you can use as a starting point. You can find these in the Windows install folder, C:\\Program Files (x86)\\Windows Kits\\10\\OEMInputSamples on x64 host computers or C:\\Program Files\\Windows Kits\\10\\OEMInputSamples on x86 host computers.

    To learn more about OEMInput contents and other features you can add to your image, see [OEMInput file contents](oeminput-file-contents.md) and [Optional features for building images](optional-features-for-building-images.md). If you are already familiar with OEMInput.xml and want to know how to add your own feature into the image and other functionality available to you, see the other topics under [Define the image using OEMInput and feature manifest files](define-the-image-using-oeminput-and-feature-manifest-files.md).

To build a mobile image, you must also have a provisioning package or Windows provisioning answer file to use as inputs. These files specify the customization settings and assets that you want to include in your image.

-   You can use the Windows ICD UI to generate a provisioning package by configuring the settings and then exporting a provisioning package.

-   You can use the Windows ICD UI to quickly generate a Windows provisioning answer file. Whenever you start a new project using the UI, Windows ICD always creates a customizations.xml in your project folder. This is typically found in your Documents\\Windows Imaging and Configuration Designer (WICD)\\*Project\_Name* folder. If you want to create one from scratch, see [Windows provisioning answer file](https://msdn.microsoft.com/library/windows/hardware/dn916153) to understand the schema and then see [Windows Provisioning settings reference](https://msdn.microsoft.com/library/windows/hardware/dn953942) to learn about the settings available for you to configure.

    **Note**  We recommend using the Windows ICD UI to easily generate either the provisioning package or the Windows provisioning answer file.

     

Follow these instructions to build a single variant mobile image:

**Build a single variant mobile image**

1.  See [Getting started with Windows ICD](https://msdn.microsoft.com/library/windows/hardware/dn916112) and follow the instructions on launching the Windows ICD CLI.

2.  [Build an image for Windows 10 Mobile](https://msdn.microsoft.com/library/windows/hardware/dn916115#to_build_a_mobile_image) using the Windows ICD CLI.

Windows supports a mechanism that allows you to create a single image that can work for multiple markets. You can dynamically configure languages, branding, apps, and settings based on conditions. Building a mobile image that contains multivariant settings is only possible through the Windows ICD CLI.

The process for building a multivariant mobile image is similar to building a single variant mobile image except that you must create a provisioning package with multivariant settings first and then you must use this package as one of the inputs when you are ready to build the image.

Follow these instructions to build multivariant mobile image:

**Build a multivariant mobile image**

1.  Create the provisioning package. For more information, see [Create a provisioning package with multivariant settings](https://msdn.microsoft.com/library/windows/hardware/dn916108).

    You will use this package as one of the inputs for the next step.

2.  [Build an image for Windows 10 Mobile](https://msdn.microsoft.com/library/windows/hardware/dn916115#to_build_a_mobile_image) using the Windows ICD CLI.

## Related topics


[Building and flashing mobile images](building-and-flashing-images.md)

[Build a mobile image using a hybrid method](build-a-mobile-image-using-windows-provisioning-and-mcsf-answer-files.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Build%20a%20mobile%20image%20using%20Windows%20ICD%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





