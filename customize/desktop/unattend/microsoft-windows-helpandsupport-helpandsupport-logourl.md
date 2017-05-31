---
title: LogoURL
description: LogoURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f52c164e-1af0-461a-8022-e8821c55ee7e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LogoURL


**Note**  
In Windows 10, this setting and other [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information in this topic is provided for reference only.

For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).

 

`LogoURL` specifies a link to an Original Equipment Manufacturer's (OEM's) webpage, a Help topic, or an executable file. This link appears on the **Help and Support** home page. When an end user clicks the logo of the OEM or organization, the corresponding page opens.

The `LogoURL` setting is used together with the [Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md) setting. When both settings are present, the logo appears and the link is active.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>&lt;Path&gt;</em></p></td>
<td><p>Specifies the path of the support page for the OEM or organization. <em>&lt;Path&gt;</em> is a string.</p>
<p>To create a link to a program, use this format: <code>shortcut:&lt;PathToExeFile&gt;</code></p>
<p>To create a link to a page in <strong>Help and Support</strong>, use this format: <code>mshelp://OEM/?id=&lt;TopicGUID&gt;</code></p>
<p>To create a link to a webpage, use this format: <code>http://&lt;WebpageAddress&gt;</code></p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md) | [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) | `LogoURL`

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md).

## XML Example


The following example shows how to set a customized **Help and Support** home page. When a user clicks the Fabrikam logo on the **Help and Support** home page, the http://www.fabrikam.com/support webpage opens.

``` syntax
<HelpAndSupport>
  <Logo>%systemdrive%\Fabrikam\Logos\Logo.png</Logo>
  <LogoURL>http://www.fabrikam.com/support</LogoURL>
  <Manufacturer>Fabrikam</Manufacturer>
</HelpAndSupport>
```

## Related topics


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md)

[Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LogoURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





