---
author: Justinha
Description: 'What is DISM?'
ms.assetid: ad08e68c-616f-404a-bfc6-c7bf1a4666f0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'What is DISM?'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# What is DISM?


Deployment Image Servicing and Management (DISM.exe) is a command-line tool that can be used to service and prepare Windows images, including those used for [Windows PE](winpe-intro.md), [Windows Recovery Environment (Windows RE)](windows-recovery-environment--windows-re--technical-reference.md) and [Windows Setup](windows-setup-technical-reference.md). DISM can be used to service a Windows image (.wim) or a virtual hard disk (.vhd or .vhdx).

DISM is available through the command line or from Windows PowerShell. To learn more about using DISM with PowerShell, see [Deployment Imaging Servicing Management (DISM) Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=393917).

## <span id="BKMK_reqs"></span><span id="bkmk_reqs"></span><span id="BKMK_REQS"></span>Image Requirements


DISM can be used to mount and service a Windows image from a .wim file, .vhd file, or a .vhdx file or, in some cases, to update a running operating system. It can be used with older Windows image files (.wim files). However, it cannot be used with Windows images that are more recent than the installed version of the Windows Assessment and Deployment Kit (Windows ADK) in which DISM is distributed. DISM is also installed with the Windows 10, Windows 8.1 and Windows 8 operating systems.

For a complete technical description of WIM, see the [Windows Imaging File Format (WIM) white paper](http://go.microsoft.com/fwlink/?LinkId=92227).

DISM can be used to service the following operating systems:

-   Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)
-   Windows Server 2016
-   Windows 8.1
-   Windows 8
-   Windows Server 2012 R2
-   Windows Server 2012
-   Windows 7
-   Windows Server 2008 R2
-   Windows Server 2008 SP2
-   Windows PE for Windows 10
-   Windows PE 5.0
-   Windows PE 4.0
-   Windows Preinstallation Environment (Windows PE) 3.0
-   [Windows Recovery Environment (Windows RE)](windows-recovery-environment--windows-re--technical-reference.md)

**Note**   DISM cannot mount a Windows image from a VHD on Windows Vista® with Service Pack 1 (SP1) or Windows Server 2008. You must attach the VHD using the DiskPart tool before you can use DISM to service the image. When you service VHD images that have been attached using the DiskPart tool, the changes are automatically committed with each operation and cannot be discarded.

 

For a list of the supported platforms and architecture types, see [DISM Supported Platforms](dism-supported-platforms.md).

## <span id="BKMK_benefits"></span><span id="bkmk_benefits"></span><span id="BKMK_BENEFITS"></span>Benefits


You can use DISM with .wim files to:

-   Capture and apply Windows images.
-   Append and delete images in a .wim file.
-   Split .wim files into several smaller files.

You can use DISM with .wim, .vhd, or .vhdx files to:

-   Add, remove, and enumerate packages, drivers, languages.
-   Enable or disable Windows features.
-   Apply changes based on the **offlineServicing** section of an Unattend.xml answer file.
-   Configure international settings.
-   Upgrade a Windows image to a different edition.
-   Prepare a Windows PE image.
-   Provide detailed logs for troubleshooting.
-   Service earlier versions of Windows such as Windows 8.x, Windows 7, Windows Server 2008 R2, Windows Vista.
-   Service all platforms (32-bit, 64-bit).
-   Service a 32-bit image from a 64-bit host, and service a 64-bit image from a 32-bit host. For more information, see the "Limitations" section later this topic.
-   Make use of old Package Manager scripts.

## <span id="BKMK_common"></span><span id="bkmk_common"></span><span id="BKMK_COMMON"></span>Common Servicing and Management Scenarios


Image servicing and management solutions fall into two main categories:

-   Managing the data or information included in the Windows image, such as enumerating or taking an inventory of the components, updates, drivers, or applications that are contained in an image, capturing or splitting an image, appending or deleting images within a .wim file, or mounting an image.
-   Servicing the image itself, including adding or removing driver packages and drivers, modifying language settings, enabling or disabling Windows features, and upgrading to a higher edition of Windows.

Here are some common scenarios for image servicing and management:

