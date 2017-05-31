---
author: Justinha
Description: 'Deploy .NET Framework 3.5 by using Deployment Image Servicing and Management (DISM)'
ms.assetid: c21b1e0f-d480-4f51-99d1-d5f7acba3a4a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Deploy .NET Framework 3.5 by using Deployment Image Servicing and Management (DISM)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy .NET Framework 3.5 by using Deployment Image Servicing and Management (DISM)


You can use the Deployment Image Servicing and Management (DISM) command-line tool to create a modified image to deploy .NET Framework 3.5.

**Important**  
For images that will support more than one language, you must add .NET Framework 3.5 binaries before adding any language packs. This order ensures that .NET Framework 3.5 language resources are installed correctly in the reference image and available to users and applications.

 

**In this topic:**

-   [Using DISM with Internet connectivity](#internet)

-   [Using DISM with no Internet connectivity](#nointerent)

## <span id="internet"></span><span id="INTERNET"></span>Using DISM with Internet connectivity


### <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements

-   Internet connection

-   Access to Windows Update. If the PC or server is behind a firewall or uses a proxy server, see [KB900935 - How the Windows Update client determines which proxy server to use to connect to the Windows Update Web site](http://support.microsoft.com/kb/900935).

-   Windows 8, Windows Server® 2012, or the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/p/?linkid=325506) tools.

-   Installation media

-   Administrator user rights. The current user must be a member of the local Administrators group to add or remove Windows features.

### <span id="For_an_online_reference_image_that_can_access_Windows_Update"></span><span id="for_an_online_reference_image_that_can_access_windows_update"></span><span id="FOR_AN_ONLINE_REFERENCE_IMAGE_THAT_CAN_ACCESS_WINDOWS_UPDATE"></span>For an online reference image that can access Windows Update

1.  Open a command prompt with administrator user rights (Run as Administrator) in Windows 8 or Windows Server 2012.

2.  To Install .NET Framework 3.5 feature files from Windows Update, use the following command:

    ``` syntax
    DISM /Online /Enable-Feature /FeatureName:NetFx3 /All 
    ```

    Use */All* to enable all parent features of the specified feature. For more information on DISM arguments, see [Enable or Disable Windows Features Using DISM](http://go.microsoft.com/fwlink/p/?linkid=259118).

3.  On Windows 8 PCs, after installation .NET Framework 3.5 is displayed as enabled in **Turn Windows features on or off** in Control Panel. For Windows Server 2012 systems, feature installation state can be viewed in Server Manager.

### <span id="For_an_offline_reference_image"></span><span id="for_an_offline_reference_image"></span><span id="FOR_AN_OFFLINE_REFERENCE_IMAGE"></span>For an offline reference image

1.  Run the following DISM command (image mounted to the **c:\\test\\offline** folder and the installation media in the **D:**\\drive) to install .NET 3.5:

    ``` syntax
    DISM /Image:C:\test\offline /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:D:\sources\sxs
    ```

    Use */All* to enable all parent features of the specified feature.

    Use */LimitAccess* to prevent DISM from contacting Windows Update/WSUS.

    Use */Source* to specify the location of the files that are needed to restore the feature.

    To use DISM from an installation of the Windows ADK, locate the Windows ADK servicing folder and navigate to this directory. By default, DISM is installed at **C:\\Program Files (x86)\\Windows Kits\\8.0\\Assessment and Deployment Kit\\Deployment Tools\\**. You can install DISM and other deployment and imaging tools, such as Windows System Image Manager (Windows SIM), on another supported operating system from the Windows ADK. For information about DISM-supported platforms, see [DISM Supported Platforms](http://go.microsoft.com/fwlink/p/?LinkId=698536).

2.  Run the following command to look up the status of .NET Framework 3.5 (offline image mounted to **c:\\test\\offline**):

    ``` syntax
    DISM /Image:c:\test\offline /Get-Features /Format:Table
    ```

    A status of **Enable Pending** indicates that the image must be brought online to complete the installation.

### <span id="nointerent"></span><span id="NOINTERENT"></span>Using DISM with no Internet connectivity

You can use DISM to add .NET Framework 3.5 and provide access to the **\\sources\\SxS** folder on the installation media to an installation of Windows® that is not connected to the Internet.

### <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements

-   Windows 8, Windows Server 2012, or the [Windows ADK](http://go.microsoft.com/fwlink/p/?linkid=325506) tools.

-   Installation media

-   Administrator user rights. The current user must be a member of the local Administrators group to add or remove Windows features.

### <span id="Steps"></span><span id="steps"></span><span id="STEPS"></span>Steps

1.  Open a command prompt with administrator user rights (Run as Administrator) in Windows 8 or Windows Server 2012.

2.  To install .NET Framework 3.5 from installation media located on the **D:** drive, use the following command:

    ``` syntax
    DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:d:\sources\sxs
    ```

    Use */All* to enable all parent features of the specified feature.

    Use */LimitAccess* to prevent DISM from contacting Windows Update/WSUS.

    Use */Source* to specify the location of the files that are needed to restore the feature.

    For more information on DISM arguments, see [Enable or Disable Windows Features Using DISM](http://go.microsoft.com/fwlink/p/?linkid=259118).

On Windows 8 PCs, after installation, .NET Framework 3.5 is displayed as enabled in **Turn Windows features on or off** in Control Panel.

## <span id="related_topics"></span>Related topics


[Microsoft .NET Framework 3.5 Deployment Considerations](microsoft-net-framework-35-deployment-considerations.md)

 

 






