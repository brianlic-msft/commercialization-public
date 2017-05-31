---
title: Preinstallable apps for desktop devices
description: Learn how to add an app to a Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) image that will be available to customers at first boot.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 047A9971-29C1-402A-8671-C36272EC511B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preinstallable apps for desktop devices


## To add a preinstalled app to a desktop image


You will need to use the Windows Assessment and Deployment Kit (ADK) to pre-install Windows Store apps in your desktop images. [Download the Windows ADK](http://go.microsoft.com/fwlink/p/?LinkId=526740).

## Request a preinstallation package


Once an app has been added to the Dev Center, you can request a preinstallation package for it. If you are the OEM adding this application to your OS image, you would ask the developer of the application to do this on your behalf. They would then give you the downloaded zip file. You cannot access their developer account directly.

1.  From the dashboard in Dev Center, select the app that is to be preinstalled. If it is a new app, click **Create new app**.
2.  Select **manage published** packages
3.  Select **Request package** for OS preinstallation
4.  A confirmation dialog will appear, noting that apps preinstalled on an OS prior to Windows 10 must be free. Select **Enable**.
5.  Find the correct package for the targeted OS and download by selecting **Download** or **Generate package**.
6.  Once ready the link will change to **Download**.
7.  Zip file is ready for inclusion in OS image.

## <a href="" id="add-the-app-to-the-os-image-"></a>Add the app to the OS image


In Windows 10, applications are consider Assets, which are configurable customizations that are not settings. You can add them using DISM, which is part of the Windows Assessment and Deployment Kit (ADK). [Download the Windows ADK](http://go.microsoft.com/fwlink/p/?LinkId=526740)

**Add the preinstalled app to the image using DISM**

1.  Open the Deployment Tools Command Prompt, installed with the Windows Assessment and Deployment Kit (ADK), with administrator privileges. From the Windows Start screen, type **Deployment and Imaging Tools Environment**, right-click the icon, and select **Run as Administrator** from the menu bar at the bottom of the screen.
2.  Mount the offline image for servicing. At the command prompt, type:

    `Dism /Mount-Image /ImageFile:c:\images\myimage.wim /Index:1 /mountdir:c:\test\offline`

3.  Add the app to the mounted image. Use the `/PackagePath` option and the `/DependencyPackagePath` option to specify the location of the folder containing all of the unpacked files and the dependency files from the Store package. `/PackagePath` should specify the root folder for the extracted folders. The root folder contains the license.xml, AUMIDs.txt, and all of the package files. At the command prompt, type:

    `Dism /Image:c:\test\offline /Add-ProvisionedAppxPackage /PackagePath:c:\downloads\appxpackage /DependencyPackagePath:c:\downloads\appxpackagedependency`

4.  Save changes and unmount the image. At the command prompt, type:

    `Dism /Unmount-Image /mountdir:c:\test\offline /commit`

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_preinstall\p_preinstall%5D:%20Preinstallable%20apps%20for%20desktop%20devices%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




