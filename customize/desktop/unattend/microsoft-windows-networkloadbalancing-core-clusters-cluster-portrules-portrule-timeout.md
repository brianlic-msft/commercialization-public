---
title: Timeout
description: Timeout
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9b7852d4-5d0a-4f6d-81b9-b3f85486be0f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Timeout


The `Timeout` setting specifies the number of seconds for which the client affinity (either single or network) would be preserved across configuration changes in the Network Load Balancing cluster.

Client affinity is used to associate client requests to cluster hosts.

By default, all network requests are load-balanced across the cluster without respect to their source. Affinity is implemented by directing all client requests from the same IP address to the same cluster host.

When extended client affinity is specified, then after a network connection terminates, it retains ownership of a connection for a configurable amount of time. Requests coming in from the same client during the timeout period are guaranteed to be picked up by the same cluster host. After this time expires, the connection is released.

**Note**  
-   This setting will be applied only if the [ClientAffinity](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule-clientaffinity.md) setting is set to `Single` or `Network`.

-   To enable this Network Load Balancing setting, the NetworkLoadBalancingFullServer package must be enabled in the Windows image you are installing. To do this, use Windows System Image Manager to add the Microsoft-Windows-Foundation-Package to your answer file, and then configure the NetworkLoadBalancingFullServer package to enable it. For more information about adding and configuring packages, see the [Windows Assessment and Deployment (Windows ADK) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=206587).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Number_of_seconds</em></p></td>
<td><p>Specifies a number of seconds for extended client affinity. During this time, requests coming in from the same client are guaranteed to be picked up by the same cluster host.</p>
<p><em>Number_of_seconds</em> is an integer value.</p>
<p>The default value is 0, meaning extended affinity is not used. All network requests are load-balanced across the cluster without respect to their source.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | [Clusters](microsoft-windows-networkloadbalancing-core-clusters.md) | [Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md) | [Portrules](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules.md) | [Portrule](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule.md) | **Timeout**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML example shows how to set the network so that requests from the same client are guaranteed to be picked up by the same cluster host until a timeout period of 15 minutes expires.

``` syntax
<Timeout>900</Timeout>
```

## Related topics


[Portrule](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules-portrule.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Timeout%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





