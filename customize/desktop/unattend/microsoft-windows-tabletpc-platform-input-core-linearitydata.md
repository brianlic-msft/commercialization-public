---
title: LinearityData
description: LinearityData
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9731a8c6-22c7-4a60-93b3-1996c4a8f7a7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LinearityData


`LinearityData` is a container for one or more instances of [DeviceElement](microsoft-windows-tabletpc-platform-input-core-linearitydata-deviceelement.md). This key is the parent key for calibration data for particular devices. You can create subkeys under this key to include calibration data for a particular digitizer. Run `tabcal.exe -export` to produce a device ID and a hexadecimal string containing calibration data. Insert the device ID and hexadecimal string under linearity data as a new subkey, using the device ID as a name and the calibration data as the value.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DeviceElement](microsoft-windows-tabletpc-platform-input-core-linearitydata-deviceelement.md)</p></td>
<td><p>Specifies a device.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md) | **LinearityData**

## Valid Passes


offlineServicing

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md).

## XML Example


The following XML output shows two devices specified, by using `LinearityData`.

``` syntax
<LinearityData>
<DeviceElement wcm:action="modify" wcm:keyValue="MyKey">11</DeviceElement>
<DeviceElement wcm:action="add" wcm:keyValue="MyKey1">12</DeviceElement>
</LinearityData>
```

## Related topics


[Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LinearityData%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





