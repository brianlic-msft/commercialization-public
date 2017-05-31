---
title: Microsoft-Windows-WPD-BusEnumService
description: Microsoft-Windows-WPD-BusEnumService
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d3336b02-03e0-47ff-90a0-42ba6b8fcda0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-WPD-BusEnumService


The `Microsoft-Windows-WPD-BusEnumService` component contains settings used to manage how the system searches for devices that use Media Transfer Protocol over Bluetooth (MTP/BT).

MTP/BT enables the computer to synchronize and transfer data between the computer and portable devices. For example, the computer may synchronize Windows Media Player music and playlists to a portable music device.

## In This Section


This component includes two settings:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[BTSearchIntervalOnAC](microsoft-windows-wpd-busenumservice-btsearchintervalonac.md)</p></td>
<td><p>Specifies how often the computer will search for portable devices using MTP/BT while plugged in to AC power.</p></td>
</tr>
<tr class="even">
<td><p>[BTSearchIntervalOnDC](microsoft-windows-wpd-busenumservice-btsearchintervalondc.md)</p></td>
<td><p>Specifies how often the computer will search for portable devices using MTP/BT while on battery power.</p></td>
</tr>
<tr class="odd">
<td><p>[RegCacheUpdated](microsoft-windows-wpd-busenumservice-regcacheupdated.md)</p></td>
<td><p>For Microsoft internal use only.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-WPD-BusEnumService%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





