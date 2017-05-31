---
title: Distribution Shares and Configuration Sets Overview
description: Distribution Shares and Configuration Sets Overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9281b886-bc80-4f77-96b9-6ff87e1ba60d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Distribution Shares and Configuration Sets Overview


A distribution share is an optional set of folders that contain custom scripts, images, branding, applications, drivers, and other files. These files can be copied to Windows® during installation through an answer file (Unattend.xml).

During installation, Windows connects to the path of the server share by using the credentials that you specify in an answer file. Only the files that you specify in the answer file are copied to the Windows installation.

If you are installing Windows in an environment that does not have a network share or server share, you can copy the necessary files from the distribution share to a configuration set. A configuration set is a subset of the files in a distribution share. You can copy a configuration set to external storage, such as a USB flash drive or an external hard disk, to use during installation.

## Folders in a Distribution Share


When you create a distribution share by using Windows System Image Manager (Windows SIM), three folders are created automatically. The folders are named **$OEM$ Folders**, **Out-of-Box Drivers**, and **Packages**. If you create your own distribution share, it must contain at least one of these folders for Windows SIM to recognize it as a valid distribution share.

### <a href="" id="-oem--folders"></a>**$OEM$ Folders**

You can use the **$OEM$ Folders** folder and subfolders only when you are creating configuration sets. You can use **$OEM$ Folders** to include logos for branding and to add applications and other files that customize the unattended installation.

