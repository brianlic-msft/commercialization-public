---
title: ID
description: ID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b6651dfa-65eb-4f26-8ee5-70d052e19886
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ID


`ID` specifies the identity of the default online printing company in the Online Print Wizard.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ID</em></p></td>
<td><p>Specifies the identity of the online printing company. This ID is not displayed to the end user. <em>ID</em> is a string with a minimum length of 1 character and a maximum length of 20 characters.</p>
<p>This string must be unique for each service provider.</p>
<p>We recommended that the service provider name, without spaces, be used as the string ID.</p>
<p>For service providers that are managed through the Microsoft Service Provider server, an ID string is assigned.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md) | **ID**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md).

## XML Example


The following XML output shows how to set Lucerne Publishing for online printing.

``` syntax
<Description>Get photos printed by Lucerne and delivered to your home.</Description>
<DisplayName>Lucerne Publishing</DisplayName>
<href>lucernepublishing.com</href>
<Icon>c:\Lucerne\lucernepub.ico</Icon>
<ID>lucernepublishing</ID>
```

## Related topics


[Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





