---
author: Justinha
Description: DISM Supported Platforms
ms.assetid: c52337e1-19a0-46d9-aa17-c5b704ea1949
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: DISM Supported Platforms
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Supported Platforms


The Windows 10 version of Deployment Image Servicing and Management (DISM) is available in Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), Windows Server 2016, and Windows Preinstallation Environment (WinPE) for Windows 10.

To service Windows 10 images, you’ll need the Windows 10 version of DISM, otherwise the image may become corrupted.

To use the Windows 10 version of DISM onto a previous version of Windows, install the Windows Assessment and Deployment Kit (ADK) [from this website](http://go.microsoft.com/fwlink/p/?LinkId=526803), and install the **Deployment Tools**. Then, start the **Deployment and Imaging Tools Environment** to run DISM commands.

To use the Windows 10 version of DISM with a previous version of Windows PE, see [Install Windows 10 using a previous version of Windows PE](copy-dism-to-another-computer.md).

Note, newer DISM features don’t always work when servicing images of previous versions of Windows. To learn more, see the [DISM Reference](dism-reference--deployment-image-servicing-and-management.md).

## <span id="DTSP_DISM"></span><span id="dtsp_dism"></span>Supported Platforms


The host deployment environment is the operating system where DISM runs. The target image is the image that is being serviced.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Host deployment environment</th>
<th align="left">Target Image:Windows 10 , Windows 10, or WinPE for Windows 10</th>
<th align="left">Target Image: , Windows 8.1, Windows Server 2016, Windows Server 2012 R2, or WinPE 5.0 (x86 or x64)</th>
<th align="left">Target Image: Windows 8, Windows Server 2012, or WinPE 4.0 (x86 or x64)</th>
<th align="left">Target Image: Windows 7, Windows Server 2008 R2, or WinPE 3.0 (x86 or x64)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Windows 10 (x86 or x64)</p></td>
<td align="left">Supported</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2016 (x86 or x64)</p></td>
<td align="left">Supported</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 8.1 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012 R2 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 8(x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 7 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported, using the Windows 8 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008 R2 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported, using the Windows 8 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Server 2008 SP2 (x86 or x64)</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported, using the Windows 8 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="even">
<td align="left"><p>WinPE for Windows 10 x86</p></td>
<td align="left">Supported</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>WinPE for Windows 10 x64</p></td>
<td align="left">Supported: X64 target image only</td>
<td align="left"><p>Supported: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
</tr>
<tr class="even">
<td align="left"><p>WinPE 5.0 x86</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>WinPE 5.0 x64</p></td>
<td align="left">Supported, using the Windows 10 version of DISM: X64 target image only</td>
<td align="left"><p>Supported: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
</tr>
<tr class="even">
<td align="left"><p>WinPE 4.0 x86</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>WinPE 4.0 x64</p></td>
<td align="left">Supported, using the Windows 10 version of DISM: X64 target image only</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
</tr>
<tr class="even">
<td align="left"><p>WinPE 3.0 x86</p></td>
<td align="left">Supported, using the Windows 10 version of DISM</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later</p></td>
<td align="left"><p>Supported, using the Windows 8 version of DISM or later</p></td>
<td align="left"><p>Supported</p></td>
</tr>
<tr class="odd">
<td align="left"><p>WinPE 3.0 x64</p></td>
<td align="left">Supported, using the Windows 10 version of DISM: X64 target image only</td>
<td align="left"><p>Supported, using the Windows 8.1 version of DISM or later: X64 target image only</p></td>
<td align="left"><p>Supported, using the Windows 8 version of DISM or later: X64 target image only</p></td>
<td align="left"><p>Supported: X64 target image only</p></td>
</tr>
</tbody>
</table>

 

Resilient File System (REFS) is not supported.

## <span id="related_topics"></span>Related topics


[Install the Windows 10 Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/p/?LinkId=526803)

[DISM Reference (Deployment Image Servicing and Management)](dism-reference--deployment-image-servicing-and-management.md)

[Install Windows 10 using a previous version of Windows PE](copy-dism-to-another-computer.md)

 

 






