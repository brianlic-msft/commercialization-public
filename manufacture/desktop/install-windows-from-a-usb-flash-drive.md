---
author: Justinha
Description: Install Windows from a USB Flash Drive
ms.assetid: b1ed80f1-cc1d-4eeb-9d5e-22c615479e1d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Install Windows from a USB Flash Drive
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Install Windows from a USB Flash Drive


To install Windows to a device without a DVD drive, you can use a USB flash drive.

**Format the drive and set the primary partition as active**

1.  Connect a USB flash drive to your PC.

2.  Open **Disk Management**: **Start** &gt; Settings: **Create and format hard disk partitions**.

3.  Format the partition: Right-click the USB drive partition &gt; **Format**. Select the **FAT32** file system to be able to boot either BIOS-based or UEFI-based PCs.

4.  Set the partition as active: Right-click the USB drive partition &gt; **Mark Partition as Active**.

**Copy Windows Setup to the USB flash drive**

1.  Copy and paste the entire contents of the Windows product DVD to the USB flash drive.

2.  Optional: add an Unattend file or a configuration set to automate the installation process. For more information, see [Automate Windows Setup](windows-setup-automation-overview.md).

**Install Windows to the new PC**

1.  Connect the USB flash drive to a new PC.

2.  Turn on the PC and press the key that opens the boot-device selection menu for the computer, such as the Esc key. Select the option that boots the PC from the USB flash drive.

    Windows Setup starts. Follow the instructions to install Windows.

3.  Remove the USB flash drive.

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

 

 






