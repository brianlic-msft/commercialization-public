---
title: CoexistenceSupport
description: Specifies the type of co-existence that's supported on the device Both - Both Wi-Fi and Bluetooth work at the same performance level during co-existence.Wi-Fi reduced - On a 2X2 system, Wi-Fi performance is reduced to 1X1 level.Bluetooth centered - When co-existing, Bluetooth has priority and restricts Wi-Fi performance.One - Either Wi-Fi or Bluetooth will stop working.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 628ED36C-9B25-4450-AC96-C66FC2F0B901
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CoexistenceSupport


Specifies the type of co-existence that's supported on the device:

-   **Both** - Both Wi-Fi and Bluetooth work at the same performance level during co-existence.
-   **Wi-Fi reduced** - On a 2X2 system, Wi-Fi performance is reduced to 1X1 level.
-   **Bluetooth centered** - When co-existing, Bluetooth has priority and restricts Wi-Fi performance.
-   **One** - Either Wi-Fi or Bluetooth will stop working.

This setting is used for telemetry only. There is no OS action associated with this setting.

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
<td><p>1</p></td>
<td><strong>Both</strong></td>
</tr>
<tr class="even">
<td><p>2</p></td>
<td><strong>Wi-Fi reduced</strong></td>
</tr>
<tr class="odd">
<td><p>3</p></td>
<td><strong>Bluetooth centered</strong></td>
</tr>
<tr class="even">
<td><p>4</p></td>
<td><strong>One</strong></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md) | **CoexistenceSupport**

## Valid Configuration Passes


offlineServicing

specialize

oobeSystem

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md).

## Related topics


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CoexistenceSupport%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





