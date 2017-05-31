---
author: Justinha
Description: 'DISM Windows Edition-Servicing Command-Line Options'
ms.assetid: e7faf4eb-7de8-49f7-9d42-caededf1b289
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Windows Edition-Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Windows Edition-Servicing Command-Line Options


You can use the Windows® edition-servicing commands to change one edition of Windows 8 to a higher edition in the same edition family. The edition packages for each potential target edition are staged in a Windows image. This is referred to as an edition-family image. Because the target editions are staged, you can service a single image, and the updates will be applied appropriately to each edition in the image. This can help reduce the number of images that you have to manage, but it might increase the factory time or end-user time that must be spent in the **specialize** configuration pass.

Offline changes do not require a product key. If you change to a higher edition using offline servicing, you can add the product key using one of the following methods:

-   Enter the product key during the out-of-box experience (OOBE).

-   Use an unattended answer file to enter the product key during the **specialize** configuration pass.

-   Use Deployment Image Servicing and Management (DISM) and the Windows edition-servicing command-line option **/Set-ProductKey** after you set the edition offline.

## <span id="BKMK_Syntax"></span><span id="bkmk_syntax"></span><span id="BKMK_SYNTAX"></span>Command-line Syntax


The base syntax for servicing a Windows image using DISM is:

**DISM.exe** {**/Image:**&lt;*path\_to\_image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

You can use the following edition-servicing options on an offline image to list editions or to change a Windows image to a higher edition:

**DISM.exe /Image:**&lt;*path\_to\_image\_directory*&gt; {**/Get-CurrentEdition** | **/Get-TargetEditions** | **/Optimize-Image /WIMBoot** | **/Set-Edition** | **/Set-ProductKey**:&lt;*product\_key*&gt;}

The following edition-servicing options are available for a running Windows operating system:

**DISM.exe /Online** {**/Get-CurrentEdition** | **/Get-TargetEditions** | **/Set-ProductKey**:&lt;*product\_key*&gt; | **/Set-Edition**:&lt;*target\_edition*&gt; {**/GetEula**:&lt; *path*&gt; | **/AcceptEula** **/ProductKey**:&lt;product\_key&gt;}}

The following table provides a description for how each edition-servicing option can be used. These options are not case-sensitive.

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
<td align="left"><p>When used immediately after an edition-servicing command-line option, information about the option and the arguments is displayed. Additional Help topics might become available when an image is specified.</p>
<p>Examples:</p>
<p><strong>Dism /Image:C:\test\offline /Get-CurrentEdition /?</strong></p>
<p><strong>Dism /Online /Get-CurrentEdition /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Get-CurrentEdition</strong></p></td>
<td align="left"><p>Displays the edition of the specified image.</p>
<p>Examples:</p>
<p><strong>Dism /Image:C:\test\offline /Get-CurrentEdition</strong></p>
<p><strong>Dism /Online /Get-CurrentEdition</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Get-TargetEditions</strong></p></td>
<td align="left"><p>Displays a list of Windows editions that an image can be changed to.</p>
<p>Examples:</p>
<p><strong>Dism /Image:C:\test\offline /Get-TargetEditions</strong></p>
<p><strong>Dism /Online /Get-TargetEditions</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Set-Edition</strong>:&lt;<em>target_edition_ID</em>&gt; [{<strong>/GetEula</strong>:&lt;<em>path</em> | <strong>/AcceptEula</strong> <strong>/ProductKey</strong>:&lt;<em>product_key</em>&gt;}]</p></td>
<td align="left"><p>Use the <strong>/Set-Edition</strong> option with no arguments to change an offline Windows image to a higher edition.</p>
<p>To change an online Windows Server operation system to a higher edition, you must use the <strong>/Set-Edition</strong> option with the <strong>/AcceptEula</strong> and <strong>/ProductKey</strong> arguments.</p>
<div class="alert">
<strong>Important</strong>  
<p>You should not use the <strong>/Set-Edition</strong> option on an image that has already been changed to a higher edition. It is recommended that you use this option on the lowest edition available in the edition family.</p>
</div>
<div>
 
</div>
<p>Use <strong>/GetEula</strong> on an online image to copy the end-user license agreement to a specified path.</p>
<p>The <strong>/AcceptEula</strong> argument accepts the end-user license agreement and is required in order to change the Windows edition on an online image.</p>
<p>Example:</p>
<p><strong>Dism /Image:C:\test\offline /Set-Edition:</strong><em>&lt;edition name&gt;</em></p>
<p>On a running Windows Server operating system only:</p>
<p><strong>Dism /online /Set-Edition:</strong><em>&lt;edition name&gt;</em> <strong>/GetEula:c:\eulapathDism /online /Set-Edition:</strong><em>&lt;edition name&gt;</em><strong>/AcceptEula /ProductKey:12345-67890-12345-67890-12345</strong></p>
<p>Where <em>&lt;edition name&gt;</em> is the higher edition that you want to change to.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Set-ProductKey</strong>:&lt;<em>productKey</em>&gt;</p></td>
<td align="left"><p>The <strong>/Set-ProductKey</strong> option can only be used to enter the product key for the current edition in an offline Windows image after you change an offline Windows image to a higher edition using the <strong>/Set-Edition</strong> option.</p>
<p>Example:</p>
<p><strong>Dism /Image:C:\test\offline /Set-ProductKey:12345-67890-12345-67890-12345</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="BKMK_Limitations"></span><span id="bkmk_limitations"></span><span id="BKMK_LIMITATIONS"></span>Limitations


-   If you do not enter the product key when you set the edition of your offline image, you must either enter the product key during OOBE, or use an unattended answer file to enter the product key during the **specialize** configuration pass.

-   You cannot use edition-servicing commands on a Windows Preinstallation Environment (Windows PE) image.

-   To maintain edition-specific customizations, you should apply edition-specific answer files after the edition upgrade.

-   If you want to run the **/Set-Edition** option against a 64-bit image with more than 30 language packs, you must run it from a 64-bit computer. Otherwise, you might receive an out-of-memory error. This limitation only exists if you are manipulating a 64-bit image from a 32-bit computer. This limitation does not exist when you run this option on a computer that matches the architecture of the image.

-   You cannot set a Windows image to a lower edition. The lowest edition will not appear when you run the **/Get-TargetEditions** option.

-   You should not use the **/Set-Edition** option on an image that has already been changed to a higher edition.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[Change the Windows Image to a Higher Edition Using DISM](change-the-windows-image-to-a-higher-edition-using-dism.md)

 

 






