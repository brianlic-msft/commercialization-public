---
author: Justinha
Description: 'Drvload Command-Line Options'
ms.assetid: d4e6f566-2763-4774-876e-24357f223a52
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Drvload Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Drvload Command-Line Options


The Drvload tool adds out-of-box drivers to a booted Windows Preinstallation Environment (Windows PE) image. It takes one or more driver .inf files as inputs. To add a driver to an offline Windows PE image, use the Deployment Image Servicing and Management (DISM) tool. For more information, see [Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md).

If the driver .inf file requires a reboot, Windows PE will ignore the request. If the driver .sys file requires a reboot, then the driver cannot be added with Drvload. For more information, see [Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md) and [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md).

Drivers added using the Drvload tool are marked as the preferred driver for that device. If you add an updated driver during Windows Setup, the driver that you added with Drvload takes precedence.

## <span id="Drvload_Command-Line_Options"></span><span id="drvload_command-line_options"></span><span id="DRVLOAD_COMMAND-LINE_OPTIONS"></span>Drvload Command-Line Options


The following command-line options are available for Drvload.

**drvload** *inf\_path* \[,*inf\_path* \[...\]\] \[**/?**\]

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/?</strong></p></td>
<td align="left"><p>Displays usage information.</p></td>
</tr>
<tr class="even">
<td align="left"><p><em>inf_path</em></p></td>
<td align="left"><p>Specifies the path to the driver .inf file. The path can contain environment variables.</p></td>
</tr>
</tbody>
</table>

 

If any drivers were not installed, then Drvload will return a non-zero status (%errorlevel%).

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

 

 






