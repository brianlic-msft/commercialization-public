---
author: kpacquer
Description: 'This guide walks you through creating Windows 10 IoT Core (IoT Core) images that can be flashed to retail devices and maintained after they have been delivered to your customers.'
ms.assetid: 2b208536-20fc-42da-abf3-39bfb141276d
MSHAttr: 'PreferredLib:/library'
title: IoT Core manufacturing guide
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IoT Core manufacturing guide

Thinking about mass-producing devices running Windows 10 IoT Core? Use the [Windows ADK IoT Core Add-ons](iot-core-adk-addons.md) to create images that you can quickly flash onto new devices. 

You can create **test images**, which include tools for quickly accessing and modifying devices. Test images are great for:
-  Developers, hardware vendors, and manufacturers (OEMs) who are trying out new device designs.
-  Hobbyists and organizations that are creating devices designed to run in non-networked or controlled network environments.

You can create **retail images**, which can be made more secure for public or corporate networks while still receiving updates.

You can add customizations, including apps, settings, hardware configurations, and board support packages (BSPs).

For OEM-style images, you’ll wrap your customizations into package (.cab) files. Packages let OEMs, ODMs, developers, and Microsoft work together to help deliver security and feature updates to your devices without stomping on each other's work.


## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios
-   [Get the tools needed to customize Windows IoT Core](set-up-your-pc-to-customize-iot-core.md)
-   [Lab 1a: Create a basic image](create-a-basic-image.md)
-   [Lab 1b: Add an app to your image](deploy-your-app-with-a-standard-board.md)
-   [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md)
-   [Lab 1d: Add networking and other provisioning package settings to an image](add-a-provisioning-package-to-an-image.md)
-   [Lab 1e: Add a driver to an image](add-a-driver-to-an-image.md)
-   [Lab 1f: Build a retail image](build-retail-image.md)
-   [Lab 2: Creating your own board support package](create-a-new-bsp.md)
-   [Lab 3: Update your apps](https://msdn.microsoft.com/windows/hardware/commercialize/service/iot/updating-iot-core-apps)

[(Previous version of this guide): IoT Core deployment and imaging](iot-core-deployment-and-imaging.md)
## <span id="Concepts"></span><span id="concepts"></span><span id="CONCEPTS"></span>Concepts

You can use the walkthrough as a guide to build both your test and retail images. In general terms:

1.  Test your customizations, including apps, settings, drivers, and BSPs, to make sure they work.
2.  Install test certificates on your PC, and package your customizations into .cab files.
2.  Create a test image that includes your customizations, along with the IoT Core package, and any updates from your hardware manufacturer.
3.  Flash the image to a device and test it. Use the test tools built into the test images to troubleshoot any new issues.
4.  If it works, sign your customizations, and repackage them into new .cab files.
5.  Create a retail image with your signed files, and use it to manufacture new devices.

![iot core image creation process](images/oemworkflow1703.png)

### <span id="Packages"></span><span id="packages"></span><span id="PACKAGES"></span>Packages

Packages are the logical building blocks of IoT Core. They contain all the files, libraries, registry settings, executables, and data on the device. From device drivers to system files, every component must be contained in a package. This modular architecture allows for precise control of updates: a package is the smallest serviceable unit on the device.

Each package contains:
-   The contents of the package, such as a signed driver binary or a signed appx binary.
-   A package definition (.pkg.xml) file specifies the contents of the package and where they should be placed in the final image. See %SRC\_DIR%\\Packages\\ directory for various samples of package files.
-   A signature. This can be a test or retail certificate.

The `pkggen` tool combines these items into signed packages. Our samples include scripts: `createpkg`, and `createprovpkg`, which call pkggen to create packages for our drivers, apps, and settings.

The process is similar to that used by Windows 10 Mobile. To learn more about creating packages, see [Creating mobile packages](https://msdn.microsoft.com/library/windows/hardware/dn756642).

### <span id="Feature_manifests__FMs_"></span><span id="feature_manifests__fms_"></span><span id="FEATURE_MANIFESTS__FMS_"></span>Feature manifests (FMs)

After you've put everything into packages, you'll use FM files to list which of your packages belong in the final image.

You can use as many FMs into an image as you want. In this guide, we refer to the following FMs:

-   **OEMFM.xml** includes features an OEM might add to a device, such as the app and a provisioning package.
-   **BSPFM.xml** includes features that a hardware manufacturer might use to define a board. For example, OEM\_RPi2FM.xml includes all of the features used for the Raspberry Pi 2.

The process is similar to that used by Windows 10 Mobile. To learn more, see [Feature manifest file contents](https://msdn.microsoft.com/library/windows/hardware/dn756745).

You'll list which of the features to add by using these tags:

-   &lt;BasePackages&gt;: Packages that you always included in your images, for example, your base app.
-   &lt;Features&gt;\\&lt;OEM&gt;: Other individual packages that might be specific to a particular product design.

The Feature Merger tool generates the required feature identifier packages that are required for servicing the device. Run this tool whenever any changes are made to the FM files. After you change OEM FM or OEM COMMON FM files, run `Buildfm oem`. After you change bspfm files, run `buildfm bsp <bspname>`.


### <span id="Creating_the_image__ImgGen_and_the_image_configuration_file__OEMInput.xml_"></span><span id="creating_the_image__imggen_and_the_image_configuration_file__oeminput.xml_"></span><span id="CREATING_THE_IMAGE__IMGGEN_AND_THE_IMAGE_CONFIGURATION_FILE__OEMINPUT.XML_"></span>Creating the image: ImgGen and the image configuration file (OEMInput.xml)

To create the final image, you'll use the `imggen` tool with an image configuration file, **OEMInput.xml file**.

These are the same tools used to create Windows 10 Mobile images. To learn more, see [OEMInput file contents](https://msdn.microsoft.com/library/windows/hardware/dn756778).

The image configuration file lists:

-   The feature manifests (FMs) and the packages that you want to install from each one.

-   An **SoC** chip identifier, which is used to help set up the device partitions. The supported values for **soc** are defined in the corresponding bspfm.xml, under \<devicelayoutpackages>.

-   A **Device** identifier, which is used to select the device layout. The supported values for **device** are defined in the corresponding bspfm.xml, under \<oemdeviceplatformpackages>.

-   The ReleaseType (either **Production** or **Test**).

    **Retail builds**: We recommend creating retail images early on in your development process to verify that everything will work when you are ready to ship.

    These builds contain all of the security features enabled.

    To use this build type, all of your code must be signed using retail (not test) code signing certificates.

    For a sample, see %SRC\_DIR%\\Products\\SampleA\\RetailOEMInput.xml.

    **Test builds**: Use these to try out new versions of your apps and drivers created by you and your hardware manufacturer partners.

    These builds have some security features disabled, which allows you to use either test-signed or production-signed packages.

    These builds also include developer tools such as debug transport, SSH, and PowerShell, that you can use to help troubleshoot issues.

    For a sample, see %SRC\_DIR%\\Products\\SampleA\\TestOEMInput.xml.

|     |  Retail builds | Test builds |
| --- | -------------- | ----------- |
| Image release type   | ReleaseType: **Production** | ReleaseType: **Test** |
| Package release type | Only Production Type packages are supported | Both Production Type or Test Type are supported |
| Test-signed packages | Not supported | Supported <p> IOT_ENABLE_TESTSIGNING feature must be included. |
| Code integrity check | Supported. By default, this is enabled. | Not supported <p>IOT_DISABLE_UMCI feature must be included |

### <span id="Board_Support_Packages"></span><span id="board_support_packages"></span><span id="BOARD_SUPPORT_PACKAGES"></span>Board Support Packages (BSPs)
Board Support Packages contain a set of software, drivers, and boot configurations for a particular board, typically supplied by a board manufacturer. The board manufacturer may periodically provide updates for the board, which your devices can receive and apply. 

## <span id="OK__let_s_try_it_"></span><span id="ok__let_s_try_it_"></span><span id="OK__LET_S_TRY_IT_"></span>OK, let's try it!

Start here: [Get the tools needed to customize Windows IoT Core](set-up-your-pc-to-customize-iot-core.md).

## <span id="related_topics"></span>Related topics

[Learn about Windows 10 IoT Core](https://developer.microsoft.com/windows/iot/iotcore)

[IoT Core Developer Resources](https://developer.microsoft.com/windows/iot)

[What's in the Windows ADK IoT Core Add-ons](iot-core-adk-addons.md)

[IoT Core feature list](iot-core-feature-list.md)

[IoT Core Add-ons command-line options](iot-core-adk-addons-command-line-options.md)

 

 



