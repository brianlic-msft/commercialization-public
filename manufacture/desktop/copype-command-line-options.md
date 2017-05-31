---
author: Justinha
Description: 'Copype Command-Line Options'
ms.assetid: 3342c1d4-7dff-4e0b-ab86-1f28d5057f12
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Copype Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Copype Command-Line Options


The **Copype** tool creates a working directory that contains a standard set of Windows Preinstallation Environment (Windows PE) files. You use these files to customize images and (together with the **Makewinpemedia** script) to create bootable media. For more information, see [Makewinpemedia Command-Line Options](makewinpemedia-command-line-options.md).

## <span id="Copype_Command-Line_Options"></span><span id="copype_command-line_options"></span><span id="COPYPE_COMMAND-LINE_OPTIONS"></span>Copype Command-Line Options


**Copype** uses the following command-line options.

**Copype.cmd** architecture WorkingDirectory

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Command-line option</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><em>architecture</em></p></td>
<td align="left"><p>Copies the boot files and the Windows PE base image (Winpe.wim) to <em>&lt;WorkingDirectory&gt;</em>\Media.</p>
<p>Values include <strong>amd64</strong>, <strong>x86</strong>, or <strong>arm</strong>.</p>
<p>The x86 version of Windows PE can boot 32-bit UEFI, 32-bit BIOS, or 64-bit BIOS-based PCs.</p>
<p>The amd64 version of Windows PE can boot either 64-bit BIOS-based or 64-bit UEFI-based PCs.</p>
<p>The arm version of Windows PE can boot ARM-based PCs.</p>
<p>For more information about running Windows PE on PCs with different architectures, see [Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md).</p></td>
</tr>
<tr class="even">
<td align="left"><p><em>WorkingDirectory</em></p></td>
<td align="left"><p>Specifies the name of the working directory where <strong>Copype</strong> creates the directory structure and copies the Windows PE files. For example:</p>
<pre class="syntax" space="preserve"><code>copype amd64 C:\winpe_amd64</code></pre>
<p><strong>Copype</strong> creates the following directory structure.</p>
<pre class="syntax" space="preserve"><code>&lt;WorkingDirectory&gt;
&lt;WorkingDirectory&gt;\media
&lt;WorkingDirectory&gt;\mount</code></pre>
<p>When <strong>Copype</strong> copies the Windows PE base image to the <em>&lt;WorkingDirectory&gt;</em>\Media\Sources folder, it renames the base image from Winpe.wim to Boot.wim.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[Makewinpemedia Command-Line Options](makewinpemedia-command-line-options.md)

 

 






