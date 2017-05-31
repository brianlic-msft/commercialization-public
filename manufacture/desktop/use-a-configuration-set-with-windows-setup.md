---
author: Justinha
Description: Use a Configuration Set with Windows Setup
ms.assetid: 6dc2e7b3-f1fb-4d46-b248-1e96c912db38
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Use a Configuration Set with Windows Setup
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use a Configuration Set with Windows Setup


Use a configuration set to add applications, drivers, packages, scripts, files and folders to Windows during installation. A configuration set is a portable collection of files and folders that you can place on a USB Flash Drive (UFD) or on a network share.

To use a configuration set, you need the following:

-   A configuration set. For more information, see [Create a Configuration Set](https://msdn.microsoft.com/library/windows/hardware/dn915081).

-   A Windows product DVD.

-   A removable media, such as a USB flash drive (UFD), if you intend to install without a network.

-   A bootable Windows PE media if you intend to install from a network. For more information, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

**How to use a Configuration Set with a Windows DVD**

1.  Turn on the computer.

2.  Insert both the removable media that contains your configuration set and the Windows product DVD into the new computer.

    **Note**  
    When using a USB flash drive, insert the drive directly into the primary set of USB ports for the computer. For a desktop computer, this is typically in the back of the computer.

     

3.  Restart the computer by pressing CTRL+ALT+DEL.

4.  When the computer reboots, you might be prompted to press any key to boot from the CD-ROM drive. Press any key and Windows Setup (**Setup.exe**) starts automatically.

    By default, Windows Setup searches all removable media for an answer file that is named **Autounattend.xml**. Autounattend.xml must be located at the root of the removable media.

    Installation starts, and the settings you configured in your answer file will be applied.

**How to use a Configuration Set from a Network**

1.  Create two folders on a network share to store the product DVD source files and your configuration set. For example,

    ``` syntax
    net use N: \\server\share
    md N:\WindowsDVD
    md N:\ConfigurationSets
    ```

2.  Copy the content of the product DVD to the **\\WindowsDVD** folder.

3.  Copy your configuration set to the **\\ConfigurationSets** folder.

4.  Boot the destination computer by using a bootable Windows PE media.

    For information about creating bootable Windows PE media, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

5.  At a command prompt in Windows PE, map a network drive to your network share. For example,

    ``` syntax
    net use N: \\server\share
    ```

6.  Run Windows Setup from the network and reference your answer file in your configuration set. For example,

    ``` syntax
    N:\WindowsDVD\setup /unattend:N:\ConfigurationSets\autounattend.xml
    ```

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Add a Custom Command to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915058)

[Boot from a DVD](boot-from-a-dvd.md)

[Deploy a Custom Image](deploy-a-custom-image.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md)

 

 






