---
author: KPacquer
Description: Customize Windows RE
ms.assetid: ce94e3c4-03f6-46d1-b2a8-cc5d75c7a66d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Customize Windows RE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customize Windows RE


You can customize Windows Recovery Environment (Windows RE) by adding languages, packages drivers, and custom diagnostic or troubleshooting tools.

The WinRE image is included inside the Windows 10 and Windows Server 2016 images, and is eventually copied to the Windows RE tools partition on the destination PC or device. To modify it, you'll mount the Windows image, then mount the WinRE image inside it. Make your changes, unmount the WinRE image, then unmount the Windows image. 

   ![image: Mount the Windows image, then mount the recovery image inside it. Make changes, then unmount the recovery image, and finally the Windows image](images/customize-recovery-image.jpg)

We recommend that when you update your Windows images with languages and boot-critical drivers, update the Windows RE image at the same time.

This topic also gives optional steps to optimize the Windows RE image after updating it.

   
## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete this walkthrough, you need the following:

-   A technician computer with the Windows Assessment and Deployment Kit (ADK) installed.
-   The Windows image (install.wim). This can be from the Windows installation media or from a reference image.

## <span id="BKMK_ExtractImage"></span><span id="bkmk_extractimage"></span><span id="BKMK_EXTRACTIMAGE"></span>Step 1: Mount the Windows and Windows RE image

**Mount the images**

1.  Open the **Deployment and Imaging Tools Environment** command prompt as an administrator:

    Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator** &gt; **Yes**.

2.  Mount the Windows base image for editing.

    ``` syntax
    md C:\mount\windows

    Dism /Mount-Image /ImageFile:C:\mount\install.wim /Index:1 /MountDir:C:\mount\windows
    ```

3.  Mount the Windows RE image for editing.

    ``` syntax
    md C:\mount\winre 

    Dism /Mount-Image /ImageFile:c:\mount\windows\windows\system32\recovery\winre.wim /Index:1 /MountDir:C:\mount\winre
    ```

    **Note**   The Windows RE image should always be index number 1.

     

## <span id="BKMK_AddLanguagePacks"></span><span id="bkmk_addlanguagepacks"></span><span id="BKMK_ADDLANGUAGEPACKS"></span>Step 2: Adding languages


When you add languages to Windows RE, you need to add the base language pack and the corresponding language packs for each of the Windows PE optional components in the Windows RE tools image.

Starting with Windows 10, Version 1607 and Windows Server 2016, the base language pack and optional component language packs required to customize Windows RE are included in the Language Pack DVDs for Windows 10 and Windows Server 2016. The Windows PE language packs in the Windows 10 ADK should not be used to customize Windows RE.

**Note**  
To ensure a consistent language experience in recovery scenarios, add the same set of languages to the Windows RE image that you add to the Windows image.

We recommend adding no more than ten language packs to a Windows or Windows RE image. Multiple language packs increase the size of the Windows image and also affect the overall performance of a system during deployment and servicing.

 

**To add language packs**

1.  List the Windows PE optional components in the Windows RE tools image:

    ``` syntax
    Dism /Get-Packages /Image:C:\mount\winre
    ```

2.  Review the resulting list of packages, and then add the corresponding language packs for each package in the image, including the base Windows PE language pack, but not including **WinPE-WiFi-Package**.

    The following code shows how to add the French (fr-fr) language pack to the base Windows PE image, and then to each of the optional components that are present in the default Windows RE image:

    ``` syntax
    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Rejuv_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-EnhancedStorage_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Scripting_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SecureStartup_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SRT_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WDS-Tools_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WMI_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-StorageWMI_fr-fr.cab"

    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-HTA_fr-fr.cab"
    ```

    The **WinPE-WiFi-Package** is not language-specific and does not need to be added when adding other languages.

3.  If you're adding language packs for Japan, Korea, or China, add the font packages for these languages. Here's an example for Japan:

    ``` syntax
    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Font Support-JA-JP.cab"
    ```

    To learn more, see [WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md).

4.  To save space and speed up the recovery process, remove unneeded languages. Reverse the order to avoid problems with dependencies.

    Note, the **WinPE-WiFi-Package** is not language specific and should not be removed.

    ``` syntax
    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-HTA_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-StorageWMI_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-WMI_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-WDS-Tools_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-SRT_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-SecureStartup_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-Scripting_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-EnhancedStorage_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-Rejuv_en-us.cab"

    Dism /Remove-Package /Image:C:\mount\winre /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\lp.cab"
    ```

