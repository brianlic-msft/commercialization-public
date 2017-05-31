---
title: Key
description: Key
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 148ace16-0efb-4eca-8c35-4f733bca8f15
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Key


`Key` specifies the name for the dedicated IP address. The name is specified as an attribute in the IpAddress.

**Note**  
-   This XML attribute does not appear in the **Properties** pane of Windows System Image Manager (Windows SIM) until you add this IPAddress to the answer file.

-   The value for Key is added to the answer file as an attribute of the [IpAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-dedicatedipaddresses-ipaddress.md) element. The attribute wcm:keyValue is used to identify multiple IP address list items. For example, you can specify three different IP addresses by using the Key values of Ip1, Ip2, and Ip3.

 

## Value


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Key</em></p></td>
<td><p>Specifies the name for the dedicated IP address.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | [Clusters](microsoft-windows-networkloadbalancing-core-clusters.md) | [Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md) | [DedicatedIpAddresses](microsoft-windows-networkloadbalancing-core-clusters-cluster-dedicatedipaddresses.md) | [IpAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-dedicatedipaddresses-ipaddress.md) | **Key**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML output specifies the name of the IP address as "Ip1".

``` syntax
<IpAddress wcm:keyValue="Ip1">
   <IpAddress>10.192.45.1</IpAddress>
   <NetworkMask>255.255.255.0</NetworkMask>
</IpAddress>
```

## Related topics


[IpAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-dedicatedipaddresses-ipaddress.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Key%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





