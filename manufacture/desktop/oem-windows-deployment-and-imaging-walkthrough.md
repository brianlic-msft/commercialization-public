---
author: KPacquer
Description: OEM Windows Desktop Deployment and Imaging Lab
ms.assetid: 04dace4d-9df9-4ead-b23d-f168832c9c04
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: OEM Windows Desktop Deployment and Imaging Lab
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OEM Windows Desktop Deployment and Imaging Lab

Getting ready to build and test Windows 10 desktop PCs? This lab provides strategies for designing base images and updating them with command-line tools. The commands can be scripted, helping you quickly customize new images for specific markets to meet your customers' needs.

Let's get started!

**Preparation**

*  [Planning: Customizing reference images for different audiences](planning-create-different-product-designs-for-different-market-segments-sxs.md)

**Deploy images**

*  [Get the tools needed to customize Windows](get-the-tools-needed-to-customize-windows-sxs.md)
*  [Get the sample scripts](windows-deployment-sample-scripts-sxs.md)
*  [Lab 1: Install Windows PE](install-windows-pe-sxs.md)
*  [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md)

**Customize Window images**

In these labs, you'll modify the Windows image (install.wim). While you can perform most of these tasks in any order, a few have dependencies:
*    **Add languages before major updates.** Major updates include hotfixes, general distribution releases, or service packs. If you add a language later, you'll need to reinstall the updates.
*    **Add major updates before apps**. Thes apps include universal Windows apps and desktop applications. If you add an update later, you'll need to  reinstall the apps.


To make the changes, you'll mount the image contents into a temporary folder, and use tools like DISM to make the changes. Unmount the images and redeploy.
   ![image: Mounting an image, making changes, and unmounting the image](images/dep-win8-sxs-createmodelspecificfiles.jpg)

*  [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) (includes basics on mounting images)
*  [Lab 4: Add languages](add-drivers-langs-universal-apps-sxs.md)
*  [Lab 5: Add updates and upgrade the edition](servicing-the-image-with-windows-updates-sxs.md)
*  [Lab 6: Add universal Windows apps](add-universal-apps-sxs.md) (includes Microsoft Universal Office Apps)
*  [Lab 7: Change settings, enter product keys, and run scripts with an answer file (unattend.xml)](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md)
*  [Lab 8: Add branding and license agreements (OOBE.xml)](add-a-license-agreement.md)

**Add desktop applications, tiles, and pins**

For Windows desktop applications, you can add them in audit mode, or apply them separately after you've applied a Windows image.

*  [Lab 9: Make changes from Windows (audit mode)](prepare-a-snapshot-of-the-pc-generalize-and-capture-windows-images-blue-sxs.md) (includes Microsoft Office 2016)
*  [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md) (includes Windows Store settings, Microsoft Office)
*  [Lab 11: Add Start tiles and taskbar pins](add-start-tiles-sxs.md) (used for universal apps and desktop applications)

**Final tasks**
Make sure your customizations are included in the recovery image, and optimize the images for quick and easy deployment.

*  [Lab 12: Update the recovery image](update-the-recovery-image.md)
*  [Lab 13: Shrink your image size](shrink-your-image-size.md)