## <span id="BKMK_AddDrivers"></span><span id="bkmk_adddrivers"></span><span id="BKMK_ADDDRIVERS"></span>Step 3: Adding boot-critical drivers


Make sure that you add any third-party drivers that your reference device requires to boot, such as storage or video drivers. If you add boot-critical drivers to a Windows image using Windows Imaging and Configuration Designer (ICD), they'll be added to the Windows RE image inside that Windows image.

**Add a boot-critical driver**

1.  If necessary, unzip or unpack the driver file from your device manufacturer.
2.  Identify the driver setup (.inf) file, and add it.

    ``` syntax
    Dism /Image:C:\mount\winre /Add-Driver /Driver:"C:\SampleDriver\driver.inf" 
    ```

    where *C:\\SampleDriver\\driver.inf* is the location of the .inf file.

## <span id="BKMK_AddCustomTools"></span><span id="bkmk_addcustomtools"></span><span id="BKMK_ADDCUSTOMTOOLS"></span>Step 4: Adding a custom tool


You can add a custom troubleshooting or diagnostic tool to your Windows RE image. To learn more, see [Add a Custom Tool to the Windows RE Boot Options Menu](add-a-custom-tool-to-the-windows-re-boot-options-menu.md).

## <span id="BKMK_AddUpdates"></span><span id="bkmk_addupdates"></span><span id="BKMK_ADDUPDATES"></span>Step 5: Adding Windows updates


Occasionally, a Windows update may require you to update the Windows RE image.

-   Add the Windows update package, for example, C:\\MSU\\Windows8.1-KB123456-x64.msu.

    ``` syntax
    Dism /Add-Package /PackagePath:C:\MSU\Windows8.1-KB123456-x64.msu /Image:C:\mount\winre /LogPath:AddPackage.log
    ```

## <span id="Step_6__Optimizing_the_image__part_1__optional_"></span><span id="step_6__optimizing_the_image__part_1__optional_"></span><span id="STEP_6__OPTIMIZING_THE_IMAGE__PART_1__OPTIONAL_"></span>Step 6: Optimizing the image, part 1 (optional)

After adding a language or Windows update package, you can reduce the size of the final Windows RE package by checking for duplicate files and marking the older versions as superseded.

1.  Optimize the image:

    ``` syntax
    Dism /Image:c:\mount\winre /Cleanup-Image /StartComponentCleanup /ResetBase
    ```

2.  Later, you'll export the image to remove the superseded files.

## <span id="BKMK_SaveImage"></span><span id="bkmk_saveimage"></span><span id="BKMK_SAVEIMAGE"></span>Step 7: Unmount the WinRE image


-   Unmount and save the image:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\winre /Commit
    ```

## <span id="Step_8__Optimizing_the_image__part_2__optional_"></span><span id="step_8__optimizing_the_image__part_2__optional_"></span><span id="STEP_8__OPTIMIZING_THE_IMAGE__PART_2__OPTIONAL_"></span>Step 8: Optimizing the image, part 2 (optional)


If you've optimized the image, you'll need to export the image in order to see a change in the file size. During the export process, DISM removes files that were superseded.

1.  Export the Windows RE image into a new Windows image file.

    ``` syntax
    Dism /Export-Image /SourceImageFile:c:\mount\windows\windows\system32\recovery\winre.wim /SourceIndex:1 /DestinationImageFile:c:\mount\winre-optimized.wim
    ```

2.  Replace the old Windows RE image with the newly-optimized image.

    ``` syntax
    del c:\mount\windows\windows\system32\recovery\winre.wim

    copy c:\mount\winre-optimized.wim c:\mount\windows\windows\system32\recovery\winre.wim
    ```

## <span id="BKMK_UnmountWindows"></span><span id="bkmk_unmountwindows"></span><span id="BKMK_UNMOUNTWINDOWS"></span>Step 9: Unmount the Windows image


Save your changes back into the Windows base image.

-   Unmount the base Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\windows /Commit
    ```

## <span id="Next_Steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next Steps


If you’re deploying Windows using **Windows Setup**, update the other Windows images inside the base Windows file (Install.wim).

If you’re deploying your reference image by using **Windows PE**, **Diskpart**, and **DISM**, then continue to [Deploy Windows RE](deploy-windows-re.md).

## <span id="related_topics"></span>Related topics


[Add a Custom Tool to the Windows RE Boot Options Menu](add-a-custom-tool-to-the-windows-re-boot-options-menu.md)

[Deploy Windows RE](deploy-windows-re.md)

[Deploy Push-Button Reset Features](deploy-push-button-reset-features.md)

[REAgentC Command-Line Options](reagentc-command-line-options.md)
