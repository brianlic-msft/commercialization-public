---
author: Justinha
Description: 'What''s New in Windows PE'
ms.assetid: db434eb7-ef16-4edc-af6a-f0057c86a56e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'What''s New in Windows PE'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# What's New in Windows PE


This topic describes the new and changed functionality of the Windows Preinstallation Environment (Windows PE/WinPE) and compares it with previous versions of Windows PE and MS-DOS.

## <span id="New_and_Changed_Functionality"></span><span id="new_and_changed_functionality"></span><span id="NEW_AND_CHANGED_FUNCTIONALITY"></span>New and Changed Functionality


This table compares the features and functionality with those of previous versions of Windows PE:

<table>
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Windows PE for Windows 10</th>
<th align="left">Windows PE 5.0</th>
<th align="left">Windows PE 4.0</th>
<th align="left">Windows PE 3.x</th>
<th align="left">Windows PE 2.x</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Operating systems deployed</p></td>
<td align="left"><p>Windows 10, Windows 8.1, Windows Server 2012 R2, Windows 8, Windows Server 2012, Windows 7, or Windows Server 2008 R2.</p></td>
<td align="left"><p>Windows 8.1, Windows Server 2012 R2, Windows 8, Windows Server 2012, Windows 7, or Windows Server 2008 R2.</p>
<p>Doesn’t support: Windows Vista or Windows Server 2008.</p></td>
<td align="left"><p>Windows 8, Windows Server 2012, Windows 7, Windows Server 2008 R2, Windows Vista, or Windows Server 2008.</p></td>
<td align="left"><p>Windows 7, Windows Server 2008 R2, Windows Vista, or Windows Server 2008.</p></td>
<td align="left"><p>Windows Vista or Windows Server 2008</p></td>
</tr>
<tr class="even">
<td align="left"><p>Scripts used to deploy Windows PE</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>CopyPE updated for use with the Windows ADK.</p>
<p>MakeWinPEMedia added to make creation of USB flash drives or ISO files easier.</p></td>
<td align="left"><p>CopyPE and Oscdimg tools included.</p></td>
<td align="left"><p>CopyPE and Oscdimg tools included.</p>
<p>Windows PE 2.1: Oscdimg tool updated to support larger images.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Scripting tools</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>.NET Framework optional component renamed to WinPE_NetFx.</p>
<p>PowerShell optional component renamed to WinPE_PowerShell.</p>
<p>Winpeshl.ini allows you to launch apps with command-line parameters in quotes. For more info, see [Winpeshl.ini Reference: Launching an app when WinPE starts](winpeshlini-reference-launching-an-app-when-winpe-starts.md).</p></td>
<td align="left"><p>.NET Framework 4.5 optional component added (WinPE_NetFx4).</p>
<p>PowerShell 3.0 optional component added (WinPE_PowerShell3).</p></td>
<td align="left"><p>Command-line scripting tools included.</p></td>
<td align="left"><p>Command-line scripting tools included.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Image capturing and servicing tools</p></td>
<td align="left"><p>DISM supports Windows 10 and Windows Imaging and Configuration Designer (ICD) features.</p></td>
<td align="left"><p>DISM supports Windows 8.1 and Windows Server 2012 R2 images but doesn’t support Windows Vista or Windows Server 2008 images. For more info, see [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md).</p></td>
<td align="left"><p>Image capturing tools included with new <code>dism /Capture-image</code> and <code>dism /Apply-image</code> commands.</p>
<p>Doesn't support servicing Windows 8.1 or Windows Server 2012 R2 images.</p></td>
<td align="left"><p>[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md) added. DISM is a command-line tool that you can use to customize a Windows or a Windows PE image.</p>
<p>The PEImg and Pkgmgr tools are not supported in Windows PE 3.0.</p>
<p>ImageX available as an optional application for capturing and applying images.</p>
<p>Doesn't support servicing Windows 8.1 or Windows Server 2012 R2 images.</p></td>
<td align="left"><p><strong>PEImg</strong> is used to service Windows PE images.</p>
<p>After you run <strong>PEImg /prep</strong> against the Windows PE 2.0 image, the image can't be modified.</p>
<p>ImageX is available as an optional application for capturing and applying images.</p>
<p><strong>Pkgmgr</strong> is used to install, remove, or update Windows packages in offline images.</p>
<p>Doesn't support servicing Windows 8.1 or Windows Server 2012 R2 images.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Optimizing Windows PE</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>The profiling feature is removed.</p>
<p>The default amount of scratch space is 512 MB for PCs that have more than 1 GB of RAM.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Smaller default size. The Windows PE 3.0 default image contains only the minimum resources to support most deployment scenarios. You can add optional components by using Deployment Image Servicing and Management (DISM).</p>
<p>The new <code>dism /apply-profiles</code> command allows you to further reduce the contents of a Windows PE 3.0 image to only those files necessary to support a given set of apps.</p></td>
<td align="left"><p>Windows PE 2.1: Supports booting directly from the hard disk, not into RAM disk.</p>
<p>Windows PE 2.1: Writable RAM drive: when booting from read-only media, Windows PE automatically creates a writable RAM disk (drive X) and allocates 32 megabytes (MB) of the RAM disk for general-purpose storage. You can customize the size, in megabytes, by using <strong>PEImg /scratchspace</strong>. Valid values are 32, 64, 128, 256, and 512.</p></td>
</tr>
<tr class="even">
<td align="left"><p>File management</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>File Management optional component added for discovering and restoring deleted files from unencrypted volumes.</p></td>
<td align="left"><p>Windows PE 3.1: base image contains improvements that are related to 4k/512e drive support.</p></td>
<td align="left"><p>No 4k/512e drive support.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Memory</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Maximum supported:</p>
<ul>
<li><p>x86: 64 GB</p></li>
<li><p>x64: 4 TB</p></li>
</ul></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Maximum supported:</p>
<ul>
<li><p>x86: 4 GB</p></li>
<li><p>x64: 128 GB</p></li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><p>Virtualization</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Windows PE 3.0 includes all Hyper-V drivers except display drivers. This enables Windows PE to run in Hypervisor. Supported features include mass storage, mouse integration, and network adapters.</p></td>
<td align="left"><p>Not supported.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Networking</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Optional Remote Network Driver Interface Specification (RNDIS) feature added for enabling network devices that implement the RNDIS specification over USB.</p></td>
<td align="left"><p>The Windows PE 3.1 base image contains RNDIS binaries.</p>
<p>Windows PE 3.0: [Hotfix](http://support.microsoft.com/kb/972831) available for 802.1X (LAN) support.</p>
<p>Windows PE 3.1 includes 802.1X binaries as an optional component. The file name of this package is WinPE-Dot3Svc.cab.</p></td>
<td align="left"><p>Supports IPv4 and IPv6. Doesn't support other protocols, like Internetwork Packet Exchange/Sequenced Packet Exchange (IPX/SPX).</p>
<p>Windows PE 2.1: [Hotfix](http://support.microsoft.com/kb/975483) available for 802.1X (LAN) support.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Recovery</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>WinRE Configuration utility added (winrecfg.exe) to support configuring Windows RE in an offline operating system.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Supports Windows Recovery Environment (Windows RE).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Security</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Secure Startup optional component added for provisioning and managing BitLocker and the Trusted Platform Module.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Supports BitLocker and Trusted Platform Module.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Architectures</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Supports x86, x64, and ARM-based PCs.</p></td>
<td align="left"><p>No change.</p></td>
<td align="left"><p>Supports x86, x64, and Itanium-based PCs.</p></td>
</tr>
</tbody>
</table>

 

To see which version of Windows PE you’re running, type `regedit` and locate this registry key: **HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\WinPE**.

## <span id="Comparison_with_MS-DOS"></span><span id="comparison_with_ms-dos"></span><span id="COMPARISON_WITH_MS-DOS"></span>Comparison with MS-DOS


Windows PE is similar to MS-DOS. It also includes support for the following features:

-   The NTFS 5.*x* file system, including dynamic volume creation and management.

-   TCP/IP networking and file sharing (client only).

-   32-bit or 64-bit Windows device drivers.

-   A subset of the Windows application programming interface (API).

-   CD, DVD, and USB flash drives.

-   Windows Deployment Services server.

-   Image management and servicing (DISM).

-   Hyper-V drivers (all drivers except for display drivers). This enables Windows PE to run in a hypervisor. Supported features include mass storage, mouse integration, and network adapters.

-   Optional support for PowerShell, Windows Management Instrumentation (WMI), Windows Data Access Components (Windows DAC), and HTML Applications (HTAs).

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

 

 






