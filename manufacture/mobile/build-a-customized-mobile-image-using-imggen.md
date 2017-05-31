---
Description: 'You can use two different tools to build a customized mobile image (FFU image) in Windows 10:'
ms.assetid: c29e417c-90a5-4928-b416-aa940efe68ab
MSHAttr: 'PreferredLib:/library'
title: Build a mobile image using ImgGen
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Build a mobile image using ImgGen


You can use two different tools to build a customized mobile image (FFU image) in Windows 10:

-   Using ImgGen.cmd, which is a command file that runs the classic imaging tool, ImageApp.exe. This tool was also available earlier releases of Windows 10 Mobile including Windows Phone 8.1 and the various GDRs.

-   Using the Windows Imaging and Configuration Designer (ICD) command-line interface, which is new for Windows 10.

In this walkthrough, we'll show how to use ImgGen.cmd to build the custom mobile image. In another walkthrough, we'll go through how to create another mobile image that includes the customizations we've done so far in addition to other customizations available only through Windows Provisioning by using the Windows ICD CLI.

**To build a customized image using ImgGen**

1.  Open a **Developer Command Prompt for VS2015** window as an administrator.

2.  If you are running Windows 8.1, complete the following steps to set the USN journal registry size to 1 Mb on your development PC. Otherwise, skip to the next step.

    1.  Change the USN minimum size registry key by running the following command:

        **reg add HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\FileSystem /v NtfsAllowUsnMinSize1Mb  /t REG\_DWORD  /d 1**

    2.  Reboot the PC before proceeding to the next step.

3.  Run ImgGen.cmd by using the following command.

    **ImgGen** *TestFlash.ffuContosoTestOEMInput.xml* **"%WPDKCONTENTROOT%\\MSPackages"** *MobileCustomizations.xml 10.0.0.1*

    This command will build an image that will be called TestFlash.ffu.

    **Note**  This command assumes you've gone through the rest of the walkthroughs in this section. For more information about the command-line syntax for ImgGen.cmd, see Using *ImgGen.cmd to generate the image* in [Build a mobile image using ImgGen.cmd](https://msdn.microsoft.com/library/windows/hardware/dn756630).

     

Once the image is built, you'll need to sign it so it can be flashed to a mobile device.

 

 



