---
title: NotInOOBE
description: NotInOOBE
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 17f04477-6154-4567-b02d-c0a88a2a89eb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# NotInOOBE


`NotInOOBE` hides mobile broadband devices or networks in OOBE. You can use this setting if you have a mobile device with embedded mobile broadband that’s sold with a deactivated mobile operator SIM. In this case, the mobile operator requires the mobile broadband device to be hidden in OOBE because SIM activation requires use of a mobile operator account experience app or a web browser, which are not supported in OOBE.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Hides mobile broadband category in OOBE.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Displays mobile broadband category in OOBE. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


generalize

specialize

## Parent Hierarchy


[Microsoft-Windows-WwanUI](microsoft-windows-wwanui.md) | **NotInOOBE**

## Applies To


For a full list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-WwanUI](microsoft-windows-wwanui.md).

## XML Example


The following XML output shows how to hide the mobile broadband category in OOBE.

``` syntax
<NotInOOBE>true</NotInOOBE>
```

## Related topics


[Microsoft-Windows-WwanUI](microsoft-windows-wwanui.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20NotInOOBE%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





