---
author: Justinha
ms.assetid: 0fbb2a9b-d3ce-4d7f-b68a-af641ceec96d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WIM vs. VHD vs. FFU: comparing image file formats'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WIM vs. VHD vs. FFU: comparing image file formats


Comparing .WIM, .VHD/.VHDX, and .FFU: These file formats are all used to deploy Windows to new devices. Here's how they compare:

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">Windows image (.WIM)</td>
<td align="left">Virtual Hard Disk (.VHD/VHDX)</td>
<td align="left">Full Flash Update (.FFU)</td>
</tr>
<tr class="even">
<td align="left">Common uses</td>
<td align="left"><p>Fastest for testing and modifying Windows images.</p>
<p>Quickly mounting and modifying images.</p></td>
<td align="left"><p>Easiest for deploying Windows to virtual PCs.</p>
<p>You can boot a new device directly from a single VHD/VHDX file.</p></td>
<td align="left"><p>Fastest for capturing and deploying Windows on a factory floor.</p>
<p>Includes built-in security to verify signed images.</p></td>
</tr>
<tr class="odd">
<td align="left">Imaging style</td>
<td align="left">File-based</td>
<td align="left">Sector-based</td>
<td align="left">Sector-based</td>
</tr>
<tr class="even">
<td align="left">Compression</td>
<td align="left">Supports multiple types of compression</td>
<td align="left">None</td>
<td align="left">None</td>
</tr>
<tr class="odd">
<td align="left">What does it capture?</td>
<td align="left"><p>A set of files, up to an entire partition.</p></td>
<td align="left"><p>Captures the full set of drive information, including partitions.</p></td>
<td align="left"><p>Captures the full set of drive information, including partitions.</p></td>
</tr>
<tr class="even">
<td align="left">When I apply the image, what happens?</td>
<td align="left"><p>Adds the files and folders to the partition.</p>
<p>If there are existing files and folders with the same names, they're replaced. Otherwise, the existing files are kept.</p></td>
<td align="left"><p>Cleans the entire drive.</p></td>
<td align="left"><p>Cleans the entire drive.</p></td>
</tr>
<tr class="odd">
<td align="left">Can I deploy to different sizes of hard drives?</td>
<td align="left"><p>Yes.</p></td>
<td align="left"><p>Yes, though the new drive must be the same size or larger than the original.</p></td>
<td align="left"><p>Yes, though the new drive must be the same size or larger than the original.</p></td>
</tr>
<tr class="even">
<td align="left">Can I modify the images?</td>
<td align="left"><p>Yes. With tools like DISM, you can mount, modify, and unmount the image.</p></td>
<td align="left"><p>Yes, you can mount a VHD/VHDX as if it were removable media, and modify the files.</p></td>
<td align="left"><p>Yes, though it's limited to adding packages.</p></td>
</tr>
<tr class="odd">
<td align="left">Security</td>
<td align="left"></td>
<td align="left"></td>
<td align="left"><p>Includes a security header and image header to identify a secured image.</p>
<p>Includes a catalog and hash table to validate a signature upfront before flashing onto a device.</p></td>
</tr>
</tbody>
</table>

 

To learn more, see **/Apply-Image** in [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="related_topics"></span>Related topics


**DISM**
[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

**VHD/VHDX**
[Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu](boot-to-vhd--native-boot--add-a-virtual-hard-disk-to-the-boot-menu.md)

[Deploy Windows on a VHD (Native Boot)](deploy-windows-on-a-vhd--native-boot.md)

**FFU**
[Deploy Windows using Full Flash Update (FFU)](deploy-windows-using-full-flash-update--ffu.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[FFU image format](../mobile/ffu-image-format.md)

 



