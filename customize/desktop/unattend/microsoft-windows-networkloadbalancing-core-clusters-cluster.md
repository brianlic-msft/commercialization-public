---
title: Cluster
description: Cluster
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b9c7e245-6a44-4d7b-b435-41510d5e58fb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cluster


`Cluster` contains the settings to specify details about a cluster, such as its interface, IP address, portrules, and so on.

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
<td><p>[BDATeam](microsoft-windows-networkloadbalancing-core-clusters-cluster-bdateam.md)</p></td>
<td><p>Specifies details about a bidirectional affinity (BDA) team.</p></td>
</tr>
<tr class="even">
<td><p>[ClusterIpAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-clusteripaddress.md)</p></td>
<td><p>Specifies the cluster primary IP address.</p></td>
</tr>
<tr class="odd">
<td><p>[ClusterIpToClusterMacEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-clusteriptoclustermacenabled.md)</p></td>
<td><p>Specifies whether the cluster MAC address is automatically calculated from the primary cluster IP address.</p></td>
</tr>
<tr class="even">
<td><p>[ClusterMacAddress](microsoft-windows-networkloadbalancing-core-clusters-cluster-clustermacaddress.md)</p></td>
<td><p>Specifies the cluster MAC address to be used when configuring a unicast cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[ClusterMode](microsoft-windows-networkloadbalancing-core-clusters-cluster-clustermode.md)</p></td>
<td><p>Specifies the mode for the cluster.</p></td>
</tr>
<tr class="even">
<td><p>[ClusterName](microsoft-windows-networkloadbalancing-core-clusters-cluster-clustername.md)</p></td>
<td><p>Specifies a full Internet name for the cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[ClusterNetMask](microsoft-windows-networkloadbalancing-core-clusters-cluster-clusternetmask.md)</p></td>
<td><p>Specifies the subnet mask for the cluster IP address.</p></td>
</tr>
<tr class="even">
<td><p>[DedicatedIpAddresses](microsoft-windows-networkloadbalancing-core-clusters-cluster-dedicatedipaddresses.md)</p></td>
<td><p>Specifies the host's unique IP addresses.</p></td>
</tr>
<tr class="odd">
<td><p>[HostIdentifier](microsoft-windows-networkloadbalancing-core-clusters-cluster-hostidentifier.md)</p></td>
<td><p>Specifies the host identifier used by this cluster.</p></td>
</tr>
<tr class="even">
<td><p>[ICMPFilteringEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-icmpfilteringenabled.md)</p></td>
<td><p>Specifies whether Internet Control Message Protocol (ICMP) filtering is enabled for the cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[IdentityHeartbeatPeriod](microsoft-windows-networkloadbalancing-core-clusters-cluster-identityheartbeatperiod.md)</p></td>
<td><p>Specifies the recurrence interval for transmitting identity heartbeats between the NetworkLoadBalancing cluster hosts.</p></td>
</tr>
<tr class="even">
<td><p>[InitialHostState](microsoft-windows-networkloadbalancing-core-clusters-cluster-initialhoststate.md)</p></td>
<td><p>Specifies the initial host state for the cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[Interface](microsoft-windows-networkloadbalancing-core-clusters-cluster-interface.md)</p></td>
<td><p>Specifies the interface name to bind to network load balancing (NLB). This is a required setting.</p></td>
</tr>
<tr class="even">
<td><p>[MaskSourceMacEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-masksourcemacenabled.md)</p></td>
<td><p>Specifies whether source Media Access Control (MAC) address masking is used.</p></td>
</tr>
<tr class="odd">
<td><p>[MaximumConnectionDescriptors](microsoft-windows-networkloadbalancing-core-clusters-cluster-maximumconnectiondescriptors.md)</p></td>
<td><p>Specifies the maximum number of descriptors per allocation for the cluster.</p></td>
</tr>
<tr class="even">
<td><p>[MembershipHeartbeatLossTolerance](microsoft-windows-networkloadbalancing-core-clusters-cluster-membershipheartbeatlosstolerance.md)</p></td>
<td><p>Specifies the number of lost heartbeat messages before Setup considers the Network Load Balancing cluster host inactive and initiates convergence.</p></td>
</tr>
<tr class="odd">
<td><p>[MembershipHeartbeatPeriod](microsoft-windows-networkloadbalancing-core-clusters-cluster-membershipheartbeatperiod.md)</p></td>
<td><p>Specifies a period between sending Network Load Balancing cluster heartbeat messages.</p></td>
</tr>
<tr class="even">
<td><p>[MulticastSpoofEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-multicastspoofenabled.md)</p></td>
<td><p>Specifies whether address resolution protocol (ARP) traffic should be spoofed.</p></td>
</tr>
<tr class="odd">
<td><p>[NetBTSupportEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-netbtsupportenabled.md)</p></td>
<td><p>Specifies whether NetBT support is enabled for the cluster.</p></td>
</tr>
<tr class="even">
<td><p>[PersistSuspendedState](microsoft-windows-networkloadbalancing-core-clusters-cluster-persistsuspendedstate.md)</p></td>
<td><p>Specifies whether a host that is shut down while in a suspended state will remain suspended when Windows is started.</p></td>
</tr>
<tr class="odd">
<td><p>[Portrules](microsoft-windows-networkloadbalancing-core-clusters-cluster-portrules.md)</p></td>
<td><p>Specifies details about the port rules that are used for the cluster, including a port rule's name, virtual IP address, protocol, mode, and so on.</p></td>
</tr>
<tr class="even">
<td><p>[UnicastInterHostCommunicationSupportEnabled](microsoft-windows-networkloadbalancing-core-clusters-cluster-unicastinterhostcommunicationsupportenabled.md)</p></td>
<td><p>Specifies whether unicast, interhost communication support is enabled for the cluster.</p></td>
</tr>
<tr class="odd">
<td><p>[VirtualIpAddresses](microsoft-windows-networkloadbalancing-core-clusters-cluster-virtualipaddresses.md)</p></td>
<td><p>Specifies the cluster’s virtual IP addresses.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | [Clusters](microsoft-windows-networkloadbalancing-core-clusters.md) | **Cluster**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML output shows how to specify details about a cluster.

