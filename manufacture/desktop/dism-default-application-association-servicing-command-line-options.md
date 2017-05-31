---
author: Justinha
Description: 'DISM Default Application Association Servicing Command-Line Options'
ms.assetid: 78cad8f9-2048-48f7-8eb6-44011adbca24
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Default Application Association Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Default Application Association Servicing Command-Line Options


You can use the default application association-servicing commands to import, export, list, and remove the settings that specify which application opens a file based on the file name extension or protocol.

The base syntax for servicing a Windows image using DISM is:

**DISM.exe** {**/Image:**&lt;*path\_to\_ image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

The following default application servicing options are available for an offline image.

**DISM.exe /image:**&lt;*path\_to\_image\_directory*&gt; \[**/Get-DefaultAppAssociations** | **/Import-DefaultAppAssociations** | **/Remove-DefaultAppAssociations**\]

The following default application association servicing options are available for a running operating system.

**DISM.exe /Online** \[**/Export-DefaultAppAssociations** | **/Get-DefaultAppAssociations** | **Import-DefaultAppAssociations** | **Remove-DefaultAppAssociations**\]

The following table provides a description of how each default application association servicing option can be used. These options are not case sensitive.

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
<td align="left"><p><strong>/Get-Help</strong></p>
<p><strong>/?</strong></p></td>
<td align="left"><p>When used immediately after a default application association servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.</p>
<p>Examples:</p>
<p><strong>Dism /image:C:\test\offline /Import-DefaultAppAssociations /?</strong></p>
<p><strong>Dism /online /Get-DefaultAppAssociations /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Export-DefaultAppAssociations:</strong>&lt;<em>path_to_export_file</em>&gt;</p></td>
<td align="left"><p>Exports the default application associations from a running operating system to an .xml file.</p>
<p>Example:</p>
<p><strong>Dism.exe /Online /Export-DefaultAppAssociations:C:\AppAssoc.xml</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Get-DefaultAppAssociations</strong></p></td>
<td align="left"><p>Displays the list of default application associations that have been set in the specified Windows image. You can use this option to verify that default application associations were successfully imported to the image.</p>
<p>Examples:</p>
<p><strong>Dism.exe /Image:C:\test\offline /Get-DefaultAppAssociations</strong></p>
<p><strong>Dism.exe /Online /Get-DefaultAppAssociations</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Import-DefaultAppAssociations:</strong>&lt;<em>path_to_xml_file</em>&gt;</p></td>
<td align="left"><p>Imports a set of default application associations to a specified Windows image from an .xml file. The default application associations will be applied for each user during their first logon.</p>
<p>Examples:</p>
<p><strong>Dism.exe /Image:C:\test\offline /Import-DefaultAppAssociations:C:\AppAssoc.xml</strong></p>
<p><strong>Dism.exe /Online /Import-DefaultAppAssociations:C:\AppAssoc.xml</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Remove-DefaultAppAssociations</strong></p></td>
<td align="left"><p>Removes the default application associations from the specified Windows image.</p>
<p>Examples:</p>
<p><strong>Dism.exe /Image:C:\test\offline /Remove-DefaultAppAssociations</strong></p>
<p><strong>Dism.exe /Online /Remove-DefaultAppAssociations</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

 

 






