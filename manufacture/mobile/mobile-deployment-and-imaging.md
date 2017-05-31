---
Description: 'Windows 10 Mobile brings the features available in Windows 10 to mobile devices.'
ms.assetid: 8ee995d9-420d-4bba-9ab0-decf4b3dc39b
MSHAttr: 'PreferredLib:/library'
title: Mobile deployment and imaging
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mobile deployment and imaging


Windows 10 Mobile brings the features available in Windows 10 to mobile devices. In addition, on devices that meet the required hardware components, Windows 10 Mobile also adds features like Continuum for Phones, which allows users to connect their Windows phone to a monitor, and even to a mouse and keyboard, to make the phone work like a desktop.

## <span id="Intended_audience"></span><span id="intended_audience"></span><span id="INTENDED_AUDIENCE"></span>Intended audience


The entirety, or sections, of this walkthrough is intended for use by:

-   New or experienced Windows OEMs and ODMs who want to build and deploy a customized Windows 10 Mobile image.

-   Mobile operators who want to know the process of building and deploying a customized mobile image.

## <span id="Overview"></span><span id="overview"></span><span id="OVERVIEW"></span>Overview


This mobile deployment and imaging guide is organized based on the two ways that you can customize, build, and flash a Windows image to a mobile device:

**Step 1:** [Prepare for Windows mobile development](preparing-for-windows-mobile-development.md) provides information about the preprequisites, tools, and how to set up your development environment.

**Step 2:** [Create mobile packages](creating-mobile-packages.md) provides step-by-step information on how to create a mobile package using a sample driver and when declaring an MCSF setting by using the MCSF settings schema within a .pkg.xml.

**Step 3:** [Configure the Start layout](configure-the-start-layout.md) shows how you can customize the Start layout on mobile devices to include Web links, secondary tiles, folders, and so on. Start layout uses a new unified schema in win\_threshold so it doesn't matter if you are using the Start MCSF settings or the Start Windows Provisioning settings to add the layout to your image. Also note that the default layout on mobile devices can only be customized as part of the imaging process.

**Step 4:** Once you've done all the preparation steps, you're ready to start customizing and building your image. We recommend learning the classic mobile deployment process first because MCSF still provides a more robust set of customizations that OEMs and ODMs can configure for their image. However, Windows Provisioning offers many enterprise policies, enrollment and enterprise settings not available through MCSF so we recommend becoming familiar with the Windows Provisioning deployment process too.

-   [Part 1: Classic mobile deployment](lab-1--classic-mobile-deployment.md)

    Configure customizations that are only available through the Managed Centralized Settings Framework (MCSF) and use the classic Windows mobile command-line tools to build packages and a customized image, and then flash the image to a device.

-   [Part 2: Mobile deployment using Windows Provisioning](lab-2--mobile-deployment-using-windows-provisioning.md)

    Use the Windows Provisioning answer file (WPAF) to configure customization settings that are only available through the Windows Provisioning framework. Use the WPAF with an MCSF CAF as inputs to the Windows Imaging and Configuration Designer (ICD) command-line interface to build a customized mobile image.

 

 



