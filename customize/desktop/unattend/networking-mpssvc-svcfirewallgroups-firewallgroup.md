---
title: FirewallGroup
description: FirewallGroup
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8a7d88a9-354f-4ec9-8f13-919de9297b1c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FirewallGroup


`FirewallGroup` specifies a Windows Firewall group.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Active](networking-mpssvc-svcfirewallgroups-firewallgroup-active.md)</p></td>
<td><p>Specifies whether a Windows Firewall group is active.</p></td>
</tr>
<tr class="even">
<td><p>[Group](networking-mpssvc-svcfirewallgroups-firewallgroup-group.md)</p></td>
<td><p>Specifies a Windows Firewall group name</p></td>
</tr>
<tr class="odd">
<td><p>[Key](networking-mpssvc-svcfirewallgroups-firewallgroup-key.md)</p></td>
<td><p>Specifies a unique name that you can use to identify the Firewall group.</p></td>
</tr>
<tr class="even">
<td><p>[Profile](networking-mpssvc-svcfirewallgroups-firewallgroup-profile.md)</p></td>
<td><p>Specifies a Windows Firewall group profile.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Networking-MPSSVC-Svc](networking-mpssvc-svc.md) | [FirewallGroups](networking-mpssvc-svcfirewallgroups.md) | **FirewallGroup**

## Valid Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Networking-MPSSVC-Svc](networking-mpssvc-svc.md).

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


[FirewallGroups](networking-mpssvc-svcfirewallgroups.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FirewallGroup%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





