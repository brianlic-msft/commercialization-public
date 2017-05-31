---
author: kpacquer
Description: 'The following features can be used with devices running in Manufacturing Mode.'
ms.assetid: 6f675ace-3f76-4421-8109-16fdf9e469fd
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Optional features for Manufacturing Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Optional features for Manufacturing Mode


The following features can be used with devices running in Manufacturing Mode.

**Note**  All optional features included with Windows 10 Mobile can be used, too. For more info about the other optional features, see [Optional features for building images](https://msdn.microsoft.com/library/windows/hardware/dn756780).

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>BCDEDIT</p></td>
<td align="left"><p>Adds bcdedit.exe to the image for development support. This should not be included in final retail images.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MFGMODEBCD</p></td>
<td align="left"><p>Adds the BCD entry to enable Manufacturing Mode in the full OS Image. You should remove this before the device leaves the factory floor.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MFGSTARTUP</p></td>
<td align="left"><p>Adds startup.bsc file to the Manufacturing Mode image and is needed whenever the MOBILECOREBOOTSH feature is used.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MFGDEVTOOLS</p></td>
<td align="left"><p>Adds a collection of useful developer tools to the Manufacturing Mode image, such as tlist.exe, sc.exe, shutdown.exe. This should not be included in the final Manufacturing Mode image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MFGTELNETFTP</p></td>
<td align="left"><p>Adds Telnet and TFTP servers to the Manufacturing Mode image. You can leave them in the final image for servicing since they only run when the device is in Manufacturing Mode.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MFGTSHELL</p></td>
<td align="left"><p>Adds TShell capability to the Manufacturing Mode image. You can leave it in the final image for servicing since it only runs when the device is in Manufacturing Mode.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MOBILECOREBOOTSH</p></td>
<td align="left"><p>Enables the bootsh service (bootshscv) so that features in startup.bsc, such as telnet and ftp, can be used. This is required when the MFGTELNETFTP feature is specified. You can leave it in the image for servicing since it only runs when the device is in Manufacturing Mode.</p></td>
</tr>
</tbody>
</table>

 

 

 





