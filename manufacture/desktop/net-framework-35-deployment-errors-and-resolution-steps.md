---
author: Justinha
Description: '.NET Framework 3.5 deployment errors and resolution steps'
ms.assetid: 1320d926-3ff7-4deb-b7b8-17190028dd97
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: '.NET Framework 3.5 deployment errors and resolution steps'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# .NET Framework 3.5 deployment errors and resolution steps


This topic describes common errors you can encounter when you use Features on Demand to enable or deploy .NET Framework 3.5, and recommended steps to resolve the issues.

**Table 1 Features on Demand Error Codes**

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Error code</th>
<th align="left">Name</th>
<th align="left">Description</th>
<th align="left">Resolution steps</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>0x800F081F</p></td>
<td align="left"><p>CBS_E_SOURCE_MISSING</p></td>
<td align="left"><p>The source files could not be found. Use the <strong>Source</strong> option to specify the location of the files that are required to restore the feature. For more information about how to specify a source location, see [Configure a Windows Repair Source](http://go.microsoft.com/fwlink/?LinkId=243077).</p></td>
<td align="left"><p>Verify that the source specified has the necessary files. The source argument should point to the <strong>\sources\sxs folder</strong> on the installation media or the Windows folder for a mounted image (for example, <strong>c:\mount\windows</strong> for an image mounted to <strong>c:\mount</strong>).</p></td>
</tr>
<tr class="even">
<td align="left"><p>0x800F0906</p></td>
<td align="left"><p>CBS_E_DOWNLOAD_FAILURE</p></td>
<td align="left"><p>The source files could not be downloaded. Use the <strong>Source</strong> option to specify the location of the files that are required to restore the feature. For more information about how to specify a source location, see [Configure a Windows Repair Source](http://go.microsoft.com/fwlink/?LinkId=243077).</p>
<p>Windows couldn’t connect to the Internet to download necessary files. Make sure that the system is connected to the Internet and click <strong>Retry</strong>.</p></td>
<td align="left"><p>Verify that the computer or server has connectivity to Windows Update, and that you are able to browse to <strong>http://update.microsoft.com</strong>. If WSUS is used to manage updates for this computer, verify that the Group Policy setting <strong>Contact Windows Update directly to download repair content instead of Windows Server Update Services (WSUS)</strong> is enabled.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>0x800F0907</p></td>
<td align="left"><p>CBS_E_GROUPPOLICY_DISALLOWED</p></td>
<td align="left"><p>DISM failed. No operation was performed. For more information, review the log file at <strong>%WINDIR%\logs\DISM\dism.log</strong>.</p>
<p>Due to network policy settings, Windows couldn't connect to the Internet to download files required to complete the requested changes.</p></td>
<td align="left"><p>Contact your network administrator for assistance with the <strong>Specify settings for optional component installation and component repair</strong> Group Policy setting.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Microsoft .NET Framework 3.5 Deployment Considerations](microsoft-net-framework-35-deployment-considerations.md)

 

 






