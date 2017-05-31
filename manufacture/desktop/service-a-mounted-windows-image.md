---
author: Justinha
Description: Service a Mounted Windows Image
ms.assetid: fbfd9166-f522-4c73-a866-7d97cab32ed8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Service a Mounted Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Service a Mounted Windows Image


You can use the Deployment Image Servicing and Management (DISM) tool to mount a Windows image from a WIM or VHD file and modify it. In the first part of this walkthrough, you add a language pack, configuring international settings and enable Windows features. In the second part, you remove a package, and then upgrade the Windows image to a higher edition of Windows®.

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete the walkthrough, you need the following:

-   A computer that has the Windows ADK tools installed on it.

-   A .wim, .vhd, or .vhdx file to update.

-   Language packs, or other packages to add and remove from the image.

## <span id="Procedures"></span><span id="procedures"></span><span id="PROCEDURES"></span>Procedures


### <span id="Step_1__Mount_an_Image_with_Read_Write_Permissions"></span><span id="step_1__mount_an_image_with_read_write_permissions"></span><span id="STEP_1__MOUNT_AN_IMAGE_WITH_READ_WRITE_PERMISSIONS"></span>Step 1: Mount an Image with Read/Write Permissions

In this step, you mount a Windows image to a specified directory, so that it is available for servicing.

1.  Copy a .wim file, a .vhd, or a .vhdx that contains a Windows image, to the local drive. For example, C:\\test\\images.

2.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

3.  Create a folder for your mounted image. For example, C:\\test\\offline.

4.  Run the **DISM /Get-ImageInfo** command to retrieve the name or index number for the image that you want to update. For example:

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\MyImage.wim
    ```

5.  Mount the Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\MyImage.wim /Index:1 /MountDir:C:\test\offline
    ```

    Since WIM files can contain one or more images, you must specify an index or name value. To mount an image from a VHD, you must specify `/Index:1`.

### <span id="Step_2__Add_Packages_to_the_Image"></span><span id="step_2__add_packages_to_the_image"></span><span id="STEP_2__ADD_PACKAGES_TO_THE_IMAGE"></span>Step 2: Add Packages to the Image

In this step, you add packages to the mounted Windows image.

1.  At an elevated command prompt, add packages to the mounted Windows image. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Add-Package /PackagePath:C:\test\packages\package1.cab /PackagePath:C:\test\packages\package2.cab
    ```

2.  If you added a language pack, you can change all international language settings in the mounted offline image by typing the following command:

    ``` syntax
    Dism /Image:C:\test\offline /Set-SKUIntlDefaults:fr-FR
    ```

    Optionally, you can configure different values for different settings, including UI language, system locale, user locale, input locale, and others. For more information about how to specify individual values for each of these settings, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

3.  At the command prompt, commit the changes. The image remains mounted until the **/Unmount-Image** option is used. For example:

    ``` syntax
    Dism /Commit-Image /MountDir:C:\test\offline
    ```

### <span id="Step_3__Remove_a_Package_from_the_Mounted_Image"></span><span id="step_3__remove_a_package_from_the_mounted_image"></span><span id="STEP_3__REMOVE_A_PACKAGE_FROM_THE_MOUNTED_IMAGE"></span>Step 3: Remove a Package from the Mounted Image

In this step, you review the packages that have been installed in your image, and then remove a specific package from the image.

1.  At an elevated command prompt, find the names of the packages that are in your image. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Get-Packages
    ```

    If the list of packages is extensive, you can output the information to a text file. For example, you can add `>C:\PackageList.txt` to the end of the command line.

2.  Review the list of packages that are available in your mounted image, and note the package identity of the package.

3.  At a command prompt, specify the package identity of a package and remove it from the mounted image. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Remove-Package /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
    ```

### <span id="Step_4__Upgrade_to_a_Higher_Edition_of_Windows"></span><span id="step_4__upgrade_to_a_higher_edition_of_windows"></span><span id="STEP_4__UPGRADE_TO_A_HIGHER_EDITION_OF_WINDOWS"></span>Step 4: Upgrade to a Higher Edition of Windows

All of the changes that you make are also applied to each potential target edition of Windows. Each target edition is staged in the image. The changes will not be lost when you upgrade to a higher edition of Windows. For more information, see [DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md).

1.  At an elevated command prompt, list the editions that are available for the upgrade. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Get-TargetEditions
    ```

    Note the target edition ID.

2.  At the command prompt, specify the edition that you want to upgrade to. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Set-Edition:Ultimate
    ```

End users can use Windows Anytime Upgrade to remove files related to lower editions of Windows that are not being used.

### <span id="Step_5__Reduce_the_Size_of_the_Image"></span><span id="step_5__reduce_the_size_of_the_image"></span><span id="STEP_5__REDUCE_THE_SIZE_OF_THE_IMAGE"></span>Step 5: Reduce the Size of the Image

In this step, you'll reduce the footprint of the image by cleaning up superseded components to reduce the size of the component store, and also by resetting the base of superseded components, which can further reduce the component store size.

-   At an elevated command prompt, run the following command to reduce the size of the image file:

    ``` syntax
    Dism /Image:C:\test\offline /cleanup-image /StartComponentCleanup /ResetBase 
    ```

### <span id="Step_6__Commit_the_Changes_and_Unmount_the_Image"></span><span id="step_6__commit_the_changes_and_unmount_the_image"></span><span id="STEP_6__COMMIT_THE_CHANGES_AND_UNMOUNT_THE_IMAGE"></span>Step 6: Commit the Changes and Unmount the Image

In this step, you unmount the image and save the changes that you have made.

-   At an elevated command prompt, unmount the image and commit the changes to the image file. For example:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## <span id="Next_Step"></span><span id="next_step"></span><span id="NEXT_STEP"></span>Next Step


This walkthrough illustrates the basic offline servicing of a mounted Windows image. All the changes were made to a single image, and persisted when the image was upgraded. The updated image is ready to be deployed. Because you copied the image file to the local hard disk drive, you can delete the original image file from the server. You can replace it with this new one, or keep a copy of the older version for reference.

For more information about additional offline servicing operations that can be performed on an offline image, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="related_topics"></span>Related topics


[Understanding Servicing Strategies](understanding-servicing-strategies.md)

[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

 

 






