---
title: BDATeam
description: BDATeam
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 63385903-c6f0-41cb-baae-db3ce62341b6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BDATeam


`BDATeam` specifies details about a bidirectional affinity (BDA) team.

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
<td><p>[Master](microsoft-windows-networkloadbalancing-core-clusters-cluster-bdateam-master.md)</p></td>
<td><p>Specifies whether the host is the master.</p></td>
</tr>
<tr class="even">
<td><p>[ReverseHash](microsoft-windows-networkloadbalancing-core-clusters-cluster-bdateam-reversehash.md)</p></td>
<td><p>Specifies whether the adapter reverses the source and destination IP addresses and ports before making load-balancing decisions.</p></td>
</tr>
<tr class="odd">
<td><p>[Team](microsoft-windows-networkloadbalancing-core-clusters-cluster-bdateam-team.md)</p></td>
<td><p>Specifies a valid Globally Unique Identifier (GUID) that identifies a BDA team.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | [Clusters](microsoft-windows-networkloadbalancing-core-clusters.md) | [Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md) | **BDATeam**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML output specifies details about a BDA team.

``` syntax
<BDATeam>
   <Team>{BF967924-0DE6-11D0-A285-00AA003049E2}</Team>
   <Master>true</Master>
   <ReverseHash>true</ReverseHash>
</BDATeam>
```

## Related topics


[Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20BDATeam%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





