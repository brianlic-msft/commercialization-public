---
title: Portrule
description: Portrule
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59ce39b3-5516-4cea-8eae-35baba20e33f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Portrule


`Portrule` specifies details about a port rule used for the cluster, including its name, virtual IP address, protocol, mode, and so on.

**Note**  
To enable this Network Load Balancing setting, the NetworkLoadBalancingFullServer package must be enabled in the Windows image you are installing. To do this, use Windows System Image Manager to add the Microsoft-Windows-Foundation-Package to your answer file, and then configure the NetworkLoadBalancingFullServer package to enable it. For more information about adding and configuring packages, see the [Windows Assessment and Deployment (Windows ADK) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=206587).

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[ClientAffinity](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-clientaffinity.md)</p></td>
<td><p>Specifies how network multiple requests are directed in a cluster.</p></td>
</tr>
<tr class="even">
<td><p>[EndPort](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-endport.md)</p></td>
<td><p>Specifies the end port used by the port rule.</p></td>
</tr>
<tr class="odd">
<td><p>[EqualLoad](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-equalload.md)</p></td>
<td><p>Specifies details about the equal load for the port rule.</p></td>
</tr>
<tr class="even">
<td><p>[HostPriority](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-hostpriority.md)</p></td>
<td><p>Specifies the host priority for the port rule.</p></td>
</tr>
<tr class="odd">
<td><p>[Key](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-key.md)</p></td>
<td><p>Specifies the name of the port rule.</p></td>
</tr>
<tr class="even">
<td><p>[LoadWeight](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-loadweight.md)</p></td>
<td><p>Specifies the load weight of the port rule.</p></td>
</tr>
<tr class="odd">
<td><p>[Mode](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-mode.md)</p></td>
<td><p>Specifies the mode of the port rule.</p></td>
</tr>
<tr class="even">
<td><p>[Protocol](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-protocol.md)</p></td>
<td><p>Specifies the protocol used by the port rule.</p></td>
</tr>
<tr class="odd">
<td><p>[StartPort](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-startport.md)</p></td>
<td><p>Specifies the start port used by the port rule.</p></td>
</tr>
<tr class="even">
<td><p>[Timeout](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-timeout.md)</p></td>
<td><p>Specifies the number of seconds for which the client affinity would be preserved across configuration changes in a cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[VirtualIpAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-virtualipaddress.md)</p></td>
<td><p>Specifies the virtual IP address of the port rule.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | [Clusters](microsoft-windows-networkloadbalancing-core-clusters.md) | [Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md) | [Portrules](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules.md) | **Portrule**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML output shows how to configure a port rule for a cluster

``` syntax
<Portrule wcm:keyValue="Portrule2">
   <VirtualIpAddress>10.100.0.223</VirtualIpAddress>
   <Protocol>Both</Protocol>
   <StartPort>80</StartPort>
   <EndPort>80</EndPort>
   <Mode>MultipleHost</Mode>
   <LoadWeight>100</LoadWeight>
   <ClientAffinity>Single</ClientAffinity>
</Portrule>
```

## Related topics


[Portrules](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Portrule%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





