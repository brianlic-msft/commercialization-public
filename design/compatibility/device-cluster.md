---
title: Device.Cluster
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

<!--
# Device.Cluster

 - [Device.Cluster](#device.cluster)
-->

<a name="device.cluster"></a>
## Device.Cluster

### Device.Cluster.Core.ClusterInABox

*Cluster in a Box*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A minimum of two or more Windows Server Certified systems grouped together in a shared storage cluster, running the Failover Clustering feature of Windows Storage Server, Windows Server, or Hyper-V Server, as a pre-configured Cluster in a Box product that is self-contained and purchasable as a single SKU, must have:

All components of the clustered server systems, such as devices, associated drivers, and filter drivers that are used in any system in the Cluster in a Box product, or are part of the Network or Storage Connected Devices of the Cluster in a Box product, and that have a defined Product Type must be certified for the version of Windows Server for which the Cluster in a Box product is being tested and submitted for certification.

All components of the clustered server systems, such as devices, associated drivers, and filter drivers that are used in any system in the Cluster in a Box product, but which do not have a defined Product Type must have a signature provided by Microsoft for the version of Windows Server for which the Cluster in a Box product is being tested and submitted.

For all the components above with a defined Product Type, and all those components above without a defined Product Type, all testing must be done using the Hardware Lab Kit \[or successor\] for the version of Windows Server operating system for which the Cluster in a Box product is being submitted.

All server systems must have all supported features of the included devices, drivers, filters and Network and Storage Connected Devices enabled during server system testing.

All server systems used in the Cluster in a Box product must be certified for the version of Windows Server for which the Cluster in a Box product is being submitted.

All server systems used in the Cluster in a Box testing must have all supported features of the included devices, drivers, filters and Network and Storage Connected Devices enabled and used during testing.

The complete Cluster in a Box product with all components must pass the Cluster in a Box tests included in the Hardware Lab Kit \[or successor\], in order for the test results submitted to Microsoft to be awarded the certification for a Cluster in a Box product.

