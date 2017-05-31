---
title: WLANFunctionLevelDeviceResetSupported
description: Specifies whether the device supports functional level device reset (FLDR). The FLDR feature in the OS checks this system capability exclusively to determine if it can run.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3D044025-F0B6-4546-9DF9-CBFB09DA7A97
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WLANFunctionLevelDeviceResetSupported


Specifies whether the device supports functional level device reset (FLDR). The FLDR feature in the OS checks this system capability exclusively to determine if it can run.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Disables functional level device reset.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Enables functional level device reset.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md) | **WLANFunctionLevelDeviceResetSupported**

## Valid Configuration Passes


offlineServicing

specialize

oobeSystem

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md).

## Related topics


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20WLANFunctionLevelDeviceResetSupported%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