<table>
<colgroup>
<col width="100%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"><strong>Tasks</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Capture an image and save it as a .wim file.</p></td>
</tr>
<tr class="even">
<td align="left"><p>List all images within a .wim, .vhd, or .vhdx file.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Manage several images in a single .wim file by appending, removing, or enumerating the images.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Prepare a Windows PE image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>List information about a Windows PE image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mount a Windows image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>List specific information about an image mounted from a .wim, .vhd, or .vhdx file, including where it is mounted, the mount status, and the index of each image in a .wim file.</p></td>
</tr>
<tr class="even">
<td align="left"><p>List all drivers in an image or information about a specific driver.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Add out-of-box or boot-critical drivers to support new hardware.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Add operating-system updates such as hotfixes and Windows features.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Add or remove a language pack, and configure international settings.</p></td>
</tr>
<tr class="even">
<td align="left"><p>List all international settings and languages in an image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Troubleshooting through integrated status and logging.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Manage multiple image versions.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>List all features in a package or specific information about a Windows feature.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Check the applicability of a Windows® Installer.msp file.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Update multiple Windows editions by updating a single image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Upgrade to a higher edition of Windows.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>List all of the Windows editions that an image can be upgraded to.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Apply settings in an Unattend.xml answer file.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Split a large .wim file into several smaller files to fit on selected media.</p></td>
</tr>
</tbody>
</table>

 

## <span id="BKMK_limitations"></span><span id="bkmk_limitations"></span><span id="BKMK_LIMITATIONS"></span>Limitations


**Version compatibility.** DISM can be used with target images of older Windows operating systems, but not with target images of operating systems that are more recent than the installed version of the Windows ADK in which DISM is distributed. For example, DISM from Windows 10, version 1511 can service Windows 10, version 1511 and version 1507 but not version 1607. To learn more, see [DISM Supported Platforms](dism-supported-platforms.md).

**Remote installation.** Installing packages to a remote computer over a network is not supported. The Windows image must be present on the local system. DISM can access packages on a network share, but it must copy them to a temporary, writable directory (called a *scratch directory*). We recommend that you use a unique scratch directory on a local drive for each package you install. The contents of the scratch directory can be deleted after installation.

**Answer files.** When you specify an answer file (Unattend.xml) for an image, only the settings specified in the **offlineServicing** configuration pass are applied. All other settings in the answer file are ignored. For more information, see [DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

**Service Packs.** Service packs must be installed online with the Windows Update Standalone installer. For more information about Windows Update Standalone Installer, see [Description of the Windows Update Standalone Installer in Windows](http://go.microsoft.com/fwlink/?LinkId=90850).

**Use an answer file to ensure package dependencies.** Some packages require other packages to be installed first. Because of this dependency requirement, you should use an answer file if you are installing multiple packages. By applying an answer file by using DISM, multiple packages can be installed in the correct order. This is the preferred method for installing multiple packages.

**Package installation order.** Packages are installed in the order that they are listed in the command line. In the following example, 1.inf, 2.inf, and 3.inf will be installed in the order in which they are listed in the command line.

``` syntax
DISM.exe /image:"c:\images\Image1" /Add-Driver /ForceUnsigned /DriverName:"C:\Drivers\1.inf" /DriverName:"C:\Drivers\2.inf" /DriverName:"C:\Drivers\3.inf"
```

**Supported servicing commands are dynamic.** The commands and options that are available for servicing an image depend on which Windows operating system you are servicing, and whether the image is offline or a currently running operating system.

**Multiple unattend files are not supported.** You can specify more than one driver or package on a command line. However, multiple Unattend.xml answer files are not supported. Only a single answer file may be specified on any command line.

**Multiple servicing commands are not supported.** You can specify multiple drivers (1.inf, 2.inf) or packages, but you cannot specify multiple commands (such as **/Add-Driver** **/Remove-Driver** or **/Add-Driver** **/Add-Package**) on the same command line.

**Logging to a network share.** When you use a computer that is not joined to a network domain, use **net use** with domain credentials to set access permissions before you specify the path for the DISM log that is stored on a network share.

**Wildcards.** Wildcards are not supported in DISM command lines.

**Do not install a language pack after an update.** If you install an update (hotfix, general distribution release \[GDR\], or service pack \[SP\]) that contains language-dependent resources before you install a language pack, the language-specific changes that are contained in the update are not applied. Always install language packs before you install updates.

## <span id="related_topics"></span>Related topics


[DISM Reference (Deployment Image Servicing and Management)](dism-reference--deployment-image-servicing-and-management.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md)

[Language Packs](language-packs-and-windows-deployment.md)

[Understanding Servicing Strategies](understanding-servicing-strategies.md)

 

 






