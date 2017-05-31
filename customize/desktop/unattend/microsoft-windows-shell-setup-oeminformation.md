---
title: OEMInformation
description: OEMInformation
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8fd731ac-32b3-42b5-a3a0-36e6d567617d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OEMInformation


`OEMInformation` specifies OEM information. This information includes the OEM’s name, telephone support numbers, URL, and other support details.

In Windows 10, the OS disables the help components that shipped in Windows 8 and Windows 8.1 including the Help and Support Windows desktop application (HelpPane.exe). HelpPane.exe will continue to exist in the box, but calls to its interfaces will result in one of two outcomes:

-   If the user is offline, the OS launches the Getting Started app.
-   If the user is online, the OS opens a browser instance and redirects the browser to an online topic.

This change affects context-sensitive (or F1) help and accessing help from the menus for apps shipped with Windows including the shell.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[HelpCustomized](microsoft-windows-shell-setup-oeminformation-helpcustomized.md)</p></td>
<td><p>Specifies whether the OEM customizes Help. If this element is set to <strong>true</strong>, Control Panel shows a support link. Otherwise, Control Panel shows the support information that [SupportHours](microsoft-windows-shell-setup-oeminformation-supporthours.md), [SupportPhone](microsoft-windows-shell-setup-oeminformation-supportphone.md), and [SupportURL](microsoft-windows-shell-setup-oeminformation-supporturl.md) specify.</p></td>
</tr>
<tr class="even">
<td><p>[Logo](microsoft-windows-shell-setup-oeminformation-logo.md)</p></td>
<td><p>Specifies the path of the .bmp file of the manufacturer logo.</p></td>
</tr>
<tr class="odd">
<td><p>[Manufacturer](microsoft-windows-shell-setup-oeminformation-manufacturer.md)</p></td>
<td><p>Specifies the name of the manufacturer.</p></td>
</tr>
<tr class="even">
<td><p>[Model](microsoft-windows-shell-setup-oeminformation-model.md)</p></td>
<td><p>Specifies the name of the computer model.</p></td>
</tr>
<tr class="odd">
<td><p>[SupportAppURL](microsoft-windows-shell-setup-oeminformation-supportappurl.md)</p></td>
<td><p>Specifies the OEM-built support app that will be launched instead of the web URL.</p></td>
</tr>
<tr class="even">
<td><p>[SupportHours](microsoft-windows-shell-setup-oeminformation-supporthours.md)</p></td>
<td><p>Specifies the hours that support is available from an OEM.</p></td>
</tr>
<tr class="odd">
<td><p>[SupportPhone](microsoft-windows-shell-setup-oeminformation-supportphone.md)</p></td>
<td><p>Specifies the telephone numbers for support for an OEM.</p></td>
</tr>
<tr class="even">
<td><p>[SupportURL](microsoft-windows-shell-setup-oeminformation-supporturl.md)</p></td>
<td><p>Specifies the URL of the support website for an OEM.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditUser

generalize

offlineServicing

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **OEMInformation**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following example shows how to set OEM information.

``` syntax
<OEMInformation>
   <HelpCustomized>true</HelpCustomized>
   <Manufacturer>OEM name</Manufacturer>
   <Model>model name</Model>
   <Logo>C:\Windows\OEM\Logo.bmp</Logo>
   <SupportAppURL>contoso-contact-support</SupportAppURL>
   <SupportHours>hours</SupportHours>
   <SupportPhone>123-456-7890</SupportPhone>
   <SupportURL>http://www.fabrikam.com/support</SupportURL>
</OEMInformation>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20OEMInformation%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





