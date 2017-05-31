---
title: Device.Connectivity.Server
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
# Device.Connectivity.Server

 - [Device.Connectivity.Server](#device.connectivity.server)
-->

<a name="device.connectivity.server"></a>
## Device.Connectivity.Server

### Device.Connectivity.Server.ServerOutOfBandManageability

*Server Baseboard Management Controller (BMC) devices must support out-of-band management capabilities.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

BMC devices must support server hardware out-of-band management capability, using IPMI 2.0 through a LAN and/or Serial interfaces, as well as in-band through the KCS system channel via the IPMI Driver.

It is not necessary that the BMC implements the full IPMI 2.0 specification, as only a subset of functionality is required for out-of-band management. The BMC must support the following capabilities:

1.  The system’s boot source is configurable through the BMC.

    1.  The BMC must support the following operations being performed on the server system. This functionality is implemented using the Set System Boot Options command.

        1.  The server can be configured to boot from the PXE server the next time it is reset

        2.  The server can be configured to boot from the hard-disk the next time it is reset

        3.  The server can be configured to always boot from the PXE server

        4.  The server can be configured to always boot from the hard-disk

2.  The system’s BMC firmware and BIOS version information is exposed through the BMC.

    1.  The BMC must expose the version information for the following components:

        1.  BIOS (through Get System Info Parameters command).

        2.  BMC management firmware (through Get Device Id command).

3.  The OOB management LAN configuration can be updated through the BMC.

    1.  This requirement is only applicable for systems that expose the BMC through the IPMI/LAN channel. The management operations are carried out over the in-band channel through the IPMI driver. The BMC must expose the following information about its own LAN configuration through the Get LAN Configuration Parameters command:

        1.  Indicator of whether the BMC is configured with a static IP address or if one is assigned by DHCP

        2.  IP Address

        3.  Subnet mask

        4.  Default Gateway

    2.  The BMC must support the following operations being performed through the Set LAN Configuration Parameters command:

        1.  BMC can be configured with a static IP address, Subnet Mask, and Default Gateway IP address

        2.  BMC can be configured to get its IP address from the DHCP server

4.  The system’s power state can be managed through the BMC.

    1.  The BMC must expose the following server system information:

        1.  Current power state of the server (through the Get Chassis Status command)

    2.  The BMC must support the following operations being performed on the server system through the Chassis Control command:

        1.  The server power can be turned off

        2.  The server power can be turned on

        3.  The server power can be reset

5.  The BMC prevents untrusted access to the server system.

    1.  The authentication mechanism used by IPMI presents a number of vulnerabilities that are exploitable in a BMC with unsecure configuration. To mitigate some of these vulnerabilities, the following configuration is present on certified BMCs:

        1.  BMC must not allow remote access on the LAN channel using the RAKP-none Authentication Algorithm.

        2.  BMC must not have an anonymous user account configured by default. If this account exists, it must be disabled.

6.  The system’s basic inventory is exposed through the BMC.

    1.  The BMC must expose the following server system information:

        1.  Manufacturer of the server hardware (Read FRU Data command)

        2.  Model of the server hardware (Read FRU Data command)

        3.  Server SMBIOS GUID (Get System GUID command)

            1.  The expected format of the GUID on the wire conforms to the format described in the SMBIOS 2.8 Specification (DSP0134). That is, the GUID 00112233-4455-6677-8899-AABBCCDDEEFF is transmitted as 33 22 11 00 55 44 77 66 88 99 AA BB CC DD EE FF by the Get System GUID command.

        4.  Asset Tag of the server (Read FRU Data command)

        5.  Serial Number of the server (Read FRU Data command)

        6.  System Event Log time of the server (Get SEL Time command)

        7.  System Event Log capacity information (Get SEL Info command)

7.  The BMC allows remote credential management.

    1.  The BMC must support its Administrator password being changed through the Set User Password command. This operation is executed using the in-band channel through the IPMI driver.

8.  The System Event Log (SEL) can be managed through the BMC

    1.  The SEL entries can be read (Get SEL Entry command)

    2.  The SEL can be cleared (Clear SEL command)

Below is a list of the IPMI commands that are being used to manage BMC devices:

-   Open Session

-   RAKP Messages

-   Set Session Privilege Level

-   Get Session Info

-   Close Session

-   Get Device Id

-   Get System GUID

-   Get System Info Parameters

-   Read FRU Data

-   Chassis Control

-   Get Chassis Status

-   Get Channel Info

-   Get LAN Configuration Parameters

-   Set LAN Configuration Parameters

-   Warm Reset

-   Get SEL Entry

-   Get SEL Info

-   Reserve SEL

-   Clear SEL

-   Get SEL Time

-   Get System Boot Options

-   Set System Boot Options

-   Get User Name

-   Set User Password

**Enforcement**

This is an “If-Implemented” optional device requirement. This is a prerequisite device requirement for server claiming to be out-of-band manageable using the de facto IPMI standard. This requirement becomes in effect at the release of Windows Server 2016.

