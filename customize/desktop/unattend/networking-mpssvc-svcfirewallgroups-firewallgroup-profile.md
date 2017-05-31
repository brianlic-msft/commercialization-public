---
title: Profile
description: Profile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b349b4b8-6fa1-45fa-b7d8-ccba0abfc404
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Profile


`Profile` specifies the profile of a [FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>all</strong></p></td>
<td><p>Specifies all profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>domain</strong></p></td>
<td><p>Specifies the domain profile. This is the default value.</p></td>
</tr>
<tr class="odd">
<td><p><strong>private</strong></p></td>
<td><p>Specifies the private profile.</p></td>
</tr>
<tr class="even">
<td><p><strong>public</strong></p></td>
<td><p>Specifies the public profile.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Networking-MPSSVC-Svc](networking-mpssvc-svc.md) | [FirewallGroups](networking-mpssvc-svcfirewallgroups.md) | [FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md) | **Profile**

## Valid Passes


specialize

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Networking-MPSSVC-Svc](networking-mpssvc-svc.md).

## XML Example


The following XML output shows how to set Windows Firewall groups.

``` syntax
<FirewallGroups>
      <FirewallGroup wcm:action="add" wcm:keyValue="RemoteDesktop">
      <Active>true</Active> 
      <Group>Remote Desktop</Group> 
      <Profile>all</Profile> 
   </FirewallGroup>
</FirewallGroups>
```

## Related topics


[FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Profile%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





