---
title: ReferralId
description: ReferralId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 534074f5-dd61-4d77-bb7c-5b4de177d688
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ReferralId


`ReferralId` specifies the identity of an OEM participating in the Windows Anytime Upgrade reward program.

**Important**  
This setting is deprecated.

This information is for reference only.

 

For information about the Windows Anytime Upgrade program, see [Windows Anytime Upgrade](http://go.microsoft.com/fwlink/?LinkId=142336).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ReferralID</em></p></td>
<td><p>Specifies the identity of OEMs participating in the Windows Anytime Upgrade program.</p>
<p>The default value is <strong>00000</strong>.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


auditSystem

oobeSystem

specialize

## Parent Hierarchy


[microsoft-windows-security-spp-ux-sppcc-](microsoft-windows-security-spp-ux-sppcc.md) | **ReferralId**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-security-spp-ux-sppcc-](microsoft-windows-security-spp-ux-sppcc.md).

## XML Example


The following XML output shows how to set Windows Anytime Upgrade.

``` syntax
<ReferralId>12345</ReferralId>
```

## Related topics


[microsoft-windows-security-spp-ux-sppcc-](microsoft-windows-security-spp-ux-sppcc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ReferralId%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





