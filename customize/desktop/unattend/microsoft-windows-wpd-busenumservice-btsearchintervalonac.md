---
title: BTSearchIntervalOnAC
description: BTSearchIntervalOnAC
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e1adcb7f-6310-4067-b828-652f19cda601
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BTSearchIntervalOnAC


`BTSearchIntervalOnAC` specifies how often the computer will search for other devices using Media Transfer Protocol over Bluetooth *(MTP/BT)*, while plugged in.

By default, the computer searches for devices that have been paired and enabled for the MTP/BT service. While the computer is plugged in to AC power, it will perform this search every 120 seconds.

If `BTSearchIntervalOnAC` is set to **0**, then the computer will not search for these devices while it is plugged in to AC power.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><code>BTSearchIntervalOnAC</code></p></td>
<td><p>Specifies how often the computer will search for portable devices using MTP/BT while plugged in to AC power.</p>
<p><code>BTSearchIntervalOnAC</code> is an integer.</p>
<p>The default value is 120 seconds.</p></td>
</tr>
</tbody>
</table>

 

## Valid passes


specialize

## Parent Hierarchy


[Microsoft-Windows-WPD-BusEnumService](microsoft-windows-wpd-busenumservice.md) | **BTSearchIntervalOnAC**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-WPD-BusEnumService](microsoft-windows-wpd-busenumservice.md).

## XML Example


The following XML output specifies that the system will search for MTP/BT portable devices every 60 seconds while plugged in to AC power, and will not search for MTP/BT portable devices while on battery power:

``` syntax
<BTSearchIntervalOnAC>60</BTSearchIntervalOnAC>
<BTSearchIntervalOnDC>0</BTSearchIntervalOnDC>
```

## Related topics


[BTSearchIntervalOnDC](microsoft-windows-wpd-busenumservice-btsearchintervalondc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20BTSearchIntervalOnAC%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





