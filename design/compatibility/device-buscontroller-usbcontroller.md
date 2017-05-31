---
title: Device.BusController.UsbController
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
# Device.BusController.UsbController

 - [Device.BusController.UsbController](#device.buscontroller.usbcontroller)
-->

<a name="device.buscontroller.usbcontroller"></a>
## Device.BusController.UsbController

### Device.BusController.UsbController.ImplementAtLeastOneXhciSpcStructForUSB2

*xHCI controllers must implement at least one xHCI Supported Protocol Capability structure for USB 2.0.*

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

Extensible Host Controller Interface (xHCI) controllers must implement at least one xHCI supported protocol capability structure for USB 2.0 as described in section 7.2 of the xHCI specification.

This affects backward compatibility with USB 2.0.

### Device.BusController.UsbController.MaintainDeviceStateOnResumeS1andS3

*USB host controller must maintain device state on resume from S1 or S3.*

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

For the host controller to maintain the device state, the USB host controller must not issue a USB bus reset on a system sleep state transition from S3 to S0 or from S1 to S0.

USB host controllers that are integrated or embedded into the south bridge chipset must decouple the USB bus reset from the PCI bus reset to reduce resume time. Resume operations from S1 or S3 must not generate USB bus resets. A USB bus reset is a reset signal that is sent over the USB bus to USB devices that are connected to the USB host controller. 

Systems that have a USB keyboard attached are allowed to perform USB bus resets to unlock the system by using a password when the system resumes from S3.

For security purposes, the BIOS in a mobile system is allowed to issue a USB bus reset if the system is attached to a docking station that has a hard disk drive (HDD) that is password-locked on first resume.

A reset of the HDD password is allowed whether or not the mobile system is docked. The following scenarios are allowed:
 

-   Undocked systems with a password-enabled HDD

-   Docked systems with a password-enabled HDD

-   Addition or removal of an HDD

If the docking station does not have a native HDD or the docking station does not have a password, the BIOS must not issue a USB bus reset.

It is acceptable to allow the controller to lose power in S3 when the system is on battery power.

*Design Notes*  

See the Enhanced Host Controller Interface Specification for Universal Serial Bus, Revision 1.0, Appendix A.

This requirement does not apply to systems that support Connected Standby.
 

### Device.BusController.UsbController.MustResumeWithoutForcedReset

*All USB host controllers must work properly upon resume from sleep, hibernation, or restart without a forced reset.*

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

All USB host controllers work properly upon resume from sleep, hibernation, or restart without a forced reset of the USB host controller.

*Design Notes*

A reset of the entire USB host controller results in significantly increased time that it takes for all USB devices to become available after system resume since there could be only one device at address 0 at a time, this enumeration has to be serialized for all USB devices on the bus. We have also seen that resetting the host controller can lead to an illegal SE1 signal state on some host controllers, which in turn can cause some USB devices to hang or drop off the bus. Moreover, devices cannot maintain any private state across sleep resume as that state will be lost on reset.

### Device.BusController.UsbController.PreserveDeviceStateAfterDisableEnable

*USB controller must preserve device states after a disable and re-enable.*

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

If a USB controller is disabled and then re-enabled, all devices that were attached to the controller before the USB controller was disabled are required to be present after the USB controller is re-enabled.

### Device.BusController.UsbController.UsbifCertification

*USB host controller is USB IF certified.*

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

USB host controllers must pass USB Implementers Forum (IF) testing. For details, see the following link:

-   <https://msdn.microsoft.com/en-us/library/windows/hardware/dn434058.aspx>

USB Type-C PD silicon (e.g., PD controller) must implement version 1.1 of the USB Type-C spec or higher and revision 2.0 v1.1 of the PD spec or higher and must be certified according to the USB-IF’s USB-C product testing matrix.

Note: Since USB-IF is currently not certifying controllers for Windows on ARM systems, the Windows on ARM controllers are exempt from needing to get full USB-IF certification. Instead, the WoA controllers are expected to pass all Windows Hardware Certification tests which include eventing, loop back, and registers tests that get run as part of USB-IF certification.

### Device.BusController.UsbController.UsbTypeCAltModeCertification

*USB Type-C Alternate Mode sub-systems are certified with their respective organizations.*

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

If the USB Type-C PD silicon (e.g., PD controller) supports an Alternate Mode Standard and the industry group that owns that Standard has a corresponding certification, the silicon must get that certification, in addition to USB-IF certification.

For example, if USB Type-C PD silicon supports DisplayPort Alternate Mode in addition to USB and PD, then that silicon must be certified by VESA for the DisplayPort functionality, in addition to the USB-IF for USB and PD functionality.

Certification for vendor-specific Alternate Modes is not required.

### Device.BusController.UsbController.UsbTypeCUCM

*USB Type-C Sub-systems support UCM*

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

USB Type-C PD silicon (e.g., PD controller) that run on a Windows 10 system and do not implement UCSI must ship with a 3<sup>rd</sup>-party UCMCx client Driver. 3<sup>rd</sup>-party UCMCx client drivers must be implemented as per the following MSDN documentation:

-   <https://msdn.microsoft.com/en-us/library/windows/hardware/mt188011.aspx>.

The UCMCx client driver is required to the implement the following APIs:

 - UcmInitializeDevice

 - UcmConnectorCreate

 - UcmConnectorTypeCAttach

 - UcmConnectorTypeCDetach

 - UcmConnectorTypeCCurrentAdChanged

 - UcmConnectorChargingStateChanged

If the system or controller supports Power Delivery, the following additional requirements apply:

 - UcmConnectorPowerDirectionChanged

 - UcmConnectorPdSourceCaps

 - UcmConnectorPdPartnerSourceCaps

 - UcmConnectorPdConnectionStateChanged

If the system or controller exposes dual role ports, the following additional requirements apply:

 - UcmConnectorDataDirectionChanged

### Device.BusController.UsbController.UsbTypeCUCSI

*USB Type-C Sub-systems that support UCSI implement it correctly*

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

USB Type-C PD silicon (e.g., PD controller) that runs on Windows 10 and implements its PD/USB Type-C state machine in an Embedded Controller must implement UCSI v1.0 (or later). In addition, it must implement the following optional features from UCSI spec.

*Commands*

-   GET\_ALTERNATE\_MODES

-   GET\_CAM\_SUPPORTED

-   GET\_PDOS

-   SET\_NOTIFICATION\_ENABLE

    -   The system or controller must support the following notifications within this command:

        -   Supported Provider Capabilities Change

        -   Negotiated Power Level Change

-   GET\_CONNECTOR\_STATUS

    -   The system or controller must support the following Connector Status Changes within this command:

        -   Supported Provider Capabilities Change

        -   Negotiated Power Level Change

<!-- -->

-   The system or controller must support the following field in GET\_CONNECTOR\_STATUS Status structure

    -   Provider Capabilities Limited Reason

### Device.BusController.UsbController.TestedUsingMicrosoftUsbStack

*xHCI controllers must be tested with Microsoft's xHCI Stack installed.*

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

Extensible Host Controller Interface (xHCI) controllers must be tested with Microsoft's xHCI stack installed and enabled on a Windows system. Support for all USB transfer types (ISoch, Interrupt, and Bulk) will be checked to ensure basic compatibility.

### Device.BusController.UsbController.XhciAc64Bit

*xHCI controllers must set the AC64-bit in the HCCPARAMS register to 1.*

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

xHCI controllers must set the AC64-bit in the HCCPARAMS register to 1 as described in Section 5.3.6 of the xHCI specification.
Therefore, the controller must support:

-   64-bit addressing, described in section 5.3.6

-   64-bit register access, described in section 5.1

*Design notes*:
Checking for AC64 to be set is a simple register check in the compliance driver.
To test 64-bit addressing, we will need to require the WLK user's client system to have at least 6 GB of RAM.  The test will use MmAllocateContiguousMemorySpecifyCache to get physical memory above 4 GB.  It will validate in some way that the controller can access this memory area.
The test will try writing one or more registers using a 64-bit register access and reading back using 64-bit register access to confirm that registers are updated correctly.  An example of a reasonable register to test is: "**Event Ring Segment Table Base Address Register (ERSTBA)**" (section 5.5.2.3.2).

If AC64 is not set, there is nothing to test.

### Device.BusController.UsbController.XhciAddInCardsMapPortsConsistently

*xHCI add-in cards must map USB 3.0 and USB 2.0 ports consistently.*

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

Consistent USB 2.0 and USB 3.0 port mapping is required to help the operating system to effectively manage the ports. 

Note: This requirement only applies to add-in cards because port mapping for integrated xHCI controllers should be performed via Advanced Configuration and Power Interface (ACPI). For more information, see the SYSFUND 226 requirement.

For Extensible Host Controller Interface (xHCI) add-in cards (where "add-in card" is defined as a card that is not integrated onto the motherboard), the complexity of this requirement varies significantly depending on whether the add-in card contains any internal (integrated or embedded) hubs.

If there are no internal hubs, then the port numbering must correlate as given in xHCI v1.x specification. That is, the first USB 3.0 port must be connected to the same connector as the first 2.0 port, the second with the second, and so on. For example, if the USB 2.0 ports are numbered 1 and 2, and the USB 3.0 ports are numbered 3 and 4, ports 1 and 3 must map to the same connector, and ports 2 and 4 must map to the same connector. For more information, see the xHCI v1.x Specification, sections 4.24.2.1 and 4.24.2.2. If the host does not have any internal hubs, then the remaining text of this requirement can be ignored.

However, if there are internal hubs (either integrated or embedded), then the requirement is more involved. Note that strictly speaking, XHCI specification does not allow such hubs for add-in cards because the port mapping information cannot be communicated to the software via ACPI. But through this requirement, we are allowing such hubs and defining the required port mapping. However, this mechanism has some limitations and it does not allow arbitrary configurations that are allowed for integrated controllers when described by ACPI.

For add-in cards, xHCI host controllers may implement "integrated hubs" and/or "embedded hubs" as defined in xHCI specification sections 4.24.2.1 and 4.24.2.2.  Embedded hubs need not be limited to being on the system board.  However, the following limitations apply:

-   Embedded hubs of add-in cards must be USB 3.0 hubs (this limitation is unique to the scenario of this requirement and not part of the xHCI specification).

-   An add-in card may have at most 1 integrated hub.

-   If an add-in card has an integrated hub, it must have only 1 USB2 protocol port on the root hub.  This port is the port connected to the integrated hub.

-   An add-in xHCI card that implements an integrated hub must set the Integrated Hub Implemented (IHI) bit in the USB 2.0 xHCI Supported Protocol Capability structure to '1' for the root hub port connected to an integrated hub (refer to section 7.2.2.1.3.2 of the xHCI specification).

-   All integrated or embedded hubs must be marked non-removable in their parent ports.

The implementation of integrated hubs determines the External Ports of the controller.  External Ports are a concept defined in section 4.24.2 of the xHCI specification to order ports, so that they can be mapped to connectors.  In all cases, let there be *n* USB2 protocol External Ports numbered 1 to *n*, and *m* USB3 protocol External Ports numbered *n*+1 to *n*+*m*.

 
External Port numbers are assigned to meet the following properties (not defined in the xHCI specification).  Note that integrated hubs must be USB 2.0 hubs.

-   If the xHCI implements an integrated hub, then *n*, the number of USB2 protocol External Ports, equals the number of downstream facing ports on the integrated hub.

-   Otherwise, *n* equals the number of downstream facing USB2 protocol ports on the root hub.

-   *m*, the number of USB3 protocol External Ports, equals the number of downstream facing USB3 protocol ports on the root hub.

-   Assign External Port numbers such that External Ports 1 through *n* are USB2 protocol ports and External Ports *n*+1 through *n*+*m* are USB3 protocol external ports, and the ordering ports within each protocol is preserved.

 
**If embedded hub(s) are not present:** The USB2 protocol External Ports and USB3 protocol External Ports must be mapped to connectors using the "default" mapping described in section 4.24.2.2 of the xHCI specification under the heading "When an Embedded hub is not implemented".

**If embedded hub(s) are present:** The embedded hubs must be USB 3.0 hubs.  First, determine the connector mapping as it would be without any embedded hubs, using the "default" mapping from section 4.24.2.2 of the xHCI specification.  For each embedded hub, both upstream ports must be connected to the same connector.  The embedded hubs' downstream ports map to new connectors in the same way as the ports of a non-embedded USB 3.0 hub.

**Non-exposed connectors:** Devices embedded in the host controller must be marked non-removable in their parent ports.  If, according to the connector mapping above, a non-removable peripheral device's connector is shared with a second port, the second port must not be connected or connectable to any device.  On the other hand, any connector whose port(s) are all marked as removable is considered to be an exposed connector, i.e., it must be physically connectable.

Note that if there is no ACPI information, a root hub cannot have both an embedded USB2 device and an integrated USB2 hub; instead, the embedded device must be attached to the integrated hub.

### Device.BusController.UsbController.XhciAddInCardsReportInternalDevices

*xHCI controller add-in cards must correctly report internally attached devices.*

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

Extensible Host Controller Interface (xHCI) controllers must indicate internally attached devices by setting the device removable (DR) bit in the PORTSC register to 1 for every port that has an internally attached device. This applies to controllers that do not have ACPI information. For more information, see section 5.4.8 of the xHCI Specification.
 

-   This requirement will prevent the operating system from flagging non-removable devices as removable.

-   Add-in cards are defined as host controllers that are not integrated onto the motherboard.

*Design Notes*

Note: This requirement only applies to add-in cards because port mapping for integrated xHCI controllers should be performed via Advanced Configuration and Power Interface (ACPI).

### Device.BusController.UsbController.XhciSupportDebuggingOnAllExposedPorts

*xHCI controllers must support USB debugging on all exposed ports.*

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

Extensible Host Controller Interface (xHCI) host controllers are debug-capable on all ports. Ports that have embedded non-removable devices attached do not need to report debug capability.
 

-   USB debugging is defined in section 7.6 of the xHCI specification.  

-   This requirement does not apply to add-in card host controllers. 

### Device.BusController.UsbController.XhciSupportMsiMsixInterrupts

*xHCI controllers must support MSI and/or MSI-X interrupts.*

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

Extensible Host Controller Interface (xHCI) controllers support Message Signaled Interrupts (MSI) and MSI-X interrupts as defined in section 6.8 of the PCI Local Bus Specification, revision 3.0 and section 5.2.6 of the xHCI Specification.

### Device.BusController.UsbController.XhciSupportsMinimum31Streams

*xHCI controllers must support at least 31 primary streams per endpoint.*

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

Refer to the eXtensible Host Controller Interface specification, section 4.12.2.

This requirement is for the MaxPSASize in the HCCPARAMS to be set to 4 at the minimum to enable ultimate data transfer rate with UAS devices.

Storage devices based on the USB Attached SCSI Protocol (UASP) will utilize streams to achieve faster data transfer rates.  To enable the best experience with these devices, every xHCI controller will need to support at least 31 primary streams.

### Device.BusController.UsbController.XhciSupportsRuntimePowerManagement

*USB xHCI host controllers must support runtime power management including, if implemented, runtime wake.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

All USB xHCI host controllers must support runtime power management, as required by the eXtensible Host Controller Interface specification, version 1.0, Section 4.15.

Runtime is defined as the system working state (S0), including the Connected Standby sub-state of S0 if the controller is tested on a system that supports Connected Standby.

Power management of the host controller encompasses software-initiated idle power down (controller low power state such as D3), software-initiated power up, and, optionally, hardware-initiated wake signaling.

If the xHCI controller is reported to support runtime wake signaling, it must be able to wake itself successfully upon any of the following events:
A) Any port detecting device wake signaling
B) Any port detecting connect, disconnect, or overcurrent, when the corresponding PORTSC Wake on Xxx bit is set to '1'.
For more details, see Section 4.15 of the xHCI specification.

To report whether the controller supports runtime wake signaling:
- For add-in controllers, the controller's PCI configuration space must accurately report whether the controller is capable of waking up via PME.  Note: reporting that the controller supports waking up via PME implies that the controller can both successfully perform PCI wake at runtime, and successfully wake the system from a system low power state, in accordance with the appropriate PCI specification.
- For integrated controllers, the ACPI \_S0W object must report whether the controller is capable of runtime wake signaling.

### Device.BusController.UsbController.XhciVersionCompliant

*USB 3.0 controllers are XHCI version compliant.*

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

USB 3.0 controllers must comply with the Extensible Host Controller Interface (xHCI) Specification version 1.0 and any USB-IF Errata that are released by the USB-IF. In 2019 Microsoft will transition to the text of this requirement being “USB 3.1 controllers must comply with the Extensible Host Controller Interface (xHCI) Specification version 1.1 and any USB-IF Errata that are released by the USB-IF. “. Microsoft strongly encourages transitioning to being compliant with the specification version 1.1 before the 2019 date.

