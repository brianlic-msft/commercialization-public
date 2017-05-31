---
title: Clusters
description: Clusters
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e4e00dcc-e259-4c5d-a61e-0a1e532f12b7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Clusters


`Clusters` contains the settings to specify details about clusters.

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
<td><p>[Cluster](microsoft-windows-networkloadbalancing-core-clusters-cluster.md)</p></td>
<td><p>Specifies details about a cluster, such as its interface, IP address, port rules, and so on.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md) | **Clusters**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md).

## XML Example


The following XML output for the `Clusters` setting shows how to set up a cluster for network load balancing.

``` syntax
<Clusters>
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
         <ReverseHash>false</ReverseHash>
      </BDATeam>
   </Cluster>
</Clusters>
```

## Related topics


[microsoft-windows-networkloadbalancing-core-](microsoft-windows-networkloadbalancing-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Clusters%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





