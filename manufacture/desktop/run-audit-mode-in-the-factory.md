---
author: Justinha
Description: Run Audit Mode in the Factory
ms.assetid: e8262c69-3fae-455e-9cbd-88c486f92094
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Run Audit Mode in the Factory
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Run Audit Mode in the Factory


In build-to-order scenarios OEMs can boot the destination PCs to audit mode to install customer-specific apps, languages, drivers, and make additional configurations.

After final assembly of the PC you complete integrity testing to ensure the PC is configured correctly.

When ready, boot the PC with Windows PE, or another operating system that allows you to install your custom Windows image to the PC. You can boot the PC by using a USB key, or you can boot the PC from the network using PXE boot and Windows Deployment Services.

We recommend you use Windows PE and DISM to boot the PC and apply your custom Windows image.

-   [Apply Images Using DISM](apply-images-using-dism.md)

-   [WinPE for Windows 10](winpe-intro.md)

-   [Windows Deployment Services Overview](http://technet.microsoft.com/library/hh831764.aspx)

After the image is applied, you boot the PC to audit mode.

-   [Audit Mode Overview](audit-mode-overview.md)

While in audit mode, you can install customer requested software, drivers specific to the PC, and additional items. While in audit mode you can also install the latest Windows updates. The following topics go into more detail about how to install drivers, language packs, and Windows updates:

-   [Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md)

-   [Language Packs](language-packs-and-windows-deployment.md)

-   [Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

Keep in mind that the more items that you install on the factory floor increases the time it takes to assemble, install, and box the PC.

After you complete your audit mode installations, you must run sysprep /oobe to ensure that the end-user goes through the out-of-box experience and accepts the license terms. You should capture the Windows installation to the recovery partition to help users rest the PC to factory default. By doing this in the factory, you can ensure that the build-to-order customizations that customers make are in the recovery image.

You will need to boot the PC to Windows PE again to capture and apply the Windows installation to the recovery partition.

The following topic describes how to create the recovery image:

-   [Deploy Push-Button Reset Features](deploy-push-button-reset-features.md)

After the recovery image is captured, you can shut down the PC, box it, and ship it.

Depending on the volume of units you are shipping, you might want to consider pulling one or more PCs off the line to ensure the systems you build meet your quality expectations.

 

 