``` syntax
<Cluster>
   <Interface>Local Area Connection 2</Interface>
   <ClusterIpAddress>10.100.0.234</ClusterIpAddress>
   <ClusterNetMask>255.255.255.0</ClusterNetMask>
   <VirtualIpAddresses>
      <IpAddress wcm:keyValue="Ip1">
         <IpAddress>10.192.45.1</IpAddress>
         <NetworkMask>255.255.255.0</NetworkMask>
      </IpAddress>
      <IpAddress wcm:keyValue="Ip2">
         <IpAddress>fe80::204:23ff:feb9:1111</IpAddress>
      </IpAddress>
   </VirtualIpAddresses>
   <Portrules>
      <Portrule wcm:keyValue="Portrule1">
         <VirtualIpAddress>255.255.255.255</VirtualIpAddress>
         <Protocol>TCP</Protocol>
         <StartPort>0</StartPort>
         <EndPort>65535</EndPort>
         <Mode>MultipleHost</Mode>
         <EqualLoad>true</EqualLoad>
         <ClientAffinity>None</ClientAffinity>
      </Portrule>
      <Portrule wcm:keyValue="Portrule2">
         <VirtualIpAddress>10.100.0.223</VirtualIpAddress>
         <Protocol>Both</Protocol>
         <StartPort>80</StartPort>
         <EndPort>80</EndPort>
         <Mode>MultipleHost</Mode>
         <LoadWeight>100</LoadWeight>
         <ClientAffinity>Single</ClientAffinity>
      </Portrule>
      <Portrule wcm:keyValue="Portrule3">
         <VirtualIpAddress>10.100.0.99</VirtualIpAddress>
         <Protocol>TCP</Protocol>
         <StartPort>23</StartPort>
         <EndPort>23</EndPort>
         <Mode>Disabled</Mode>
      </Portrule>
      <Portrule wcm:keyValue="Portrule4">
         <VirtualIpAddress>255.255.255.255</VirtualIpAddress>
         <Protocol>UDP</Protocol>
         <StartPort>25</StartPort>
         <EndPort>25</EndPort>
         <Mode>MultipleHost</Mode>
         <EqualLoad>true</EqualLoad>
         <ClientAffinity>Network</ClientAffinity>
      </Portrule>
      <Portrule wcm:keyValue="Portrule5">
         <VirtualIpAddress>10.100.0.223</VirtualIpAddress>
         <Protocol>TCP</Protocol>
         <StartPort>3389</StartPort>
         <EndPort>3389</EndPort>
         <Mode>SingleHost</Mode>
         <HostPriority>1</HostPriority>
      </Portrule>
   </Portrules>
   <DedicatedIpAddresses>
      <IpAddress wcm:keyValue="Ip1">
         <IpAddress>10.192.45.1</IpAddress>
         <NetworkMask>255.255.255.0</NetworkMask>
      </IpAddress>
      <IpAddress wcm:keyValue="Ip2">
         <IpAddress>fe80::204:23ff:feb9:1111</IpAddress>
      </IpAddress>
   </DedicatedIpAddresses>
   <HostIdentifier>6</HostIdentifier>
   <ClusterMacAddress>02-bf-01-02-03-04</ClusterMacAddress>
   <ClusterName>mycluster.domain.com</ClusterName>
   <ClusterMode>Multicast</ClusterMode>
   <InitialHostState>Started</InitialHostState>
   <PersistSuspendedState>false</PersistSuspendedState>
   <MembershipHeartbeatPeriod>1000</MembershipHeartbeatPeriod>
   <MembershipHeartbeatLossTolerance>5</MembershipHeartbeatLossTolerance>
   <IdentityHeartbeatPeriod>2000</IdentityHeartbeatPeriod>
   <MulticastSpoofEnabled>false</MulticastSpoofEnabled>
   <MaskSourceMacEnabled>true</MaskSourceMacEnabled>
   <ICMPFilteringEnabled>false</ICMPFilteringEnabled>
   <NetBTSupportEnabled>true</NetBTSupportEnabled>
   <ClusterIpToClusterMacEnabled>true</ClusterIpToClusterMacEnabled>
   <UnicastInterHostCommunicationSupportEnabled>true</UnicastInterHostCommunicationSupportEnabled>
   <MaximumConnectionDescriptors>512</MaximumConnectionDescriptors>
   <BDATeam>
      <Team>{BF967924-0DE6-11D0-A285-00AA003049E2}</Team>
      <Master>true</Master>
      <ReverseHash>true</ReverseHash>
   </BDATeam>
</Cluster>
```

## Related topics


[Clusters](microsoft-windows-networkloadbalancing-core-clusters.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Cluster%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





