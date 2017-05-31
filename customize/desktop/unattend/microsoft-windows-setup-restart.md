---
title: Restart
description: Restart
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2bfabdf7-cd94-4fa8-a9e6-9bed0677db8d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Restart


`Restart` specifies whether to restart or to shut down the computer after the windowsPE configuration pass. This setting is specific to Windows PE scenarios. Once image-based installation begins, this setting is ignored.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Restart</strong></p></td>
<td><p>Specifies that the computer immediately restarts after the windowsPE configuration pass. End users cannot disable the restart. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>Shutdown</strong></p></td>
<td><p>Specifies that the computer immediately shuts down after the windowsPE configuration pass. End users cannot disable the shutdown.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **Restart**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set the computer to shut down after the windowsPE configuration pass.

``` syntax
<Restart>Shutdown</Restart>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Restart%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





