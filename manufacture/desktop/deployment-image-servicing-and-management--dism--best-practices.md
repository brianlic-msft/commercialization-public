---
author: Justinha
Description: 'Deployment Image Servicing and Management (DISM) Best Practices'
ms.assetid: b9629ef4-9b4f-47c4-8eca-d2469cfcbd9b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Deployment Image Servicing and Management (DISM) Best Practices'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deployment Image Servicing and Management (DISM) Best Practices


This section describes some best practices related to servicing a Windows® image. We recommend that you implement these practices wherever possible.


## <span id="BKMK_elevate"></span><span id="bkmk_elevate"></span><span id="BKMK_ELEVATE"></span>Elevate Permissions for Command-Line Tools


Many deployment command-line tools, including Deployment Image Servicing and Management (DISM), require elevated permissions.

Make sure that you have elevated permissions. Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

This must be done even if you are logged on as an administrator.

## <span id="BKMK_av"></span><span id="bkmk_av"></span><span id="BKMK_AV"></span>Disable Antivirus Tools


Some DISM commands may be blocked by antivirus or antimalware tools. Before servicing an image, disable antivirus or antimalware tools on the technician computer.

## <span id="BKMK_servicing"></span><span id="bkmk_servicing"></span><span id="BKMK_SERVICING"></span>Servicing an Image


The best way to service a Windows image is offline with the DISM tool. DISM can be used to install, uninstall, configure, and update drivers, features, and packages in Windows images and Windows Preinstallation Environment (WinPE) images without booting the image. For more information, see [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md).

You can use the **/Commit-Image** option at any point during servicing to save the changes that you have made so far. You can recover a corrupted image more easily with the **/Cleanup-Image /RestoreHealth** option if you have committed your changes often.

You can mount and modify multiple images on a single computer. However, performance may slow down on some functions, such as **/Unmount-Image**, depending on the memory available on the computer. As a best practice, you should not mount more than 20 images at the same time.

**Note**  
If you have split a .wim file into smaller files for spanning across multiple media, you cannot mount the image for servicing.

 

## <span id="BKMK_intl"></span><span id="bkmk_intl"></span><span id="BKMK_INTL"></span>Changing International Settings


To change the international settings in Windows 10, Windows 8.1, Windows 8, Windows Server 2016 Technical Preview, Windows Server 2012 R2, Windows Server 2012, Windows 7, and Windows Server 2008 R2 images, you must use DISM. For more information, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

## <span id="BKMK_log"></span><span id="bkmk_log"></span><span id="BKMK_LOG"></span>Use Log Files


DISM will log verbose information to %WINDIR%\\Logs\\Dism\\Dism.log by default. You can also specify a name and location of your choice for the log file, and set the **/loglevel** parameters so that only the information you are interested in is logged. When an error occurs, the console will display the error code, error message, and the location of the log file.

**Important**  
If you specify a log path on a network share from a computer that is not joined to a domain, use net-use with domain credentials to set access permissions before you set the log path for the DISM log.

 

The log file will automatically be archived. The archived log file will be saved with .bak appended to the file name, and a new log file will be generated. Each time the log file is archived, the .bak file will be overwritten.

The log file gives you the history of the operations that have been performed, which can help you troubleshoot problems.

## <span id="BKMK_pkg"></span><span id="bkmk_pkg"></span><span id="BKMK_PKG"></span>Package Locations


Do not put a package that you intend to install directly at the root of a partition on a Windows installation.

## <span id="NetShare"></span><span id="netshare"></span><span id="NETSHARE"></span>Storing Files on a Network Share


Although DISM supports network paths for images and packages, most operations will perform faster on files that are copied to the local hard-drive.

## <span id="BKMK_PE"></span><span id="bkmk_pe"></span>Servicing a Windows Image from WinPE


You can service Windows images from WinPE. However, you must consider certain factors while planning your servicing strategy. Review the following requirements for servicing an image from WinPE.

### <span id="Booting_WinPE_from_a_Hard_Drive"></span><span id="booting_winpe_from_a_hard_drive"></span><span id="BOOTING_WINPE_FROM_A_HARD_DRIVE"></span>Booting WinPE from a Hard Drive

For better performance, you can allocate additional memory when you boot WinPE from a hard disk drive. You can also create temporary folders to store update files to accommodate large updates.