As a general rule, to add new files and resources to Windows, use a data image. For more information, see [How to Create a Data Image](http://go.microsoft.com/fwlink/?LinkId=224962).

For more information about how to use **$OEM$ Folders**, see [How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963).

**Important**  
Do not overwrite existing files that are carried and serviced by the operating system. Using **$OEM$ Folders** to update or overwrite these files can cause the operating system to behave unpredictably and cause serious issues.

 

The following table describes the support for **$OEM$ Folders** and its subfolders.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Folder</th>
<th>Definition</th>
<th>Supported</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>$OEM$ Folders</strong></p></td>
<td><p>Contains all supplemental folders and files for an automated or customized installation.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\Textmode</strong></p></td>
<td><p>Contains updated mass-storage drivers and hardware abstraction layer (HAL) files that the text-mode part of Setup requires.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p><strong>$OEM$ Folders\$$</strong></p></td>
<td><p>Contains files that Windows Setup copies to the <strong>%WINDIR%</strong> folder (for example, <strong>C:\Windows</strong>) during installation.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\$$\Help</strong></p></td>
<td><p>Contains custom Help files that Windows Setup copies to the <strong>%WINDIR%\Help</strong> folder during installation.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p><strong>$OEM$ Folders\$$\System32</strong></p></td>
<td><p>Contains files that Windows Setup copies to the <strong>%WINDIR%\System32</strong> folder during installation.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\$1</strong></p></td>
<td><p>Represents the root of the drive on which you installed Windows (also called the boot partition), and contains files that Windows Setup copies to the boot partition during installation.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>$OEM$ Folders\$1\</strong><em>Pnpdrivers</em></p></td>
<td><p>Contains new or updated Plug and Play (PnP) drivers. You specify the folder name in the Unattend.xml file for unattended installations. For example, you might name this folder <strong>$OEM$ Folders\$1\Pnpdrvs</strong>.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\$1\SysPrep</strong></p></td>
<td><p>Contains files that are used for <strong>Sysprep</strong>-based installation.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p><strong>$OEM$ Folders\$Docs</strong></p></td>
<td><p>Contains files that Windows Setup copies to <strong>%DOCUMENTS_AND_SETTINGS%</strong> during installation.</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\$Progs</strong></p></td>
<td><p>Contains programs that Windows Setup copies to the <strong>%PROGRAM_FILES%</strong> folder during installation.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p><strong>$OEM$ Folders\$Progs\Internet Explorer</strong></p></td>
<td><p>Contains the settings file to customize Windows Internet Explorer®.</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p><strong>$OEM$ Folders\</strong><em>drive_letter</em>\<em>subfolder</em></p></td>
<td><p>A subfolder of the drive that contains files that Windows Setup copies to the subfolder during installation. Multiple instances of this type of folder can exist under the <strong>$OEM$ Folders\</strong><em>drive_letter</em> folder, for example, <strong>$OEM$ Folders\D\MyFolder</strong>.</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

 

### Out-of-Box Drivers

Drivers are a type of software that enables hardware or devices to function.

The **Out-of-Box Drivers** folder includes additional device drivers that you install during Windows Setup by using Windows SIM. Windows Setup uses the following types of drivers:

-   **In-box drivers**.

    Windows Setup handles in-box drivers the same way that it handles packages.

-   **Out-of-box drivers**.

    By using Windows SIM, you can add out-of-box device drivers that are based on .inf files. Typically, these out-of-box drivers are processed during the **auditSystem** configuration pass. Your .inf-based out-of-box drivers must be in a distribution-share subfolder that is called Out-of-Box Drivers. For more information, see [How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963).

-   **In-box drivers that are installed via a .msi file.**

    In-box drivers that require a .msi file are added the same way that applications are added.

    **Note**  
    By using the **Microsoft-Windows-PnpCustomizationsWinPE** component, you must add boot-critical device drivers that are required for installation during the **windowsPE** configuration pass. For more information, see [How to Add Device Drivers by Using Windows Setup](http://go.microsoft.com/fwlink/?LinkId=224975). You can also add device drivers to an offline image by using Deployment Image Servicing and Management (**DISM**). For more information, see [How to Add and Remove Drivers Offline](http://go.microsoft.com/fwlink/?LinkId=224967).

     

### Packages

The **Packages** folder is a location for Windows software updates. Package types include service packs, security updates, language packs, and other packages that Microsoft issues. You must use Windows SIM to import packages to a distribution share. After a package is imported and available in the **Distribution Share** pane, you can add the package to the answer file. For more information, see [How to Add Packages to a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=225111).

## Configuration Sets


After an answer file (**Unattend.xml**) has been validated and saved, you can create a configuration set. A configuration set is a subset of a distribution share that you can create by using Windows SIM. Configuration sets are useful when a network share is not available. You can store configuration sets on removable media and use them in the field. Creating a configuration set exports binaries that are referenced in the answer file and puts them together in a self-contained file set that can be accessed from the Unattend.xml file.

### Contents of a Configuration Set

A configuration set contains a complete collection of files, drivers, applications, patches, and answer files that are used to customize Windows installations. A configuration set contains all the required binaries, which are packaged with an associated answer file (**Unattend.xml**).

### Benefits of Configuration Sets

Using configuration sets for unattended installations provides the following benefits:

-   A configuration set is a smaller and more portable version of a distribution share, which can have a size of several gigabytes. You can use configuration sets to install Windows operating systems while you are in the field.

-   Configuration sets are completely self-contained and have no references outside the file set.

-   You can duplicate a configuration set and then edit it for each computer model that you manufacture and release.

**Important**  
If a configuration set is used during Windows Setup, all the contents at the root of the media where the answer file exists are copied to the Windows installation. Having many files and folders at the same level as the answer file might slow down installation. In some cases, you might run out of disk space.

 

## Security Considerations for Distribution Shares and Configuration Sets


Your distribution shares and configuration sets contain private data. The following are recommendations for improving security for distribution shares and configuration sets:

-   Restrict access to the contents of distribution shares. Depending on your environment, you can change the access control lists (**ACLs**) or permissions on a distribution share. Only approved accounts should have access to distribution shares.

-   Keep applications and device drivers updated with the latest fixes and patches.

## Related topics


[How to Create or Open a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=225113)

[How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963)

[How to Add Packages to a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=225111)

[Windows SIM Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214570)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Distribution%20Shares%20and%20Configuration%20Sets%20Overview%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





