---
title: HKLMConnectTimeOut
description: HKLMConnectTimeOut
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 72644a17-ad1e-4b8a-9285-537a0fd0696f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HKLMConnectTimeOut


`HKLMConnectTimeOut` specifies the number of milliseconds to wait for an Internet connection request to complete for all users. After this timeout limit is reached, the request is canceled.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Number_of_milliseconds</em></p></td>
<td><p>Specifies the number of milliseconds to wait before timing out. The default value is <strong>60000</strong> (one minute). <em>Number_of_milliseconds</em> is an integer from 5000 (five seconds) through 86400000 (one day).</p>
<p>Setting this option to <strong>0</strong> will disable this timer.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md) | **HKLMConnectTimeOut**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md).

## XML Example


The following XML output shows how to set the timeout limit to two minutes.

``` syntax
<HKLMConnectRetries>1</HKLMConnectRetries>
<HKLMConnectTimeOut>120000</HKLMConnectTimeOut>
```

## Related topics


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20HKLMConnectTimeOut%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





