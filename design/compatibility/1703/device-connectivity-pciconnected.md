---
title: Device.Connectivity.PciConnected
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
# Device.Connectivity.PciConnected

 - [Device.Connectivity.PciConnected](#device.connectivity.pciconnected)
-->

<a name="device.connectivity.pciconnected"></a>
## Device.Connectivity.PciConnected

### Device.Connectivity.PciConnected.64BitPrefetchableBar

*PCI-X and PCI Express devices that use prefetchable memory BARs, implement 64-bit prefetchable memory base address registers (BARs)*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Devices that sit on the PCI-X or PCI Express bus and use prefetchable memory BARs must implement 64-bit prefetchable memory BARs on x64-based systems.

*Design Notes*

See [Firmware Allocation of PCI Device Resources in Windows](http://www.microsoft.com/whdc/system/bus/pci/PCI-rsc.mspx)

If the device supports 64-bit prefetchable memory BARs, Windows attempts to assign a region above 4 GB. In a PCI bridge, Windows ignores boot configuration for an entire device path emanating from the bridge in whose scope this method is defined. For the bridge and devices below it to be assigned a region above 4 GB, all devices in the path must support 64-bit prefetchable BARs. If this is not true, the rebalance code runs and moves all resource assignments below 4 GB, because the goal is to start as many devices as possible

### Device.Connectivity.PciConnected.ConfigurationSpaceCorrectlyPopulated

*Configuration space for PCI device is correctly populated*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

PCI2.3 describes the configuration space that the system uses to identify and configure each device that is attached to the bus. The configuration space is made up of a header region and a device-dependent region. Each configuration space must have a 64-byte header at offset0. All the device registers that the device circuit uses for initialization, configuration, and catastrophic error handling must fit within the space between byte64 and byte255.
All other registers that the device uses during normal operation must be located in normal I/O or memory space. Unimplemented registers or reads to reserved registers must finish normally and return zero. Writes to reserved registers must finish normally, and the data must be discarded.
All registers that the device requires at interrupt time must be in I/O or memory space.

### Device.Connectivity.PciConnected.ExpressCardImplementsSerialNumber

*A single ExpressCard module that supports both USB and PCI Express interfaces implements a common serial number*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

An ExpressCard module that supports both USB and PCI Express interfaces on a single module must implement the common serial number as described in the PCI ExpressCard Electromechanical Specification.
This is the only method that Windows will use to determine the relationship of USB and PCI Express on one module.
 

### Device.Connectivity.PciConnected.InterruptDisableBit

*PCI and PCI-X devices, that are PCI 2.3 compliant, support the interrupt-disable bit*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All PCI and PCI-X devices that claim support for PCI Local Bus Specification Revision 2.3 or later, must support the interrupt-disable bit.

*Design Notes*

See PCI Local Bus Specification, Revision 2.3, Section 6.2.2.

### Device.Connectivity.PciConnected.MsiOrMsixSupport

*PCI device that reports PCI-X capability in the PCI configuration space and that generates interrupts may support MSI or MSI-X but is not required to do so*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

As part of the PCI Conventional Specification 2.2 or later, PCI-X Addendum, Section 3.2, all PCI-X devices that generate interrupts must support message-signaled interrupts.
For MSI implementation, MSI capabilities must be implemented in the configuration space.
For MSI-X implementation, MSI-X capabilities must be implemented in the configuration space.
However, because PCI-X is being replaced by PCI Express and many existing implementations do not support MSI or MSI-X, this requirement is being relaxed. Any device that claims to support MSI or MSI-X must do so or will fail the relevant WDK tests.

*Design Notes*

Message Signaled Interrupt for PCI-X device is required by industry standard specification. However, see above.

### Device.Connectivity.PciConnected.PciAndPcixDevicesArePciCompliant

*PCI and PCI-X devices, at a minimum, are PCI 2.1 compliant*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All PCI and PCI-X devices must comply with the PCI Local Bus Specification, Revision 2.1 or later. This requirement applies to devices on X86, IA64 and x64 systems.

*Design Notes*

See PCI Local Bus Specification, Revision 2.1 or later.

### Device.Connectivity.PciConnected.PCIExpress

*PCI Express requirement*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**1. Device driver for PCI Express device does not modify VC Enable settings:**

The device driver must not modify the "VC Enable" bit (PCI Express Base Specification, Version1.0a, Section7.11.7, VC Resource Control Register: bit 31) for any of the device's extended (non-VC0) virtual channel or channels.

**2.** **PCI Express link active state L1 exit latency does not exceed 64 µS:**

A PCI Express link, between root complex and device or bridge, cannot have an active state L1 exit latency of more than 64 microseconds on systems unless the link is associated with a PCI Express cable; that is, a value of 111b cannot be reported in the link capabilities register field 17:15. See PCIe Express Base Specification, Revision 1.0a, Section 7.8.6.

**3.** **PCI Express hot-plug port that supports firmware-controlled hot plug uses the \_OSC control method for enable and disable**:

All PCI Express hot-plug ports that support firmware-controlled hot-plugs must support the\_OSC control method for enabling and disabling firmware-controlled hot-plug as described in the PCI Firmware Specification Version 3.0. See PCI Express Base Specification, Revision 1.1, Section 6.7.4.

**4.** **PCI Express component implements a single device number on its primary interface:**

Every PCI Express component (that is, physical device) is restricted to implementing a single device number on its primary interface (upstream port), but it may implement up to eight independent functions within that device number. See PCI Express Base Specification, Revision1.1 (or later), Section 7.3.1.

**5. PCI Express device implements support for MSI or MSI-X:**

MSI support, which is optional for PCI 2.1, PCI 2.2, and PCI 2.3 devices, is required for PCI Express devices. This capability can be either implemented as MSI or MSI-X. See PCI Express Base Specification, Revision1.0a, Section 6.1.

**6**. **PCI Express root complex supports the enhanced (memory-mapped) configuration space access mechanism:**

The root complex must support the enhanced configuration space access mechanism as defined in PCI Express Base Specification, Revision 1.1 (or later), Section 7.9.

**7.** **PCI Express device that can interrupt supports the interrupt disable bit:**

If an interrupt is implemented, PCI Express devices must support the interrupt disable functionality described in PCI Local Bus Specification, Revision2.3. This bit disables the device or function from asserting INTx. A value of 0 enables the assertion of its INTx signal. A value of 1 disables the assertion of its INTx signal. This bit's state upon reset is 0

### Device.Connectivity.PciConnected.SubsystemIdsRequired

*Device IDs include PCI subsystem IDs*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The SID and SVID fields must comply with the SID requirement in PCI Local Bus Specification 2.3 and the implementation details in "PCI Device Subsystem IDs and Windows."
AMR devices and MR devices on the system board are not exempt from the requirement for SID and SVID.
SVID is not required for PCIe to PCI/PCI-X bridges.

*Design Notes*

See "PCI Device Subsystem IDs and Windows" at <http://go.microsoft.com/fwlink/?LinkId=36804>.
