---
author: Justinha
Description: 'DISM Windows PE Servicing Command-Line Options'
ms.assetid: d759221d-47ee-4f50-957e-3b978be22dea
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Windows PE Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Windows PE Servicing Command-Line Options


You can mount a Windows Preinstallation Environment (Windows PE) image and add or remove packages, drivers, and language packs using the appropriate driver, package, or international-servicing commands. There are also commands that are specific to a Windows PE image, which can be used to prepare the Windows PE environment, enable profiling, list packages and prepare the Windows PE image for deployment.

**Important**  
Windows PE profiling functionality is removed beginning with Windows 8.1.

 

The base syntax for servicing a Windows PE image is:

**DISM.exe** **/Image:***&lt;path\_to\_image\_directory&gt;* \[**dism\_global\_options**\] {**servicing\_option**} \[*&lt;servicing\_argument&gt;*\]

In addition to the Deployment Image Servicing and Management (DISM) options, the following Windows PE servicing options are available for an offline image.

**DISM.exe /Image:** *&lt;path\_to\_image\_directory&gt;* \[**/Get-PESettings** | **/Get-Profiling** | **/Get-ScratchSpace** | **/Get-TargetPath** | **/Set-ScratchSpace:***&lt;size\_of\_ScratchSpace&gt;* | **/Set-TargetPath :***&lt;target\_path&gt;* | **/Enable-Profiling** | **/Disable-Profiling** | **/Apply-Profiles:***&lt;path\_to\_myprofile.txt&gt;*\]

**Important**  
These options cannot be used with an online, running version of Windows PE. You must specify a Windows PE image using the **/Image:***&lt;path\_to\_image\_directory&gt;* option.

 

The following table provides a description for how each Windows PE servicing option can be used on a Windows PE image. These options are not case sensitive.

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
<td align="left"><p><strong>/Get-PESettings</strong></p></td>
<td align="left"><p>Displays a list of Windows PE settings in the Windows PE image. The list includes current profiling state, scratch space settings and target path settings. For example:</p>
<p><strong>Dism /image:C:\test\offline /Get-PESettings</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Get-Profiling</strong></p></td>
<td align="left"><p>Retrieves the enabled/disabled state of the Windows PE profiling tool. For example:</p>
<p><strong>Dism /image:C:\test\offline /Get-Profiling</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Get-ScratchSpace</strong></p></td>
<td align="left"><p>Retrieves the configured amount of Windows PE system volume scratch space. This setting represents the amount of writeable space available on the Windows PE system volume when booted in ramdisk mode. For example:</p>
<p><strong>Dism /image:C:\test\offline /Get-ScratchSpace</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Get-TargetPath</strong></p></td>
<td align="left"><p>Retrieves the target path of the Windows PE image. The target path represents a path to the root of the Windows PE image at boot time. For example:</p>
<p><strong>Dism /image:C:\test\offline /Get-TargetPath</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Set-ScratchSpace:</strong><em>&lt;size_of_ScratchSpace&gt;</em></p></td>
<td align="left"><p>Sets the available scratch space, in megabytes. Valid values are 32, 64, 128, 256 and 512. For example:</p>
<p><strong>Dism /image:C:\test\offline /set-ScratchSpace:128</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Set-TargetPath :</strong><em>&lt;target_path&gt;</em></p></td>
<td align="left"><p>For hard disk boot scenarios, this option sets the location of the Windows PE image on the disk.</p>
<p>Note the following limitations when setting the target path:</p>
<ul>
<li><p>The path must be at least three characters and no longer than 32 characters</p></li>
<li><p>The path must start with a letter (any letter from C to Z)</p></li>
<li><p>The drive letter must be followed by *:\*</p></li>
<li><p>The remainder of the path must not contain any invalid characters, such as Unicode characters</p></li>
<li><p>The path must be absolute, no &quot;.&quot; or &quot;..&quot; elements</p></li>
<li><p>The path must not contain any blank spaces or &quot;\\&quot;</p></li>
</ul>
<p>For example:</p>
<p><strong>Dism /image:C:\test\offline /Set-TargetPath:X:\</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Enable-Profiling</strong></p></td>
<td align="left"><p>Enables profiling (file logging) so you can create your own profiles. By default, profiling is disabled. For example:</p>
<p><strong>Dism /image:C:\test\offline /Enable-profiling</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Disable-Profiling</strong></p></td>
<td align="left"><p>Turns off the file logging that is used to create a profile.</p>
<p><strong>Dism /image:C:\test\offline /Disable-Profiling</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Apply-Profiles:</strong><em>&lt;path_to_myprofile.txt&gt;</em></p></td>
<td align="left"><p><em>&lt;path_to_myprofiles.txt&gt;</em> must be a comma separated list of profile file names.</p>
<p>Removes any files from the Windows PE image that are not part of the custom profiles. It also checks the custom profile against the CORE profile to ensure that custom application files and boot-critical files are not deleted. A Windows PE image that has been customized using any profile is not serviceable. However, <strong>/Get-Profiling</strong>, <strong>/Get-TargetPath</strong> and <strong>/Get-PESettings</strong> will work. For example:</p>
<p><strong>Dism /image:C:\test\offline /Apply-Profiles:C:\test\profiles\myprofile.txt</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


The Windows PE commands can be used to change international settings only in Windows PE 3.0 and Windows PE 4.0 images.

## <span id="related_topics"></span>Related topics


[Windows PE for Windows 10](winpe-intro.md)

[Wpeutil Command-Line Options](wpeutil-command-line-options.md)

[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

 

 






