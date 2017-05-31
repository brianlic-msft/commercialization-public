---
author: Justinha
Description: Service an Applied Windows Image
ms.assetid: cdf543f7-7810-4ec5-9992-af0f3b6a789f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Service an Applied Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Service an Applied Windows Image


Windows® image (.wim) files contain one or more volume images for a Windows® operating system. A volume image represents the captured volume or partition of a Windows operating system. If you have to re-capture a Windows image, or export a copy of a specific .wim file to another .wim file, or append a volume image to an existing .wim file, you can use the Deployment Image Servicing and Management (DISM) tool to apply the image, and then service the image when it is applied. Then you can boot to audit mode to resolve pending online actions, and add applications or make additional customizations.

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete the walkthrough, you need the following:

-   A computer that has the latest version of the Windows Assessment and Deployment Kit (Windows ADK) tools installed on it.

-   Before you can apply a Windows image to a hard disk drive partition, you must create the hard disk partitions on the destination computer. For more information, see [Hard Drives and Partitions](hard-drives-and-partitions.md).

-   You must have the master Windows image (.wim file) and the language packs, drivers, or other packages available in an available location to add them to the Windows image.

-   A bootable Windows PE disk. For more information, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md) You can also apply the image from another operating system on the same computer, such as Windows 8 or Windows 7 with the latest ADK tools installed.

## <span id="Procedures"></span><span id="procedures"></span><span id="PROCEDURES"></span>Procedures


### <span id="Step_1__Boot_to_Windows_PE_and_Apply_the_Windows_Image"></span><span id="step_1__boot_to_windows_pe_and_apply_the_windows_image"></span><span id="STEP_1__BOOT_TO_WINDOWS_PE_AND_APPLY_THE_WINDOWS_IMAGE"></span>Step 1: Boot to Windows PE and Apply the Windows Image

In this step, you boot to Windows PE and apply a Windows image so that it can be serviced offline.

**To apply an image**

1.  On the destination computer, boot to Windows PE. For more information, see [WinPE for Windows 10](winpe-intro.md).

2.  At a command prompt, apply the master Windows image using DISM. For example:

    ``` syntax
    Dism /Apply-Image /ImageFile:C:\test\wim\install.wim /Index:1 /ApplyDir:C:\test\AppliedImages
    ```

    For more information about DISM commands, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

### <span id="Step_2__Add_Packages_to_the_Windows_Image"></span><span id="step_2__add_packages_to_the_windows_image"></span><span id="STEP_2__ADD_PACKAGES_TO_THE_WINDOWS_IMAGE"></span>Step 2: Add Packages to the Windows Image

Use DISM to add packages to your master Windows image.

**To add a package to the image**

1.  At a command prompt, run DISM with the **/Add-Package** option and point to the .cab or .msu package that you want to add to the Windows image. Multiple packages can be added on one command line. For example, type the following command to add multiple packages:

    ``` syntax
    Dism /Image:C:\test\AppliedImages /Add-Package /PackagePath:C:\Test\Packages\package1.cab /PackagePath:C:\Test\Packages\package2.cab 
    ```

    For more information about these DISM command-line options, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

    You can also use DISM command-line options on an applied Windows image to add drivers, add language packs, change to a higher edition of Windows, or apply an unattended answer file. For more information, see:

    -   [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md)

    -   [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

    -   [DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md)

    -   [DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

2.  Check the log file to verify that the package was successfully added.

    Some packages and drivers that were added or removed could be in a pending state. This is usually because a restart is required to complete the action. Booting the image to audit mode will satisfy the restart requirement, and let you add applications and make additional customizations. For more information, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

## <span id="Next_Step"></span><span id="next_step"></span><span id="NEXT_STEP"></span>Next Step


This walkthrough illustrates basic offline servicing of an applied Windows image in Windows PE. When you complete this process, the packages are added to the Windows image. You can now either run `sysprep /generalize /oobe` to remove machine-specific customizations and recapture the image for later deployment, or run `sysprep /oobe` to keep the specialized customizations and ship this computer. Using the `/oobe` option will ensure that the computer starts in Out-of-Box Experience (OOBE) mode the next time that it is booted. For more information, see [Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md).

## <span id="related_topics"></span>Related topics


[Understanding Servicing Strategies](understanding-servicing-strategies.md)

[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[Windows ADK](http://go.microsoft.com/fwlink/p/?linkid=526803)

 

 






