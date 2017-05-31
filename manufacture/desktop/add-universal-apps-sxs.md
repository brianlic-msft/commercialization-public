---
author: KPacquer
Description: 'Lab 6: Add universal Windows apps, Lab 6: Add universal Windows apps, and taskbar pins'
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 6: Add universal Windows apps, Lab 6: Add universal Windows apps, and taskbar pins'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="Add_apps"></span>Lab 6: Add universal Windows apps, Lab 6: Add universal Windows apps, and taskbar pins

Add apps to your images to support different customer needs. Some have different installation procedures:

-  **Windows universal platform apps (UWP apps)**: These can be added or re-installed using tools described in this topic.

-  **Windows desktop applications**: We'll show you how to add those in [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md).

**Notes** 

- **Add languages before major updates.** Major updates include hotfixes, general distribution releases, or service packs. If you add a language later, you'll need to [reinstall the updates](servicing-the-image-with-windows-updates-sxs.md).

- **Add major updates before apps**. Thes apps include universal Windows apps and desktop applications. If you add an update later, you'll need to  [reinstall the apps](add-universal-apps-sxs.md).

- **There's no longer monthly updates of the inbox apps**. This process changed for Windows 10, version 1607. See the [communication on the MyOEM Portal](https://myoem.microsoft.com/oem/myoem/en/programs/mktg/mda/Pages/COMM-MDAinboxApUpdtRlsPrcssChng.aspx):

  - In the future, Microsoft will release updated versions of the apps only when Microsoft releases full updated versions of Windows.

  - OEMs will need to incorporate the updated apps at the same time they incorporate the broader Windows release.

- **When adding 3rd party apps, follow the [Windows Store OEM Program Guide](https://myoem.microsoft.com/oem/myoem/en/topics/Licensing/roylicres/ost2016/Pages/DP-WindowsStoreOEMProgramGuide2016FinalCL.aspx)**. You must comply with all Store Program terms and conditions, and related documents. 

## <span id="Mount_the_image"></span>Mount the image

**Step 1: Mount the image**

Use the steps from [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) to mount the image. The short version:

1.  Open the command line as an administrator (**Start** > type **deployment** > right-click **Deployment and Imaging Tools Environment** > **Run as administrator**.)

2.  Make a backup of the file (`copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim`)

3.  Mount the image (`md C:\mount\windows`, then `Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize`)

## <span id="Add_or_reinstall_apps"></span>Add/reinstall apps
	
**Step 2: Add/reinstall inbox apps (required whenever adding languages)**

Note, in previous versions, it was required to first remove inbox apps. This is no longer required, and if you do, the commands may fail.

NOTE: For Windows 10 version 1607, app bundles now only contain the dependency packages that pertain to the app. You no longer need to check the prov.xml file for what dependencies to install. Install all dependency packages found in the folder.

1.  Go to <https://microsoftoem.com> and get the supplemental OPK. This package includes the Windows 10, version 1703 inbox apps. 

2.  Extract the package to a folder, for example, E:\apps\amd64.

3.  Add/reinstall the inbox apps. The following example shows you how to reinstall the Get Started inbox app. Repeat these steps for each of the inbox apps (with the exception of AppConnector) by substituting the appropriate package.

    Partial example: 

    ``` syntax
    Dism /Add-ProvisionedAppxPackage /Image:c:\mount\windows /PackagePath:e:\apps\amd64\Microsoft.3DBuilder_8wekyb3d8bbwe.appxbundle /LicensePath:e:\apps\amd64\Microsoft.3DBuilder_8wekyb3d8bbwe.xml /DependencyPackagePath:e:\apps\amd64\Microsoft.VCLibs.x64.14.00.appx /DependencyPackagePath:e:\apps\amd64\Microsoft.VCLibs.x86.14.00.appx
    ```

    For full examples, see [sample scripts](windows-deployment-sample-scripts-sxs.md#Reinstall_Windows_inbox_apps).

**Step 3: Add/reinstall other apps, example: Microsoft Universal Office Apps**

Get the latest version of the app. In our example, we install Microsoft Universal Office Apps, though you can install any UWP app using this procedure. 

1.  Go to <https://microsoftoem.com> and get the latest version of the Office Mobile supplemental OPK. This guide uses X20-98485 Office Mobile Multilang v1.3 OPK. 

    **Note**: Install either Office Single Image (either with or with out perpetual or subscription license) or Office Mobile (not both). Office Mobile must be used on devices with screen size of 10.1” and below, and Office Single Image must be used on devices with screen sizes above 10.1”. For devices that have a single fixed storage drive with less than 32 GB, OEMs may preinstall Office Mobile, regardless of the screen size. To learn more, see [Office Mobile Communication](https://myoem.microsoft.com/oem/myoem/en/product/office/Pages/COMM-OfficeUnvrslAppsOPKRlsTmng.aspx).

2.  Extract the package to a folder, for example, e:\Universal_Office.

3.  Add/reinstall Microsoft Universal Office Apps:

    ``` syntax
    Dism /Add-ProvisionedAppxPackage /Image:"c:\mount\windows" /packagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Excelim.appxbundle_Windows10_PreinstallKit\1b0569bd5fbd41d6bf0669beb013073c.appxbundle" /dependencypackagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Excelim.appxbundle_Windows10_PreinstallKit\Microsoft.VCLibs.140.00_14.0.22929.0_x86__8wekyb3d8bbwe.appx" /licensepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Excelim.appxbundle_Windows10_PreinstallKit\1b0569bd5fbd41d6bf0669beb013073c_License1.xml"

    Dism /Add-ProvisionedAppxPackage /Image:"c:\mount\windows"  /packagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Pptim.appxbundle_Windows10_PreinstallKit\7f255062294a415a974b4958961df056.appxbundle" /dependencypackagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Pptim.appxbundle_Windows10_PreinstallKit\Microsoft.VCLibs.140.00_14.0.22929.0_x86__8wekyb3d8bbwe.appx" /licensepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Pptim.appxbundle_Windows10_PreinstallKit\7f255062294a415a974b4958961df056_License1.xml"

    Dism /Add-ProvisionedAppxPackage /Image:"c:\mount\windows" /packagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Wordim.appxbundle_Windows10_PreinstallKit\532f710ca9d34f0aae6af4abe0af0592.appxbundle" /dependencypackagepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Wordim.appxbundle_Windows10_PreinstallKit\Microsoft.VCLibs.140.00_14.0.22929.0_x86__8wekyb3d8bbwe.appx" /licensepath:"e:\Universal_Office\PC_TH1_store.16.0.6228.1011.Wordim.appxbundle_Windows10_PreinstallKit\532f710ca9d34f0aae6af4abe0af0592_License1.xml"
    ```

    Where the PackagePath points to the app bundle package.

**Step 4: Start Menu**

Note the app IDs, you'll need these later in [Lab 13: Add universal Windows apps and taskbar pins](add-start-tiles-sxs.md).

**Step 5: Unmount the images**

1.  Close all applications that might access files from the image.

2.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

    where *C* is the drive letter of the drive that contains the image.

    This process may take several minutes.

## <span id="Try_it_out"></span>Try it out

**Step 6: Apply the image to a new PC**
Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the Windows image and the recovery image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).
	
**Step 7: Verify apps**
1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  Check the Start Menu to make sure the apps are available.

Next step: [Lab 7: Change settings, enter product keys, and run scripts with an answer file (unattend.xml)](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md)