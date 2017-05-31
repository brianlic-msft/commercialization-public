---
title: Group
description: Group
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 63eb28d1-3b5f-467e-bd34-a679a6e9aa83
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Group


The `Group` setting specifies the name of a [FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md). The available rule groups differ by Windows edition.

**To see the rule groups available on a computer**

1.  Run the **wf.msc** command. This opens the Windows Firewall with Advanced Security window.

2.  In the Windows Firewall window, select **Inbound Rules**. This shows each of the inbound rules.

3.  In the Actions window, select **Filter by Group**. The list of available groups is displayed.

In unattended installations, you can use a string for the **Group** setting—for example, "Remote Desktop." However, to specify a Group in an answer file that applies to multilingual unattended installations, you can reference an indirect string resource stored in the FirewallAPI.dll binary. For example, to enable Remote Desktop, use the following:

``` syntax
<Group>@FirewallAPI.dll,-28752</Group>
```

For more information, see the MSDN topic: [Firewall Groups](http://go.microsoft.com/fwlink/?LinkId=99708).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>GroupName</em></p></td>
<td><p>Specifies the name of a Windows Firewall rule group. <em>GroupName</em> is a string. The default value is an empty string.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Networking-MPSSVC-Svc](networking-mpssvc-svc.md) | [FirewallGroups](networking-mpssvc-svcfirewallgroups.md) | [FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md) | **Group**

## Valid Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Networking-MPSSVC-Svc](networking-mpssvc-svc.md).

## XML Example


The following XML output shows how to set two Windows Firewall groups. The first group is set using the name of the group. The second is set using information from the @FirewallAPI.dll file.

``` syntax
<FirewallGroups>
      <FirewallGroup wcm:action="add" wcm:keyValue="WindowsMediaPlayer">
      <Active>true</Active> 
      <Group>Windows Media Player</Group> 
      <Profile>all</Profile> 
   </FirewallGroup>
      <FirewallGroup wcm:action="add" wcm:keyValue="RemoteDesktop">
      <Active>true</Active> 
      <Group>@FirewallAPI.dll,-28752</Group> 
      <Profile>all</Profile> 
   </FirewallGroup>
</FirewallGroups>
```

## Related topics


[FirewallGroup](networking-mpssvc-svcfirewallgroups-firewallgroup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Group%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





