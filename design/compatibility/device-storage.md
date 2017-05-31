---
title: Device.Storage
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

# Device.Storage

 - [Device.Storage.Controller](#device.storage.controller)
 - [Device.Storage.Controller.Ata](#device.storage.controller.ata)
 - [Device.Storage.Controller.AzureStack](#device.storage.controller.azurestack)
 - [Device.Storage.Controller.Boot](#device.storage.controller.boot)
 - [Device.Storage.Controller.Fc](#device.storage.controller.fc)
 - [Device.Storage.Controller.Fc.NPIV](#device.storage.controller.fc.npiv)
 - [Device.Storage.Controller.Fcoe](#device.storage.controller.fcoe)
 - [Device.Storage.Controller.Flush](#device.storage.controller.flush)
 - [Device.Storage.Controller.Iscsi](#device.storage.controller.iscsi)
 - [Device.Storage.Controller.Iscsi.iSCSIBootComponent](#device.storage.controller.iscsi.iscsibootcomponent)
 - [Device.Storage.Controller.Optical](#device.storage.controller.optical)
 - [Device.Storage.Controller.PassThroughSupport](#device.storage.controller.passthroughsupport)
 - [Device.Storage.Controller.Raid](#device.storage.controller.raid)
 - [Device.Storage.Controller.Raid.ContinuousAvailability](#device.storage.controller.raid.continuousavailability)
 - [Device.Storage.Controller.Sas](#device.storage.controller.sas)
 - [Device.Storage.Controller.Sata](#device.storage.controller.sata)
 - [Device.Storage.Controller.SD](#device.storage.controller.sd)
 - [Device.Storage.ControllerDrive.NVMe](#device.storage.controllerdrive.nvme)
 - [Device.Storage.Enclosure](#device.storage.enclosure)
 - [Device.Storage.Enclosure.AzureStack](#device.storage.enclosure.azurestack)
 - [Device.Storage.Hd](#device.storage.hd)
 - [Device.Storage.Hd.1394](#device.storage.hd.1394)
 - [Device.Storage.Hd.Alua](#device.storage.hd.alua)
 - [Device.Storage.Hd.Ata](#device.storage.hd.ata)
 - [Device.Storage.Hd.AtaProtocol](#device.storage.hd.ataprotocol)
 - [Device.Storage.Hd.AzureStack](#device.storage.hd.azurestack)
 - [Device.Storage.Hd.DataVerification](#device.storage.hd.dataverification)
 - [Device.Storage.Hd.Ehdd](#device.storage.hd.ehdd)
 - [Device.Storage.Hd.EMMC](#device.storage.hd.emmc)
 - [Device.Storage.Hd.EnhancedStorage](#device.storage.hd.enhancedstorage)
 - [Device.Storage.Hd.FibreChannel](#device.storage.hd.fibrechannel)
 - [Device.Storage.Hd.Flush](#device.storage.hd.flush)
 - [Device.Storage.Hd.Iscsi](#device.storage.hd.iscsi)
 - [Device.Storage.Hd.Mpio](#device.storage.hd.mpio)
 - [Device.Storage.Hd.MultipleAccess](#device.storage.hd.multipleaccess)
 - [Device.Storage.Hd.MultipleAccess.PersistentReservation](#device.storage.hd.multipleaccess.persistentreservation)
 - [Device.Storage.Hd.OffloadedDataTransfer](#device.storage.hd.offloadeddatatransfer)
 - [Device.Storage.Hd.PersistentReservation](#device.storage.hd.persistentreservation)
 - [Device.Storage.Hd.PortAssociation](#device.storage.hd.portassociation)
 - [Device.Storage.Hd.RaidArray](#device.storage.hd.raidarray)
 - [Device.Storage.Hd.ReadZeroOnTrimUnmap](#device.storage.hd.readzeroontrimunmap)
 - [Device.Storage.Hd.RemovableMedia](#device.storage.hd.removablemedia)
 - [Device.Storage.Hd.Sas](#device.storage.hd.sas)
 - [Device.Storage.Hd.Sata](#device.storage.hd.sata)
 - [Device.Storage.Hd.Sata.HybridInformation](#device.storage.hd.sata.hybridinformation)
 - [Device.Storage.Hd.Scsi](#device.storage.hd.scsi)
 - [Device.Storage.Hd.Scsi.ReliabilityCounters](#device.storage.hd.scsi.reliabilitycounters)
 - [Device.Storage.Hd.ScsiProtocol](#device.storage.hd.scsiprotocol)
 - [Device.Storage.Hd.SMR](#device.storage.hd.smr)
 - [Device.Storage.Hd.ThinProvisioning](#device.storage.hd.thinprovisioning)
 - [Device.Storage.Hd.Trim](#device.storage.hd.trim)
 - [Device.Storage.Hd.Uas](#device.storage.hd.uas)
 - [Device.Storage.Hd.UasOnEHCI](#device.storage.hd.uasonehci)
 - [Device.Storage.Hd.Usb](#device.storage.hd.usb)
 - [Device.Storage.Hd.Usb3](#device.storage.hd.usb3)
 - [Device.Storage.Hd.WindowsToGoCapableUSBDrive](#device.storage.hd.windowstogocapableusbdrive)
 - [Device.Storage.Optical](#device.storage.optical)
 - [Device.Storage.Optical.BluRayReader](#device.storage.optical.blurayreader)
 - [Device.Storage.Optical.BluRayWriter](#device.storage.optical.bluraywriter)
 - [Device.Storage.Optical.Sata](#device.storage.optical.sata)

<a name="device.storage.controller"></a>
## Device.Storage.Controller

*General feature that applies to all storage controllers*

### Device.Storage.Controller.BasicFunction

*Storage controller basic functionality*

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

Controller Basic Functionality

PCI-based host controllers and adapters must support PCI bus mastering as the default setting, and virtual direct access memory (DMA) services must be supported in the host adapter option ROM.

Devices that cannot perform their function without other registry modifications, other than those performed automatically by the device class co-installer, are not eligible for the certification.

All commands must be passed to the underlying physical device unless the controller is a RAID adapter.

If a device returns less data than requested, it must correctly indicate an underrun condition and adapters must handle this in accordance with the WDK (adjust DataTransferLength).

Non-RAID Controller

Miniport drivers other than RAID drivers may not create pseudo devices to be used as targets for management commands for the adapter when no actual LUNs are present. Instead, a SCSI miniports INF must specify the CreateInitiatorLu parameter under the services Parameters key and set this DWORD value to 1. This may not be done using a coinstaller. Storage miniport drivers do not use this parameter as the adapter may always be used even if no devices are present. Values for storage drivers are documented in the WDK.

The following Storage Controller Driver Logo requirement is for the storage controller driver that does not have a matched submission category in the current Windows Hardware Certification Program. Any storage controller with a matched submission category shall be submitted under its matched category.

-   Storage controller driver must be a STORPORT MINIPORT driver.

-   Registry Entries for STORPORT Miniport Drivers - STORAGE\_BUS\_TYPE must set to BusTypeUnknown (0x00).

-   For storage controllers, the controller itself must correctly translate the commands and respond in accordance with the applicable SCSI specifications, even if the controller implements other command protocols on a different interface type such as SATA, NVMe, or PQI. Any commands that are not recognized must result in a SCSI check condition with valid sense data.

### Device.Storage.Controller.ClassCode

*Bus-attached controllers must implement the correct class/subclass code as defined in the PCI Code and ID Assignment Specification (Rev. 1.6).*

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

Controller Class Code

Storage host controllers and adapters must meet the requirements for the device protocol used and any requirements related to the device storage bus.
Bus-attached controllers must implement the correct class/subclass code as specified in PCI 2.3, Appendix D. This applies to all bus types including, but not limited to, IDE, Fibre Channel, SCSI, and SATA-based devices. Any device that implements RAID functionality regardless of whether the RAID implementation is done in hardware, firmware, or in the driver code, must implement the PCI RAID Class Code (01/04) and not use the interconnect class code (for example, a SATA RAID controller must implement the 01/04 class code and not the AHCI class code 01/06/01).

Non-PCI attached storage host controller does not need to report PCI class code. However, it must report the equivalent ACPI Compatibility ID.
 

### Device.Storage.Controller.InfFile

*All host adapters must be installed by using Plug and Play mechanisms and require the use of an INF file.*

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

Controller INF File
All host adapters must be installed by using Plug and Play mechanisms and require the use of an INF. Installation programs must use INF files, must pass the most current Chkinf tool, and can explicitly modify the registry values only by using INF file constructs that meet the Windows certification program requirements. Changes can be made only under the following keys:

-   TimeoutValues under the class driver services keys (Disk and Tape).

-   SpecialTargetList only for SCSIport implementations.

-   Device's service key (must be HKLM\\System\\CurrentControlSet\\Services\\ and the Parameters\\Device subkey under that).

-   Signal BusChangeDetected on any link transition or detection of a hot-plug event. A limited settling is allowed before this is signaled, but it must be settable through a registry parameter.

-   Implementation of the BusType registry DWORD to correctly set the interface type in accordance with the enumeration in NTDDSTOR.H (see the WDK). This value must be set in the miniport's INF under the service's Parameters key. There is no programmatic way to set it and you may not rely on coinstallers as they do not run under all scenarios.
     

### Device.Storage.Controller.MiniportDriverModel

*Storage Miniport Driver Model *

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

Miniport Driver Model

Drivers used with storage controllers must follow the miniport driver model. Storage Miniports must comply with all miniport interface definitions as defined in the WDK. Fibre Channel, iSCSI, SAS, SAS RAID SATA, SATA RAID, SCSI, and SCSI RAID controller drivers must be STORPORT miniports. Monolithic, full-port drivers or other types of drivers that do not follow the miniport model are not eligible for the certification. All drivers for physical hardware must be implemented to support Plug and Play. Legacy drivers are no longer supported.

Any device that depends on a filter driver for physical disk drive functionality is not eligible for certification. Filter drivers may not be used to bypass any part of the storage stack. For example, a filter driver many not directly access any hardware (such as by using HAL calls) and filter drivers may not be used to link cache manager to the hardware implementation. Filter drivers may not be used to violate any terms of the certification program.

Multipathing drivers may not be tied to specific HBAs except for PCI RAID controllers and must use the MPIO model.

Transient or pseudo-devices may not be exposed to the system. Drivers that specify NODRV may be used to "claim" management devices that report as processor, controller, or MSC device types. Such drivers that do not refer to a service entry are not eligible for the certification, but they can be signed.

<a name="device.storage.controller.ata"></a>
## Device.Storage.Controller.Ata

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Ata.Interface

*PATA Controller Interface*

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

PATA Interface
PATA controllers must comply with the ATA/ATAPI-7 specification. Bus-mastering DMA capability is required for all PATA controllers with the exception of compact flash and similar flash-RAM device.
The following requirements are also applied to ATA/ATAPI controllers.

-   The PACKET command protocol as defined in ATA/ATAPI-7 Volume 2, Section 11.8, must not be implemented in ATA-only controllers.

-   PATA controllers that support the PACKET command protocol must be fully implemented as defined in ATA/ATAPI-7 Volume 2, Section 11.8.

-   Identify Device data fields (61:60) and (103:100) must not be used to determine 28-bit or 48-bit LBA addressing support. Instead, bit 10 of word 83 and bit 10 of word 86 must be checked for 48-bit LBA addressing support as defined in ATA/ATAPI-7, Volume 1, Section 4.2.1.



<a name="device.storage.controller.azurestack"></a>
## Device.Storage.Controller.AzureStack

*Defines requirements that must be met if the storage controller is supported in a Microsoft Azure Stack based private cloud solution*

### Device.Storage.Controller.AzureStack.BasicFunction

*Basic requirements for storage controllers used in Microsoft Azure Stack solutions*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack requirements for storage controllers are captured by the following table.

<table>
    <tr><th>Feature</th><th>Requirement</th></tr>
    <tr><td rowspan="4">Device.Storage.Controller</td><td>Device.Storage.Controller.BasicFunction</td></tr>
	<tr><td>Device.Storage.Controller.ClassCode</td></tr>
	<tr><td>Device.Storage.Controller.InfFile</td></tr>
	<tr><td>Device.Storage.Controller.MiniportDriverModel</td></tr>
    <tr><td>Device.Storage.Controller.Boot</td><td>If ‘Device.Storage.Controller.Boot.BasicFunction’ is implemented, then ‘Device.Storage.Controller.Boot.BitLocker’ is required</td></tr>
    <tr><td>Device.Storage.Controller.Flush</td><td>Device.Storage.Controller.Flush.BasicFunction</td></tr>
    <tr><td>Device.Storage.Controller.PassThroughSupport</td><td>Device.Storage.Controller.PassThroughSupport.BasicFunction</td></tr>
    <tr><td>Device.Storage.Controller.Sas</td><td>If ‘Device.Storage.Controller.Sas.Interface’ is implemented, then ‘Device.Storage.Controller.Sas.TranslationLayer’ is required</td></tr>
    <tr><td>Device.Storage.ControllerDrive.NVMe</td><td>Device.Storage.ControllerDrive.NVMe.BasicFunction</td></tr>
    <tr><td rowspan="6">Device.DevFund.Server.Nano</td><td>Device.DevFund.Server.OperateInServerNano</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Deployment</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Diagnostics</td></tr>
	<tr><td>Device.DevFund.Server.Nano.PatchAndUpdate</td></tr>
	<tr><td>Device.DevFund.Server.Nano.MonitoringAndTelemetry</td></tr>
	<tr><td>Device.DevFund.Server.Nano.FirmwareUpdate</td></tr>
</table>

In addition to the above, the following requirements must be met:

1.	SAS HBA required for SAS and SATA disk devices
2.	SAS Expander with SES capability required for SAS and SATA devices

### Device.Storage.Controller.AzureStack.CloudStress
*Storage controllers that are used to connect to cluster storage for the private cloud solution must comply with this specification* 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Private cloud solutions comprise of tightly integrated software and hardware components to deliver resiliency with high performance. Issues in any of the components (software, hardware, drivers, firmware, and so forth) can compromise the solution and undermine any promises made regarding the Service Level Agreement (SLA) for the private cloud. 

Many of these issues are surfaced only under a high-stress, private cloud simulation. The Private Cloud Simulator (PCS) enables you to validate your component in a cloud scenario and identify such issues. It simulates a live datacenter/private cloud by creating VM workloads, scheduling administrative operations (load balancing, software/hardware maintenance), and injecting faults (unplanned hardware/software failures) on the private cloud. 

To comply with this specification, the controller must pass the PCS test run with the ‘Storage Controller – Azure Stack’ profile on a 4-node clustered configuration.

### Device.Storage.Controller.AzureStack.FirmwareUpdate
*Storage controllers that are used to connect to cluster storage for the private cloud solution must comply with this specification*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack will require SAS and NVMe controllers to be firmware updateable. For NVMe controllers, this must be possible through the inbox [firmware update mechanism](https://blogs.technet.microsoft.com/filecab/2016/01/25/updating-firmware-for-disk-drives-in-windows-server-2016-tp4/) introduced in WS 2016 (Update-StorageFirmware). Also, SAS HBAs must properly translate firmware download and activate commands according to the [SAT-4](http://www.t10.org/cgi-bin/ac.pl?t=f&f=sat4r04a.pdf) specification.


<a name="device.storage.controller.boot"></a>
## Device.Storage.Controller.Boot

*Defines requirements that must be met if the storage controller supports boot*

### Device.Storage.Controller.Boot.BasicFunction

*If the controller implements boot support, it must support Int13h functions.*

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

Controller Boot Support

Option ROMs in host controllers and adapters for any interface type, including RAID controllers, that provide boot support must fully support extended Int13h functions (functions 4xh) as defined in BIOS Enhanced Disk Drive Services - 3 \[T13-D1572\], Revision 3 or later. Logical block addressing is the only addressing mechanism supported.

It is recommended that controllers also support booting using the Extensible Firmware Interface (EFI) and implement device paths as defined in EDD-3. Starting from Windows 8, it is required for controllers to support booting using the Extensible Firmware Interface (EFI).

SD/eMMC/NAND flash controllers do not have Option ROM, so the first part of this requirement does not apply. EFI support is required.

### Device.Storage.Controller.Boot.BitLocker

*BitLocker must not cause failure in SAN Boot through storage controllers.*

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

BitLocker must be properly enabled to protect an operating system in a SAN Boot configuration.

**Business Justification**

(1) When a server is placed in an environment without adequate physical security, BitLocker protects data on the server against unauthorized access if a server is stolen; (2) When hosting service providers repurpose or decommission storage arrays, BitLocker Disk Encryption prevents data breach.

<a name="device.storage.controller.fc"></a>
## Device.Storage.Controller.Fc

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Fc.Interface

*Fibre Channel HBA interface*

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

Fibre Channel Interface
Fibre Channel host bus adapter drivers must support the WMI classes and methods required to implement the FC-HBA or SM-API by using the Microsoft HBAAPI.DLL. Vendors may not replace the Microsoft-provided version of the HBAAPI.DLL file. A subset of Hbapiwmi.mof WMI classes and methods are required for Windows compatibility. Other WMI classes are optional and are grouped to form feature sets. If a driver implements any part of an optional feature set, all related classes in that feature set must be supported. In some cases, some features are grouped into subfeatures. If a driver implements such a subfeature, the driver must correctly support that specific subfeature.
 

<a name="device.storage.controller.fc.npiv"></a>
## Device.Storage.Controller.Fc.NPIV

*NPIV is used to deliver Virtual Fibre Channel functionality in Hyper-V.*

### Device.Storage.Controller.Fc.NPIV.BasicFunction

*Hyper-V Virtual Fibre Channel N\_Port IO virtualization support*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

N\_Port IO Virtualization (NPIV) is the underlying technology used in the Hyper-V feature Virtual Fibre Channel. These tests allow vendors to self-test drivers for compatibility with Virtual Fibre Channel at an API level during the development cycle, and before submitting updated drivers to Microsoft for certification.

The following classes are required: MSFC\_VirtualFibrePortAttributes, MSFC\_FibrePortNPIVAttributes, MSFC\_FibrePortNPIVMethodsEx, MSFC\_FibrePortNPIVCapabilities, MSFC\_NPIVCapabilities, MSFC\_NPIVLUNMappingInformationEx. Optionally, MSFC\_DH\_Chap\_Parameters may be implemented.

These tests cover typical valid and invalid API calls, but do not cover in-depth scenarios covering VM workloads, storage target functionality and data integrity, performance, or other considerations.

<a name="device.storage.controller.fcoe"></a>
## Device.Storage.Controller.Fcoe

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Fcoe.Interface

*Fibre Channel over Ethernet host bus adapter*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Fibre Channel over Ethernet host bus adapter  
 

-   FCoE adapter must implement FC-BB-5 FC-BB\_E specification.

-   FCoE adapter miniport must be implemented as a Storport miniport.

-   FCoE adapter miniport must define VER\_FILEDESCRIPTION\_STR and contain the substring "\[FCoE\]".

-   For FCoE adapter miniport INF's \[service-install-section\]:

    -   "DisplayName" entry value is required and must contain the substring "\[FCoE\]".

    -   "Description" entry value is optional, if specified, must contain the substring "\[FCoE\]".

-   For FCoE adapter miniport INF's Models Section \[models-section-name\] | \[models-section-name.TargetOSVersion\]:

    -   "device-description" entry value must contain the substring "\[FCoE\]".

-   FCoE adapter miniport must declare BusTypeFibre as its STORAGE\_BUS\_TYPE in the INF file. STORAGE\_BUS\_TYPE Enumeration

-   FCoE adapters that expose PCI storage device(s)/function(s) for FCoE frame processing (either egress or ingress), must report 0x0c0400 (Fibre Channel) as its Class Code (Base Class, Sub-Class and Interface code).

### Device.Storage.Controller.Fcoe.Interoperability

*Fibre Channel over Ethernet host bus adapter – Interoperability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Interoperability
 

-   FCoE adapter must interoperate with FC SAN devices through FCF.

-   FCoE adapter must interoperate with native FCoE devices.

-   FCoE adapter must be able to transport network (IP) and storage (FCoE) traffic concurrently.

-   Disable/removal/loss of FC (storage) functionality must not impact network (Ethernet) connectivity and functionality.

-   FCoE adapter must be able to access and address FC and native FCoE devices concurrently (through FCF).

 
Initiator Coexistence
 

-   FCoE adapter must coexist with FC adapter without interference on the same system.

-   FCoE adapter must coexist with other FCoE adapters without interference on the same system.

<a name="device.storage.controller.flush"></a>
## Device.Storage.Controller.Flush

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Flush.BasicFunction

*Flush to connected device*

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

Industry standard spec requirements:

-   For ATA device, FLUSH CACHE (E7h, Non-Data ) 28-bit command is optional for ATA devices and ATAPI devices. FLUSH CACHE EXT (EAh, Non-Data) 48-bit command is mandatory for devices implementing the 48-bit Address feature set.

-   For SCSI Devices, SYNCHRONIZE CACHE (10) command and /or SYNCHRONIZE CACHE (16) command shall be implemented.

Windows design spec requirements - controller:

-   For controllers and device drivers of all bus types (ATA, SCSI and USB), flush cache command shall be sent to connected device without any omission.

<a name="device.storage.controller.iscsi"></a>
## Device.Storage.Controller.Iscsi

*Defines the industry and Microsoft standards that must be met*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

### Device.Storage.Controller.Iscsi.Interface

*iSCSI interface*

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

iSCSI Interface
iSCSI host bus adapters must be compatible with iSCSI RFC3720 and must implement all mandatory requirements. The only exception to this is that IPsec is not mandatory but, if implemented, will be tested. All optional components, if implemented, must comply with this specification.
 

-   Optional behavior must not undermine compliance with the iSCSI specification or the Windows certification program requirements for iSCSI.

-   The device and drivers must also meet applicable requirements for SCSI controllers and devices.

-   An iSNS client may be implemented and if so, comply with RFC3723.

-   An adapter must be able to receive ping (ICMP) and send ping (ICMP).

-   Device logons must be consistent with the Microsoft iSCSI Discovery Service.

-   Any boot device configured by other means must be reported to the service after boot.

-   Any other persistent target assignments and sessions under control of the HBA must be reported by using WMI to the iSCSI Initiator Service when it is available.

-   The following logon authentication implementations are both required:

	<!-- -->

	-   "CHAP-target authenticates initiator"

	-   None

	<!-- -->

-   Mutual CHAP, if implemented, must adhere to the specification and will be tested.

-   IPSec support must adhere to all applicable IPSec requirements in this document.

-   The HBA driver must implement all required WMI interfaces documented in the WDK.

-   The initiator must perform an automatic logon to targets assigned to the computer as persistent targets. The initiator will connect to all persistent targets before the targets are enumerated by Windows, which starts with an Inquiry to LUN 0. If a connection drops, it will continue to try to reconnect. Devices cannot depend on the discovery service for this information.

-   Initiators must:

	<!-- -->

	-   Maintain the persistent logon information in the registry or in NVRAM.

	-   Support the new WMI class for defining/managing persistent logons.

	-   Persist IP network adapter and discovery configurations (IP configuration information, such as static IP address, static default gateway IP address, static subnet mask, and DNS server) or use DHCP to obtain this information.

	-   For discovery configuration, remember which discovery methods are used and, for iSNS (if implemented), maintain the address of the iSNS server.

	<!-- -->

-   An iSCSI HBA must support changers, disk, tape, and external RAID devices.

<a name="device.storage.controller.iscsi.iscsibootcomponent"></a>
## Device.Storage.Controller.Iscsi.iSCSIBootComponent

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Iscsi.iSCSIBootComponent.FwTable

*iSCSI Boot functionality*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

iSCSI Boot functionality
The iSCSI boot component must:

-   Be compatible with iSCSI targets complying to iSCSI RFC3720.

-   Defer all iSCSI functionality to the Microsoft iSCSI software initiator after the Windows boot sequence begins (once ntoskrnl.exe loads).

-   Support Login Redirection.

-   Support one-way CHAP and must maintain CHAP secret in non-volatile memory.

-   Implement iSCSI Boot Firmware Table in firmware or Option ROM per the ACPI SIIG optional table.

-   Support crashdump.

-   Support the use of IPV6 addressing.

-   Support RELOGIN as minimum error handling in the case of an error during logon initialization sequence with the iSCSI target.

-   Support the following DHCP option numbers: 1, 3, 17, 43, 51, 54, 57, 60, 61, 255, 201, 202, 203, 204, 205, and 206.

-   Support the following DHCP parameters:

-   DHCPDISCOVER to get an IP address assigned.

-   DHCPREQUEST to obtain iSCSI protocol parameters.

-   DHCPINFORM to inquire updates in information from the DHCP server.

In addition:

-   All requests from the iSCSI preboot component DHCP clients to DHCP servers must use option 60 to signal the appropriate vendor scope.

-   All requests from the iSCSI preboot component DHCP clients to DHCP servers must use option 61 to signal the identity of this given client. If the client Alt ID is not defined, then the type field should be set to 0x01 and the EN MAC address must be used to define client identity. If the client Alt Id is defined, then the type field should be set to 0x00 and the CAID field must be used.

-   All requests from the iSCSI preboot component DHCP clients to DHCP servers must use the CHADDR field containing the EN MAC address of the DHCP client.

-   The use of the CIADDR in iSCSI preboot component must conform to the DHCP usage of CIADDR.

-   The use of the YIADDR iSCSI preboot component must conform to the DHCP usage of YIADDR; namely, the iSCSI preboot component DHCP client must accept the YIADDR provided by the DHCP server during the DHCPREQUESTÃ³DHCPACK or DHCPINFORMÃ³DHCPACK transaction sequence.

-   The use of SIADDR in the iSCSI preboot component must conform to the DHCP usage of SIADDR; namely, the iSCSI preboot component DHCP client must use this address to access the DHCP server during DHCPREQUESTÃ³DHCPACK or DHCPINFORMÃ³DHCPACK transactions.

-   To support DHCP option 1, the subnet mask provided in the DHCPOFFER response from the iSCSI pre-boot component must provide the subnet mask.

-   All transactions between the iSCSI preboot component DHCP clients and DHCP servers must be a single-frame transaction.

-   To avoid conflict with other services, the iSCSI preboot component must not use DHCP option 52.

-   Implementation of multiple option responses in the iSCSI preboot component must comply with RFC 3396.

<a name="device.storage.controller.optical"></a>
## Device.Storage.Controller.Optical

*General feature that applies to all storage controllers to ensure optical burning requirements are met.*

### Device.Storage.Controller.Optical.BasicFunction

*Storage HBA drivers must support optical drives.*

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

Controller optical support

The storage HBA drivers must support the optical device. The CDBs sent to the optical device and the response from the optical device must be handled properly.
 

<a name="device.storage.controller.passthroughsupport"></a>
## Device.Storage.Controller.PassThroughSupport

*Pass-through storage controller basic functionality*

### Device.Storage.Controller.PassThroughSupport.BasicFunction

*Pass-through storage controller basic functionality*

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

The bus adapter must report the actual bus type used to connected drives (e.g., drives are connected via the SAS bus; reporting drives as connected via the "RAID" bus is invalid).  All commands must be passed directly through to the underlying physical devices.  The physical devices must not be abstracted (e.g., formed into a logical RAID disk) and the bus adapter must not respond to commands on behalf of the physical devices.

NOTE: This applies only to SAS and SATA controllers.

<a name="device.storage.controller.raid"></a>
## Device.Storage.Controller.Raid

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Raid.BasicFunction

*RAID controller*

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

RAID Controller

-   Miniport drivers for PCI RAID adapters may create a management LU if this device is always available for management commands and has a device type other than disk. Since this device will appear in device manager, a NODRV INF may be submitted to claim this device and prevent user popups (this INF may be signed).

-   For RAID controllers, the controller itself must correctly interpret the commands and respond in accordance with the applicable SCSI specifications, even if the controller implements RAID on a different interface type such as SATA. Any commands that are not recognized must result in a SCSI check condition with valid sense data.

-   (If Implemented) If the RAID controller supports a disk pass-through mode (aka HBA mode) and the use of SATA drives, it should implement at least the following T10 SAT-4 spec (Rev. 03a) translations:

	-   Download Microcode mode 0Eh (Section 8.16.2.5)

	-   Download Microcode mode 0Fh (Section 8.16.2.6)

    Note: Compliance with this requirement should be tested by connecting a SATA drive, compliant with the Windows 10 firmware update requirements, to the Raid controller in HBA mode and running the HLK Firmware Update Test.

SCSI Requirements can be found in the Device.Storage.SCSI section.

<a name="device.storage.controller.raid.continuousavailability"></a>
## Device.Storage.Controller.Raid.ContinuousAvailability

*Validates that Continuous Availability (CA) storage controller and drivers meet all applicable requirements*

### Device.Storage.Controller.Raid.ContinuousAvailability.ActiveMode

*A device and its driver must support active LUN access on each node in a Windows Failover Cluster system configuration.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

When the device and driver are configured in multiple nodes in a Windows failover cluster, each node must support as a minimum “dual-active” access, defined as full read/write functionality for at least one LUN that has the capability to be failed over to another node in the cluster. Specifically, a device is not allowed to only support passive operation where the device and driver operate only in the standby mode until the cluster fails over a LUN from another node.

Design Notes:

-   For this “dual-active” access, LUNs do not need to provide full, performant read/write functionality to all nodes in the cluster. Access from other nodes only needs to be supported as required to support a valid Windows failover cluster.

-   Specifically, it is desirable but not required to support simultaneous, shared access to a LUN from multiple nodes in the cluster.

### Device.Storage.Controller.Raid.ContinuousAvailability.FailoverClustering

*A device and its driver must meet a minimum set of requirements to operate in a Windows failover cluster.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A device must comply with SPC-3 section 6.11 PERSISTENT RESERVE IN command

-   A device must comply with SPC-3 section 6.12 PERSISTENT RESERVE OUT command

    -   Device must support Persistent reservations type as defined in section 6.11.3.4 Table 107:

		<!-- -->

		-   5h Write Exclusive – Registrants only

		<!-- -->

-   A device must comply with Reservation behavior as defined in SPC-3 section 5.6

-   Specifically, SCSI compliance testing should take special care to verify the following:

    -   Verify Reserving – once reserved, the scope & type of an existing persistent reservation cannot be changed

    -   Comply with section 5.6.1 – table 32

    -   Comply with section 5.6.6 – table 33, table 34, table 36 – verify Good Status conditions

    -   Verify, re-register an I\_T nexus that has already been registered (5.6.6) – should return good status

    -   Verify, re-reserve an I\_T nexus that holds the persistent reservation (5.6.9) – should return good status

    -   Return Reservation conflict – if PRO command with service action PREEMPT or PREEMPT & ABORT is sent with invalid Service Action Reservation Key (5.6.10.4.4)

    -   Verify Additional Length Field per 6.11.3.2 - should return zero when no persistent reservation is held

Design Notes:

-   It is recommended that in addition to the standard HCT qualification, all solutions are also validated with the "Microsoft Cluster Configuration Validation Wizard" (ClusPrep) tool.

-   Only SAS devices using the Serial SCSI Protocol (SSP) transport will be supported on failover clusters (including SAS JBOD or any SAS SSP RAID systems).

If the system disks are attached to a bus type that is not a valid type for shared storage (something other than FC, iSCSI, or SAS), then the system disks and shared.

### Device.Storage.Controller.Raid.ContinuousAvailability.LunAccess

*A device and its driver must meet requirements for accessing LUNs in a Windows failover clustering configuration.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

When a node in a Windows Failover Cluster fails over its resources, either planned or unplanned (e.g., resulting from a node crash or node power failure), the device and driver must meet the following requirements:

-   All data from successfully acknowledged writes prior to failover must be preserved and accessible from surviving nodes. Specifically, data corresponding to write operations sent to the device and driver on the failing node prior to the start of failover of its LUNs (i.e., after the corresponding RAID controller on a surviving node receives a persistent reservation request corresponding to the LUNs from the failed node) that have been acknowledged by the driver as completed must be accessible after failover completes from a surviving node. In addition, any data that may be pending from unacknowledged writes at the start of failover must not change data subsequently written to the device from a surviving node.

-   When the LUNs supported by the RAID controller on the failing node stop being accessible (i.e., stop acknowledging and processing I/O requests), the LUN must be made accessible (i.e., acknowledge and process I/O requests) by at least one other node in the cluster with a maximum delay of 5 seconds. This time limit must be supported for up to 100 LUNs or the maximum number of LUNs supported by the controller, whichever is smaller.

During normal operation (i.e., not during failover) in a Windows failover cluster, the device and driver must meet the following requirement:

-   All I/O requests to any LUN supported by the RAID controller must complete within 25 seconds. This time limit must be supported for up to 100 LUNs or the maximum number of LUNs supported by the controller, whichever is smaller.

### Device.Storage.Controller.Raid.ContinuousAvailability.RAID

*A device and its driver must meet a minimum set of requirements for RAID functionality.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

-   A device and its driver must support commands from SBC-2 (or later) regardless of the drive interface implemented.

-   A device and its driver must support, at a minimum, one of: RAID1, RAID 5, RAID6 or RAID 1/0, or an equivalent feature that supports full LUN functionality in the event of failure of a single data drive.

-   A device and its driver RAID implementation must provide a solution to prevent data loss due to the RAID “write hole” failure mechanism. (See Design Notes for definition of the RAID “write hole” failure mechanism.)

**Design Notes**

If there is a system or controller failure during active writes, the erasure code information of a stripe (e.g., parity) may become inconsistent with the data. Data loss may result if this incorrect erasure code information is subsequently used to reconstruct the missing block in that stripe. This problem is known as the RAID “write hole”.

-   Examples of typical solutions for the RAID write hole problem are to provide mechanisms to detect and recover from an interrupted update-in-place operation or to avoid update-in-place semantics.

### Device.Storage.Controller.Raid.ContinuousAvailability.RecoveryProcessing

*A device and its driver must automatically complete all recovery processing resulting from failing over a LUN from a node in a Windows failover cluster.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

When the device and driver are configured in a Windows failover cluster and LUN access is restored after a failover (see requirement CAHWStorage-0004), all processing required by the device and driver to recover from the failover operation and restore normal operation must complete automatically, i.e., without any manual intervention.

<a name="device.storage.controller.sas"></a>
## Device.Storage.Controller.Sas

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Sas.Interface

*SAS controller interface*

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

SAS Interface

SAS host bus adapter miniport drivers must use the Microsoft hbaapi DLL to support the Windows Management Instrumentation (WMI) methods. The specific required WMI classes and methods are grouped and designated as mandatory or optional. All mandatory classes and methods must be supported. If a group is identified as optional and a miniport driver supports that group, individual methods and classes within that group are also classified as mandatory if the group is implemented, or optional, if the group is not implemented.

**Note:** The SAS HBA API is currently in the draft stage at the T11.5 working group. This support will not be a requirement until the draft document is complete. WHQL will issue an announcement when this support becomes a requirement.

### Device.Storage.Controller.Sas.TranslationLayer

*Defines specific translations from SAS to SATA that must be implemented *

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

(If Implemented)

SAS HBAs and/or their drivers should implement the following SCSI / ATA Translations, as defined in the T10 SAT-4 spec (Rev. 03a):

-   Download Microcode mode 0Eh (Section 8.16.2.5)
-   Download Microcode mode 0Fh (Section 8.16.2.6)

Note: Compliance with this requirement should be tested by connecting a SATA drive, compliant with the Windows 10 firmware update requirements, to the SAS HBA and running the HLK Firmware Update Test. Testing the controller's translation layer should be done with a SAS expander between the target (SATA drive) and the controller (HBA).

<a name="device.storage.controller.sata"></a>
## Device.Storage.Controller.Sata

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.Sata.Interface

*SATA controller interface*

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

SATA Interface
 

-   SATA controllers must comply with the ATA/ATAPI-7 specification.

-   SATA controllers must support hot plug.

-   SATA controllers shall support Asynchronous Notification as defined in Serial ATA: High Speed Serialized AT Attachment, Version 2.6 or later and AHCI 1.3 or later.

-   If implemented, NCQ must be supported properly.

-   If implemented, larger sectors other than 512 bytes must be supported properly.

-   AHCI SATA controllers must comply with the AHCI 1.0 specification or later.

-   SATA controllers shall not emulate PATA.

-   Interfaces for non-AHCI SATA controllers, if implementing an interface other than AHCI, must be supported by a Windows inbox driver or must certify with a supplied driver set. The supplied drivers must meet the driver certification requirements in this document.

-   Recommendation: SATA controllers should implement interface power management.

-   Recommendation: SATA controllers should implement Native Command Queuing (NCQ) support.

<a name="device.storage.controller.sd"></a>
## Device.Storage.Controller.SD

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Controller.SD.BasicFunction

*SD controller basic functionality*

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

-   Supports the SD Standard Host Interface (as per the SD 3.0 Standard).

-   Supports CMD21 tuning for eMMC HS200.

-   All interrupts shall be disabled except for buffer read ready when executing the tuning procedure for either SD 3.0 devices (CMD19) or eMMC 4.5 devices (CMD21).

-   Tuning procedure must use the standard tuning blocks defined in the SD and eMMC standard specifications, respectively.

-   Supports 1.8V and 3.3V signaling voltages.

-   Supports ADMA2 (no system DMA).

-   Properly express all capabilities supported by the host controller in the standard capabilities register.

-   Supports Byte (8-bit), Word (16-bit), and Double Word (32-bit) register accesses based on the register size given in the standard host controller specification.

-   Supports write protect where write protect is indicated by the value 0.

-   Supports 1-bit and 4-bit bus widths. 8-bit bus width is also required for eMMC controller.

-   Supports all UHS-I modes (SDR50, DDR50, SDR104). HS200 is also required for eMMC controller.

-   No retuning shall be necessary for SDR50 mode.

-   Retuning shall not require a software timer.

-   Supports Auto CMD23 and Auto CMD12.

-   No toggling of any proprietary register bits shall be necessary to enable any functionality.

-   Clock frequency shall be calculated according to standard specification.

-   Support standard error recovery procedure.

<a name="device.storage.controllerdrive.nvme"></a>
## Device.Storage.ControllerDrive.NVMe

*Storage NVMe feature*

### Device.Storage.ControllerDrive.NVMe.BasicFunction

*NVMe device requirements*

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

**Description**

The following requirements must be fulfilled by the NVMe device in general:

-   The device must support PCIe Gen2 or higher.

The device must support the following interrupt modes:


-   Running with the requested number of interrupts (i.e., &gt; 1 MSI or MSI-X based interrupt)

-   Running with only 1 MSI or MSI-X interrupt

-   Running with only 1 line-based interrupt

    -   \[Server\] MSI-X is required

    -   \[Client\] MSI or MSI-X is required

The device must use the following class and sub-class codes for identification, for further driver matching the vendor and product IDs should be utilized:

-   Base Class:01h

-   Sub-Class:08h

-   Programming Interface:02h

The device must have at least one upgradeable firmware slot.

\[Client\] (If Implemented) The device shall support either:

-   A non-operational NVMe power state with a maximum listed power consumption of no more than 5mW and an exit latency to an operational state of less than 100ms (implies L1.2), or

-   The ability to resume from D3cold (power-off) within 500ms, while not exceeding an entry latency of 1,000ms.

Note: If such a power state or capability is not provided by the device, experience on Connected Standby systems will be affected negatively as battery drain increases significantly.

It is highly recommended that NVMe devices that are to be used in client systems with limited cooling capability support at least the following in addition to 100% on and off states:

-   1 operational power state (reduced performance) – such that significant thermal throttling of the device is possible

-   1 non-operational power state with a resume latency of at most 50ms.

The following requirements that the device must fulfill are specific to revision 1.0 of the official NVMe spec:

-   3.1.1 Controller Capabilities

    -   MPSMIN (Memory Page Size Minimum) must be set to 0. Bit: 51:48

-   5.2 Asynchronous Event Request

    -   Error events, as well as SMART / Health status events must be supported, see section 5.12 below.

-   5.3 Create I/O Completion Queue

-   5.4 Create I/O Submission Queue

-   5.5 Delete I/O Completion Queue

-   5.6 Delete I/O Submission Queue

-   At least 2 queues must be supported for 5.3 through 5.6

    -   1 set of I/O submission and completion queues and 1 set of admin submission and completion queues are acceptable.

    -   Note: It is recommended to provide at least 4 I/O queues on client devices and 16 or more on server devices to provide the ability to bind one set of queues per processor on the system.

-   5.7 Firmware Commit

    -   Activation of a firmware image should be done without requiring a power cycle of the device.

    -   The activation process is expected to be achieved via a host-initiated reset, as described in section 8.1 of spec version 1.2a.

-   5.8 Firmware Image Download

    -   The device must not fail I/O during the download phase and shall continue serving I/O.

-   5.9 Get Features – at least the following must be reported accurately:

-   5.12.1.5 Error Recovery

-   5.12.1.6 Volatile Write Cache

    -   A volatile write cache is not required on the device to adhere to these requirements. This field has to be accurately reported.

-   5.12.1.8 Interrupt Coalescing

    -   \[Server\] required

    -   \[Client\] not required

-   5.12.1.11 Asynchronous Event Configuration

-   5.10 Get Log Page

    -   The device must implement and populate at least the log pages for Error Information (01h), SMART / Health Information (02h), and Firmware Slot Information (03h)

-   5.11 Identify

    -   MDTS (Maximum Data Transfer Size) must be either 0 (no limitation) or at least 5 (128KB). Byte: 77

        -   Note: This value may increase in future revisions and next generation devices should be designed with this in mind.

    -   NN (Number of Namespaces) must be at least 1. Bytes: 519:516

    -   FLBAS (Formatted LBA Size) must have bit 4 set to 0. Byte: 26

        -   If the Metadata Capabilities feature is supported, this requirement holds, otherwise it can be ignored; i.e., iff MC bit 1 is set to 1, the above FLBAS requirement is binding. Byte: 27

    -   LBADS (LBA Data Size) must be set to 9 or 12, i.e., 512B or 4KB. Bits: 23:16

        -   Other LBA data sizes are acceptable, as long as 512B or 4KB is supported.

    -   NGUID (Namespace Globally Unique Identifier) / EUI64 must be implemented.

        -   The controller shall specify a globally unique namespace identifier in this field or the EUI64 field when the namespace is created.

-   5.12 Set Features – at least the following must be implemented:

    -   Error Recovery (05h)

    -   Volatile Write Cache (06h)

        -   If a volatile write cache exists on the device

    -   Number of Queues (07h)

    -   Interrupt Coalescing (08h)

    -   Asynchronous Event Configuration (0Bh)

-   5.13 (If Implemented) Format NVM

    -   The device should be capable to perform a Cryptographic Erase (SES Value 010b)

        -   If cryptographic erase is not supported, Windows will not utilize the FormatNVM command.

    -   Format NVM must be targetable at individual namespaces, i.e., Bit 1 and Bit 0 in the Identify Controller data structure, of Byte 524 (FNA), must be set to 0.

-   6.6 Dataset Management – Deallocate

    -   All I/O and Deallocate commands shall be completed in less than 500 ms.

    -   98.5% of I/O commands shall be completed in less than 100 ms.

-   6.7 Flush

    -   If a volatile cache exists on the device

-   6.8 Read

-   6.9 Write

<a name="device.storage.enclosure"></a>
## Device.Storage.Enclosure

*Drive enclosures must meet these requirements.*

### Device.Storage.Enclosure.DirectAccess

*Drive enclosures must provide direct access to the drives they house.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Enclosures must not abstract the drives they house (e.g., formed into a logical RAID disk).  Integrated switches, if present, must provide discovery of and access to all the drives in the enclosure without requiring additional physical host connections.

### Device.Storage.Enclosure.DriveIdentification

*Drive enclosures must provide a drive identification service.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Storage enclosure must meet the following requirements to support storage space configuration.

-   Must support the following commands:

    -   INQUIRY

    -   SEND DIAGNOSTIC

    -   RECEIVE DIAGNOSTIC RESULTS

    -   REQUEST SENSE

    -   TEST UNIT READY

-   Must set ENCSERV bit to one in the Standard Inquiry Data (SPC4) to indicate that storage target device contains an embedded enclosure services component that is addressable through this logical unit.

-   Must support the following diagnostic pages for enclosure service devices:

    -   Supported Diagnostic Pages diagnostic page (00h)

    -   Configuration diagnostic page (01h)

    -   Enclosure Control diagnostic page (02h)

    -   Enclosure Status diagnostic page (02h)

    -   Additional Element Status diagnostic page (0Ah)

-   The following Type Control and Status Elements are used in Windows Storage Space feature;

| Element Type Code | Element Type Name                        |
|-------------------|------------------------------------------|
| 01h               | Device Slot                              |
| 02h               | Power Supply                             |
| 03h               | Cooling                                  |
| 04h               | Temperature Sensor                       |
| 07h               | Enclosure Service Controller Electronics |
| 12h               | Voltage Sensor                           |
| 13h               | Current Sensor                           |
| 17h               | Array Device Slot                        |

-   Storage enclosure must support either Device Slot (01h) or Array Device Slot (17h) Element Type. All other element types (Power Supply, Cooling, Temperature Sensor, Enclosure Service Controller Electronics, Voltage Sensor, and Current Sensor) are optional.

<!-- -->

-   For Additional Element Status diagnostic page (0Ah), enclosures shall provide additional element status descriptor with the EIP (element index present) bit set to one:

    -   The Element Index field that is reported by drive bays are in an ascending order.

    -   The protocol identifier must set to 6h (SAS).

-   The SES device must report the same address the drive reports for Device Identification VPD page (83h) should include one designation descriptor in which the target port name or identifier (see SAM-5) is indicated. The designation descriptor, if any, shall have the ASSOCIATION field set to 01b (i.e., target port) and the DESIGNATOR TYPE field set to:

    - 2h (i.e., EUI-64-based);

    - 3h (i.e., NAA); or

    - 8h (i.e., SCSI name string).

<!-- -->

-   For Enclosure Control diagnostic page (02h), control descriptors are enumerated by disk bay number in an ascending order.

-   Must comply with T10 SES3 spec to implement both Enclosure Control diagnostic page and Enclosure Status diagnostic page with INFO, 1NON-CRIT, CRIT and UNRECOV bits.

-   ELEMENT STATUS CODE field in all Status element formats must adopt the following codes:

| Code     | Name              | Condition                                                                                                                  |
|----------|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| 0h       | Unsupported       | Status detection is not implemented for this element.                                                                      |
| 1h       | OK                | Element is installed and no error conditions are known.                                                                    |
| 2h       | Critical          | Critical condition is detected.                                                                                            |
| 3h       | Noncritical       | Noncritical condition is detected                                                                                          |
| 4h       | Unrecoverable     | Unrecoverable condition is detected.                                                                                       |
| 5h       | Not Installed     | Element is not installed in enclosure.                                                                                     |
| 6h       | Unknown           | Sensor has failed or element status is not available.                                                                      |
| 7h       | Not Available     | Element is installed, no known errors, but the element has not been turned on or set into operation.                       |
| 8h       | No Access Allowed | The initiator port from which the RECEIVE DIAGNOSTIC RESULT command was not received does not have access to this element. |
| 9h to Fh | Reserved          |  &nbsp;          |

Notes:  Windows correlates enclosure services to drives via the protocol-specific information and the drives’ Device Identification VPD page (83h) with ASSOCIATION field set to 1.

<a name="device.storage.enclosure.azurestack"></a>
## Device.Storage.Enclosure.AzureStack

*Defines requirements that must be met if the drive enclosure is supported in a Microsoft Azure Stack based private cloud solution*

### Device.Storage.Enclosure.AzureStack.BasicFunction

*Basic requirements for drive enclosures used in Microsoft Azure Stack solutions*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack requirements for drive enclosures are captured by the following table.

<table>
    <tr><th>Feature</th><th>Requirement</th></tr>
    <tr><td rowspan="2">Device.Storage.Enclosure</td><td>Device.Storage.Enclosure.DirectAccess</td></tr>
	<tr><td>Device.Storage.Enclosure.DriveIdentification</td></tr>
    <tr><td rowspan="6">Device.DevFund.Server.Nano</td><td>Device.DevFund.Server.OperateInServerNano</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Deployment</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Diagnostics</td></tr>
	<tr><td>Device.DevFund.Server.Nano.PatchAndUpdate</td></tr>
	<tr><td>Device.DevFund.Server.Nano.MonitoringAndTelemetry</td></tr>
	<tr><td>Device.DevFund.Server.Nano.FirmwareUpdate</td></tr>
</table>

In addition to the above, the following requirement must be met:

- Storage enclosures must have and report unique ID

### Device.Storage.Enclosure.AzureStack.CloudStress

*Drive enclosures that supply cluster storage for the private cloud solution must comply with this specification* 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Private cloud solutions comprise of tightly integrated software and hardware components to deliver resiliency with high performance. Issues in any of the components (software, hardware, drivers, firmware, and so forth) can compromise the solution and undermine any promises made regarding the Service Level Agreement (SLA) for the private cloud.

Many of these issues are surfaced only under a high-stress, private cloud simulation. The Private Cloud Simulator (PCS) enables you to validate your component in a cloud scenario and identify such issues. It simulates a live datacenter/private cloud by creating VM workloads, scheduling administrative operations (load balancing, software/hardware maintenance), and injecting faults (unplanned hardware/software failures) on the private cloud.

To comply with this specification, the controller must pass the PCS test run with the Storage Enclosure profile on a 4-node clustered configuration.

### Device.Storage.Enclosure.AzureStack.FirmwareUpdate

*Drive enclosures that supply cluster storage for the private cloud solution must comply with this specification* 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack will require enclosures to be firmware updateable.



<a name="device.storage.hd"></a>
## Device.Storage.Hd

### Device.Storage.Hd.BasicFunction

*HD basic functionality*

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

The device must be able to perform the following scenarios:

-   Sequential read
-   Sequential write
-   Sequential verify (write followed by read and comparison)
-   Random read
-   Random write
-   Random verify

### Device.Storage.Hd.PhysicalSectorSizeReportsAccurately

*The reported physical sector size must be the unit of an atomic write.*

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

**Following applies to ATA based Hard Disk Drives:**

If implemented, support for storage devices with logical sector sizes larger than 512-bytes need to be implemented as described in the ATA-8 specifications. Please refer to the INCITS T13 specification repository for access to the specification.

**Following applies to SCSI based Hard Disk Drives:**

If implemented, support for storage devices with logical sector sizes larger than 512-bytes need to be implemented as described in the SBC-3, SPC-4, and SAT-3 specifications. Please refer to the INCITS T10 specification repository for access to the relevant specifications.
 
**Business Justification**

Some hard disk drives report the physical sector size of the disk incorrectly. For example, the drive is released a "4K" drive without reporting that it is indeed a 4K drive. Applications use the reported physical sector size as a notion of atomicity and perform I/O based on this. The most basic example is a database-style application will only store one commit record within the unit of atomic write for fear of loss if power is lost or if a physical sector becomes physically bad. When the reported physical sector size is not the unit of atomicity, serious reliability concerns can arise in scenarios where power is lost such as: Applications can fail to recover, and users will need to restore from backup. Applications can fail to recover, but the application will need to perform a lengthy consistency check. Corruption of metadata, log file data, user data, or even data from other applications.

### Device.Storage.Hd.RotationalRate

*Hd rotational rate logo requirements*

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

Solid State Device (SSD) shall set Nominal Media Rotation Rate to a non-rotating medium value. A rotational or a mixed rotational and SSD device shall report the rotational rate of the rotational medium.

**Following applies to ATA based Hard Disk Drives**:

ATA hard disk devices must report nominal media rotation rate as described in the ATA-8 specifications. The Word 217 of Identify Device command return shall not be 0000h.

**Nominal Media Rotation Rate Value Description**

| Value       | Description                                                                         |
|-------------|-------------------------------------------------------------------------------------|
| 0000h       | Rate not reported                                                                   |
| 0001h       | Non-rotating media (e.g., solid state device)                                       |
| 0002h-0400h | Reserved                                                                            |
| 0401h-FFFEh | Nominal media rotation rate in rotations per minute (rpm) (e.g., 7 200 rpm = 1C20h) |
| FFFFh       | Reserved                                                                            |

**Following applies to SCSI based Hard Disk Drives**:

SCSI hard disk device must report nominal media rotation rate as described in the T10 SBC3 specifications. The Inquiry command return for Block Device Characteristics VPD page shall not set media rotation rate = 0000h.

**MEDIUM ROTATION RATE field**

| Code        | Description                                                                                              |
|-------------|----------------------------------------------------------------------------------------------------------|
| 0000h       | Medium rotation rate is not reported                                                                     |
| 0001h       | Non-rotating medium (e.g., solid state)                                                                  |
| 0002h-0400h | Reserved                                                                                                 |
| 0401h-FFFEh | Nominal medium rotation rate in rpm (e.g., 7 200 rpm = 1C20h,10 000 rpm = 2710h, and 15 000 rpm = 3A98h) |
| FFFFh       | Reserved                                                                                                 |

<a name="device.storage.hd.1394"></a>
## Device.Storage.Hd.1394

### Device.Storage.Hd.1394.Compliance

*IEEE 1394 hard disk drive specification compliance*

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

1394 Compliance

IEEE-1394 (Firewire) devices must comply with Serial Bus Protocol-2 (SBP-2) and SCSI Primary Commands-2 (SPC-2), and disk devices must comply with SCSI Reduced Block Commands (RBC).

The reference for specification compliance...:
SBP-2, SPC-2, Min:RBC
 

<a name="device.storage.hd.alua"></a>
## Device.Storage.Hd.Alua

### Device.Storage.Hd.Alua.Compliance

*Asymmetric Logical Unit Acces (ALUA)*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If a device supports asymmetric logical unit access (ALUA), the device must comply with the requirement of implementing target port group support (TPGS) in standard inquiry data as SPC3-r23 section 6.4.2.

The Report Target Port Group command must be supported, if logical units report in the standard Inquiry Data that they support ALUA. The storage device must comply with SPC3 -r23 section 6.25 Report Target Port Group command according to its TPGS field code in the standard Inquiry data.
 

<a name="device.storage.hd.ata"></a>
## Device.Storage.Hd.Ata

### Device.Storage.Hd.Ata.BasicFunction

*ATA/ATAPI interface*

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

PATA Devices (legacy)

(PATA Devices will no longer be accepted for WHQL submission after June 2013.)

Microsoft recommends the use of SATA for new devices. However, in a spirit of compatibility with existing device base, the following requirements are provided for PATA devices.

Shared bus capabilities are required for PATA devices; devices shall be configurable as device 0 or device 1.
 

### Device.Storage.Hd.Ata.Dma

*ATA/ATAPI DMA mode.*

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

ATA/ATAPI DMA Mode

All PATA controllers and PATA peripherals shall support Ultra-DMA as defined in ATA/ATAPI-7.

Justification:

In addition to improved transfer rates, Ultra-DMA also provides error checking for improved robustness over previous PATA implementations.

<a name="device.storage.hd.ataprotocol"></a>
## Device.Storage.Hd.AtaProtocol

### Device.Storage.Hd.AtaProtocol.Performance

*ATA device performance*

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

ATA device performance

The Windows 7 Windows System Assessment Tool (WinSAT) disk formal test for the block storage device must pass the following performance requirements for any visible storage space utilization up to 95% (% of utilization as % of "used space" seen through the Windows file system).

-   Disk Sequential 64 K Byte Read   &gt;25 MB/s

-   Disk Random 16 K Byte Read   &gt;0.5 MB/s

-   Disk Sequential 64 K Byte Write   &gt;20 MB/s

-   Average Read Time with Sequential Writes &lt;25 ms

-   Latency: 95th Percentile    &lt;120 ms

-   Latency: Maximum    &lt;700 ms

-   Average Read Time with Random Writes &lt;40 ms

### Device.Storage.Hd.AtaProtocol.Protocol

*ATA/ATAPI protocol*

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

ATA/ATAPI Protocol
 

-   ATA/ATAPI controllers and devices shall comply with the following standard(s)

    -   INCITS 397-2005 (1532D): AT Attachment with Packet Interface - 7 or later, also referred to in this document as ATA/ATAPI-7. AT Attachment with Packet Interface - 8 or later will be required when this revision 8 is final and published.

-   ATA/ATAPI controllers shall support Windows operating system boot

-   ATA/ATAPI devices shall not rely on Identify Device data fields (61:60) and (103:100) to determine 28-bit or 48-bit LBA addressing support. ATA/ATAPI shall rely instead on bit 10 of word 83 and bit 10 of word 86 to identify 48-bit LBA addressing support (as per ATA/ATAPI-7).  

*Design notes*

Recommended:

Reporting Nominal Media Rotation Rate

If a device requires Windows defragmentation to be turned off by default, the device should report its Nominal Media Rotation Rate as 0001h Non-rotating media (e.g., solid state device) as per the ATA8-ACS1 specification, section 7.16.7.77. 

Justification:

When the Nominal Media Rotation Rate reported by the device is anything but 0001h Non-rotating media, Windows will by default perform defragmentation of the block storage device.
 

<a name="device.storage.hd.azurestack"></a>
## Device.Storage.Hd.AzureStack

*Defines requirements that must be met if the disk is supported in a Microsoft Azure Stack based private cloud solution*

### Device.Storage.Hd.AzureStack.BasicFunction

*Basic requirements for disks used in Microsoft Azure Stack solutions*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack requirements for disks are captured by the following table.

<table>
    <tr><th>Feature</th><th>Requirement</th></tr>
    <tr><td rowspan="3">Device.Storage.Hd</td><td>Device.Storage.Hd.BasicFunction</td></tr>
	<tr><td>Device.Storage.Hd.PhysicalSectorSizeReportsAccurately</td></tr>
	<tr><td>Device.Storage.Hd.RotationalRate</td></tr>
    <tr><td>Device.Storage.Hd.DataVerification</td><td>Device.Storage.Hd.DataVerification.BasicFunction</td></tr>
    <tr><td>Device.Storage.Hd.Flush</td><td>Device.Storage.Hd.Flush.BasicFunction</td></tr>
    <tr><td>Device.Storage.Hd.PortAssociation</td><td>Device.Storage.Hd.PortAssociation.BasicFunction</td></tr>
    <tr><td>Device.Storage.Hd.Sas</td><td>Device.Storage.Hd.Sas.ComplyWithIndustrySpec</td></tr>
    <tr><td>Device.Storage.Hd.Sata</td><td>Device.Storage.Hd.Sata.BasicFunction</td></tr>
    <tr><td>Device.Storage.Hd.Scsi.ReliabilityCounters</td><td>Device.Storage.Hd.Scsi.ReliabilityCounters.BasicFunction</td></tr>
    <tr><td rowspan="3">Device.Storage.Hd.ScsiProtocol</td><td>Device.Storage.Hd.ScsiProtocol.ReferenceSpec</td></tr>
	<tr><td>Device.Storage.Hd.ScsiProtocol.SamCompliance</td></tr>
	<tr><td>Device.Storage.Hd.ScsiProtocol.SpcCompliance</td></tr>
    <tr><td rowspan="6">Device.DevFund.Server.Nano</td><td>Device.DevFund.Server.OperateInServerNano</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Deployment</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Diagnostics</td></tr>
	<tr><td>Device.DevFund.Server.Nano.PatchAndUpdate</td></tr>
	<tr><td>Device.DevFund.Server.Nano.MonitoringAndTelemetry</td></tr>
	<tr><td>Device.DevFund.Server.Nano.FirmwareUpdate</td></tr>
</table>

In addition to the above, the following requirements must be met:

- Disk devices must be of, and reported as, either SATA, SAS or NVMe bus type
- Disk devices must be of, and reported as, either SSD or HDD media type
- Disk devices must have and report unique ID

### Device.Storage.Hd.AzureStack.CloudStress

*Disks that are used as cluster storage for the private cloud solution must comply with this specification*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Private cloud solutions comprise of tightly integrated software and hardware components to deliver resiliency with high performance. Issues in any of the components (software, hardware, drivers, firmware, and so forth) can compromise the solution and undermine any promises made regarding the Service Level Agreement (SLA) for the private cloud. 

Many of these issues are surfaced only under a high-stress, private cloud simulation. The Private Cloud Simulator (PCS) enables you to validate your component in a cloud scenario and identify such issues. It simulates a live datacenter/private cloud by creating VM workloads, scheduling administrative operations (load balancing, software/hardware maintenance), and injecting faults (unplanned hardware/software failures) on the private cloud. 

To comply with this specification, the disk must pass the PCS test run with the ‘Storage Disk – AzureStack’ profile on a 4-node clustered configuration.

### Device.Storage.Hd.AzureStack.FirmwareUpdate

*Disks that are used as cluster storage for the private cloud solution must comply with this specification*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack will require SAS and SATA drives to be firmware updateable using the inbox [firmware update mechanism](https://blogs.technet.microsoft.com/filecab/2016/01/25/updating-firmware-for-disk-drives-in-windows-server-2016-tp4/), introduced in Windows Server 2016 (Update-StorageFirmware).


<a name="device.storage.hd.dataverification"></a>
## Device.Storage.Hd.DataVerification

*Disk Verification Tests to ensure there is no data loss or corruption*

### Device.Storage.Hd.DataVerification.BasicFunction

*All storage devices must work correctly on Windows.*

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

Storage devices must reliably read and write data without data loss or data corruption.

<a name="device.storage.hd.ehdd"></a>
## Device.Storage.Hd.Ehdd

### Device.Storage.Hd.Ehdd.Compliance

*Encrypted hard drive complies with Microsoft and industry specifications.*

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

Encrypted hard drive

eDrives must be compliant with these industry specifications

-   IEEE 1667 version IEEE 1667-2009

	<!-- -->

	-   Support Probe silo
	-   Support TCG Storage silo

	<!-- -->

-   TCG

	<!-- -->

	-   TCG core specification version 2.0

	-   OPAL SSC 2.0

		<!-- -->

		-   Programmatic TPer Reset Rev
		-   Modifiable CommonName Column
		-   SID Authority Disable

		<!-- -->

	-   OPAL SSC Feature Sets

		<!-- -->

		-   Set Additional Data Store Rev 1.05 or later
		-   Single User Mode Rev 1.02 or later

		<!-- -->

-   SCSI

	<!-- -->

	-   SPC4
	-   SAT2

	<!-- -->

-   ATA

	<!-- -->

	-   ACS2

eDrives must comply with these Windows Design Spec requirements:

-   Support at least AES 128

-   Support one or more of the following cipher modes

	<!-- -->

	-   CBC
	-   XTS

	<!-- -->

-   Support at least 8 bands

-   Support additional data store tables

-   Support range crossing

-   Support authenticate method

-   Support secret protect info

-   Support modifiable common name

-   Support TCG stack reset

-   Support programmatic TPer reset

-   Support single user mode

-   If SCSI devices(SPC4):-

	<!-- -->

	-   The 1667 Version Descriptor, 0xFFC2 (IEEE 1667-2009) should be reported in the INQUIRY data. The 'Additional Length' field of the INQUIRY data must be greater than or equal to 0x38.

	-   Security Protocol IN output must report 00, 01, 02, EE in the Supported Security Protocol List payload

	<!-- -->

-   If ATA devices (ACS2):-

	<!-- -->

	-   The TrustedComputer.FeatureSupported (word 48 - bit 0 must be set to '1') must be reported in the IDENTIFY data

	-   The AdditionalSupported.IEEE1667IDENTIFY (word 69 - bit 7 should be set to '1') must be reported in the IDENTIFY data

	-   Trusted Receive output should report 00,01, 02, EE in the Supported Security Protocol List payload

	<!-- -->

-   If SATA-USB:-

	<!-- -->

	-   Support SAT2

	<!-- -->

-   Command Performance:- The drive must complete the following operations within the specified duration

| Operations            | Max completion time |
|-----------------------|---------------------|
| Discovery/Enumeration | 24 sec (8 bands)    |
| Activate              | 45 sec              |
| Revert                | 8 sec               |
| Create Band           | 1.5 sec             |
| Delete Band           | 2 sec               |
| Erase Band            | 2 sec               |
| Set Metadata          | 20 sec              |
| Get Metadata          | 14 sec              |
| Lock Band             | 1.5 sec             |
| Unlock Band           | 1.5 sec             |

<a name="device.storage.hd.emmc"></a>
## Device.Storage.Hd.EMMC

*Defines the industry and Microsoft standards that must be met*

### Device.Storage.Hd.EMMC.BasicFunction

*Emmc basic functionality*

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

Must support industry standards.

eMMC 4.5.1 Requirements

-   Support discard/sanitize on both sector size and erase block boundaries.

-   Support HPI/BKOPS.

-   Support Packed commands.

-   Support HS200 signaling.

-   Support DDR50 signaling.

-   Support a RPMB of at least 128 KB in size and creation of GPPs.

-   Support sleep (CMD5).

-   Support crypto offload operations (CMD53/54).

-   Support OS initiated cache flushing if device supports volatile cache.

<a name="device.storage.hd.enhancedstorage"></a>
## Device.Storage.Hd.EnhancedStorage

### Device.Storage.Hd.EnhancedStorage.1667Compliance

*Enhanced Storage devices must comply with the IEEE 1667 defined standards.*

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

IEEE1667-Class (Enhanced Storage) enabled storage devices must meet industry standards.
Enhanced Storage devices must comply with the IEEE 1667 defined standards.

-   Enhanced Storage device must:

    -   Support authenticating the host

    -   Implement support for IEEE 1667 (version 1.1 or later) defined Probe Silo on the device.

    -   Implement at least one Certificate or Password Silo on the device.

-   Enhanced Storage device that implements Certificate Silo must:

    -   Load native windows certificate silo driver.

    -   Respond to all commands of the IEEE 1667 version 1.1 specification.

    -   Verify certificate-based authentication is used to allow and block access to volume.

-   Enhanced Storage device that implements Password Silo must:

    -   Load native password silo driver.

    -   Respond to all commands in the IEEE 1667 Password Silo specification. 

    -   Verify password-based authentication is used to allow and block access to the volume.

*Design Notes*

Obtain IEEE 1667 specification from IEEE at the following location:<http://go.microsoft.com/fwlink/?LinkID=110100>

<a name="device.storage.hd.fibrechannel"></a>
## Device.Storage.Hd.FibreChannel

### Device.Storage.Hd.FibreChannel.Compliance

*Fibre Channel devices*

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

Fibre Channel devices must comply with Fibre Channel Protocol for SCSI, Second Version (FCP-2) or later. To ensure interoperability at the electrical and signaling levels, Fibre Channel devices must comply with Third-Generation Fibre Channel Physical and Signaling Interface (formerly ANSI X3.303:1998).
 

<a name="device.storage.hd.flush"></a>
## Device.Storage.Hd.Flush

### Device.Storage.Hd.Flush.BasicFunction

*Flush command completion*

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

Industry standard spec requirements:
 

-   For an ATA device, FLUSH CACHE (E7h, Non-Data ) 28-bit command is optional for ATA devices and ATAPI devices. FLUSH CACHE EXT (EAh, Non-Data) 48-bit command is mandatory for devices implementing the 48-bit Address feature set.

-   For a SCSI device, SYNCHRONIZE CACHE (10) command  and/or  SYNCHRONIZE CACHE (16) command shall be implemented.

Windows Design Spec requirements - HDD:

-   Correct Reporting of Completion: When the OS issues a flush cache command, the storage device should synchronously report the completion of the command only when the content of the cache has been persisted.

Note: The requirement is not applicable to Laptop.

<a name="device.storage.hd.iscsi"></a>
## Device.Storage.Hd.Iscsi

### Device.Storage.Hd.Iscsi.BasicFunction

*iSCSI devices*

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

iSCSI devices
iSCSI devices must comply with RFC3720, RFC3721, and RFC3723.

-   Device must complete testing by using the Microsoft iSCSI initiator.

-   Device must be able to receive ping (ICMP) and send ping (ICMP).

-   The following iSCSI protocol features are required:

-   Send targets.

-   Logon Authentication: CHAP and none. Targets may delegate CHAP authentication to Radius.

-   Discovery Session Logon key/value pairs: InitiatorName, SessionType, and AuthMethod.

-   Normal Session Logon key/value pairs: InitiatorName, SessionType, AuthMethod, and TargetName.

-   DataPDUInOrder.

-   DataSequenceInOrder.

-   DefaultTime2Wait.

-   DefaultTime2Retain

-   ErrorRecoveryLevel=0.

-   Targets that allow different shared secrets for different initiator names.

The following iSCSI protocol features must pass testing if they are implemented:

-   Mutual CHAP.

-   HeaderDigest: CRC32 and none.

-   DataDigest: CRC32 and none.

-   InitialR2T.

-   IPsec; when using IPsec, Main mode must be available. In addition, the following items are required when IPsec is implemented:

	<!-- -->

	-   IPsec transport mode must be implemented.

	-   Internet key exchange (IKE) implementations must support main mode and preshared keys. Target portals with the same IP address must expect the identical main mode IKE policy.

	-   Targets and initiators must allow different preshared keys for different identifier payloads.

	-   Targets and initiators must have static IP addresses for main mode.

	-   Additional Standard Inquiry data VERSION DESCRIPTORS (SPC-3) are required

	-   At least one iSCSI VERSION DESCRIPTOR is required (value = 0960h).

<a name="device.storage.hd.mpio"></a>
## Device.Storage.Hd.Mpio

### Device.Storage.Hd.Mpio.BasicFunction

*RAID implementations that provide a multipathing solution must comply with Microsoft multipath I/O (MPIO).*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Internal or external RAID implementations that provide a multipathing solution must comply with Microsoft multipath I/O (MPIO). Windows multipathing solutions must consist of a Device Specific Module (DSM) created by using the Microsoft MPIO DDK and must comply with all requirements set forth in the Multipath I/O Program Agreement.
Following WMI classes must be implemented by 3rd party DSM.

-     DSM\_QuerySupportedLBPolicies

-     DSM\_QueryUniqyeId

3rd party DSM must report minor, major version numbers for the DSM
 

<a name="device.storage.hd.multipleaccess"></a>
## Device.Storage.Hd.MultipleAccess

*Drives that support Multiple Access must meet these requirements.*

### Device.Storage.Hd.MultipleAccess.MultiplePorts

*Multi-port drives must provide symmetric access.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Multi-port drives must support the same set of commands on all ports.  Drives must not provide different behavior or degraded performance for commands based on which port is used for command delivery.

When drives are connected to a host via multiple paths, the drives must use Windows' Multipath IO (MPIO) solution with the Microsoft Device Specific Module (DSM).

Example:  Drives must provide the same performance for data access commands and the same behavior for persistent reservation commands arriving on different ports as they provide when those commands arrive on the same port.

The performance degradation between any two ports should be within a 10% range.

Notes:  Multi-port drives may be connected to one or more computer hosts via one or more paths per host.  Connecting a drive to multiple hosts enables Windows to use the drive as part of a failover cluster of hosts.  Connecting a drive to a single host via multiple paths enables Windows to continue to provide access to the drive in the event of a cable failure.  Windows supports using these connection topologies independently and jointly.

<a name="device.storage.hd.multipleaccess.persistentreservation"></a>
## Device.Storage.Hd.MultipleAccess.PersistentReservation

*Drives that support Persistent Reservations must meet these requirements.*

### Device.Storage.Hd.MultipleAccess.PersistentReservation.BasicFunction

*Drives must provide persistent reservations.*

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

Drives must implement persistent reservations as per the SCSI-3 Primary Commands (SPC-3) specification.  Windows depends on proper behavior for the below persistent reservation capabilities.
 

-   PERSISTENT RESERVE IN Read Keys (00h)
-   PERSISTENT RESERVE IN Read Reservation (01h)
-   PERSISTENT RESERVE OUT Reserve (01h)
	-   Scope:  LU\_SCOPE (0h)
	-   Type:  Write Exclusive - Registrants Only (5h)
-   PERSISTENT RESERVE OUT Release (02h)
-   PERSISTENT RESERVE OUT Clear  (03h)
-   PERSISTENT RESERVE OUT Preempt  (04h)
-   PERSISTENT RESERVE OUT Register AND Ignore Existing Key (06h)
-   PERSISTENT RESERVE OUT Register (00h)

Notes:  Windows can use physical disks to form a storage pool.  From the storage pool, Windows can define virtual disks called storage spaces.  A failover cluster can make the pool of physical disks, the storage spaces they define, and the data they contain highly available.  In addition to the standard HCT qualification, physical disks should also pass the "Microsoft Cluster Configuration Validation Wizard" (ClusPrep) tool.

<a name="device.storage.hd.offloadeddatatransfer"></a>
## Device.Storage.Hd.OffloadedDataTransfer

*Windows Offloaded Data Transfer*

### Device.Storage.Hd.OffloadedDataTransfer.CopyOffload

*If Copy Offload is supported, these requirements must be implemented.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Industry standard spec requirements:**

-   Targets that support the Windows Copy Offload feature must implement the T10 XCOPY Lite specification (11-059r8):

	<!-- -->

	-   Supported VPD pages (Must include ECOP VPD Page (Page Code 8Fh) in the Supported VPD page list)

	-   ECOP VPD page or ECOP VPD page (Page Code 8Fh) + Block Device ROD Limits ECOP descriptor (0000h)

	-   Block Limit VPD page (Page Code B0h)

	-   According to the T10 11-059r8 spec, Windows adopts 83h OP Code + 10 Service Action Code for POPULATE TOKEN and 83h OP Code + 11 Service Action Code for WRITE USING TOKEN commands.

	-   According to the T10 11-059r8 spec, Windows adopts 84h OP Code + 07 Service Action Code for the RECEIVE ROD TOKEN INFORMATION command. Response service action field and command parameters shall be compliant with T10 XCOPY Lite spec (11-059r8).

**Windows Design Spec requirements: **

-   During the target device enumeration, Windows will send down an Inquiry for Supported VPD pages VPD page. If 8F is included in Supported VPD page list, Windows will inquire for the ECOP VPD page and BLOCK LIMITs VPD page.

-   Implementation and error handling with parameters of the ECOP VPD page

	<!-- -->

	-   The MAXIMUM RANGE DESCRIPTORS - If the number of Block Device Range Descriptors of a POPULATE TOKEN or WRITE USING TOKEN command exceeds the MAXIMUM RANGE DESCRIPTORS, copy manager shall terminate the command with the CHECK CONDITION status with the sense key set to ILLEGAL REQUEST and the additional sense code set to TOO MANY SEGMENT DESCRIPTORS.

	-   The MAXIMUM INACTIVITY TIMER (MAXIMUM IAT) - If the INACTIVITY TIMEOUT of a POPULATE TOKEN command exceeds the MAXIMUM INACTIVITY TIMER, copy manager shall terminate the command with the CHECK CONDITION status with the sense key set to ILLEGAL REQUEST and the additional sense code set to INVALID FIELD IN PARAMETER LIST.

	-   The MAXIMUM TOKEN TRANSFER SIZE -

		-   If the sum of the NUMBER OF LOGICAL BLOCKS fields in all block device range descriptors of the WRITE USING TOKEN command is greater than the MAXIMUM TOKEN TRANSFER SIZE, copy manager shall terminate the command with the CHECK CONDITION status with the sense key set to ILLEGAL REQUEST and the additional sense code set to INVALID FIELD IN PARAMETER LIST.

		-   If the sum of the NUMBER OF LOGICAL BLOCKS fields in all block device range descriptors of the POPULATE TOKEN is greater than the MAXIMUM TOKEN TRANSFER SIZE, copy manager shall terminate the command with the CHECK CONDITION status with the sense key set to ILLEGAL REQUEST and the additional sense code set to INVALID FIELD IN PARAMETER LIST.

	<!-- -->

-   Implementation and error handling with parameters of Block Limits VPD page

-   The MAXIMUM TRANSFER LENGTH field indicates the maximum transfer length in blocks that the copy manager accepts for a single BLOCK DEVICE RANGE DESCRIPTOR. If a copy manager receives a request for a NUMBER OF LOGICAL BLOCKS exceeding this maximum, then the copy manager shall terminate the command with CHECK CONDITION status with the sense key set to ILLEGAL REQUEST and the additional sense code set to INVALID FIELD IN PARAMETER LIST.

-   Storage array must support both synchronous and asynchronous POPULATE TOKEN and WRITE USING TOKEN according to T10 11-059r8, 11-078r4, and 11-204r0 spec.

-   Storage array must complete synchronous POPULATE TOKEN and WRITE USING TOKEN commands in a very short time (4 seconds) without causing any SCSI command timeout.

**User Experience Requirements:**

-   Fall back to Legacy Copy - Windows copy offload operation shall be able to fall back to legacy copy operation when a copy offload error or limitation is reported.

-   Drag and drop copy experience - must be able support drag and drop copy with copy offload capable storage target device.

<a name="device.storage.hd.persistentreservation"></a>
## Device.Storage.Hd.PersistentReservation

### Device.Storage.Hd.PersistentReservation.ClusterFailover

*Cluster failover for RAID array systems*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Required**: All Microsoft MPIO device-specific modules (DSMs) must be Windows Hardware Certification-qualified and support registering and unregistering persistent reservations across all paths.

Design Notes:

-   All host bus adaptors (HBA) used on failover cluster nodes can use only a Windows Hardware Certification-qualified miniport driver based on the Storport miniport model.

-   All multipath I/O solutions leveraged on highly available failover clusters must be based on Microsoft MPIO.

-   It is recommended that in addition to the standard HCT qualification all solutions are also validated with the "Microsoft Cluster Configuration Validation Wizard" (ClusPrep) tool.

-   FC, iSCSI, and particularly serial-attached SCSI (SAS) failover cluster solutions cannot be built on RAID HBAs where cache and/or RAID configuration is machine/node specific. The RAID set information and hardware cache must reside in a single shared point that lives in an external storage controller.

-   SAS, FC, and iSCSI have no restrictions as to the number of nodes they support (which currently is 8nodes).

Note: Legacy parallel-SCSI server clusters were restricted to a maximum size of 2 nodes.

-   Only SAS devices using the Serial SCSI Protocol (SSP) transport will be supported on failover clusters (including SAS JBOD or any SAS SSP RAID systems). SATA devices attached to a SAS domain must be part of a RAID system.

-   SATA direct attach and SATA JBOD is not supported; the system must include RAID.

-   If the system disks are attached to a bus type that is not a valid type for shared storage (something other then FC, iSCSI, or SAS), then the system disks and shared storage must be on separate physical controllers/host bus adaptors.

<a name="device.storage.hd.portassociation"></a>
## Device.Storage.Hd.PortAssociation

*Drives must provide port association.*

### Device.Storage.Hd.PortAssociation.BasicFunction

*Drives must provide port association.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A drive must report its port address for device identification VPD page 83h inquiry association type 1 (port association).  This must be the same address the drive supplies to a SCSI Enclosure Services (SES) device and the SES device reports via SES diagnostic page 0Ah with protocol identifier set to 6h.

Notes:  Windows depends on drive enclosures to provide SCSI Enclosure Services (SES) capabilities such as drive slot identification and visual drive indications (commonly implemented as drive LEDs).  Windows matches a drive in an enclosure with SES identification capabilities via the drive's port address.  Computer hosts may be separate from drive enclosures or may be integrated into drive enclosures.

<a name="device.storage.hd.raidarray"></a>
## Device.Storage.Hd.RaidArray

### Device.Storage.Hd.RaidArray.BasicFunction

*RAID array systems*

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

RAID Requirements

RAID systems and devices must support commands from SBC-2 (or later) regardless of the drive interface implemented.

RAID controllers and RAID systems must support, at a minimum, one of: RAID1, RAID 5, RAID6, or RAID 1/0.

External RAID arrays must allow a failed drive that is redundant to be replaced manually without shutting down or halting the system. This requirement includes, but is not limited to, drives in a mirror set, a physical drive being replaced by a "hot spare," and the first failed drive in a RAID level-5 array. The RAID subsystem must also allow lost data to be rebuilt without interfering with system operations. It is expected that RAID array throughput will be impacted during the rebuild.

### Device.Storage.Hd.RaidArray.BitLocker

*BitLocker must not cause data corruption on storage arrays.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

BitLocker must be properly enabled to protect data volumes on storage arrays.

**Business Justification**

(1) When a server is placed in an environment without adequate physical security, BitLocker protects data on the server against unauthorized access if a server is stolen. (2) When hosting service providers repurpose or decommission storage arrays, BitLocker Disk Encryption prevents data breach.

<a name="device.storage.hd.readzeroontrimunmap"></a>
## Device.Storage.Hd.ReadZeroOnTrimUnmap

### Device.Storage.Hd.ReadZeroOnTrimUnmap.BasicFunction

*The requirement applies to hard disk drives.*

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

If the logical block provisioning read zeros (LBPRZ) bit is set to one, then the device server shall set all bits to zero in the Data-In Buffer for a read operation on an unmapped (deallocated or anchored) LBA.

<a name="device.storage.hd.removablemedia"></a>
## Device.Storage.Hd.RemovableMedia

*Defines requirements that must be met if the storage device is removable, i.e., it has RMB bit set to 1.*

### Device.Storage.Hd.RemovableMedia.BasicFunction

*Devices with true removable storage media*

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

Device with true removable storage media should report as True Removable Media (RMB=1) according to SPC-4 Revision 29, Section 6.4.2.

<a name="device.storage.hd.sas"></a>
## Device.Storage.Hd.Sas

### Device.Storage.Hd.Sas.ComplyWithIndustrySpec

*Serial attached SCSI devices must comply with industry specifications.*

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

The reference for specification compliance. Where noted as Min, the baseline specification is mandatory. “Rec:” indicates the preferred version of the specification. If not otherwise specified, the version listed is the minimum required. Unless otherwise indicated, all features of the cited specifications that are classified as mandatory by the standards body must be implemented.

SAS-1, SAM-3, SPC-3, Min:SBC-2, Rec: SBC-3

Serial Attached SCSI devices comply with the Serial Attached SCSI (SAS) Specification 1 or later.

-   Shall not cause more than 10% IO performance degradation when the SAS storage device is used in a MPIO configuration.

-   SAS storage device shall establish a UNIT ATTENTION subsequent to detection of the following events.

	<!-- -->

	-   Power On
	-   Hard Reset
	-   Logical unit reset
	-   I\_T Nexus loss
	-   Power loss expected

	<!-- -->

-   SAS SSD must implement following T10 (SCSI) command specification:

    -   Read Capacity (16)
    -   Block Limit VPD Page (Page Code B0h)
    -   Block Device Characteristics VPD page (Page Code B1h)
    -   Logical Block Provisioning VPD Page (Page Code B2h)
        -   SAS devices must support the Task Abort functionality described in the SAM-5 spec (T10).

-   SAS SSD must meet the following requirements:

    -   SAS SSD target device must return MEDIUM ROTATION RATE = 0001h (Non-rotating medium)

    -   SAS SSD target device must return Read Capacity (16) command with LBPME bit set to 1 and Provisioning Type field = 0 (000b) Not Report a Provisioning Type or 1 (001b) Resource Provisioned in the Logical Block Provisioning VPD page (Page Code B2).

    -   SAS SSD device must implement Block Limit VPD Page (Page Code B0h) and support the following parameters.

		<!-- -->

		-   MAXIMUM UNMAP LBA COUNT
		-   MAXIMUM UNMAP BLOCK DESCRIPTOR COUNT
		-   OPTIMAL UNMAP GRANULARITY
		-   UNMAP GRANULARITY ALIGNMENT
		-   UGAVALID Bit

    -   SAS SSD target device must implement Logical Block Provisioning VPD Page (Page Code B2h) and support the following parameters:

		-   LBPU bit
		-   LBPRZ bit
		-   Provisioning Type field.

    -   SAS SSD must support UNMAP (10) command and the LBPU bit in LBP VPD page shall set to one.

        -   If the device reports a seek penalty (SMR), the following thresholds apply:

            -   98.5% of all I/O must complete within 200ms
            -   100% of all I/O must complete within 1,000ms

        -   Otherwise (SSD):

            -   98.5% of all I/O must complete within 100ms
            -   100% of all I/O must complete within 500ms

<!-- -->

-   If the LBPME bit in ReadCapacity(16) return is set to one, the SAS SSD device must support Logical Block Provisioning VPD page (Page Code B2h)

-   If the LBPRZ bit in ReadCapacity(16) return is set to one, the SAS SSD device must set LBPRZ bit of Logical Block Provisioning VPD page to one.

(If Implemented) Firmware Download & Activate

SAS devices implementing the ability to download and activate firmware, i.e., command WRITE BUFFER, shall behave in the following way:

-   Mode 0Eh (Download Microcode with offsets, save, and defer activate) and 0Fh (Activate deferred microcode) of the command WRITE BUFFER shall be supported by the device.

-   The device must retain Persistent Reservations through the firmware download/activate cycle.

-   The device must retain VPD page 0x83 through download and activate of a firmware image.

-   The download operation must be possible using SCSI Buffer ID 0 and a transfer size of 64KB.

-   Execution of the WRITE BUFFER command (subcommand 0Eh) shall not prevent the execution of other read or write I/O in the device queue. No I/O failure is expected during the download operation (subcommand 0Eh)

-   If I/O from other initiators is failed during activation (subcommand 0Fh) – it must fail with sense code MICROCODE HAS BEEN CHANGED.

-   The activation process must occur without requiring the host to power cycle or bus reset, i.e., activation must be completed via an internal reset of the SAS drive.

<a name="device.storage.hd.sata"></a>
## Device.Storage.Hd.Sata

### Device.Storage.Hd.Sata.BasicFunction

*ATA device performance*

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

SATA Devices: 

SATA Devices: 

-   Requirement: SATA devices shall meet the requirements of the Serial ATA: High Speed Serialized AT Attachment, Version 2.6 or later.

-   Recommendation: SATA devices should implement interface power management

-   Recommendation: SATA devices should implement Native Command Queuing (NCQ) support

-   Hot-Plug:

    -   If the device is connected to a port marked as “external” hot-plug support is required. A port is considered “external” if any one of the following register settings (according to the AHCI industry spec) is true:

        -   PxCMD.HPCP = 1 or,

        -   CAP.SXS = 1 and PxCMD.ESP = 1 or,

        -   CAP.SMPS = 1 and PxCMD.MPSP = 1

    -   If the device is connected to a port marked as “internal” no interrupt needs to be generated for a hot-plug event

(If Implemented) Firmware Download & Activate

SATA drives implementing the ability to download and activate firmware, i.e., command DOWNLOAD MICROCODE DMA (IDENTIFY DEVICE word 69 bit 8 == 1) or command DOWNLOAD MICROCODE (IDENTIFY DEVICE word 83 bit 0 == 1) shall behave in the following way:

-   The device must retain the following IDENTIFY device data through download and activate of a firmware image: Vendor ID, Model ID, Serial Number.

-   The activation process must occur without requiring the host to power cycle or bus reset, i.e., activation must be completed via an internal reset of the SATA device.

-   \[DMA\] The drive shall support IDENTIFY DEVICE data log page 03h.

    -   The field “DM OFFSETS DEFERRED SUPPORTED bit” shall be set to 1, indicating that subcommands 0EH and 0FH are supported.

-   \[DMA\] Subcommand 0Eh “Download with offsets and save microcode for future use” of the command DOWNLOAD MICROCODE DMA shall be supported.

-   \[DMA\] Subcommand 0Fh “Activate downloaded microcode” of the command DOWNLOAD MICROCODE DMA shall be supported.

Note: A DMA implementation of these commands is preferred but not required

<a name="device.storage.hd.sata.hybridinformation"></a>
## Device.Storage.Hd.Sata.HybridInformation

*This feature is for all devices that support the Hybrid Information feature.*

### Device.Storage.Hd.Sata.HybridInformation.BasicFunction

*SATAIO hybrid drive requirements*

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

The following functionalities and requirements have to be supported by the device and refer to hybrid devices in general. They are required for use with the Windows in-box driver (StorAHCI.sys).

If a drive reports itself as a hybrid drive, it must be comprised of a spinning disk and at least one non-volatile cache (NVC) component within a single physical device.

Self-Pinning on Boot

The device shall implement a mechanism to self-pin boot files, i.e., anything prior to Windows becoming active, into the top priority level of the cache. Specifically, the drive shall self-pin in this fashion from power on until the Hybrid Information Log Page is read. The drive should cease self-pinning to the top priority after 160 MB of data has been pinned. All other self-pinning the drive performs shall occur at priority 0.

Cache Size

The hybrid cache has to provide at least 5 GB (5x2<sup>30</sup> Bytes) of useable capacity to the host.

Note: Devices providing less than 12 GB of useable cache capacity will not be eligible to benefit from hiberfile, swapfile, or other sequential I/O caching.

6 priority levels (0 through 5)

The device must support at least 6 priority levels. No data placed in the cache by the host shall be evicted from ranges 1 through 5 by the device, unless Windows specifies it through calls to evict, demotebysize or trim, or issues further I/Os with priority &gt; 0 to a full cache (i.e., cache churning).

Priority 0

Any I/O hinted at priority 0 shall be serviced directly by the platter, regardless of current state (i.e., if the platter is spun down and receives a priority 0 I/O, it shall spin-up). I/O hinted at priority 0 shall bypass the non-volatile cache and invalidate any cache-resident LBAs that are hinted at priority 0 and now present on platter.

Direct Flash Access

When the platter is spun down, all hinted write commands – except priority 0 writes – shall be serviced directly by the non-volatile cache. The write I/O shall not be staged on the platter first, so as to avoid platter spin-up. If the write cannot be serviced by the non-volatile cache, due to resource constraints (no clean pages, etc.) the platter may spin-up to service the I/O.

Power Up In Standby

The device must support the Power Up In Standby feature (PUIS) defined in SATA spec ATA ACS-3.

Cache Page Replacement

The drive shall repurpose cache pages of lower priorities to satisfy I/Os at higher priorities, starting with the lowest priority. For example, if the cache is full with 25% at priority 0, 50% at priority 2, and 25% at priority 3 and a priority 3 read/write occurs that is not in cache, a priority 0 cache page should be repurposed to accommodate the priority 3 LBA that was read. Once all priority 0 cache pages are repurposed, priority 1 and 2 pages will be repurposed respectively. If no lower priority pages are available, priority 3 should repurpose pages first that are chosen by a LRU-like algorithm.

Update Priority On IO (Read/Write)

Priorities associated with LBAs in the cache must be updated on any subsequent read or write to that LBA, from any valid priority to any valid priority. In addition, if a read or write is issued to an LBA range that currently does NOT reside in cache, then it shall be placed in the cache at the specified priority (provided there is room in the cache or there are blocks of lower priority that can be evicted – in case of a full cache).

Trim

The device shall support trim as defined in the Windows 8 Hardware Certification Requirements under Device.Storage.Hd.Trim.BasicFunction.

Non-volatile Cache Performance:

Random Read: &gt;= 8 MB/s @ 4 KB (Queue Depth = 1)

Latency:

Setting dirty high and dirty low thresholds shall complete within 50 ms.

This command can be completed asynchronously.

I/O that carries priority information should not be significantly slower than I/O without priority information. A read or write that has a priority assigned must not incur a latency penalty larger than the bigger of 10% of an identical I/O without priority information or 0.5 ms (max(10%,0.5 ms)). Achieving this on 95% of all I/Os is acceptable with the penalty never exceeding 100% of a non-priority I/O.

HybridDemoteBySize must return within 500ms when called on 3/255<sup>th</sup> of the cache size.

HybridChangePriorityByLBARange must return within 150 ms when called on a 32 MB range of data.

A possible asynchronous implementation of these commands is acceptable.

Command/Protocol Requirements

The following functionalities and requirements have to be supported by the device and refer SATA revision 3.2 worked on by SATAIO:

13.7.5.4.11 MaxPriority Behavior

The MaxPriority Behavior bit must be set to 0.

13.3.15 Enable/Disable Hybrid Information

13.6.5.4.13 Hybrid Control

Enable/Disable Caching Medium

Windows must have the ability to enable and disable the hybrid cache. Upon disabling the hybrid cache, all dirty data in the cache has to be synchronized with the final storage medium.

Dirty Low Threshold

Dirty High Threshold

Dirty data should be synchronized in ascending order of priority, i.e., priority 0 dirty data should be synchronized before priority 1 dirty data is synchronized. When the amount of dirty data on the device, exceeds the dirty high threshold marker, the device must begin the synchronization of dirty data. It is understood that this requires the platter to spin-up.

13.6.5.4.7 Hybrid Demote By Size

Hybrid Information feature related Logs

The device must enable Windows to read the hybrid log pages and return sensible information. In other words, General Purpose Logging is required and the version number shall be set to 0001h. Specifically:

13.7.9 Word 0x12 of “General Purpose Log Directory” shall be set to “1”, indicating that the “NCQ NON-DATA” log is supported.

13.7.10 Word 0x13 of “General Purpose Log Directory” shall be set to “1”, indicating that the “NCQ SEND AND RECEIVE” log is supported.

13.7.12 Word 0x14 of “General Purpose Log Directory” shall be set to “1”, indicating that the “NCQ HYBRID INFORMATION” log is supported. Windows has to be able to determine the following:

Caching Medium Health Status

Dirty Low Threshold

Dirty High Threshold

Maximum Hybrid Priority Level

Max Priority Behavior

NVM size

Max Eviction Commands.

Max Eviction Data Blocks

For each Priority level:

consumed NVM size fraction

consumed Mapping Resources Fraction

consumed NVM Size for Dirty Data Fraction

consumed Mapping Resources for dirty data fraction

13.6.5.4.1 Hybrid Evict

The LBA range specified by the Evict command shall be targeted to the primary medium like a regular write. The host will ensure consistency – if necessary – by issuing a subsequent flush command. Evicted LBA ranges should be invalidated in the NVC, such that the data only resides on the platter after completion of the Evict command.

13.6.5.4.10 Hybrid Change By LBA Range

Hybrid Change By LBA Range must be supported by the device, including the Cache Behavior bit of the command.

<a name="device.storage.hd.scsi"></a>
## Device.Storage.Hd.Scsi

### Device.Storage.Hd.Scsi.Connectors

*SCSI connectors*

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

SCSI connectors
If an external connector is implemented, it must meet the requirements in SCSI or a later specification. The SCSI connector must not use the same connector type as any other non-SCSI connector on the system. All external parallel SCSI connectors must be labeled with an ANSI-approved icon for the bus. For internal and external configurations, the SCSI bus cable must be plugged into shrouded and keyed connectors on the host adapter and devices. This ensures that the cable is properly positioned so the user cannot plug in cables incorrectly. For internal configurations, pin-1 orientation must be designated on one edge of the ribbon cable and also on the keyed connector for the SCSI peripheral device.

### Device.Storage.Hd.Scsi.ParallelInterface

*Parallel SCSI interface*

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

Parallel SCSI interface
 

-   Parallel SCSI devices and adapters comply with SCSI Parallel Interface-4 (SPI-4) or later.

-   Termination: Automatic termination circuit and SCSI terminators meet SPI-4 standard or later. Parallel SCSI host controllers and adapters must use automatic termination that allows a user to add external devices without removing the server case. Terminators used in the SCSI host adapter must be regulated terminators, which are also known as active, SCSI SPI-4, or Boulay terminators. SCSI termination built onto internal cables must also meet the SPI-4 specification.

-   Terminator power must be supplied to the SCSI bus with overcurrent protection. The host adapter must supply terminator power (TERMPWR) to the SCSI bus for system-board implementations by using PCI or another expansion bus. All terminators on the external SCSI bus must be powered from the TERMPWR lines in the SCSI bus. In addition, the circuit that supplies TERMPWR must have overcurrent protection built into it.

-   External removable disks, hard drives, and CD/DVD optical drives must provide automatic termination or an accessible on-board termination switch. At a minimum, a mechanical means must be provided for setting termination and the switch must be accessible to the user without opening the device chassis.

-   All SCSI devices supporting hot plugging must comply with annex D of SPI-4, which addresses SCSI device insertion and removal, with and without command activity.

-   Differential devices must support DIFFSENS as defined in SPI-4 standard or later.

<a name="device.storage.hd.scsi.reliabilitycounters"></a>
## Device.Storage.Hd.Scsi.ReliabilityCounters

*Basic reliability counter functionality for disks that implement the SCSI command sets.*

### Device.Storage.Hd.Scsi.ReliabilityCounters.BasicFunction

*Basic reliability counter functionality for disks that implement the SCSI command sets.*

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

All SCSI drives must provide valid data for the below log sense page (LOG SENSE 4Dh) parameters as per the SCSI Primary Commands 4 (SPC-4) and SCSI Block Commands 3 (SBC-3) specifications.

-   Start-Stop Cycle Counter (0Eh)

<!-- -->

-   Manufacture Date (0001h)

<!-- -->

-   Read Error Counter (03h)

	<!-- -->

	-   Total (0002h)

	-   Total Errors Corrected (0003h)

	-   Total Uncorrected Errors (0006h)

	<!-- -->

-   Temperature (0Dh)

	<!-- -->

	-   Temperature (0000h)

	-   Reference Temperature (0001h)

	<!-- -->

-   Write Error Counter (02h)

	<!-- -->

	-   Total (0002h)

	-   Total Errors Corrected (0003h)

	-   Total Uncorrected Errors (0006h)

	<!-- -->

-   Background Scan (15h)

	<!-- -->

	-   Background Scan Status (0000h)

Drives which physically move recording media and/or read-write devices, such as hard disk drives, must provide valid data for the below log sense page (LOG SENSE 4Dh) parameters as per the SCSI Primary Commands 4 (SPC-4) specification.

-   Start-Stop Cycle Counter (0Eh)

	<!-- -->

	-   Specified Cycle Count Over Device Lifetime (0003h)

	-   Accumulated Start-Stop Cycles (0004h)

	-   Specified Load-Unload Count Over Device Lifetime (0005h)

	-   Accumulated Load-Unload Cycles (0006h)

Solid-state drives must provide valid data for the below log sense page (LOG SENSE 4Dh) parameter as per the SCSI Block Commands 3 (SBC-3) specification.

-   Solid State Media (11h)

	<!-- -->

	-   Percentage Used Endurance Indicator (0001h)

<a name="device.storage.hd.scsiprotocol"></a>
## Device.Storage.Hd.ScsiProtocol

### Device.Storage.Hd.ScsiProtocol.ReferenceSpec

*Reference to specifications*

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

Where noted as Min, the baseline specification is mandatory. Rec indicates the preferred version of the specification. If not otherwise specified, the version listed is the minimum required. Unless otherwise indicated, all features of the cited specifications that are classified as mandatory by the standards body must be implemented.

SPI-4, SAM-3, Min:SPC-2, Rec: SPC-3, Min: SBC, Rec: SBC-2
 

### Device.Storage.Hd.ScsiProtocol.SamCompliance

*SCSI Architecture Model SAM-3*

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

SCSI Architecture Model SAM-3

SCSI Devices must comply with SCSI Architecture Model SAM-3 or later (except as noted in SBP-2 for 1394 devices), including the following requirements:

-   All devices must support LUN reset. In particular, if two LUNs L0 and L1 under the same target have outstanding commands, a LUN reset to L0 must clear any outstanding commands to L0 only.

-   Following a reset, all devices must return an appropriate unit attention condition to any initiator currently having access to the logical unit.

-   All FC, iSCSI, SCSI, and SAS devices must support multiple initiators.

-   MODE SELECT commands that change parameters must cause a unit attention condition to be raised for any other initiator consistent with SAM-3.

-   LUN 0 must be implemented for all targets. At a minimum, LUN 0 must respond to INQUIRY and all multi-LUN targets must support the REPORT LUNS commands.

-   If any LUN is added or removed that is accessible to the initiator(s), the device must report a unit attention condition of (06/3F/0E) REPORT LUNS DATA HAS CHANGED MODE SELECT. Commands that change parameters must cause a unit attention condition to be raised for any other initiator that would be impacted by the change.

-   Any unrecognized SCSI command or incorrectly formed command descriptor block (CDB) must result in an immediate CHECK CONDITION reported back to the initiator.

### Device.Storage.Hd.ScsiProtocol.SpcCompliance

*SCSI Primary Commands (SPC-3, SPC-4 and SBC-3) *

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

SCSI Primary Commands-3 (SPC-3), SCSI Primary Commands-4 (SPC-4) and SCSI Block Commands-3 (SBC-3)

Devices must comply with SCSI Primary Commands: support commands listed as mandatory in the SCSI Primary Commands (SPC-3 or later). In addition, each device type must implement the mandatory command set for that type (SBC-3 for block devices and so on).

**For SCSI INQUIRY and REPORT LUNS commands**:

All devices must support the SCSI INQUIRY command.

Multi-LUN devices must always respond to an INQUIRY command sent to LUN 0 even if LUN 0 is not implemented. This can be indicated by returning the Device Type Qualifier of 3.

-   All multi-LUN devices must support the REPORT LUNS command as defined in SPC-2 or later.

-   Windows supports only single-level logical unit numbers up to 255; see SAM-3. Use of any other format will be incorrectly interpreted, and the device may not be available or data corruption will occur.

All standard INQUIRY data must be correctly set for the device capabilities.

-   VERSION Field must be 04 or greater. For SAS, this field must be 05 or greater.

-   Drives with attached media changers must set the MChgnr bit in the standard inquiry data.

-   Multi-LUN units must return valid REPORT LUNS data for LUN 0.

-   If LUN 0 is not an accessible PERIPHERAL DEVICE TYPE, the PERIPHERAL QUALIFIER shall be returned as 1. SCSIport will not enumerate the entire target device if a qualifier of 3 is used. It is strongly recommended that LUN 0 not be type 0 because it must be exposed to all initiators. Type 0 is permitted only if the array can map different logical units to LUN 0 for each initiator.

-   If a device has more than one port, MultiP bit must be set and page 83h descriptors must correctly reflect the port information.

Vital Product Data (VPD) pages:

-   Page 00h (Supported Pages VPD Page) is required.

-   Page B1h (Block Device Characteristics VPD Page) is required.

-   Page 80h (Unit Serial Number VPD Page) is required.

    Page 83h (Device Identification VPD Page) is required. For VPD Page 83, at least one type-3 or one type-2 descriptor must be returned for each logical unit, the value must use Code Set 1 (Binary), the value must be unique for that logical unit, and it must be the same value regardless of the path or port responding to the request. Appropriate descriptors for multiport devices are required in addition to that mandatory descriptor. Devices that support aliases must also support the corresponding descriptor types. Vendor-specific device identifiers, if present, must use type 0 and must follow the specified format, including correct page length.

-   Vendor-specific identifiers are not a substitute for the mandatory type 2/3 descriptors. All device identifiers must conform to formatting rules set forth in SPC-3 or later, even if the device claims only conformance to a previous release.

-   Device must comply with SPC-3 section 7.6.3 Device Identification VPD page 83h.

At least one identification descriptor must have the IDENTIFIER TYPE field set to:

-   2h (EUI-64-based) as defined in 7.6.3.5

-   3h (NAA); or as defined in 7.6.3.6

-   8h (SCSI name string) at defined in 7.6.3.11

**SCSI Mode Sense Command and Pages **

MODE SENSE (6) is mandatory for all devices except RBC devices, which implement MODE SENSE (10). The DBD bit must be supported.

-   Mode Page 3Fh (Return all pages mode page) is mandatory.

-   Device type-specific pages listed in the device-specific sections of this document.

-   Additional commands for all devices are as follows:

-   All devices must support the TEST UNIT READY and REQUEST SENSE commands.

**Block Storage (Disk and RAID) Devices **

Block storage (disk and RAID) devices must comply with the following requirements:

-   SCSI block commands (SBC) or later (RBC for 1394). These requirements apply to any device reporting as Device Type 0, including logical units exposed by a RAID controller or subsystem.

-   Block Devices must support the SCSI START STOP UNIT command to decrease power consumption.

-   READ CAPACITY (10) command. If a device has more than 2^32 - 1 sectors, a value of 0xFFFFFFFF must be returned for the RETURNED LOGICAL BLOCK ADDRESS field and the READ CAPACITY (16) command must be supported (see below).

-   Any change to capacity must set a unit attention condition of CAPACITY DATA HAS CHANGED for all initiators with access to the logical unit.

-   READ(10).

-   WRITE(10). Support for force unit access (FUA) is mandatory for individual physical disk drives or RAID controllers that contain volatile (non-battery-backed) cache memory and must cause the data sent with this command to be committed to physical media before the command completes.

-   REASSIGN BLOCKS (hard disks only). RAID controllers that handle bad block replacement should succeed this command.

-   VERIFY (10).

-   START STOP UNIT. This command must not perform any other action, such as path failover.

-   SYNCHRONIZE CACHE (10) (no optional fields are used). For a physical disk drive, this command causes all data in the write cache to commit to physical media if write caching is enabled. Failure to follow this can result in data corruption.

Mode pages:

-   Mode Page 08h (Caching mode page) with the following bits must contain valid information: WCE (Write Cache Enable), CACHE SEGMENT SIZE, and NUMBER OF CACHE SEGMENTS (optional). RBC devices support Page 6 instead of Page 8 (WCD, WRITED, FORMATD, and LOCKD bits).

    -   If a device supports disabling write caching through the use of the WCE bit, this bit must also be reported as changeable and be supported by a MODE SELECT operation which modifies it. The status of the write caching must be visible by reading Mode Page 8. Vendors can implement caching policies outside of the limited SBC ones, and disabling of write cache does not need to be through this mode page.

-   Mode Page 0Ah (Control mode page) is required.

-   Mode Page 1Ah (Power Condition mode page) is required

Disk devices that support greater than 2-TB logical units (including 1394 disks). Devices must conform to SPC-3 and must implement all of the following in accordance with the SCSI Block Commands-2 (SBC-2) specification:

-   READ CAPACITY (16)

-   READ (16)

-   WRITE (16) FUA (bit must be supported if a volatile cache is present on the device)

-   VERIFY (16)

-   REASSIGN BLOCKS. LONGLBA field must be supported.

**Erasable SCSI Disk Devices **

Erasable SCSI disk devices must also support the following commands or features:

-   ERASE: Full-side and selected-block erase.

-   Format requirements reported with FORMAT command.

-   MODE SENSE (6) Total spare blocks available, write protect status.

-   PREVENT ALLOW MEDIUM REMOVAL and START STOP UNIT.

-   REASSIGN BLOCKS and READ DEFECT DATA (10).

    WRITE without pre-erase, for erasable optical only.

<a name="device.storage.hd.smr"></a>
## Device.Storage.Hd.SMR

*Defines the industry and Microsoft standards that shall be met for drives which self-identify as SMR and are either Host-Aware or Host-Managed (also known as Restricted). Drive-Managed SMR (also known as Autonomous) do not have additional Microsoft requirements.*

### Device.Storage.Hd.SMR.BasicFunction

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>
 
**Description**

*SMR Host-Aware/Host-Managed device basic functionality, applicable to both ZAC (ATA) and ZBC (SCSI/SAS) devices.*

**SMR Device Basic Functionality**

-   Write pointer zones shall be 256 MB in length.

-   Conventional zones are recommended (but not required) to be 256 MB in length.

-   Starting at LBA 0 (the first addressable logical sector), there shall be contiguous conventional zones, which total to at least 0.1% of the drive’s addressable LBA space. *(For example, a 10 TB device shall provide at least 10 GB of conventional space, recommended to be rounded up to the next multiple of 256 MB)*

-   SMR device may allow additional conventional zones through the drive’s LBA space, including the last zones.

-   SMR Host-Aware device shall provide support for at least 128 open sequential write preferred zones.

-   SMR Host-Managed device shall provide support for at least 128 open sequential write required zones.

### Device.Storage.Hd.SMR.ATA

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>
 

**Description**

**SMR Host-Aware/Host-Managed devices shall support the following industry standards:**

-   T13 Zoned Device ATA Command Set (ZAC), revision 04i or later

-   T13 ATA Command Set – 4 (ACS-4), revision 10 or later (for portions of the device which is zoned)

-   Device shall support all ACS-4 features as defined as mandatory in ZAC r04i for SMR device type, and shall not support ACS-4 features defined as prohibited in ZAC r04i for SMR device type.

-   Device shall support NCQ feature set, as defined in ACS-4 r10.

-   SMR Host-Aware device shall report the optimal number of open sequential write preferred zones, as defined in ZAC r04i 6.2.2 Zoned Device Information page.

-   SMR Host-Managed device shall report the maximum number of open sequential write preferred zones, as defined in ZAC r04i 6.2.2 Zoned Device Information page. 

 

### Device.Storage.Hd.SMR.SCSI

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>
 

**Description **

**SMR Host-Aware/Host-Managed devices shall support industry standards, specifically:**

-   T10 Zoned Block Commands (ZBC), revision 4 or later

-   T10 SCSI Block Commands -4 (SBC-4), revision 9 or later (for portions of the device which is zoned)

-   Device shall support all SBC-4 features as defined as mandatory in ZBC r4 for SMR device type, and shall not support SBC-4 features defined as prohibited in ZBC r4 for SMR device type.

-   SMR Host-Aware device shall report the optimal number of open sequential write preferred zones, as defined in ZBC r4 6.4.2 Zoned Block Device Characteristics VPD page.

-   SMR Host-Managed device shall report the maximum number of open sequential write preferred zones, as defined in ZBC r4 6.4.2 Zoned Block Device Characteristics VPD page.

<a name="device.storage.hd.thinprovisioning"></a>
## Device.Storage.Hd.ThinProvisioning

### Device.Storage.Hd.ThinProvisioning.BasicFunction

*Thin Provisioning*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Industry standard spec requirements:**

-   Targets that support thin provisioning feature must implement following T10 SPC4 and SBC3 specification:

-   Supported VPD Page VPD Page (Page Code 00h)

-   Block Limit VPD Page (Page Code B0h)

-   Logical Block Provisioning VPD Page (Page Code B2h)

-   Logical Block Provisioning Log Page (Page Code 0Ch)

**Windows Design Spec requirements: **
 

-   Target devices with thin provisioning feature must meet the following requirements.

	<!-- -->

	-   Must return Inquiry command for Supported VPD Page VPD Page with B0h and B2h.

	-   Must return LBPU bit set to one and Provisioning Type field = 3 (010b) of Logical Block Provisioning VPD page (Page Code B2). 

	-   Must implement Block Limit VPD Page (Page Code B0h) and support the following parameters.

		<!-- -->

		-   MAXIMUM UNMAP LBA COUNT
		-   MAXIMUM UNMAP BLOCK DESCRIPTOR COUNT
		-   OPTIMAL UNMAP GRANULARITY
		-   UNMAP GRANULARITY ALIGNMENT
		-   UGAVALID Bit

		<!-- -->

	-   Must implement Logical Block Provisioning VPD Page (Page Code B2h) and support the following parameters.

		<!-- -->

		-   Threshold Exponent
		-   LBPU bit
		-   LBPRZ bit
		-   Provisioning Type field

		<!-- -->

	-   Thin Provisioning target devices should support Log sense command to retrieve Logical Block Provisioning Log Page (Page Code 0Ch) - for adding the following information into the threshold notification system event log.

		<!-- -->

		-   Used LBA mapping resources of a Thin Provisioning LUN.
		-   Available LBA mapping resources to the Thin Provisioning LUN.

		<!-- -->

	-   Storage array must support UNMAP (10) command, the LBPU bit in LBP VPD page shall set to one.

	-   Must support Get LBA Status (16) command according to T10 SBC3 spec.

	<!-- -->

-   If the LBPME bit in ReadCapacity(16) return is set to one or B2h is reported in the Supported VPD Page VPD Page, the storage array must support Logical Block Provisioning VPD page (Page Code B2h).

-   If the LBPRZ bit in ReadCapacity(16) return is set to one, the storage array must set LBPRZ bit of Logical Block Provisioning VPD page to one.

-   Storage array must support threshold notification (TN), temporary resource exhaustion (TRE) and permanent resource exhaustion (PRE) through the following sense key, additional sense code and additional sense code qualifier returns as SPC4 and SBC3 specs.

	<!-- -->

	-   TN- Sense Key/ASC/ASCQ (06/38/07)
	-   TRE- Sense Key/ASC/ASCQ (02/04/14)
	-   PRE- Sense Key/ASC/ASCQ (07/27/07)

**User Experience Requirements:**

-   Must be able to set threshold through vendors' storage management utility and monitor the system event log when the thin provisioning soft threshold is reached.

-   Must support Log Sense command to retrieve the LBP log page for reporting available LBA mapping resource and used LBA mapping resource information to the thin provisioning LUN, if Log Page (Page Code OCh) is implemented.

<a name="device.storage.hd.trim"></a>
## Device.Storage.Hd.Trim

### Device.Storage.Hd.Trim.BasicFunction

*ATA Trim and SCSI Unmap functionality*

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

If the device implements ATA non-NCQ Trim or SCSI Unmap support:

-   The Trim implementation shall comply with ATA ACS2 Section 7.10 (Data Set Management Commands).

-   The SCSI Unmap command implementation shall comply with T10 SBC3 Section 5.28 (UNMAP command).

-   If the device reports a seek penalty indicating rotational media:

	-   All IO and Trim/Unmap commands shall be completed in less than 1,000 ms.

	-   98.5% of IO commands shall be completed in less than 200 ms.

-   Otherwise (SSD):

	-   All IO and Trim/Unmap commands shall be completed in less than 500 ms.

	-   98.5% of IO commands shall be completed in less than 100 ms.

If the RZAT bit is set on a SATA device or the LBPRZ bit is set on a SCSI device, then the device shall return all '0's to a Read command before the trimmed block(s) is(are) re-written.

<a name="device.storage.hd.uas"></a>
## Device.Storage.Hd.Uas

### Device.Storage.Hd.Uas.Compliance

*USB UAS storage devices*

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

USB UASP storage devices must also be compliant with the USB UASP v1.0 and SPC4, SBC3.
USB UASP Storage devices must support the following:

-   Mode page code: 0x08 Mode subpage code : 00

-   Block Limits page - 0xB0 SPC3 6.5.3

-   Support at least 16 streams

-   Support task management commands

**           Note:** For further information on mode pages, see SPC4: D.6 Mode page codes.

-   Support SPC, SBC version descriptors

-   Support/report R02. R04 version descriptors

-   Device must report FIXED if it is not a true removable media (RMB=0)

**Note:** For further information on mode pages, see SPC4: D.6 Mode page codes.
 Data devices must perform as indicated:

-   Minimum sequential write speed: 100 MB/s

-   Minimum sequential read speed: 110 MB/s

Additional Requirement: If the device supports UASP on XHCI, then it must support UASP on EHCI.

<a name="device.storage.hd.uasonehci"></a>
## Device.Storage.Hd.UasOnEHCI

### Device.Storage.Hd.UasOnEHCI.BasicFunction

*USB UAS storage devices*

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

If the device supports UASP on XHCI and then it must support UASP on EHCI.

<a name="device.storage.hd.usb"></a>
## Device.Storage.Hd.Usb

### Device.Storage.Hd.Usb.Compatibility

*USB compatibility*

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

USB compatibility
 

-   All USB storage devices must meet the requirements of the Universal Serial Bus Mass Storage Class Specification Overview, V1.2 Revision. This includes all USB Mass Storage class documents, including Bulk Only, Control/Bulk/Interrupt, Bootability, and UFI Command specifications.

-   BOT1.0, SPC-2, SBC-2

-   USB 3.0 devices must retain backward compatibility at the Type-A connector to allow Superspeed devices to be used, albeit at a lower speed, with USB 2.0 PCs and allow high-speed devices with their existing cables to be connected to the USB 3.0 Superspeed Type-A connectors.

-   USB storage devices must comply with USB 3.0 - Section 11 Interoperability and Power Delivery specs. The following table lists the compatibility matrix for USB 3.0 and USB 2.0. The implication of identifying a host port as supporting USB 3.0 is that both hardware and software support for USB 3.0 is in place; otherwise, the port shall only be identified as a USB 2.0 port.

<html>
    <table>
        <thead>
            <tr class="header">
                <th>USB Host Port</th>
                <th>USB Device Capability</th>
                <th>Connected Mode</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="2">USB 2.0</th>
                <td>USB 2.0</td>
                <td>
                    USB 2.0 high-speed, full-speed, or<br />
                    low-speed
                </td>
            </tr>
            <tr class="even">
                <td>USB 3.0</td>
                <td>
                    USB 2.0 high-speed<br />
                </td>
            </tr>
            <tr class="odd">
                <th rowspan="2">USB 3.0</th>
                <td>USB 2.0</td>
                <td>
                    USB 2.0 high-speed, full-speed, or<br />
                    low-speed
                </td>
            </tr>
            <tr class="even">
                <td>USB 3.0</td>
                <td>
                    USB 3.0 SuperSpeed<br />
                </td>
            </tr>
        </tbody>
    </table>
</html>

-   USB storage devices must comply with certification requirement for USB devices and USB storage devices

Note:  
Please refer to USB3.0 spec section 3.1.4 USB 3.0 Architecture summary

-   USB3.0 Super-speed - 5 Gb/s
-   USB2.0 high-speed  - 480 Mb/s
-   Full-speed - 12 Mb/s
-   Low-speed - 1.5 Mb/s

<a name="device.storage.hd.usb3"></a>
## Device.Storage.Hd.Usb3

### Device.Storage.Hd.Usb3.Compliance

*USB 3.0 storage devices*

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

USB 3.0 storage devices must support industry specifications as indicated below:
 

-   All USB 3.0 Storage devices must be compliant with the USB 3.0 Version 1.0 specification

-   Provide unique product identification through each storage end point (BOT, UASP)

	<!-- -->

	-   USB VID/PID

Data Devices must perform as indicated:

-   Minimum sequential write speed: 60MB/s

-   Minimum sequential read speed: 90MB/s

<a name="device.storage.hd.windowstogocapableusbdrive"></a>
## Device.Storage.Hd.WindowsToGoCapableUSBDrive

*Windows To Go capable USB drive feature*

### Device.Storage.Hd.WindowsToGoCapableUSBDrive.WindowsToGoCapableUSBDrive

*Windows To Go capable USB drive*

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

USB boot devices must be USB 3.0 and meet these industry specifications:

-   USB 3.0 Version 1.0 specification
-   USB BOT specification
-   SCSI Block Commands 3 (SBC-3) Specification


USB boot devices must:

-   Boot Windows

    -   Operate at SuperSpeed when connected to a USB 3.0 port

    -   Successfully enter and resume from Sleep (S3) and Hibernate (S4)

-   Include in the MS OS Descriptor extended property the value "WindowsBootCapable" DWORD value 1

-   Be at least 32 GB in size (20 GB usable)

-   Provide unique, consistent product identification

    -   USB VID/PID
    -   Inquiry Serial Number
    -   Inquiry Model Number

-   Report FIXED (RMB=0)

-   Implement the Block Device Characteristics VPD page

-   **Not** implement IEEE-1667

-   **Not** expose more than one LUN during boot

-   **Not** support the USB Attached SCSI (UAS) protocol

-   If the WTG drive exposes multiple functions to the OS:

    -   The device must be designed as a composite USB device

    -   Composite devices must set DeviceClass, Subclass, and Protocol to 0 in the composite node's device descriptors

    -   Must not implement any functions other than WTG Storage and Smartcard

    -   The Storage function must be the first function exposed

-   Support the following mode pages

    -   Mode page code: 0x08 Mode subpage code : 00

-   Meet the following performance requirements:

    -   Random 4 KB Write IOPs &gt;= 200 (Rotational drives exempt)

    -   Random 4 KB Read IOPs &gt;= 2000 (Rotational drives exempt)

    -   Read/Write perf should scale linearly in mixed workload random access read/write

    -   Sequential write speed &gt;= 80 MB/s

    -   Sequential read speed &gt;= 80 MB/s

    -   Max I/O Latency &lt; 500 milliseconds

    -   Maximum of 16 seconds sum-total of user-perceivable I/O latencies over any 1 hour period of a user-representative workload, where a user-perceivable I/O is defined as having a latency of at least 100 millisecond

<a name="device.storage.optical"></a>
## Device.Storage.Optical

### Device.Storage.Optical.CdRawRecording

*Optical drives must support CD RAW recording.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical drives must support CD RAW recording mode for CD-R and CD-RW profiles.

### Device.Storage.Optical.CommandPerformance

*Optical drives must complete Performance Command within allowed time frames.*

</table>
<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

 
Optical drives must complete all commands within the maximum allowed times according to the following table.

| COMMAND                                                                              | Basic certification requirement (msec) | Exception (exception criteria/ msec)                                    |
|--------------------------------------------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------|
| GET CONFIGURATION                                                                    | 20                                     | &nbsp; |
| GET EVENT STATUS NOTIFICATION                                                        | 20                                     | &nbsp; |
| GET PERFORMANCE                                                                      | 20                                     | &nbsp; |
| INQUIRY                                                                              | 20                                     | &nbsp; |
| MECHANISM STATUS                                                                     | 20                                     | &nbsp; |
| MODE SELECT                                                                          | 20                                     | &nbsp; |
| MODE SENSE                                                                           | 20                                     | &nbsp; |
| PREVENT ALLOW MEDIUM REMOVAL                                                         | 20                                     | &nbsp; |
| READ TOC PMA ATIP                                                                    | 20                                     | &nbsp; |
| READ BUFFER CAPACITY                                                                 | 20                                     | &nbsp; |
| READ CAPACITY                                                                        | 20                                     | &nbsp; |
| READ CD<sup>1,2,4</sup>                                                              | 500                                    | &nbsp; |
| READ DISC INFORMATION                                                                | 50                                     | &nbsp; |
| READ FORMAT CAPACITIES                                                               | 20                                     | &nbsp; |
| READ TRACK INFORMATION                                                               | 20                                     | &nbsp; |
| REQUEST SENSE (when not following a command failed with error status)                | 20                                     | &nbsp; |
| SEND OPC INFORMATION                                                                 | 60000                                  | For dual layer media, i.e., DVD+R DL, DVD-R DL, BD-RE DL / 70000        |
| SET READ AHEAD                                                                       | 20                                     | &nbsp; |
| SET STREAMING                                                                        | 20                                     | &nbsp; |
| START STOP UNIT (Immed=1b)                                                           | 20                                     | &nbsp; |
| START STOP UNIT (Eject, Immed=0b)                                                    | 7000                                   | &nbsp; |
| START STOP UNIT (Inject, Immed=0b, until media is ready)                             | 25000                                  | DVD-RAM / 40000<br/>For dual layer media, i.e., DVD+R DL, DVD-R DL, BD-RE DL / 30000 |
| SYNCHRONIZE CACHE (Immed=1b)                                                         | 20                                     | &nbsp; |
| SYNCHRONIZE CACHE (Immed=0b)                                                         | 15000                                  | &nbsp; |
| TEST UNIT READY                                                                      | 20                                     | &nbsp; |
| BLANK (Immed=1b)                                                                     | 20                                     | &nbsp; |
| BLANK (Immed=0b)                                                                     | N/A                                    | &nbsp; |
| CLOSE TRACK SESSION (Immed=1b)                                                       | 20                                     | &nbsp; |
| CLOSE TRACK SESSION (Immed=0b, close logical track or session, do not finalize disc) | 65000                                  | DVD+R DL, DVD-R DL / 300000<br/>DVD-R SL, DVD-RW / 180000 |
| CLOSE TRACK SESSION (Immed=0b, finalize disc)                                        | 65000                                  | DVD+R DL, 300000<br/>DVD-R SL, DVD-R DL DVD-RW / 900000 |
| FORMAT UNIT (Immediate)                                                              | 20                                     | &nbsp; |
| LOAD/UNLOAD MEDIUM                                                                   | N/A                                    | &nbsp; |
| READ10<sup>1,2,4</sup>                                                               | 500                                    | DVD-RAM / 800                                                           |
| READ12 (not streaming)<sup>1,2,4</sup>                                               | 500                                    | DVD-RAM / 800                                                           |
| READ12 (streaming)<sup>1,2,4</sup>                                                   | 100                                    | CD at 1X / 500;             CD at 2x / 350;              CD at 4x / 200 |
| READ DISC STRUCTURE<sup>6</sup>                                                      | 20                                     | &nbsp; |
| READ MEDIA SERIAL NUMBER<sup>2</sup>                                                 | 500                                    | &nbsp; |
| REPORT KEY                                                                           | 20                                     | &nbsp; |
| RESERVE TRACK                                                                        | N/A                                    | &nbsp; |
| SEND CUE SHEET                                                                       | N/A                                    | &nbsp; |
| SEND DISC STRUCTURE                                                                  | N/A                                    | &nbsp; |
| SEND KEY                                                                             | 20                                     | &nbsp; |
| SET CD SPEED                                                                         | 20                                     | &nbsp; |
| WRITE 10 (FUA=0) <sup>1,3</sup>                                                      | 50                                     | &nbsp; |
| WRITE 12 (FUA=0) <sup>1,3</sup>                                                      | 50                                     | &nbsp; |
| WRITE BUFFER                                                                         | N/A                                    | &nbsp; |
| ERASE                                                                                | N/A                                    | &nbsp; |
| READ BUFFER                                                                          | N/A                                    | &nbsp; |
| READ CD MSF<sup>1,2,4</sup>                                                          | 500                                    | &nbsp; |
| REPAIR TRACK                                                                         | N/A                                    | &nbsp; |
| SEEK10                                                                               | N/A                                    | &nbsp; |
| VERIFY 10                                                                            | N/A                                    | &nbsp; |
| WRITE AND VERIFY 10                                                                  | N/A                                    | &nbsp; |

 
**"Command completion time" is defined as the time between a command leaving the Microsoft port / miniport driver and the command completion being returned to the Microsoft port / miniport driver. If the command is failed with error status, this time also includes the subsequent Request Sense command leaving the Microsoft port / miniport driver and the Request Sense command completion being returned to the Microsoft port / miniport driver.**

All the command execution time performance measurement should be performed on media conforming to media physical layer standard specification from associated committees - i.e., DVD Forum, BDA, DVD+RW Alliance. Also, they should be performed under normal temperature and humidity operational condition as declared in the device specification.

**Note:** Read-Only drives will be retired from the Windows certification Program on June 01, 2010. Hence, certification requirements and tests will cease to exist for Read-Only drives on June 01, 2010. Partners who wish to receive Windows certification on systems with Read-Only drives would still be able to. However, the Read-Only drive would fall under the "unclassified" category of devices.
 
<sup>1</sup>: Transfer length for the read and write performance tests is equal or smaller to a single ECC block (32 KB or 64 KB depending of the current media type, i.e., 64 KB for CD and BD, 32 KB for DVD).

<sup>2</sup>: Performance tests may be exercised at any speed reported as supported by the device, including 1x media speed if so reported as supported.

<sup>3</sup>: Drive ***must*** make use of write buffer and ***shall not*** delay command completion by any form of media access. If write buffer is full, drive ***must*** fail the write command with long write in progress sense information (02h/04h/08h).
 
<sup>4</sup>: The first hundred read I/O commands after media arrival or resume from StandBy power state or Set Cd Speed or Set Streaming are permitted a delay up to a cumulative total of  60 000 msec to complete to allow for additional spin-up time. These commands individually may take any duration up to a limit of 7 000 msec, but the cumulative time to complete all hundred commands shall not exceed 60 000 msec. Only the time between when a read command is sent to the device and that read command is completed by the device is accounted for, the time between two successive read commands is not accounted for (i.e., host delays are not measured).

<sup>6</sup>: The list of disc structure codes is limited to; physical format information (Format = 0x00, Address = 0), DVD-RAM medium status (Format = 0x09, Address = 0), DVD+RW write inhibit DCB (Format = 0x30 Address = 0x57444300), write protection status (Format = 0xC0 Address = 0)<sup>7</sup>:Dual Layer Write profile *will be required on 1 June 2010* for Blu-Ray drives of 9.5 mm height and smaller as well as DVD drives 7 mm height and smaller. This ends the previous exception for these form factors.

### Device.Storage.Optical.DriveDefinition

*How optical drives are defined for certification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

To be an Optical Drive, the device must be defined as CD (Compact Disc) device, DVD (Digital Versatile Disc or Digital Video Disc) device, BD (Blu-Ray Disc) device or any device which identifies itself as Peripheral Device Type 5 per INCITS's T10's command set SCSI Primary Commands, SPC (any revision).

### Device.Storage.Optical.Features

*Required optical drive features*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical drives must support the required features listed below:

-   Core Feature
-   Profile List Feature
-   Mandatory features per profile
-   Removable medium feature from Mt. Fuji 7
-   Reporting correct tray status
-   Power management feature
-   Morphing Feature
-   Drive Serial Number Feature
-   DVD CSS Feature (0106h)

### Device.Storage.Optical.MmcVersion

*Optical drives must comply with MMC.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical drives must conform to INCITS's T10's command set and MultiMedia Command Set - 6 (MMC-6) when published. Because the publication of MMC-6 has been delayed, Optical Drives must in the interim conform to the combination of INCITS's T10's command set MultiMedia Command Set - 5 (MMC-5) and SFF's Mt. Fuji Commands for Multimedia Devices Version 7 (INF-8090i v7) until the publication of MMC-6. If and when MMC-5 and INF-8090i v7 contradict each other, and the following requirements do not specify explicitly the required behavior, compliance to MMC-5 is required (with the exception of features newly defined in INF-8090i v7).

### Device.Storage.Optical.Profiles

*Required optical drive profiles*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical drives must support the required profiles as listed below:

-   CD-ROM
-   DVD-ROM
-   Removable Disk
-   CD-R
-   CD-RW
-   DVD-R Sequential Recording
-   DVD-RW Restricted Overwrite
-   DVD-R Dual Layer Sequential Recording
-   DVD+RW
-   DVD+R
-   DVD+R DL

### Device.Storage.Optical.RealTimeStreaming

*Optical drives must support Real Time Streaming.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical Drives must support Real Time Streaming as required according to Profile requirements. For all recordable and rewritable profiles, the following fields shall be set accordingly: Stream Writing (SW)=1b and Write Speed Performance Descriptor (WSPD)=1b.

<a name="device.storage.optical.blurayreader"></a>
## Device.Storage.Optical.BluRayReader

### Device.Storage.Optical.BluRayReader.Profiles

*Required profiles for Blu-Ray readers*

</table>
<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Blu-Ray reader drives must support BD-ROM profile.

<a name="device.storage.optical.bluraywriter"></a>
## Device.Storage.Optical.BluRayWriter

### Device.Storage.Optical.BluRayWriter.Profiles

*Required profiles for Blu-Ray writers*

</table>
<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Blu-Ray drives that can write must support BD-ROM, BD-R Sequential Recording and BD-RE profiles.

<a name="device.storage.optical.sata"></a>
## Device.Storage.Optical.Sata

### Device.Storage.Optical.Sata.AsynchronousNotification

*Asynchronous Notification is required for all SATA connected drives.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Optical drives that connect via the SATA bus must support Asynchronous Notification.

