---
title: HKLMConnectRetries
description: HKLMConnectRetries
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b77b168b-0c25-4271-ac7d-db800e530854
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HKLMConnectRetries


`HKLMConnectRetries` specifies the number of times that the system attempts to resolve and connect to a host before the request is canceled.

The system makes only one attempt per IP address.

If a host has only one IP address and the first connection attempt fails, there are no further attempts. If a connection attempt still fails after the specified number of attempts, the request is canceled.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Number_of_retries</em></p></td>
<td><p>Specifies the number of times the system attempts to resolve and connect to a host before the request is canceled.</p>
<p>The default value is <strong>5</strong>. <em>Number_of_retries</em> is an integer between 1 and 100.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md) | **HKLMConnectRetries**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md).

## XML Examples


The following XML example shows how to specify that the system try the first two IP addresses in the list. If the host has seven IP addresses, the system tries only the first two IP addresses because `HKLMConnectRetries` is set to **2**.

``` syntax
<HKLMConnectRetries>2</HKLMConnectRetries>
```

The following XML example shows how to specify that the system try 10 IP addresses. If the host has seven IP addresses, the system tries seven times, because the system attempts each IP address only once.

``` syntax
<HKLMConnectRetries>10</HKLMConnectRetries>
```

## Related topics


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20HKLMConnectRetries%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





