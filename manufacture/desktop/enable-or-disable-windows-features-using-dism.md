---
author: Justinha
Description: Enable or Disable Windows Features Using DISM
ms.assetid: a5280bba-7808-4752-92ca-7605a9ea29f0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Enable or Disable Windows Features Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable or Disable Windows Features Using DISM


The Deployment Image Servicing and Management (DISM) tool is a command-line tool that is used to modify Windows® images. You can use DISM to enable or disable Windows features directly from the command prompt, or by applying an answer file to the image. You can enable or disable Windows features offline on a WIM or VHD file, or online on a running operating system.

## To mount an offline image for servicing

1.  Open a command prompt with administrator privileges.

2.  To use DISM from an installation of the Windows Assessment and Deployment Kit (Windows ADK), locate the Windows ADK servicing folder and navigate to this directory. By default, DISM is installed at C:\\Program Files (x86)\\Windows Kits\\10.0\\Assessment and Deployment Kit\\Deployment Tools\\ in Windows 10, C:\\Program Files (x86)\\Windows Kits\\8.1\\Assessment and Deployment Kit\\Deployment Tools\\ in Windows 8.1and C:\\Program Files (x86)\\Windows Kits\\8.0\\Assessment and Deployment Kit\\Deployment Tools\\ in Windows 8.

    DISM is available in:

    -   Windows 10
    -   Windows 8.1
    -   Windows 8
    -   Windows Server 2016 Technical Preview
    -   Windows Server 2012 R2
    -   Windows Server 2012
    -   Windows Preinstallation Environment (WinPE) for Windows 10
    -   WinPE 5.0
    -   WinPE 4.0

    You can install DISM and other deployment and imaging tools, such as Windows System Image Manager (Windows SIM), on another supported operating system from the Windows ADK. For more information, see [DISM Supported Platforms](dism-supported-platforms.md).

3.  Use the `/Get-ImageInfo` option to retrieve the name or index number for the image that you want to modify. An index or name value is required for most operations that specify an image file.

    For example, at the command prompt type:

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

4.  Mount the offline Windows image. For example, type:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Base Windows Image" /MountDir:C:\test\offline
    ```

## To find available Windows features in an image

1.  List all of the features available in the operating system. For example, type:

    ``` syntax
    Dism /online /Get-Features
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Get-Features
    ```

    You can use `>featurelist.txt` to redirect the output of the command to a text file that is named featurelist.

2.  Review the list of features to find the feature that you want to enable, disable, remove, or restore.

3.  Use `/Get-FeatureInfo` to list information about the specific feature you are interested in. For example, type:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:TFTP
    ```

## To enable Windows features

1.  Enable a specific feature in the image. You can use the `/All` argument to enable all of the parent features in the same command. For example, type:

    ``` syntax
    Dism /online /Enable-Feature /FeatureName:TFTP /All
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Enable-Feature /FeatureName:TFTP /All
    ```

2.  Optional: Get the status of the feature you have enabled. For example, type:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:TFTP
    ```

    If the status is **Enble Pending**, you must boot the image in order to enable the feature entirely.

## To restore removed Windows features

1.  Enable a specific feature in the image. If you do not specify a source, DISM will look in the default location specified by group policy for the required files needed to enable the feature For more information, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md).

    If the files are not found in the default location, DISM will contact Windows Update (WU) for the required files. You can use the `/LimitAccess` argument to prevent DISM from contacting WU.

    If you specify multiple `/Source` arguments, the files are gathered from the first location where they are found and the rest of the locations are ignored.

    For example, type:

    ``` syntax
    Dism /Online /Enable-Feature /FeatureName:TFTP /Source:Z:\sources\SxS /Source:C:\test\mount\windows /LimitAccess
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Enable-Feature /FeatureName:TFTP /Source:C:\test\mount\windows
    ```

2.  Optional: Get the status of the feature you have enabled. For example, type:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:TFTP
    ```

    If the status is **EnablePending**, you must boot the image in order to enable the feature entirely.

## To disable Windows features

1.  Disable a specific feature in the image. For example, type:

    ``` syntax
    Dism /online /Disable-Feature /FeatureName:TFTP
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Disable-Feature /FeatureName:TFTP
    ```

2.  Optional: Use `DISM /GetFeatureInfo` to get the status of the feature you have disabled. For example, type:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:TFTP
    ```

    If the status is **DisablePending**, you must boot the image in order to disable the feature entirely.

## To remove Windows features for on-demand installation

1.  Remove a specific feature in the image without removing the feature's manifest from the image. This option can only be used when servicing Windows 10, Windows 8.1, Windows 8, Windows Server 2016 Technical Preview, Windows Server 2012 R2, or Windows Server 2012. For more information, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md).

    For example, type:

    ``` syntax
    Dism /online /Disable-Feature /FeatureName:TFTP /Remove
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Disable-Feature /FeatureName:TFTP /Remove
    ```

2.  Optional: Use `DISM /GetFeatureInfo` to get the status of the feature you have disabled. For example, type:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:TFTP
    ```

    The status is **Disabled**. Beginning with Windows 10, the payload is not removed from Windows client SKUs in order to support push-button reset. The payload is removed from Windows Server SKUs.

## To enable or disable Windows features by using DISM and an answer file

1.  In Windows SIM, open an existing catalog by clicking **Select a Windows Image** on the **File** menu and specifying the catalog file type (.clg) in the drop-down list, or create a new catalog by clicking **Create Catalog** on the **Tools** menu.

2.  Expand the catalog in the **Windows Image** pane, and then expand **Packages**.

3.  Expand **Foundation**, and right-click **Microsoft-Windows-Foundation-Package**.

4.  Click **Add to Answer File**.

5.  Click **Enabled** or **Disabled** next to the features that you intend to enable or disable. Click the arrow to select the opposite choice.

    You might have to expand an item to see all its children. You must enable the parent if any one of its children are enabled.

    **Note**  
    You can't restore or remove a Windows feature for features on demand with an unattended answer file.

6.  Click **Tools** on the main menu, and then click **Validate Answer File**.

7.  Correct any errors that appear in the **Messages** pane, and save the answer file.

8.  At the command prompt, type the following command to apply the unattended answer file to the image.

    ``` syntax
    Dism /online /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

    To service an offline image, specify the location of the mounted image directory. For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

## To commit changes on an offline image

-   Commit the changes and unmount the image. For example, type:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## <span id="related_topics"></span>Related topics


[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

[DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

[Configure a Windows Repair Source](configure-a-windows-repair-source.md)

 

 