### <span id="Add_Page-File_Support_to_Your_WinPE_Image"></span><span id="add_page-file_support_to_your_winpe_image"></span><span id="ADD_PAGE-FILE_SUPPORT_TO_YOUR_WINPE_IMAGE"></span>Add Page-File Support to Your WinPE Image

Make sure you have sufficient memory to load and run your custom WinPE image. In addition to the image size, you should have at least 256 MB of available working memory. If you have limited memory, define a page file (Pagefile.sys) to improve memory management. For more information on implementing a page file, see [Wpeutil Command-Line Options](wpeutil-command-line-options.md).

### <span id="Create_a_Temporary_Directory_in_Which_to_Store_Update_Files"></span><span id="create_a_temporary_directory_in_which_to_store_update_files"></span><span id="CREATE_A_TEMPORARY_DIRECTORY_IN_WHICH_TO_STORE_UPDATE_FILES"></span>Create a Temporary Directory in Which to Store Update Files

You should use the **/ScratchDir** option with DISM to create a temporary directory on a different drive when you create or service a Windows image. A temporary directory is used for many DISM operations including capturing an image, installing language packs, installing updates, or installing or removing Windows features in a Windows image. Some files are expanded to this temporary directory before they are applied to a Windows image.

There must be sufficient space in the partition to accommodate large updates. The specific size of the free space that is required depends on the size of the updates that you intend to install. When adding a language pack, the scratch directory must have at least 1 GB of space for temporary files.

If you do not set a temporary directory path using the **/ScratchDir** option, WinPE creates a 32-MB temporary directory by default. You can allocate additional temporary storage to this default location using the DISM **/Set-ScratchSpace** option. Valid sizes include 32, 64, 128, 256, and 512 MB. This feature is available only offline and you cannot adjust this setting while a WinPE session is running. As a best practice, you should use the **/ScratchDir** option to instead specify a directory on another partition that has sufficient space to support any image management and servicing operations you perform.

After installation is complete, the contents of this directory are no longer needed and can be deleted. For more information, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

### <span id="Booting_WinPE_from_a_CD-ROM_DVD"></span><span id="booting_winpe_from_a_cd-rom_dvd"></span><span id="BOOTING_WINPE_FROM_A_CD-ROM_DVD"></span>Booting WinPE from a CD-ROM/DVD

Servicing a Windows image requires additional temporary storage space. For WinPE RAM disks, you might need additional RAM. In addition to the RAM requirements of your WinPE image, additional RAM is required to process updates. The amount of RAM that is required depends on the size of the updates that you intend to apply. Ensure that your computer has sufficient RAM.

## <span id="BKMK_verify"></span><span id="bkmk_verify"></span><span id="BKMK_VERIFY"></span>Scan for Corruption and Verify the Integrity of System Files


Before you deliver a computer to an end user, you should verify the integrity of Windows system files. You can use the **/Cleanup-Image** option to identify file corruption and perform repair operations on the image. For more information about the **/Cleanup-Image** option in DISM, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

You can also use System File Checker (Sfc.exe) on an online or offline reference image. System File Checker is released with all versions of Windows.System File Checker requires elevated permissions, and you must be an Administrator to run it. It scans all protected files to verify the file versions. To verify only the integrity of the Windows system files, run the **sfc.exe /verifyonly** option. For complete command-line syntax, at an elevated command prompt, type **sfc.exe /?**.

Running Sfc.exe can take a significant amount of time. The expected result is that there are no system integrity violations. However, if there are problems with Windows system files, you should investigate the issues. We do not recommend that you use the Sfc.exe scan options to automatically fix Windows system files.

## <span id="Security"></span><span id="security"></span><span id="SECURITY"></span>Improving Security for Windows Images


Your Windows images contain custom configuration data, custom applications, and other intellectual property. There are several ways to improve the security of your Windows images, both online and offline.

-   **Restrict access to Windows images**. Depending on your environment, you can edit the access control lists (ACLs) or permissions on a file. Only approved accounts can have access to Windows images.

-   **Update your Windows images with the latest fixes and software updates**. There are many ways you can service a Windows image. After servicing your Windows image, test the validity and stability of the computer.

-   **During Windows installation, configure the computer to automatically download and install Windows updates**. This extends installation time, but ensures that the Windows image that you are installing contains the latest updates. For more information, see the `DynamicUpdate` setting in the Microsoft-Windows-Setup component in the **Unattended Windows Setup Reference**.

## <span id="related_topics"></span>Related topics


[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[Understanding Servicing Strategies](understanding-servicing-strategies.md)

 

 






