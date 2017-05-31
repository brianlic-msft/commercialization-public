---
author: Justinha
Description: Add or Remove Packages Offline Using DISM
ms.assetid: 32785116-e5ed-40ae-8802-9c2a67cd9938
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add or Remove Packages Offline Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add or Remove Packages Offline Using DISM


Deployment Image Servicing and Management (DISM.exe) is a command-line tool that is used to update offline Windows® images. There are two ways to install or remove packages offline with DISM. You can either apply an unattend answer file to the offline image, or you can add or remove the package directly from the command prompt.

If you are installing multiple packages to a Windows image, and there are dependency requirements, the best way to ensure the correct order of the installation is by using an answer file. You can use DISM to apply the Unattend.xml answer file to the image. When you use DISM to apply an answer file, the unattend settings in the **offlineServicing** configuration pass are applied to the Windows image.

You must install the latest version of the Windows Assessment and Deployment Kit (Windows ADK), which contains all of the tools that are required, including DISM.

## To add packages to an offline image by using DISM

1.  At an elevated command prompt, locate the Windows ADK servicing folder, and type the following command to retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

    An index or name value is required for most operations that specify an image file.

2.  Type the following command to mount the offline Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows 7 HomeBasic" /MountDir:C:\test\offline
    ```

3.  At a command prompt, type the following command to add a specific package to the image. You can add multiple packages on one command line. They will be installed in the order listed in the command line.

    ``` syntax
    Dism /Image:C:\test\offline /Add-Package /PackagePath:C:\packages\package1.cab /PackagePath:C:\packages\package2.cab
    ```

4.  At a command prompt, type the following command to commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## To remove packages from an offline image by using DISM

1.  At an elevated command prompt, locate the Windows ADK servicing folder, and type the following command to retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

    An index or name value is required for most operations that specify an image file.

2.  Type the following command to mount the offline Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows 7 HomeBasic" /MountDir:C:\test\offline
    ```

3.  Optional: Type the following command to list the packages in the image.

    ``` syntax
    Dism /Image:C:\test\offline /Get-Packages
    ```

    You can use `>featurelist.txt` to redirect the output of the command to a text file that is named FeatureList.

4.  Review the list of packages that are available in your mounted image and note the package identity of the package.

5.  At a command prompt, specify the package identity to remove it from the image. You can remove multiple packages on one command line.

    ``` syntax
    DISM /Image:C:\test\offline /Remove-Package /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0 /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~x86~~6.1.6801.0
    ```

    You can use the **/PackagePath** option to point to the original source of the package, or to specify the path to the .cab file, or you can use the **/PackageName** option to specify the package by name as it is listed in the image. For more information, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

6.  At a command prompt, type the following command to commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## To add or remove packages offline by using DISM and an answer file

1.  Open Windows SIM.

2.  To add a new package, click **Insert** on the main menu, and select **Package(s)**. Browse to the package you want to add, and then click **Open**.

3.  To remove an existing package, select the package in the **Answer file** pane that you want to remove. In the **Properties** pane, change the **Action** property to **Remove**.

    **Note**  
    The packages must be added to the **offlineServicing** configuration pass.

4.  Validate and save the answer file.

5.  At an elevated command prompt, locate the Windows ADK servicing folder, and then type the following command to retrieve the name or index number for the image that you want to mount.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

6.  Type the following command to mount the offline Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /name:"Windows 7 HomeBasic" /MountDir:C:\test\offline
    ```

    An index or name value is required for most operations that specify an image file.

7.  At a command prompt, type the following command to apply the unattended answer file to the image.

    ``` syntax
    DISM /Image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

8.  At a command prompt, type the following command to commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

For more information about Windows SIM, see [Windows Setup Technical Reference](windows-setup-technical-reference.md).

## <span id="related_topics"></span>Related topics


[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

[DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

 

 






