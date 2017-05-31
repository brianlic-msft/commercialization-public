---
title: PulseOrToneDialing
description: PulseOrToneDialing
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c01fff79-8704-4b34-a612-cb2773afd7d9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PulseOrToneDialing


`PulseOrToneDialing` specifies whether to use pulse dialing or tone dialing.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong></p></td>
<td><p>Specifies pulse dialing.</p></td>
</tr>
<tr class="even">
<td><p><strong>1</strong></p></td>
<td><p>Specifies tone dialing.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md) | [TapiUnattendLocation](microsoft-windows-tapisetup-tapiunattendlocation.md) | **PulseOrToneDialing**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md).

## XML Example


The following XML output shows how to set the location from which you are calling.

``` syntax
<TapiUnattendLocation>
   <AreaCode>123</AreaCode>
   <CountryOrRegion>123</CountryOrRegion>
   <DisableCallWaiting>7</DisableCallWaiting>
   <InternationalCarrierCode>123456789</InternationalCarrierCode>
   <LongDistanceAccess>11</LongDistanceAccess>
   <LongDistanceCarrierCode>123456789</LongDistanceCarrierCode>
   <Name>MyLocation</Name>
   <OutsideAccess>9</OutsideAccess>
   <PulseOrToneDialing>1</PulseOrToneDialing>
</TapiUnattendLocation>
```

## Related topics


[TapiUnattendLocation](microsoft-windows-tapisetup-tapiunattendlocation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PulseOrToneDialing%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





