---
Description: 'In this section, we''ll go through the process of customizing and building a mobile image using the Windows Imaging and Configuration Designer (ICD).'
ms.assetid: 6e018255-b629-4d69-8b85-7a5c3ec53944
MSHAttr: 'PreferredLib:/library'
title: 'Part 2: Mobile deployment using Windows Provisioning'
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Part 2: Mobile deployment using Windows Provisioning


In this section, we'll go through the process of customizing and building a mobile image using the Windows Imaging and Configuration Designer (ICD). Windows ICD provides a hybrid method for customizing and building a mobile image because it lets you use both a Windows Provisioning answer file (WPAF) to configure the runtime settings, enterprise policies, and enrollment settings available in Windows Provisioning, and a Managed Centralized Settings Framework (MCSF) customization answer file (CAF) to fully customize the device hardware and connectivity settings, preload apps, and add assets such as ringtones and localized strings.

-   [Use the Windows ICD CLI to customize and build a mobile image](use-the-windows-icd-cli-to-customize-and-build-a-mobile-image.md)

    This method uses the Windows ICD CLI to build a customized mobile image.

-   Legacy: [Use the Windows ICD UI to customize and build a mobile image](use-the-windows-icd-ui-to-customize-and-build-a-mobile-image.md)

    Note, this method is not supported in Windows 10, version 1607.


## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


Before proceeding with either of the walkthroughs, you must first complete the steps in [Prepare for Windows mobile development](preparing-for-windows-mobile-development.md) and [Configure the Start layout](configure-the-start-layout.md). Windows Provisioning/Windows ICD understands MCSF CAF so if you want to learn how to create a CAF, see [Configure customization settings](configure-customization-settings.md).

 

 



