---
author: Justinha
Description: 'Sysprep (System Preparation) Overview'
ms.assetid: f16f9f4e-c897-4a08-8c0f-e9d64043738c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Sysprep (System Preparation) Overview'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sysprep (System Preparation) Overview

**Sysprep** (System Preparation) prepares a Windows installation (Windows client and Windows Server) for imaging, allowing you to capture a customized installation. **Sysprep** removes PC-specific information from a Windows installation, "generalizing" the installation so it can be installed on different PCs. With **Sysprep** you can configure the PC to boot to audit mode, where you can make additional changes or updates to your image. Or, you can configure Windows to boot to the Out-of-Box Experience (OOBE).

Sysprep is part of the Windows image, and is used during audit mode.

## <span id="BKMK_OVER"></span><span id="bkmk_over"></span>Feature description


Sysprep provides the following features:

-   Removes PC-specific information from the Windows image, including the PC’s security identifier (SID). This allows you to capture the image and apply it to other PCs. This is known as generalizing the PC.

-   Uninstalls PC-specific drivers from the Windows image.

-   Prepares the PC for delivery to a customer by setting the PC to boot to OOBE.

-   Allows you to add answer file (unattend) settings to an existing installation.

## <span id="BKMK_APP"></span><span id="bkmk_app"></span>Practical applications


Sysprep helps you solve business goals such as:

-   Helps you manage multiple PCs by creating a generic image that can be used across multiple hardware designs.

-   Deploy PCs by capturing and deploying images with unique security identifiers.

-   Fine-tune setup of individual PCs by adding apps, languages, or drivers in audit mode. For more information, see [Audit Mode Overview](audit-mode-overview.md).

-   Provide more reliable PCs by testing in audit mode before delivering them to customers.

## <span id="BKMK_NEW"></span><span id="bkmk_new"></span>New and changed functionality

Beginning with Windows 10, version 1607, Sysprep can be used to prepare an image that has been upgraded. For example:

- You can start with a computer that runs Windows 10, version 1511 or Windows 10, version 1507.
- Upgrade the computer to run Windows 10, version 1607.
- Run Sysprep generalize on the upgraded image, re-capture the updated image, and deploy the image to new devices.

This process allows enterprises to efficiently and continuously roll out up-to-date Windows 10 deployment images. 

Beginning with Windows 8.1, the Sysprep user interface is deprecated. The Sysprep UI will continue to be supported in this release however it may be removed in a future release. We recommend that you update your deployment workflow to use Sysprep from the command line. For more information, see [Sysprep Command-Line Options](sysprep-command-line-options.md).

## <span id="Dependencies"></span><span id="dependencies"></span><span id="DEPENDENCIES"></span>Dependencies


-   You must run Windows Setup before you use Sysprep.

-   You need a tool to capture an image of the installation, such as [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md) or other disk-imaging software.

**Note**  
When you copy Windows images between PCs, the reference and destination PCs may not have to have compatible hardware abstraction layers (HALs). The /detecthal option in the Boot Configuration Data (BCD) enables a system that has already run Sysprep to install the correct HAL.

 

## <span id="bkmk_4"></span><span id="BKMK_4"></span>Limitations


Sysprep has the following limitations:

-   The security identifier (SID) is only replaced on the operating system volume when you execute Sysprep. If a single PC has multiple operating systems, you must run Sysprep on each image individually.

-   In some cases, customized applications that you install before you recapture the Windows image may require a consistent drive letter. Some applications store paths that include the system's drive letter. Uninstallation, servicing, and repair scenarios may not function correctly if the system's drive letter does not match the drive letter that the application specifies.

-   The Plug and Play devices on the reference and destination PCs do not have to be from the same manufacturer. These devices include modems, sound cards, network adapters, and video cards. However, the installation must include the drivers for these devices.

-   Not all server roles support Sysprep. If you generalize a Windows Server installation that has specific server roles configured, those server roles may not continue to function after the imaging and deployment process. For more information, see [Sysprep Support for Server Roles](sysprep-support-for-server-roles.md).

-   If you run Sysprep on an NTFS file system partition that contains encrypted files or folders, the data in those folders becomes completely unreadable and unrecoverable.

-   The Sysprep tool runs only if the PC is a member of a workgroup, not a domain. If the PC is joined to a domain, Sysprep removes the PC from the domain.

-   If a PC is joined to a domain, and the Group Policy of that domain assigns a strong account password policy to the PC, all user accounts will require strong passwords. Running Sysprep or OOBE does not remove the strong password policy.

    **Warning**  
    If you do not assign a strong password to a user account before you run Sysprep or OOBE, you may not be able to log on to the PC. We recommend that you always use strong passwords for your user accounts.

     

## <span id="bkmk_3"></span><span id="BKMK_3"></span>Unsupported Scenarios


The following scenarios are not supported:

-   Moving or copying a Windows image to a different PC without generalizing the PC is not supported.

-   Using a different version of the Sysprep tool to configure an image is not supported. You must use only the version of the Sysprep tool that is installed with the Windows image that you intend to configure. Sysprep is installed with every version of Windows. You must always run Sysprep from the %WINDIR%\\system32\\sysprep directory.

-   If you are using a version of Windows earlier than Windows 10, Version 1607, using the Sysprep tool on upgrade installation types, or to reconfigure an existing installation of Windows that has already been deployed is not supported. In this case, Sysprep must be used only to configure new installations of Windows. You can run Sysprep an unlimited number of times to build and configure your installation of Windows.

-   Automating Sysprep by using a Microsoft-Windows-Deployment\\[RunSynchronous](http://go.microsoft.com/fwlink/?LinkId=286336) command is not supported. However, you can use the Microsoft-Windows-Deployment\\[Generalize](http://go.microsoft.com/fwlink/?LinkId=286337) setting to prepare the PC for imaging after installation.

-   Running VM mode outside a virtual machine (VM) is unsupported. You cannot use VM mode to prepare a VHD for deployment to any PC.

-   Sysprep cannot be run under the context of a System account. Running Sysprep under the context of System account by using Task Scheduler or PSExec, for example, is not supported.

## <span id="BKMK_LINKS"></span><span id="bkmk_links"></span>See also


The following table contains links to resources related to this scenario.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Content type</th>
<th align="left">References</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Product evaluation</strong></p></td>
<td align="left"><p>[Sysprep Process Overview](sysprep-process-overview.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Operations</strong></p></td>
<td align="left"><p>[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md) | [Customize the Default User Profile by Using CopyProfile](customize-the-default-user-profile-by-using-copyprofile.md) | [Use Answer Files with Sysprep](use-answer-files-with-sysprep.md)</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Tools and settings</strong></p></td>
<td align="left"><p>[Sysprep Command-Line Options](sysprep-command-line-options.md) | [Sysprep Support for Server Roles](sysprep-support-for-server-roles.md)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Related technologies</strong></p></td>
<td align="left"><p>[Windows Setup](http://microsoft.com) | [Audit Mode Overview](audit-mode-overview.md) | [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)</p></td>
</tr>
</tbody>
</table>

 

 

 






