---
title: LayeredDriver
description: LayeredDriver
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bb468c34-f1d0-4035-bc76-3f8fbe78cd93
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LayeredDriver


`LayeredDriver` specifies a keyboard driver to use for Japanese or Korean keyboards.

In Japan, many retail users have 106-key keyboards, while some others have 101- or 102-key keyboards. In Korea, several different types of keyboards are available, some with different numbers of keys.

This setting provides a means to select the specific keyboard to configure during Windows Setup.

## Value


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Specifies the PC/AT Enhanced keyboard (101/102-key).</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Specifies the Korean PC/AT 101-Key Compatible keyboard or the Microsoft Natural keyboard (type 1).</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Specifies the Korean PC/AT 101-Key Compatible keyboard or the Microsoft Natural keyboard (type 2).</p></td>
</tr>
<tr class="even">
<td><p><strong>4</strong></p></td>
<td><p>Specifies the Korean PC/AT 101-Key Compatible keyboard or the Microsoft Natural keyboard (type 3).</p></td>
</tr>
<tr class="odd">
<td><p><strong>5</strong></p></td>
<td><p>Specifies the Korean keyboard (103/106-key).</p></td>
</tr>
<tr class="even">
<td><p><strong>6</strong></p></td>
<td><p>Specifies the Japanese keyboard (106/109-key).</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md) | **LayeredDriver**

## Valid Configuration Passes


windowsPE

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md).

## XML Example


The following example configures the `LayeredDriver` setting to use the Japanese (106/109) keyboard.

``` syntax
<LayeredDriver>6</LayeredDriver>
```

## Related topics


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md)

[Microsoft-Windows-International-Core](microsoft-windows-international-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LayeredDriver%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





