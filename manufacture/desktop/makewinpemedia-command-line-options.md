---
author: Justinha
Description: 'Makewinpemedia Command-Line Options'
ms.assetid: b3fc26e8-96a0-4fca-9678-ac895835b7e0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Makewinpemedia Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Makewinpemedia Command-Line Options


The **Makewinpemedia** tool is new for Windows 8. You can use **Makewinpemedia** to create bootable Windows Preinstallation Environment (Windows PE) media. Running the **Copype** tool is a prerequisite for creating bootable media. **Copype** creates a directory structure for Windows PE files and copies the necessary Windows PE media files. For more information, see [Copype Command-Line Options](copype-command-line-options.md) and [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

## <span id="Makewinpemedia_Command-Line_Options"></span><span id="makewinpemedia_command-line_options"></span><span id="MAKEWINPEMEDIA_COMMAND-LINE_OPTIONS"></span>Makewinpemedia Command-Line Options


The **Makewinpemedia** tool uses the following command-line options.

**Makewinpemedia** {*/ufd* | */iso*} \[*/f*\] *&lt;WorkingDirectory&gt; &lt;DestinationLocation&gt;*

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
<td align="left"><p><strong>/ufd</strong></p></td>
<td align="left"><p>Specifies a USB flash drive as the type of media to create. For example:</p>
<pre class="syntax" space="preserve"><code>Makewinpemedia /ufd C:\winpe_amd64 F:</code></pre>
<p>where F is the drive letter of the USB flash drive.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/iso</strong></p></td>
<td align="left"><p>Specifies a .iso file (CD or DVD) as the type of media to create. For example:</p>
<pre class="syntax" space="preserve"><code>Makewinpemedia /iso C:\winpe_amd64 C:\winpe_x64\winpe_amd64.iso</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/f</strong></p></td>
<td align="left"><p>Optional. Suppresses the confirmation message that appears before you format the USB flash drive or overwrite an existing .iso file. For example:</p>
<pre class="syntax" space="preserve"><code>Makewinpemedia /ufd /f C:\winpe_amd64 F:</code></pre>
<p>where F is the drive letter of the USB flash drive.</p></td>
</tr>
<tr class="even">
<td align="left"><p><em>&lt;WorkingDirectory&gt;</em></p></td>
<td align="left"><p>Specifies the name of the working directory where the <strong>Copype</strong> tool creates the Windows PE directory structure and copies the necessary files for creating bootable media. For example:</p>
<pre class="syntax" space="preserve"><code>C:\winpe_amd64</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><em>&lt;DestinationLocation&gt;</em></p></td>
<td align="left"><p>Specifies the drive letter of the USB flash drive if you are using the <strong>/ufd</strong> option, or the name of the .iso file if you are using the <strong>/iso</strong> option.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[Oscdimg Command-Line Options](oscdimg-command-line-options.md)

 

 






