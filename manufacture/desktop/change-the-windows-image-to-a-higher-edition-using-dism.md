---
author: Justinha
Description: Change the Windows Image to a Higher Edition Using DISM
ms.assetid: 754e7ef2-85fe-4b45-94d7-d7bd1db6eaa1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Change the Windows Image to a Higher Edition Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Change the Windows Image to a Higher Edition Using DISM


You can use the Windows® edition-servicing commands to change one edition of Windows to a higher edition of Windows. The edition packages for each potential target edition are staged in the Windows image. This is referred to as an edition-family image. You can use the command-line options to list potential target editions. Because the target editions are staged, you can service a single image, and the updates will be applied appropriately to each edition in the image.

You need a product key to change the Windows edition online. Offline changes do not require a product key. If you change the image to a higher edition using offline servicing, you can add the product key by using one of the following methods:

-   Enter the product key during the out-of-box experience (OOBE).

-   Use an unattended answer file to enter the product key during the **specialize** configuration pass.

-   Use Deployment Image Servicing and Management (DISM) and the Windows edition-servicing command-line option **/Set-ProductKey** after you set the edition offline.

For more information about product keys, see [Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md).

## <span id="Find_and_Change_Current_Edition_of_Windows"></span><span id="find_and_change_current_edition_of_windows"></span><span id="FIND_AND_CHANGE_CURRENT_EDITION_OF_WINDOWS"></span>Find and Change Current Edition of Windows


You can find the edition of Windows your image is currently set to by mounting the image and running DISM commands on the mounted image.

**To find the current edition**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  At the command prompt, type the following command to retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images
    ```

3.  Type the following command to mount the offline Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images /Index:1 /MountDir:C:\test\offline
    ```

    An index or name value is required for most operations that specify an image file.

4.  Type the following command to find the edition of Windows your image is currently set to.

    ``` syntax
    Dism /Image:C:\test\offline /Get-CurrentEdition
    ```

    Note which edition of Windows your image is currently set to. If the image has already been changed to a higher edition you should not change it again. We recommend that you use the lowest edition as a starting point.

5.  Unmount the image or continue with the next procedure. To unmount your image, type the following command.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

**To change to a higher edition of Windows**

1.  Type the following command to mount the offline Windows image (if it is not already mounted).

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images /Name:<Image_name> /MountDir:C:\test\offline
    ```

2.  Type the following command to find the editions of Windows that you can change your image to.

    ``` syntax
    Dism /Image:C:\test\offline /Get-TargetEditions
    ```

    Note the edition-ID for the edition you want to change to.

    **Note**  
    You cannot set a Windows image to a lower edition. The lowest edition will not appear when you run the **/Get-TargetEditions** option. You should not use this procedure on an image that has already been changed to a higher edition.

     

3.  Type the following command specifying the edition-ID to change the Windows image to a higher edition.

    ``` syntax
    Dism /Image:C:\test\offline /Set-Edition:Professional
    ```

4.  Type the following command to unmount the image and commit your changes.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## <span id="related_topics"></span>Related topics


[Understanding Servicing Strategies](understanding-servicing-strategies.md)

[DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

 

 






