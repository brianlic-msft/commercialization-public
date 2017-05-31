---
author: Justinha
Description: Create and Manage a Windows Image Using DISM
ms.assetid: ef3d32c6-54f4-4347-9cbb-593c7ae7bf5e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create and Manage a Windows Image Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create and Manage a Windows Image Using DISM


Deployment Image Servicing and Management (DISM.exe) mounts a Windows image (.wim) file or virtual hard disk (.vhd or .vhdx) for servicing. You can also use the DISM image management command to list the image index numbers or to verify the architecture for the image that you are mounting. After you update the image, you must unmount it and either commit or discard the changes you have made.

You can use DISM servicing commands to install, uninstall, configure, and update the features and packages in offline Windows® images and offline Windows Preinstallation Environment (Windows PE) images. For more information about common DISM scenarios, see [What is DISM?](what-is-dism.md). For more information about DISM servicing commands, see [Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md).

## <span id="In_This_Section"></span><span id="in_this_section"></span><span id="IN_THIS_SECTION"></span>In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>[Capture Images of Hard Disk Partitions Using DISM](capture-images-of-hard-disk-partitions-using-dism.md)</p></td>
<td align="left"><p>Use the Diskpart tool and the Deployment Image Servicing and Management (DISM) tool to capture an image and save it as a .wim file.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md)</p></td>
<td align="left"><p>Map the contents of a Windows image (.wim) file to a directory to service the image or to perform common file operations such as adding and deleting files.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Apply Images Using DISM](apply-images-using-dism.md)</p></td>
<td align="left"><p>Use the Diskpart tool and the DISM tool to apply Windows images to one or more partitions onto a computer for deployment.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Split a Windows Image (WIM) File to Span Across Multiple DVDs](split-a-windows-image--wim--file-to-span-across-multiple-dvds.md)</p></td>
<td align="left"><p>Split a large .wim file into several smaller files that will fit on your selected media. Copy split .wim files onto your selected media as .iso files.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Create a WIM for Multiple Architecture Types Using DISM](create-a-wim-for-multiple-architecture-types-using-dism.md)</p></td>
<td align="left"><p>Create a single .wim file that includes both 32-bit and 64-bit Windows images.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Append a Volume Image to an Existing Image Using DISM](append-a-volume-image-to-an-existing-image-using-dism--s14.md)</p></td>
<td align="left"><p>Add a second image to an existing .wim file.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Create a Data Image Using DISM](create-a-data-image-using-dism.md)</p></td>
<td align="left"><p>Create a .wim file that contains only files and applications that you intend to copy to the Windows installation by using an unattended answer file.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

 

 






