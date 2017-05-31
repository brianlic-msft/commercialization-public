---
author: Justinha
Description: Reduce the Size of the Component Store in an Offline Windows Image
ms.assetid: 2cdff215-30b9-4360-9e2c-cc2c3d695608
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Reduce the Size of the Component Store in an Offline Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Reduce the Size of the Component Store in an Offline Windows Image


You can use the Deployment Image Servicing and Management (DISM) tool to mount a Windows image from a WIM, VHD, or VHDX file and modify it.

## <span id="Analyze_and_clean_up_the_Component_Store__WinSxS_folder__in_an_offline_Windows_image"></span><span id="analyze_and_clean_up_the_component_store__winsxs_folder__in_an_offline_windows_image"></span><span id="ANALYZE_AND_CLEAN_UP_THE_COMPONENT_STORE__WINSXS_FOLDER__IN_AN_OFFLINE_WINDOWS_IMAGE"></span>Analyze and clean up the Component Store (WinSxS folder) in an offline Windows image


To complete the walkthrough, you need the following:

-   A computer running Windows 10, Windows 8.1, Windows 8, Windows 7, Windows Server 2016 Technical Preview, Windows Server 2012 R2, Windows Server 2012, or Windows Server 2008 R2 with the Windows 8.1 version of the Windows ADK tools installed on it.

-   A .wim, .vhd, or .vhdx file of a Windows 10 or Windows Server 2016 Technical Preview image.

**Analyze the size of the Component Store in an offline Windows image**

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

6.  Analyze the size of the component store. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Cleanup-Image /AnalyzeComponentStore
    ```

    To understand the different values provided in the display, see [Determine the Actual Size of the WinSxS Folder](determine-the-actual-size-of-the-winsxs-folder.md).

7.  If the component store cleanup was recommended in the displayed report, then you can start cleanup of the image. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Cleanup-Image /StartComponentCleanup
    ```

8.  You can reduce the size of the component store further by adding the /ResetBase parameter. For example:

    ``` syntax
    Dism /Image:C:\test\offline /Cleanup-Image /StartComponentCleanup /ResetBase
    ```
    
    Beginning with Windows 10, version 1607, you can specify the /Defer parameter with /Resetbase to defer any long-running cleanup operations to the next automatic maintenance. But we highly recommend you **only** use /Defer as an option in the factory where DISM /Resetbase requires more than 30 minutes to complete. 
   
    The maintenance task is scheduled to run weekly, with a two-week deadline.  In the first week, the maintenance task will only run during system idle maintenance windows.  If it is unable to complete (for example, the computer is turned off when not in use) then the task scheduler runs more often, and the task may run while the system is not idle.
 
    To see the performance effects while the task is running, click Start > Run and type the following command:
    
    ```syntax
    Schtasks.exe /Run /I /TN \Microsoft\Windows\Servicing\StartComponentCleanup
    ```
    
9.  Commit the changes and unmounts the image in order to save the changes that you’ve made. For example:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## <span id="related_topics"></span>Related topics


[Manage the Component Store](manage-the-component-store.md)

[Clean Up the WinSxS Folder](clean-up-the-winsxs-folder.md)

[Determine the Actual Size of the WinSxS Folder](determine-the-actual-size-of-the-winsxs-folder.md)

[Where Did My Space Go? (blog post)](http://blogs.technet.com/b/askcore/archive/2013/03/01/where-did-my-space-go.aspx)

[NTFS Metafiles blog post](http://blogs.technet.com/b/askcore/archive/2009/12/30/ntfs-metafiles.aspx)

[How to create and manipulate NTFS junction points](http://support.microsoft.com/kb/205524)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

 

 






