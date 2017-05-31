---
title: Value
description: Value
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 53b88df2-5e96-4335-80b9-81a9ffec95c5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Value


`Value` specifies information to associate a Tablet PC monitor to a digitizer.

This setting requires the string values of: *DigitizerPattern*, *AdapterPattern*, and *MonitorPattern*. For information about finding the Device String or Device ID values, see the MSDN articles: [DISPLAY\_DEVICE](http://go.microsoft.com/fwlink/?LinkId=140784) and [EnumDisplayDevices](http://go.microsoft.com/fwlink/?LinkId=140787).

**Note**  
Some portions of these patterns may change depending on installation order. For best results, only use portions of the string that are unique to the device.

 

An association is made between the digitizer and monitor if:

The *DigitizerPattern* matches exactly one digitizer.

The combination of *AdapterPattern* and *MonitorPattern* match exactly one monitor.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>&quot;<em>DigitizerPattern</em>&quot;=&quot;<em>AdapterPattern</em>|<em>MonitorPattern</em>&quot;</p></td>
<td><p>Specifies the information to associate the Tablet PC monitor to the digitizer.</p>
<p><em>DigitizerPattern</em> is a substring that matches the Device Instance Path of the digitizer.</p>
<p><em>AdapterPattern</em> is a substring that matches a unique pattern from either the DeviceString or DeviceID fields from DISPLAY_DEVICE.</p>
<p><em>MonitorPattern</em> is a substring that matches a unique pattern from either the DeviceString or DeviceID fields from DISPLAY_DEVICE.</p>
<p>It is not required to match these string values completely. You can provide just the portions of the string that are unique to the device.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md)| [AssociationData](microsoft-windows-tabletpc-platform-input-core-associationdata.md)| [AssociationElement](microsoft-windows-tabletpc-platform-input-core-associationdata-associationelement.md) | **Value**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md).

## XML Example


The following XML output shows how to configure the `AssociationData` setting to associate a Tablet PC monitor to three digitizers on the same system.

For the Tablet PC monitor in this example, the DeviceString is "MONITOR\\FAB1234B\\{12ab34cd56-ef76-ab54-3210fe}", and the DeviceID field is "Generic PnP Monitor". The substring FAB1234B is chosen for *Monitor\_pattern* in the example, though other choices of unique substrings are also possible.

**Note**  
In Windows System Image Manager, you can enter values with quotation marks. In the XML, the quotation marks are replaced with `&quot;`.

 

``` syntax
<AssociationData>
   <AssociationElement wcm:action="add" wcm:keyValue="Monitor1">&quot;hid#VID_1B96&amp;PID_0008&amp;REV_2100&amp;mi_01&amp;col01&quot;=&quot;PCI\\VEN_8086&amp;DEV_4102&amp;SUBSYS_16B510CF|FUJ5812&quot;</AssociationElement>
   <AssociationElement wcm:action="add" wcm:keyValue="Monitor2">&quot;hid#VID_1B96&amp;PID_0008&amp;REV_2100&amp;mi_01&amp;col02&quot;=&quot;PCI\\VEN_8086&amp;DEV_4102&amp;SUBSYS_16B510CF|FUJ5812&quot;</AssociationElement>
</AssociationData>
   <AssociationElement wcm:action="add" wcm:keyValue="Monitor3">&quot;hid#VID_1B96&amp;PID_0008&amp;REV_2100&amp;mi_01&amp;col03&quot;=&quot;PCI\\VEN_8086&amp;DEV_4102&amp;SUBSYS_16B510CF|FUJ5812&quot;</AssociationElement>
</AssociationData>
```

## Related topics


[AssociationElement](microsoft-windows-tabletpc-platform-input-core-associationdata-associationelement.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Value%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





