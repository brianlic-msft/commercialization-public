---
title: Device.Network.Switch.Manageability
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
# Device.Network.Switch.Manageability

 - [Device.Network.Switch.Manageability](#device.network.switch.manageability)
-->

<a name="device.network.switch.manageability"></a>
## Device.Network.Switch.Manageability

### Device.Network.Switch.Manageability.NetworkSwitchProfile

*Device.Network.Switch.Manageability.NetworkSwitchProfile*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description**

The proposed DTMF Network Switch Profile defines the CIM model and associated behavior for the management of a network switch (including the CIM classes, associations, indications, methods, and properties).  It is not necessary that a datacenter network switch implements the full proposed DMTF Network Switch Profile, as only a subset of functionality is required to meet this manageability requirement.  This subset must include the following management operations via implemented CIM classes remotely over WS-Man. This requirement is an If Implemented requirement and the functionality that needs to be met if this requirement is implemented is as follows:

-   Get, Enable and Disable Switch Features

-   Get, Enable and Disable Ports

-   Set Port to Access or Trunk mode

-   Get, Set Port Description

-   Get a list of VLANs for a Trunk Port

-   Get the VLAN for an Access Port

-   Add/Remove a VLAN to/from a Trunk Port

-   Get a list of VLANs

-   Enable/Disable a VLAN

-   Create/Delete a VLAN

-   Change VLAN Name

-   Shutdown/Restart Switch

-   Get, Set Switch Host Name

-   Get Firmware Version Info

-   Get, Set Banner for login

### Device.Network.Switch.Manageability.NetworkSwitchProfileView

*This is a mandatory requirement for certification that the Layer-3 capable network switch must have the capability to be configured by the Windows PowerShell Desired State Configuration (DSC) mechanism.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Desired State Configuration (DSC) enables deploying and managing configuration data for services and managing the environment in which these services run. Additional information can be found at <http://technet.microsoft.com/en-us/library/dn249912.aspx>.

A datacenter Layer-3 network switch native OMI based provider implements a specific set of view classes that define the DSC experience and requirements. The design of the view classes provides a higher-level task-based abstraction compared to the full Network Switch CIM schema. The design of the view classes would be based on the CIM standard as defined by DMTF in this publication <http://www.dmtf.org/sites/default/files/standards/documents/DSP0004_3.0.0.pdf>.

This declarative way of configuring the switches ensures that multiple round trips are not required for the configuration and provides a vendor agnostic interface to achieve that. Additionally, it also ensures that the network switches do not deviate from this initial configuration, thereby improving the reliability of the deployment.

The approach with CIM view classes greatly simplifies the schema for the initial configuration and enables the above goals of configuration. The switch vendors have the flexibility to choose their own underlying implementation for satisfying the contract of the DSC provider represented by the view classes.

All categories of manageability operations would be validated as follows:

1.  The change request DSC document, a Managed Object Format File (MOF) file, is successfully received and consumed by the network switch. This document specifies the desired state into which the network switch must transition.

2.  Depending on the targeted functional area of the network switch, different methods are used to verify the intended state of the network switch. The related requirements call these out individually.

In addition to the consumption of DSC documents in the above manners, the switch also supports Enumerate and Get functionality on the configuration element(s) so that an explicit Enumerate or Get operation can be invoked on the switch to return the state information of the configuration elements.

A datacenter Layer-3 network switch provides this support natively without the aid of an external companion provider operating in a separate device enclosure.
