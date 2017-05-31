---
author: kpacquer
Description: 'The Windows 10 IoT Core ADK Add-Ons include tools to help you customize and create new images for your devices with the apps, board support packages (BSPs), drivers, and Windows features that you choose, and a sample structure you can use to quickly create new images.'
ms.assetid: 26cfbad0-9528-4f89-a174-f198ece325d4
MSHAttr: 'PreferredLib:/library'
title: 'Windows ADK IoT Core Add-ons: contents'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows ADK IoT Core Add-ons: contents

The [Windows 10 IoT Core ADK Add-Ons](http://go.microsoft.com/fwlink/?LinkId=735028) include OEM-specific tools to create images for your IoT Core devices with your apps, board support packages (BSPs), settings, drivers, and features.

The [IoT Core manufacturing guide](iot-core-manufacturing-guide.md) walks you through building images with these tools.

## <span id="Root_folder"></span>Root folder

-   **IoTCoreShell**: Launches the [IoT Core Shell command-line](iot-core-adk-addons-command-line-options.md#iotcoreshell).

-   **README.md**: Version info, links to documentation

## <span id="Build"></span><span id="build"></span><span id="BUILD"></span>Build
This is the output directory where the build contents are stored. It starts as empty.

## <span id="Common_files"></span><span id="common_files"></span><span id="COMMON_FILES"></span>Common files

Source files for packages that are common to all architectures.

-   **Custom.Cmd**: Package to include the oemcustomization cmd. This is product-specific and picks up the input file from product directory. This also makes an registry entry with the product name.

-   **Device.SystemInformation**: Package to add the System product name and manufacturer name to the image.

-   **DeviceLayout.GPT4GB**: Package with GPT [drive/partition layout](device-layout.md) for UEFI-based devices with 4GB drives.

-   **DeviceLayout.GPT2GB**: Package with GPT [drive/partition layout](device-layout.md) for UEFI-based devices with 2GB drives.

-   **DeviceLayout.MBR4GB**: Package with MBR [drive/partition layout](device-layout.md) for legacy BIOS-based devices with 4GB drives.

-   **DeviceLayout.MBR2GB**: Package with MBR [drive/partition layout](device-layout.md) for legacy BIOS-based devices with 2GB drives.

-   **Provisioning.Auto**: Package used to [add a provisioning package to an image](add-a-provisioning-package-to-an-image.md). This is product specific and picks up the input ppkg file from the product directory.

-   **Provisioning.Manual**: Package for manual provisioning. This depends on Custom.Cmd for triggering the provisioning.

-   **Registry.Version**: Package containing registry settings with product and version information.

-   **Settings.HotKey**: Sample package to demonstrate how to [add a registry setting to an image](add-a-registry-setting-to-an-image.md). This setting changes the values of the left Windows key, right Windows key, and the Alt+Right Windows key to act as the Home key.

-   **OEMCommonFM.xml**: Feature manifest for OEM Common packages.


## <span id="Source"></span><span id="source"></span><span id="SOURCE"></span>Source (Source-arm, Source-x64, Source-x86)
 
Source files for packages that are specific to an architecture.

### <span id="BSP"></span><span id="bsp"></span>BSP
Source files to create board support packages (BSPs). 

Some BSPs are included in each folder as a start. You can [create your own BSPs](create-a-new-bsp.md) based on these packages.

### <span id="Packages"></span><span id="packages"></span><span id="PACKAGES"></span>Packages

-   **Drivers.GPIO**: Sample package for a driver.

-   **OEMFM.xml:** Feature manifest for OEM packages

-   **versioninfo.txt:** Current version number. Used for [updating IoT Core apps](https://msdn.microsoft.com/windows/hardware/commercialize/service/iot/updating-iot-core-apps).

### <span id="Products"></span><span id="products"></span><span id="PRODUCTS"></span>Products

Source file for product configurations. Use our samples (SampleA, SampleB) or [create your own](iot-core-manufacturing-guide.md).

## <span id="Tools"></span><span id="tools"></span><span id="TOOLS"></span>Tools

Includes the [IoT Core Add-ons command-line options](iot-core-adk-addons-command-line-options.md).

## <span id="related_topics"></span>Related topics

[IoT Core manufacturing guides](iot-core-manufacturing-guide.md)

[IoT Core feature list](iot-core-feature-list.md)


 

 



