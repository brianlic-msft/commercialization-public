---
title: SearchContent
description: SearchContent
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 18361b84-7a5e-4d13-ba5e-d835b98b42ef
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SearchContent


**Note**  
In Windows 10, this setting and other [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information in this topic is provided for reference only.

For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).

 

`SearchContent` specifies whether the Original Equipment Manufacturer (OEM) or organization has provided offline Help content that **Help and Support** must return in search results.

When an end user performs a search in **Help and Support**, Windows searches for the OEM's offline Help content.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>When a user performs a search in <strong>Help and Support</strong>, Windows searches for matching Help content in offline Help files that the OEM provides.</p>
<div class="alert">
<strong>Note</strong>  
<p>For the results to appear, you must also set both the Microsoft-Windows-HelpAndSupport/<code>HelpAndSupport</code>/[Manufacturer](microsoft-windows-helpandsupport-helpandsupport-manufacturer.md) value to <strong>true</strong> and the Microsoft-Windows-Shell-Setup/<code>OEMInformation</code>/[HelpCustomized](microsoft-windows-shell-setup-oeminformation-helpcustomized.md) value to <strong>true</strong>.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>When a user performs a search in <strong>Help and Support</strong>, Windows searches for Help content only in the data store for Windows Help files.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md) | [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) | **SearchContent**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md).

## XML Example


The following example shows how to configure Windows to perform **Help and Support** searches from both Windows and offline Help files that the OEM or organization provides when the computer is offline.

``` syntax
<Manufacturer>Fabrikam</Manufacturer>
<SearchContent>true</SearchContent>
```

## Related topics


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SearchContent%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





