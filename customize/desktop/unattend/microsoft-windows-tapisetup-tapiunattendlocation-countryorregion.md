---
title: CountryOrRegion
description: CountryOrRegion
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5774e2db-41da-4ee8-873c-e34183fb29d7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CountryOrRegion


`CountryOrRegion` specifies the geo-code for this location. This code is not the same as the country code that is used for dialing.

Region codes change over time. To find the latest region codes, follow these steps:

1.  Create a registry key that has a list of region codes by using the **Phone and Modem** item in Control Panel. To do this, follow these steps:

    1.  On your technician computer, use the **Run** command to open **telephon.cpl**. This opens the **Phone and Modem** Control Panel. The first time this Control Panel item is opened, a dialog box opens and prompts you for location details. If this dialog box does not appear, close the **Phone and Modem** Control Panel, and then continue to step 2.

    2.  Follow the on-screen prompts to enter the location information. After you have set the location information, the system writes a registry key that has an updated list of region code values.

2.  Find the list of region codes in the registry. To do this, follow these steps:

    1.  Use the **Run** command to open **regedit**. This open Registry Editor.

    2.  In Registry Editor, navigate to the **Computer\\HKEYLOCALMACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Telephony\\Country List** registry key. This registry key shows the current list of region code identifiers.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Region_code</em></p></td>
<td><p>Specifies the region code. <em>Region_code</em> is an integer.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md) | [TapiUnattendLocation](microsoft-windows-tapisetup-tapiunattendlocation.md) | **CountryOrRegion**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-tapisetup-](microsoft-windows-tapisetup.md).

## XML Example


The following example shows how to set the location that you are calling from.

``` syntax
<TapiUnattendLocation>
   <AreaCode>123</AreaCode>
   <CountryOrRegion>246</CountryOrRegion>
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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CountryOrRegion%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





