---
author: Justinha
Description: 'Planning: Customizing reference images for different audiences'
ms.assetid: b98343dd-bb5e-4904-9b40-f44cea88fbf0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Planning: Customizing reference images for different audiences'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Planning: Customizing reference images for different audiences

Instead of having one device design that tries to fit everyone, Windows image management tools help you tailor device designs to meet the specific needs of various customers.

To get started, we recommend choosing a hardware design that targets a specific audience, market, or price point. Build base images for this design and test it. Next, modify the base images to create designs for for different audiences, include branding, logos, languages, and apps.

## <span id="Device_types"></span><span id="device_types"></span><span id="DEVICE_TYPES"></span>Device types

Consider creating separate designs for different device types, such as low-cost or performance laptops, or low-cost or performance desktops. Each of these styles has different sets of critical differentiators, such as battery life or graphics performance.

Although Windows includes base drivers for many common devices, some hardware requires specialized device drivers that must be installed and occasionally updated.

Many drivers are designed to be installed offline without booting the Windows image.

Use Windows Assessment tools to make sure that the apps and hardware that you're installing can perform well in a variety of circumstances.

## <span id="Architecture"></span><span id="architecture"></span><span id="ARCHITECTURE"></span>Architecture

If you plan to build devices with both 64-bit and 32-bit (x86) chipsets and architectures, you'll need separate base images. You'll also need different versions of drivers, packages, and updates.

## <span id="Retail_customers_and_business_customers"></span><span id="retail_customers_and_business_customers"></span><span id="RETAIL_CUSTOMERS_AND_BUSINESS_CUSTOMERS"></span>Retail customers and business customers

If you're building designs for both retail and business customers, you can start with a single base edition such as Windows 10 Home or Windows 10 Pro, and then later upgrade it to a higher edition such as Windows 10 Enterprise, as needed. Once you've built a higher edition, however, you can't downgrade it to the lower edition. For more info, see [Windows Upgrade Paths](http://go.microsoft.com/fwlink/?LinkId=526838).

If you're building devices to sell to retail customers, you'll need to meet a set of minimum requirements. For info, see the Licensing and Policy guidance on the [OEM Partner Center](http://go.microsoft.com/fwlink/?LinkId=131358).

If you're building devices for businesses, you'll have fewer restrictions. IT professionals can customize their devices in all sorts of ways. However, you should consider the implications of IT policies, as well as customer needs such as migrating data, activating security tools, and managing volume license agreements and product keys.

## <span id="Regions"></span><span id="regions"></span><span id="REGIONS"></span>Regions

Consider creating different base images for different regions.

The resource files for Windows and other apps like Microsoft Office can be large - some resources like localized handwriting and speech recognition resources are several hundred megabytes.

To save drive space, we've split up the language packs. This can help you preload more languages for your customers or save space on your image. For example, to target a large region, you may preload the basic language components such as text and user interface files for many areas within the region, but only include the handwriting recognition for devices with pens, or only include voice and speech tools for Cortana on devices with integrated microphones. Users can download these components later as needed.

## <span id="Sample_plan"></span><span id="sample_plan"></span><span id="SAMPLE_PLAN"></span>Sample plan

This lab uses the following three sample hardware configurations.

| Hardware Configuration:      | 1            | 1B                  | 2                                 |
|------------------------------|--------------|---------------------|-----------------------------------|
| Form factor                  | Small tablet | 2-in-1              | Notebook                          |
| Architecture                 | x86          | x86                 | x64                               |
| RAM                          | 1 GB         | 2 GB                | 4 GB                              |
| Disk capacity and type       | 16 GB eMMC   | 32 GB eMMC          | 500 GB HDD                        |
| Disk compression used        | Yes          | No                  | No                                |
| Display size                 | 8”           | 10”                 | 14”                               |
| Windows SKU                  | Home         | Pro                 | Home                              |
| Region/Language(s)           | EN-US        | EN-US, FR-FR, ES-ES | EN-GB, DE-DE, FR-FR, ES-ES, ZH-CN |
| Cortana                      | Yes          | Yes                 | Yes                               |
| Inbox apps (Universal)       | Yes          | Yes                 | Yes                               |
| Pen                          | No           | Yes                 | No                                |
| Office (Universal)           | Yes          | Yes                 | Yes                               |
| Windows desktop applications | No           | Yes                 | Yes                               |
| Office 2016                  | No           | Yes                 | Yes                               |
| Compact OS                   | Yes          | Yes                 | No                                |
 
 Notes:
* We can build an image for Hardware Configuration 1B by using Hardware Configuration 1 as a base image.
* We can't build Hardware Configuration 2 from either Hardware Configuration 1 or 1B, because they use a different architecture.

Next: [Get the tools needed to customize Windows](get-the-tools-needed-to-customize-windows-sxs.md)