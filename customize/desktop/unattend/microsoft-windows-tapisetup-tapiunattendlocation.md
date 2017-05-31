---
title: TapiUnattendLocation
description: TapiUnattendLocation
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 86aeb8bd-8ef1-44cf-82cb-fa779c2aa26c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TapiUnattendLocation


`TapiUnattendLocation` specifies unattended installation settings for a telephony location.

If one of the child elements is not applicable in your country or region, you must specify an empty string in the unattended installation answer file, by entering two quotation marks (**""**).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[AreaCode](microsoft-windows-tapisetup-tapiunattendlocation-areacode.md)</p></td>
<td><p>Specifies the local telephone area code.</p></td>
</tr>
<tr class="even">
<td><p>[CountryOrRegion](microsoft-windows-tapisetup-tapiunattendlocation-countryorregion.md)</p></td>
<td><p>Specifies the region ID for this location. This not the same as the country or region code used for dialing.</p></td>
</tr>
<tr class="odd">
<td><p>[DisableCallWaiting](microsoft-windows-tapisetup-tapiunattendlocation-disablecallwaiting.md)</p></td>
<td><p>Specifies the number to dial to disable call waiting.</p></td>
</tr>
<tr class="even">
<td><p>[InternationalCarrierCode](microsoft-windows-tapisetup-tapiunattendlocation-internationalcarriercode.md)</p></td>
<td><p>Specifies the international telephone carrier.</p></td>
</tr>
<tr class="odd">
<td><p>[LongDistanceAccess](microsoft-windows-tapisetup-tapiunattendlocation-longdistanceaccess.md)</p></td>
<td><p>Specifies the number to dial from this location for long distance access.</p></td>
</tr>
<tr class="even">
<td><p>[LongDistanceCarrierCode](microsoft-windows-tapisetup-tapiunattendlocation-longdistancecarriercode.md)</p></td>
<td><p>Specifies the long distance carrier.</p></td>
</tr>
<tr class="odd">
<td><p>[Name](microsoft-windows-tapisetup-tapiunattendlocation-name.md)</p></td>
<td><p>Specifies the name of this location. This appears in the user interface (UI).</p></td>
</tr>
<tr class="even">
<td><p>[OutsideAccess](microsoft-windows-tapisetup-tapiunattendlocation-outsideaccess.md)</p></td>
<td><p>Specifies the number to dial to access an outside line from this location.</p></td>
</tr>
<tr class="odd">
<td><p>[PulseOrToneDialing](microsoft-windows-tapisetup-tapiunattendlocation-pulseortonedialing.md)</p></td>
<td><p>Specifies whether to use pulse dialing or tone dialing.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md) | **TapiUnattendLocation**

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


[microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TapiUnattendLocation%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





