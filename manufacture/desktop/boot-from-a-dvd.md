---
author: Justinha
Description: Boot from a DVD
ms.assetid: f64eb16b-15b3-4a6d-af68-526a8097edb7
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Boot from a DVD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Boot from a DVD


The simplest way to install Windows on new hardware is to start directly from the Windows product DVD by using an answer file that is named Autounattend.xml. This method provides flexibility when network access is not available or when you are building only a few computers. You can use this same method to build an initial image in an image-based deployment scenario, typically known as a *master installation*.

By using the answer file, you can automate all or parts of Windows Setup. You can create an answer file by using Windows System Image Manager (Windows SIM). For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085).

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete this walkthrough, you need the following:

-   An answer file on removable media (CD or DVD-ROM) or a USB flash drive. The answer file must be named Autounattend.xml. The answer file must be located at the root of the media.

-   A Windows product DVD.

**To install Windows from the Windows product DVD**

1.  Turn on the new computer.

    **Note**  
    This example assumes that the hard disk drive is blank.

     

2.  Insert both the Windows product DVD and the removable media that contains your answer file into the new computer.

    **Note**  
    When you use a USB flash drive, insert the drive directly into the primary set of USB ports for the computer. For a desktop computer, this is typically in the back of the computer.

     

3.  Restart the computer by pressing the CTRL+ALT+DEL keys. Windows Setup (Setup.exe) starts automatically.

    By default, Windows Setup searches at the root of a drive and other locations, such as removable media, for an answer file that is named Autounattend.xml. This occurs even if you do not explicitly specify an answer file. For more information, see “Implicitly Searching for an Answer File” and “Implicit Answer File Search Order” in [Windows Setup Automation Overview](windows-setup-automation-overview.md).

4.  After the Setup program is finished, validate that Windows applied all customizations, and then reseal the computer by using the **sysprep** command together with the **/generalize** option.

    The Sysprep tool removes all system-specific information and resets the computer. The next time that the computer starts, your customers can accept the Microsoft Software License Terms and add user-specific information.

    Optional: To automatically run the Sysprep tool after the installation, set the Microsoft-Windows-Deployment | Reseal component setting in your answer file (Autounattend.xml) as follows:

    `ForceShutdownNow = true, Mode =OOBE`

    Optional: To run the Sysprep tool manually from a running operating system, type the following at a command prompt:

    `c:\windows\system32\sysprep /oobe /shutdown`

For more information, see [Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md).

## <span id="Next_Steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next Steps


This walkthrough illustrates a basic unattended installation that requires no user input. You can manually add more customizations to the newly installed operating system. If this is a master installation or an installation that you will use for image deployment, shut down the computer. Then, capture an image of the installation by using the Deployment Image Servicing and Management (DISM) tool or any third-party imaging software.

**Important**  
You must run the **sysprep /generalize** command before you move a Windows image to a new computer by any method. These methods include imaging, hard disk duplication, and other methods. Moving or copying a Windows image to a different computer without running the **sysprep /generalize** command is not supported, even if the new computer has the same hardware configuration. Generalizing the image removes unique information from the Windows installation so that you can apply that image on different computers.

The next time that you boot the Windows image, the [specialize](specialize.md) configuration pass runs. During this configuration pass, many components perform actions that must occur when you boot a Windows image on a new computer. For more information, see [How Configuration Passes Work](how-configuration-passes-work.md).

 

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

[Deploy a Custom Image](deploy-a-custom-image.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md)

 

 






