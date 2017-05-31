---
author: Justinha
Description: 'DISM Unattended Servicing Command-Line Options'
ms.assetid: 698c8ad3-e292-45b2-9f74-d0e8885a7971
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Unattended Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Unattended Servicing Command-Line Options


If you are installing multiple packages to a Windows® image, use DISM to apply an unattend.xml answer file to the image. Some packages require other packages to be installed first. If there is a dependency requirement, the best way to ensure the correct order of the installation is by using an answer file. When you use DISM to apply an unattend.xml answer file to an image, the unattended settings in the **offlineServicing** configuration pass are applied to the Windows image.

The base syntax for servicing a Windows image using DISM is:

**DISM.exe** {**/Image:**&lt;*path\_to\_ image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

The following servicing options are available to apply an unattend.xml answer file to an offline Windows image:

**DISM.exe /Image:**&lt;*path\_to\_ image\_directory*&gt; **/Apply-Unattend:**&lt;*path\_to\_unattend.xml*&gt;

The following servicing options are available to apply an unattend.xml answer file to a running operating system:

**DISM.exe /Online** **/Apply-Unattend:**&lt;*path\_to\_unattend.xml*&gt;

The following table provides a description of how an unattended servicing option can be used. These options are not case sensitive.

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
<td align="left"><p>When used immediately after an unattended servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.</p>
<p>Examples:</p>
<p><strong>Dism /online /Apply-Unattend /?</strong></p>
<p><strong>Dism /image:C:\test\offline /Apply-Unattend /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Apply-Unattend:</strong>&lt;<em>path_to_unattend.xml</em>&gt;</p></td>
<td align="left"><p>Applies an Unattend.xml file to an image.</p>
<p>If you are updating device drivers using an unattended answer file, you must apply the answer file to an offline image and specify the settings in the <strong>offlineServicing</strong> configuration pass.</p>
<p>If you are updating packages or other settings using an unattended answer file, you can apply the answer file to an offline or online image. Specify the settings in the <strong>offlineServicing</strong> configuration pass.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml</strong></p>
<p><strong>Dism /online /Apply-Unattend:C:\test\answerfiles\myunattend.xml</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


-   You cannot use other servicing commands on the same command line with unattended servicing commands.

-   Only a single unattend.xml answer file can be specified on any command line.

-   When you add packages to an image using an unattended answer file, the applicability of the package will not be checked. The answer file will be applied, and the operation will complete even if there are packages specified in the answer file which do not apply to the image. If you have to check the applicability of a package when you add it to an image, use the **DISM** command together with the **/Add-Package** option without the **/ignorecheck** option. For more information, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

-   If you are updating device drivers using an unattended answer file, you must apply the answer file to an offline image.

-   When you use DISM.exe to apply an answer file to a running operating system, the answer file should only contain elements in the **offlineServicing** configuration pass. This is because some settings in the Specialize configuration pass might be applied to the operating system. We recommend that the answer file that you use with DISM only contain settings in the **offlineServicing** configuration pass.

-   The recommended way to author answer files is to create them in Windows System Image Manager (Windows SIM). However, if you use a manually authored answer file, you must validate the answer file in Windows SIM to verify that it works. For more information, see [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073).

-   When you apply an answer file by using DISM, the answer file is not cached on the target computer.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

[DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md)

[DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md)

 

 






