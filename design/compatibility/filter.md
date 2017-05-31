---
title: Hardware Compatibility Specification for Filter for Windows 10, version 1607
Description: 'This section of the documentation provides specifications for hardware compatibility for filter drivers on Windows 10, version 1607.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hardware Compatibility Specification for Filter for Windows 10, version 1607

This section of the documentation provides specifications for hardware compatibility for filter drivers on Windows 10, version 1607.

These specifications are divided into the following categories and topics:

- [Filter.Driver.AntiVirus](#filterdriverantivirus)
- [Filter.Driver.DeviceGuard](#filterdriverdeviceguard)
- [Filter.Driver.EarlyLaunchAntiMalware](#filterdriverearlylaunchantimalware)
- [Filter.Driver.FileSystem](#filterdriverfilesystem)
- [Filter.Driver.Fundamentals](#filterdriverfundamentals)
- [Filter.Driver.Network-LWF](#filterdrivernetworklwf)
- [Filter.Driver.Security](#filterdriversecurity)
- [Filter.Driver.vSwitchExtension](#filterdrivervswitchextension)
- [Filter.Driver.WindowsFilteringPlatform](#filterdriverwindowsfilteringplatform)

<a name="filterdriverantivirus"></a>
## Filter.Driver.AntiVirus 

*Antivirus requirements for filter drivers.*

### Filter.Driver.AntiVirus.Functionality

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows file systems, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows file systems, as well as interact accurately with the core components of the operating system. Some areas of particular interest are: 
 

-   Local File Systems
    -   NT API, Win32 API and Win32 mapped IO API usage
    -   Object ID functionality
    -   Reparse points
    -   Oplocks
    -   System cache usage
    -   Transactional capability
-   Remote file systems
-   Oplock semantics over SMB

Information about file system behavior: <http://download.microsoft.com/download/4/3/8/43889780-8d45-4b2e-9d3a-c696a890309f/File%20System%20Behavior%20Overview.pdf>

Information about Oplock semantics over SMB, see the \[MS-SMB2\] protocol document at: <http://msdn.microsoft.com/en-us/library/cc246482(PROT.13).aspx>

### Filter.Driver.AntiVirus.IcarDetection

*Anti-virus filter drivers must be architected to exercise basic anti-virus functionality, as well as interact accurately with the core components of the operating system.*

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

Anti-virus filter drivers must be architected to exercise basic anti-virus functionality, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:    

-   File systems
-   Anti-virus functionality

### Filter.Driver.AntiVirus.MiniFilter

*A file system filter driver must be a minifilter driver that uses the file systems filter manager.*

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

This requirement will be tested implicitly. The driver detection mechanism of the Windows Hardware Lab Kit will be written such that legacy file system filter drivers are not enumerated. Only minifilter drivers will be enumerated and surfaced in the kit. As such, a user will be unable to select a legacy filter driver for logo testing via the kit.

Information about filter manger and minifilter drivers available here:
<http://msdn.microsoft.com/en-us/library/ff540402.aspx>
<http://msdn.microsoft.com/en-us/windows/hardware/gg462968.aspx>

### Filter.Driver.AntiVirus.NamedPipeAndMailSlots

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Named Pipe and Mail Slots, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of Named Pipe and Mail Slots, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are: 

-   Named Pipe file system

    -   Functionality and stress for common APIs

    -   Anonymous pipes

    -   Pipe modes

    -   Open modes

    -   Invalid pipe names

    -   Flushing pipe

    -   Max pipe instance

    -   Pipe direction (in/out/duplex)

    -   Input and output buffer sizes

    -   Various call semantics, such as reconnecting a pipe that has been disconnected at the server end.

    -   Behavior validation of all named pipes operations for each distinct state of a pipe instance.

    -   Performance for named pipe creation and connection.

    -   Throughput for different in/out buffer sizes and number of clients. 

    -   Scalability of increasing number of clients to time it takes for a connection to a named pipe instance

-   Mail Slot file system

-   Functionality and stress for common APIs

Information about Named Pipe and Mail Slots can be found at:
<http://msdn.microsoft.com/en-us/library/aa365574.aspx>

### Filter.Driver.AntiVirus.RegistryAndProcess

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of the Windows registry and processes, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of the Windows registry and processes, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:      

-   Registry

    -   NT API and Win32 API usage

    -   Key functions

    -   Transaction registry operations

    -   Symbolic link behavior

-   Process

    -   General module management

    -   Race conditions at thread/process termination

    -   Process management callback functionality

-   Thread and process handle operations

### Filter.Driver.AntiVirus.Winsock

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows Sockets, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows Sockets, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:   

-   Winsock

-   Winsock API functionality

Information about Winsock APIs can be found at:
<http://msdn.microsoft.com/en-us/library/ms740673(VS.85).aspx>

<a name="filterdriverdeviceguard"></a>
## Filter.Driver.DeviceGuard 

*All kernel drivers must be built to be compatible with [Device Guard](http://blogs.msdn.com/b/windows_hardware_certification/archive/2015/05/22/driver-compatibility-with-device-guard-in-windows-10.aspx).*

### Filter.Driver.DeviceGuard.DriverCompatibility

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>


**Description**

Windows 10 has a feature called [*Device Guard*](http://blogs.windows.com/business/2015/04/21/windows-10-security-innovations-at-rsa-device-guard-windows-hello-and-microsoft-passport/) that gives organizations the ability to lock down devices in a way that provides advanced malware protection against new and unknown malware variants as well as Advanced Persistent Threats (APTs). Device Guard can use hardware technology and virtualization to isolate the Code Integrity (CI) decision-making function from the rest of the Windows operating system. When using virtualization-based security to isolate Code Integrity, the only way kernel memory can become executable is through a Code Integrity verification. This means that kernel memory pages can never be Writable and Executable (W+X) and executable code cannot be directly modified.

Details are available on the Windows Hardware Certification Blog: [Driver compatibility with Device Guard in Windows 10](http://aka.ms/DeviceGuard).

The following attributes must be set on the sys file.
<table>
<tr><th>Name of attribute</th><th>Description</th></tr>
<tr><td>CompanyName</td><td>Company name</td></tr>
<tr><td>FileDescription</td><td>File/Product description of the driver</td></tr>
<tr><td>OriginalFilename</td><td>Original file name</td></tr>
<tr><td>ProductName</td><td></td></tr>
<tr><td>VS\_FIXEDFILEINFO:</td><td></td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;FileVer</td><td>File version number</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;FileVer</td><td>Product version number</td></tr>
</table>

You can find more details on the following MSDN page:

-   <https://msdn.microsoft.com/en-us/library/windows/desktop/aa381058.aspx>

All kernel drivers on Windows MUST be signed by Microsoft (WHQL certificate) through the SysDev dashboard.

<a name="filterdriverearlylaunchantimalware"></a>
## Filter.Driver.EarlyLaunchAntiMalware 

*This section describes requirements for early launch driver.*

### Filter.Driver.EarlyLaunchAntiMalware.BackupDriver

*Early launch anti-malware drivers must include a backup copy in case of corruption.*

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

The anti-malware (AM) driver is critical to the boot success of the computer.  If the driver gets corrupted, then the boot may not succeed.  To provide the best user experience, it is required that when the AM driver is installed, it also installs a copy in the driver backup store.  This ensures a smooth remediation experience in the case that the primary driver gets corrupted.

The location of the ELAM backup store is defined by Windows, and stored in the registry:
HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\EarlyLaunch ! BackupPath

*Design Notes:*
The early launch anti-malware (AM) drivers are started soon after the NTOS kernel starts.  For each subsequent boot driver, the AM driver receives a callback from the PnP manager to determine whether the boot driver should be initialized.  The AM driver evaluates the boot driver and must return good, bad, or unknown.  Based on the returned classification and defined policy, the PnP manager decides whether to initialize the boot driver.

### Filter.Driver.EarlyLaunchAntiMalware.ELAMSignatureAttributes

*Requirement for the SignatureAttribute section in the ELAM INF files.*

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

ELAM files must be signed with a special signature as part of the submission process. The process of determining what signature each module needs is being standardized; each INF file must now include a SignatureAttributes section that uniquely identifies what type of signature is applicable for the associated driver binaries. Adding this section to existing inf files is a very simple process.

An example follows.
```
\[SignatureAttributes\]
ELAMFILE.dll = SignatureAttributes.Elam
\[SignatureAttributes.Elam\]
Elam=true
```

### Filter.Driver.EarlyLaunchAntiMalware.MVIMembership

*Early launch anti-malware drivers may only be created by MVI members.*

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

Any early launch anti-malware (AM) driver may only be created by Microsoft Virus Initiative (MVI) members.

 *Design Notes:*
The early launch AM drivers are started soon after the NTOS kernel starts.  For each subsequent boot driver, the AM driver receives a callback from the PnP manager to determine whether the boot driver should be initialized.  The AM driver evaluates the boot driver and must return good, bad, or unknown.  Based on the returned classification and defined policy, the PnP manager decides whether to initialize the boot driver.

### Filter.Driver.EarlyLaunchAntiMalware.Performance

*Early launch anti-malware drivers must be performant.*

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

Callback Latency:
The anti-malware (AM) driver is required to return a result for each callback within 0.5 ms of receiving the callback.

Memory Allocation:
The AM driver, including both the driver image as well as its configuration (signature) data, is required to have a limited memory footprint of 256 KB or less.

Unload Blocking:
Each AM driver will receive a synchronous callback after the last boot driver has been initialized indicating that the AM driver will be unloaded. At this point, the AM driver must clean up and save any persistent status information. This must occur within 0.5 ms as measured from the time when the kernel issues the callback to the driver to the time that the AM driver returns the callback.

*Design Notes:*
The early launch AM drivers are started soon after the NTOS kernel starts.  For each subsequent boot driver, the AM driver receives a callback from the PnP manager to determine whether the boot driver should be initialized.  The AM driver evaluates the boot driver and must return good, bad, or unknown.  Based on the returned classification and defined policy, the PnP manager decides whether to initialize the boot driver. 

### Filter.Driver.EarlyLaunchAntiMalware.SignatureData

*Early launch anti-malware drivers must only use signature data stored in the Microsoft-specific location.*

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

The AM driver must get its malware signature data from a single, well-known location and no other.  The signature data shall be stored in the registry in a new ELAM hive under HKLM that is loaded by Winload, and will therefore be available to the AM driver prior to the file system being initialized.   Each AM driver will have a unique key in which to store their signature blob.   The registry path and key shall be of the format HKLM\\ELAM\\<*Vendor Name*>\\Measured : Binary = <*blob*>.

*Design Notes:*
The early launch anti-malware (AM) drivers are started soon after the NTOS kernel starts.  For each subsequent boot driver, the AM driver receives a callback from the PnP manager to determine whether the boot driver should be initialized.  The AM driver evaluates the boot driver and must return good, bad, or unknown.  Based on the returned classification and defined policy, the PnP manager decides whether to initialize the boot driver.

<a name="filterdriverfilesystem"></a>
## Filter.Driver.FileSystem 

### Filter.Driver.FileSystem.Functionality

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows file systems, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows file systems, as well as interact accurately with the core components of the operating system. Some areas of particular interest are:   

-   Local file systems

    -   NT API, Win32 API and Win32 mapped IO API usage

    -   Object ID functionality

    -   Reparse points

    -   Oplocks

    -   System cache usage

    -   Transactional capability

-   Remote file systems

-   Oplock semantics over SMB

Information about file system behavior: <http://download.microsoft.com/download/4/3/8/43889780-8d45-4b2e-9d3a-c696a890309f/File%20System%20Behavior%20Overview.pdf>

Information about Oplock semantics over SMB, see the \[MS-SMB2\] protocol document at: <http://msdn.microsoft.com/en-us/library/cc246482(PROT.13).aspx>

### Filter.Driver.FileSystem.MiniFilter

*A file system filter driver must be a minifilter driver using the file systems Filter Manager.*

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

This requirement will be tested implicitly. The gatherer will be written such that it enumerates and surfaces only minifilter drivers for the Windows Hardware Certification Kit (WHCK). Hence, a user will be unable to select a legacy filter driver for certification testing.

Information about Filter Manger and minifilter drivers available here:
<http://msdn.microsoft.com/en-us/library/ff540402.aspx>

### Filter.Driver.FileSystem.NamedPipeAndMailSlots

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Named Pipe and Mail Slots, as well as interact accurately with the core components of the operating system.*

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

Kernel Mode filter drivers must be architected to maximize the reliability and functionality of Named Pipe and Mail Slots, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:  

-   Named Pipe file system

    -   Functionality and stress for common APIs

    -   Anonymous pipes

    -   Pipe modes

    -   Open modes

    -   Invalid pipe names

    -   Flushing pipe

    -   Max pipe instance

    -   Pipe direction (in/out/duplex)

    -   Input and output buffer sizes

    -   Various call semantics, such as reconnecting a pipe that has been disconnected at the server end.

    -   Behavior validation of all named pipes operations for each distinct state of a pipe instance.

    -   Performance for named pipe creation and connection.

    -   Throughput for different in/out buffer sizes and number of clients. 

    -   Scalability of increasing number of clients to time it takes for connection to a named pipe instance

-   Mail Slot file system

-   Functionality and stress for common APIs

Information about Named Pipe and Mail Slots can be found at:
<http://msdn.microsoft.com/en-us/library/aa365574.aspx>

### Filter.Driver.FileSystem.RegistryAndProcess

*Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows registry and processes, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers must be architected to maximize the reliability and functionality of Windows registry and processes, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:      

-   Registry

    -   NT API and Win32 API usage

    -   Key functions

    -   Transaction registry operations

    -   Symbolic link behavior

-   Process

    -   General module management

    -   Race conditions at thread/process termination

    -   Process management callback functionality

-   Thread and process handle operations


## Filter.Driver.Fundamentals 

*Corresponds to device driver fundamentals, but for filter drivers.*

### Filter.Driver.Fundamentals.DriverQuality

*A filter driver must be of high quality.*

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

Driver components must not cause the system to crash or leak resources. These resources include, but are not limited to the following:  

-   Memory

-   Graphics Device Interface (GDI) or user objects

-   Kernel objects such as files, mutex, semaphore, and device handles

-   Critical sections

-   Disk space

-   Printer handles

*Design Notes*:

Sleep & PNP with IO Before And After Test - Test cycles the system through all sleep states and does basic PNP on all devices on the system.

This test will be run with Driver Verifier enabled with standard settings.

<a name="filterdrivernetworklwf"></a>
## Filter.Driver.Network.LWF 

*LAN requirements.*

### Filter.Driver.Network.LWF.Base

*All light weight filters must be NDIS 6.30 or greater.*

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

All light weight filters must be NDIS 6.30 or greater and be compliant to the NDIS specification on MSDN.

### Filter.Driver.Network.LWF.MTUSize

*All light weight filters must be able to accept arbitrary packet sizes which might be greater than the miniport's MTU.*

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

All light weight filters must be NDIS 6.30 or greater. All light weight filters must be able to accept arbitrary packet sizes which might be greater than the miniport's MTU.


## Filter.Driver.Security 

*Additional requirements related to security for TDI filter drivers and LSPs.*

### Filter.Driver.Security.NoTDIFilterAndLSP

*No TDI filters or LSPs are installed by the driver or associated software packages during installation or usage. *

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

There can be no use of TDI filters or LSPs by either kernel mode software or drivers, or user mode software or drivers.

<a name="filterdrivervswitchextension"></a>
## Filter.Driver.vSwitchExtension 

### Filter.Driver.vSwitchExtension.ExtensionRequirements

*Filter drivers that implement VM Switch Extensibility must support required functionalities, modes, and protocols.*

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

Filter drivers that implement VM Switch Extensibility must support required functionalities, modes, and protocols.

Requirements

-   An extension must pass NDIS Filter logo requirements.

    -   An extension must have a valid INF.

    -   An extension must make only NDIS, WDF, or WDM calls; any calls to other kernel mode components are not allowed.

-   An extension must support Hyper-V Live Migration.

    -   Don't break LM, Save/Restore, Export/Import

    -   Don't block saved data from another extension

    -   Don't block other extension interactions

-   All traffic passing through a virtual switch coming from a VM, a host VNIC, external NIC, or extension must not have headers modified by extensions.   Exceptions from this requirement include:

    -   Redirecting traffic to a network appliance

    -   Mutable IP header fields (as specified in RFC 4302 section 3.3.3.1.1.1 for IPv4 and section 3.3.3.1.2.1 for IPv6)

-   An unconfigured extension must not break connectivity between the host and external network.

-   A capture extension must not break connectivity between vSwitch ports.

-   An extension must pass the following switch/port/NIC configuration OIDs down the stack of an extension:

    -   OID\_SWITCH\_PARAMETERS

    -   OID\_SWITCH\_PORT\_ARRAY

    -   OID\_SWITCH\_PORT\_TEARDOWN

    -   OID\_SWITCH\_PORT\_DELETE

    -   OID\_SWITCH\_NIC\_ARRAY

    -   OID\_SWITCH\_NIC\_CONNECT

    -   OID\_SWITCH\_NIC\_DISCONNECT

    -   OID\_SWITCH\_NIC\_DELETE

    -   OID\_SWITCH\_NIC\_REQUEST

-   An extension must pass the following policy/status OIDs that it does not consume down the stack:

    -   OID\_SWITCH\_PORT\_PROPERTY\_ADD

    -   OID\_SWITCH\_PORT\_PROPERTY\_UPDATE

    -   OID\_SWITCH\_PORT\_PROPERTY\_DELETE

    -   OID\_SWITCH\_PROPERTY\_ADD

    -   OID\_SWITCH\_PROPERTY\_UPDATE

    -   OID\_SWITCH\_PROPERTY\_DELETE

    -   OID\_SWITCH\_PORT\_FEATURE\_STATUS\_QUERY

    -   OID\_SWITCH\_FEATURE\_STATUS\_QUERY

-   An extension must pass the following policy OIDs down the stack:

    -   OID\_SWITCH\_PORT\_PROPERTY\_ENUM

    -   OID\_SWITCH\_PROPERTY\_ENUM

-   An extension must pass the following up the stack:

    -   NDIS\_SWITCH\_NIC\_STATUS\_INDICATION

-   A "capture" extension must not call any of the following functions:

*Design Notes:*
See the VM Switch Extensibility Specification.

<a name="filterdriverwindowsfilteringplatform"></a>
## Filter.Driver.WindowsFilteringPlatform 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.AppContainers.SupportModernApplications

*WFP-based products must not block App Container apps that are operating within their declared network intentions by default, and should only block App Container apps when following specific user/admin intention or protecting the system against a specific threat.*

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

WFP-based products must not block App Container apps that are operating within their declared network intentions by default, and should only *block App Container apps* when following specific user/admin intention or protecting the system against a specific threat.

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.CleanUninstall

*WFP-based products must stop cleanly and clean up all running state upon uninstall.*

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

This is to ensure that host firewalls do not leave unused objects upon uninstall, thereby potentially causing diagnostic issues if another separate host firewall is installed on the same PC. 
The following WFP objects need to be cleaned up: Provider, providerContext, Filter, subLayer, or callout.
In addition, additional installation requirements for applications (via the Software logo program) must be met.

*Design Notes*:

Applications can use either an MSI, or another installer that meets this requirement to ensure a satisfactory install/uninstall experience on a Windows® based PC.
The installation requirements for applications (in the Software Logo Program) are located in the following link:
<http://www.microsoft.com/downloads/details.aspx?FamilyID=27028822-B172-4CEC-91A3-26B610A4DA79&displaylang=en>
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.ConnectionProxying.NoDeadlocks

*WFP-based products that redirect or proxy at redirect layers (connect redirect), must use the new proxying API so that other WFP-based products can determine that the connection has been proxied.*

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

WFP-based products which redirect or proxy at redirect layers (connect redirect), must use the new proxy'ing API so that other WFP-based products can determine that the connection has been proxy'ed.
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.FwpmFilters.MaintainOneTerminating

*WFP-based products must create and maintain at least one terminating FWPM\_FILTER object.*

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

A terminating filter is one that returns a permit / block decision. It may exist as a static filter or within a callout. The intent behind this requirement is to ensure that premium host firewalls perform at least one permit or block decision and not simply maintain filters only for inspection purposes, whereas basic host firewalls may do so through WFP or through other means such as TDI, NDIS, and WinSock LSP filters.

*Design Notes:*
The definition for the FWPM\_FILTER object can be found in the following URL: <http://go.microsoft.com/fwlink/?LinkID=116902&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.FwpmProviders.AssociateWithObjects

*WFP-based products must associate all of their provider contexts, filters, sublayers, and callouts with their corresponding identifying provider object.*

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

For examples that illustrate the code behavior expected for various types of objects, please see below:
Reference the name & product of the company within an identifying provider object:
```
const PWSTR pCompanyName = L"Microsoft Corporation";
const PWSTR pProductName = L"Windows Firewall";
FWPM\_PROVIDER0 myProvider;
myProvider.displayData.name = pCompanyName;
myProvider.displayData.description = pProductName; 
```
Initialize the provider object:
```
FWPM\_PROVIDER\_CONTEXT0 myProviderContext;
FWPM\_PROVIDER0 myProvider;
myProviderContext.providerKey = &(myProvider.providerKey);
```
Initialize the subLayer object & associate it to your respective provider object:
```
FWPM\_SUBLAYER0 mySubLayer;
FWPM\_PROVIDER0 myProvider;
mySubLayer.providerKey = &(myProvider.providerKey); 
```
Initialize the callout object & associate it to your respective provider object:
```
FWPM\_CALLOUT0 myCallout;
FWPM\_PROVIDER0 myProvider;
myCallout.providerKey = &(myProvider.providerKey); 
```
Initialize the filter object & associate it to your respective provider object:
```
FWPM\_FILTER0 myFilter;
FWPM\_PROVIDER0 myProvider;
myFilter.providerKey = &(myProvider.providerKey);
```
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.FwpmProviders.MaintainIdentifying

*WFP-based products must create and maintain at least one identifying FWPM\_PROVIDER provider object.*

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

An identifying provider object *must* reference the name & product of the company as shown in the example below.  
FWPM\_PROVIDER0

1.  All vendors must create and maintain at least 1 provider.

2.  The provider.displayData.Name must contain the name of the company.

3.  The provider.displayData.Description must contain the name of the product.

All objects created & owned by the vendor must reference only their provider(s):
```
const PWSTR pCompanyName = L"Microsoft Corporation";
const PWSTR pProductName = L"Windows Firewall";
FWPM\_PROVIDER0 myProvider;
 
myProvider.displayData.name = pCompanyName;
myProvider.displayData.description = pProductName;
```

*Design Notes:*
The definition of the FWPM\_PROVIDER object can be found in the following URL:
<http://go.microsoft.com/fwlink/?LinkID=116844&clcid=0x409>
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.FwpmSublayers.UseOwnOrBuiltIn

*WFP-based products must use only their own sublayer or one of the built-in sublayers.*

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

A host firewall's own sublayer may be used to ensure that its filters must not be bypassed by a higher weight filter from another host firewall. In addition, a host firewall must not override filters belonging to another host firewall.

*Design Notes:*
The definition for the FWPM\_SUBLAYERobject can be found in the following URL:
<http://go.microsoft.com/fwlink/?LinkID=116845&clcid=0x409>
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.NetworkDiagnosticsFramework.HelperClass

*WFP-based products must include a Network Diagnostics Framework (NDF) helper class that extends the Filtering Platform helper class (FPHC).*

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

The Windows Filtering Platform (WFP) includes a Network Diagnostics Framework (NDF) helper class, called the Filtering Platform helper class (FPHC). FPHC can help to identify the root causes of connectivity issues caused by WFP. A host firewall can invoke its own NDF helper class. FPHC extensibility allows these third-party helper classes to be invoked during diagnostics.

FPHC can identify WFP as the cause of a connectivity issue. If available, FPHC can also identify the provider that created the filter that is blocking network traffic. FPHC passes this information to NDF, which in turn can then notify the user that WFP is causing the connectivity problem and give the name of the provider blocking traffic.

However, the FPHC cannot suggest a corrective action to the user, nor can it provide the reason that the filter is blocking traffic to the user. Only an FPHC extension can perform those tasks.

Host firewalls must be able to successfully diagnose the inbound/outbound connection failures caused by the host firewall, and provide an appropriate response to the end-user based on the diagnosis. (for example, repair mechanism, message explaining to the user the reason why the connection failed, and so on).

*Design Notes:*
More information regarding NDF and FPHC can be found in the following links:

NDF       : <http://go.microsoft.com/fwlink/?LinkID=125463&clcid=0x409><br/>
FPHC     : <http://go.microsoft.com/fwlink/?LinkID=125464&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.NoAccessViolations

*WFP-based products must not be the resulting cause of any access violation under high load or during driver load/unload.*

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

WFP-based products must not be the resulting cause of any access violation under high load or during driver load/unload (while under network load or not).
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.NoTamperingWith3rdPartyObjects

*WFP-based products must not attempt to remove or alter another WFP-based product's WFP objects and built-in objects.*

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

This ensures interoperability between multiple host firewalls' WFP objects within the operating system.
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.PacketInjection.NoDeadlocks

*WFP-based products must not continually modify network packets that have already been modified and re-injected, so as to create potential deadlocks.*

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

Firewalls may use callouts to modify and re-inject network packets, when filtering at any layer. One or many host firewalls may be present on the same system. When there is only one host firewall is present on the system, continually modifying & re-injecting the same packets may result in reduced performance and is to be avoided. When multiple host firewalls (with callouts) are present on the system, the same network packet(s) may continually be modified by multiple callouts. When a host firewall continually modifies and reinjects the same packet, it may result in the network packet never getting processed and could potentially create a deadlock, which is to be avoided.

Host firewalls must not modify and reinject the same network packet more than 2 times per layer. If such a situation occurs, host firewalls may choose to let the packet go through, or drop the network packet.
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.StreamInjection.NoStreamStarvation

*WFP-based product callouts at FWPM\_LAYER\_STREAM must not starve the data throughput.*

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

To *not starve* means that Stream layer callout indications should not be pended to queue up more than 8 MB of data.
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.SupportPowerManagedStates

*WFP-based products must ensure network connectivity upon recovering from power managed states.*

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

Tests must be run on a machine that supports all the power states (standby, hibernate, hybrid, shutdown, restart). Host Firewalls allow the system to enter into and recover from the above mentioned power managed states. Upon resuming from those particular power managed states, requirements from WFP should be met.

Firewalls should never pend packets such that a power state change refuses to work due to the pended packets.
 

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.WFPObjectACLs

*WFP-based products must ACL all of their objects in a way that any other WFP-based product can at least enumerate those objects using the corresponding WFP enumeration APIs.*

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

WFP-based products must ACL all of their objects in a way that any other WFP-based product can at least enumerate those objects using the corresponding WFP enumeration APIs.
This is to make sure that all WFP objects on the system can be enumerated by any Host firewall or application for diagnostic purposes.

*Design Notes:*
As an example, Filter objects must be able to be enumerated by the FwpmFilterEnum function documented in the following URL:
<http://go.microsoft.com/fwlink/?LinkID=116839&clcid=0x409>
Similarly, enumeration functions for other objects (provider, sublayer, etc.) can be found in the following URL: <http://go.microsoft.com/fwlink/?LinkID=116840&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.ArchitecturalDesign.Winsock

*Kernel mode filter drivers are architected to maximize the reliability and functionality of Windows Sockets, as well as interact accurately with the core components of the operating system.*

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

Kernel mode filter drivers are architected to maximize the reliability and functionality of Windows Sockets, as well as interact accurately with the core components of the operating system.  Some areas of particular interest are:   

-   Winsock

-   Winsock API functionality

Information about Winsock APIs can be found at:
<http://msdn.microsoft.com/en-us/library/ms740673(VS.85).aspx>

### Filter.Driver.WindowsFilteringPlatform.Firewall.DisableWindowsFirewallProperly

*Host firewalls must disable the Windows firewall using only the supported method.*

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

Host firewalls are provided with the ability to selectively turn parts of Windows Firewall on or off. These parts specify different types of rules (and subsequently filter sets), and may also be referred to as categories. Filter sets that may be selectively turned off are Boot-Time Filters, Firewall Filters, Connection Security Filters, and Stealth Filters.
The 'Register' interface is supported by the HNetCfg.FwProducts COM object. The put\_DisplayName() call must be used to fill in your product information.
Before turning off the firewall rules category, vendor firewalls must ensure that all filters must be installed.

This requirement ensures better interoperability with Windows. In addition, if all installed host firewalls on the system are uninstalled for any reason, Windows Firewall is aware of this, and will automatically turn on the firewall filters, ensuring that the system is always protected.
The Connection Security filters need to remain enabled to keep Windows scenarios protected. Specifically, the Connection Security filters ensure that the system supports communications that require authentication and encryption.

*Design Notes*:

This requirement ensures that firewall vendors disable Windows Firewall per documented guidelines.

### Filter.Driver.WindowsFilteringPlatform.Firewall.NotOnlyPermitAllFilters

*Host firewalls must not have only "permit\_all" filters.*

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

Host firewalls must not circumvent the intent of the Windows Filtering Platform API tests, by simply maintaining all 'permit\_all' filters for all kinds of network traffic, which essentially is not meaningful filtering of network traffic. This applies to both, static as well as callout filters. Similarly, Host firewalls must not maintain only 'block\_all' filters. However, that will be addressed when testing for consumer scenarios.
 

### Filter.Driver.WindowsFilteringPlatform.Firewall.Support5TupleExceptions

*All host-based firewalls must be able to block/allow by 5-tuple parts (including port (ICMP type and code, UDP and TCP) IP address, and protocol (for example, UDP/TCP/ICMP).*

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

All host-based firewalls must be able to block/allow by 5-tuple parts (including port (ICMP type and code, UDP and TCP) IP address, protocol (for example, UDP/TCP/ICMP)).

### Filter.Driver.WindowsFilteringPlatform.Firewall.SupportApplicationExceptions

*WFP-based products must support exceptions from corresponding applications.*

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

In addition to supporting scenarios based on applications within Windows® it is important to support applications (installed by the home user), that are registered with the host firewall for filtering purposes. Firewalls may use parameters, such as path and ports, as the basis for permitting or blocking application-specific traffic. This scenario will need to work with native IPv4, native IPv6, 6to4, and Teredo packets.
The word *support* refers to the *host firewall's capability* to ensure exceptions from applications work with the host firewall, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.
 

### Filter.Driver.WindowsFilteringPlatform.Firewall.SupportMACAddressExceptions

*All host-based firewalls that have filters in L2 (Native/Mac) layers must be able to Block or Allow by MAC address.*

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

All host-based firewalls that have filters in L2 (Native/Mac) layers must be able to Block or Allow by MAC address.

### Filter.Driver.WindowsFilteringPlatform.Firewall.UseWindowsFilteringPlatform

*Firewalls must comply with Windows Filtering Platform based APIs for filtering network traffic on home user solutions.*

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

There must be no TDI, NDIS, WinSock LSP filters present upon installation of the host firewall on the PC. On home user products, only static filters / callouts based on Windows Filtering Platform (WFP) must be used.

*Design Notes:*
For more information on Windows Filtering Platform, please see the following link: <http://go.microsoft.com/fwlink/?LinkID=116899&clcid=0x409>

 

### Filter.Driver.WindowsFilteringPlatform.NetworkingFundamental.SupportAddressResolution

*WFP-based products must support allowing for successful ARP and ICMP Neighbor Discovery exchanges.*

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

WFP-based products must support ARP (for IPv4) and ICMP Neighbor Discovery (for IPv6) exchanges.

Firewalls allow the system to send out ARP and ICMP Neighbor Discovery requests and replies, as well as receive ARP and ICMP Neighbor Discovery requests and replies.
The word *support* refers to the *host firewall's capability* to make ARP work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Host firewalls should allow the PC to send out ARP requests on behalf of another node rather than only on behalf of itself, when ICS is running on the host.
As part of Internet Connection Sharing's (ICS) DHCP functionality, ICS DHCP can send out ARP requests on behalf of another node in the subnet.
 

### Filter.Driver.WindowsFilteringPlatform.NetworkingFundamental.SupportDynamicAddressing

*WFP-based products support allowing for successful DHCP exchanges over both IPv4 and IPv6.*

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

Host firewalls support allowing successful DHCP exchanges over both IPv4 and IPv6.

DHCP DISCOVER, DHCP REQUEST & DHCP INFORM packets can be transmitted over outbound UDP source port 68 to destination port 67. DHCP OFFER & DHCP ACK & DHCP NACK packets can be received over inbound UDP source port 67 to destination port 68. DHCPv6 packets can be transmitted over outbound UDP source port 546 to destination port 547. DHCPv6 packets can be received over Inbound UDP Source Port 547 to destination port 546.  

The word *support* refers to the *host firewall's capability* to allow successful DHCP exchanges, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Details can be found in the following URL: <http://go.microsoft.com/fwlink/?LinkID=116834&clcid=0x409>

Host firewalls should allow DHCP inbound and outbound as the server over the wireless interface when a service like ICS is running on the host.

Internet Connection Sharing (ICS) acts as a DHCP server and expects to receive incoming DHCP clients.
DHCP DISCOVER, DHCP REQUEST & DHCP INFORM packets can be received over Inbound UDP source port 68 to destination port 67.
DHCP OFFER & DHCP ACK & DHCP NACK packets can be transmitted over outbound UDP source port 67 to destination port 68.

### Filter.Driver.WindowsFilteringPlatform.NetworkingFundamental.SupportIPv4

*WFP-based products must support IPv4 traffic.*

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

This is to ensure that consumer host firewalls or other filtering components do not cause the loss of basic IPv4 connectivity on the PC.
The word *support* refers to the *host firewall's capability* to make IPv4 work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
More information about IPv4, RFCs can be found in the following link: <http://go.microsoft.com/fwlink/?LinkID=116835&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.NetworkingFundamental.SupportIPv6

*WFP-based products must support IPv6 traffic.*

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

Windows® has IPv6 enabled by default. Host firewalls should not break native IPv6 connectivity (and therefore, Windows scenarios based on IPv6) for customers.

The word *support* refers to the *host firewall's capability* to make IPv6 work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
More information about IPv6 can be found in the following link: <http://go.microsoft.com/fwlink/?LinkID=116832&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.NetworkingFundamental.SupportNameResolution

*WFP-based products must support allowing for successful DNS client queries.*

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

DNS QUERY packet can be sent out over \[Outbound UDP Destination Port 53 (Domain Name Server)\] and DNS QUERY RESPONSE packet to be received over \[Inbound UDP Source Port 53 (Domain Name Server)\]. Host firewalls should allow successful DNS client queries over both IPv4 and IPv6.
The word *support* refers to the *host firewall's capability* to allow successful DNS client queries, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
More information about DNS, RFCs can be found in the following link: <http://go.microsoft.com/fwlink/?LinkID=116835&clcid=0x409>
Host firewalls should allow this type of DNS traffic (Host as a server) over the wireless interface when a service like ICS is running on the host.
This requirement applies to Internet Connection Sharing that acts as a DNS server (proxy) and expects receiving incoming DNS requests from clients on destination UDP port 53, and respond to the DNS client with DNS response with destination UDP port 53.

### Filter.Driver.WindowsFilteringPlatform.Scenario.Support6to4

*WFP-based products must support 6to4.*

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

In certain markets, 6to4 technologies may help certain customers move to IPv6 connectivity. The following guidelines may help meet this requirement:

-   Host firewalls allow for the system to send and receive IPv6 packets over IPv4 protocol 41.

The word *support* refers to the *host firewall's capability* to 6to4 work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Please refer to the following article below for further information on 6to4:
<http://go.microsoft.com/fwlink/?LinkID=116837&clcid=0x409>
 

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportAutomaticUpdates

*WFP-based products must support Automatic Updates in Windows.*

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

This is related to Automatic Updates / Windows Update (WU), which is a key scenario through which important patches are installed on your PC to keep it up to date. The following guideline may help meet this requirement:
 

-   Host firewalls allow outbound TCP connections to destination ports 80 & 443.

The word *support* refers to the *host firewall's capability* to make Automatic Updates work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
For more information on Windows Updates/ Automatic Updates, please see the following link: <http://go.microsoft.com/fwlink/?LinkID=116898&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportBasicWebsiteBrowsing

*WFP-based products must support basic internet browsing experiences.*

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

This is to ensure that basic internet browsing experiences are supported upon installation of a host firewall on a Windows&ndash;based computer.
Host firewalls must allow TCP packets over Ports 80 and 443 to support this scenario. This scenario must work with native IPv4, native IPv6, 6to4, and Teredo packets.
The word *support* refers to the *host firewall's capability* to ensure a successful internet browsing experience, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportFileAndPrinterSharing

*WFP-based products must support file and printer sharing.*

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

This is to ensure that home users will be able to share content to and from other PCs inside of their home network, in addition to printing content on shared printers.
 Host firewalls must allow UDP packets specific to protocol 17 over Ports 137 / 138, and TCP packets specific to protocol 6 over ports 139/445. This scenario must work with native IPv4, native IPv6, 6to4, and Teredo packets.
TCP packets should be allowed over ports 5357/5358 & UDP packets should be allowed over port 3702. This scenario should work with native IPv4, native IPv6, 6to4, and Teredo packets.
The word *support* refers to the *host firewall's capability* to make file and printer sharing work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Please refer to the following link for more information:
                <http://go.microsoft.com/fwlink/?LinkID=116838&clcid=0x409>

Please refer to the following documents for more information:

-   HomeGroup Firewall Requirements: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

-   Network Location Dialog: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

-   PNRP: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportICMPErrorMessages

*WFP-based products must support ICMP error messages and discovery functions.*

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

This is to ensure that host firewalls support ICMP error messages (per IETF RFCs 4890 and RFC 2979), for inbound/outbound packets that must not be dropped. Important discovery functions must also be supported. The specific error messages that need to be supported for both ICMPv4 and ICMPv6 are: Destination Unreachable, Time Exceeded, and Parameter Problem. In addition, for ICMPv6, Packet too big, Router solicitation, Neighbor solicitation, Router advertisement, and neighbor advertisement discovery functions must be supported.
The word *support* refers to the *host firewall's capability* to make ICMP work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
For more information, please see <http://go.microsoft.com/fwlink/?LinkID=116835&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportInternetStreaming

*WFP-based products must support Internet streaming and Media sharing for media player network sharing services.*

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

This is related to Automatic Updates / Windows Update (WU), which is a key scenario through which important patches are installed on your PC to keep it up to date. The following guidelines may help meet this requirement:

Host firewalls allow outbound TCP connections to destination ports 80 & 443.
The word *support* refers to the *host firewall's capability* to make Automatic Updates work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
For more information on Windows Updates/ Automatic Updates, please see the following link: <http://go.microsoft.com/fwlink/?LinkID=116898&clcid=0x409>

 

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportMediaExtenderStreaming

*WFP-based products must support media streaming scenarios based on extender technologies.*

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

Extender technology is built into home entertainment devices such as TVs, DVD players, and cool, quiet components that allow you to keep your PC where it makes sense and use it as a hub to provide your digital entertainment to TVs throughout your house. These devices are called extender devices.
For example: With the new Extenders for Windows Media Center, you can stream the digital media you have on your Windows Media Center PC in as many as five rooms in your house. Home-users may access the live and recorded TV, music, movies, videos, sports, Internet TV and other online content on Windows® PCs through wired or wireless home networks. Windows Media Center Extenders use network ports to communicate with Windows PCs. The following tables of exceptions may be useful in meeting this requirement.

**Table 1. Media Center Extender–specific**
<table>
<tr><th>Binary executable</th><th>Port</th><th>Direction</th><th>Scope</th></tr>
<tr><td>svchost.exe (ssdpsrv)</td><td>UDP 1900</td><td>Inbound</td><td>Local Subnet</td></tr>
<tr><td>svchost.exe (termservice)</td><td>TCP 3390</td><td>Inbound</td><td>Local Subnet</td></tr>
<tr><td>svchost.exe (QWave)</td><td>TCP 2177</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>svchost.exe (QWave)</td><td>UDP 2177</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td> System</td><td>TCP 10244</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehshell.exe</td><td>TCP 554</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehshell.exe</td><td>UDP 5004, 5005</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehshell.exe</td><td>TCP 8554-8558</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehshell.exe</td><td>UDP 50004-50013</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehshell.exe</td><td>UDP 7777-7781</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>mcrmgr.exe</td><td>random</td><td>Outbound</td><td>Internet</td></tr>
<tr><td>mc2prov.exe</td><td>random</td><td>Outbound</td><td>Internet</td></tr>
<tr><td>Svchost.exe (mcs2svc)</td><td>random</td><td>Outbound</td><td>Local Subnet</td></tr>
</table>

**Table 2. Media Center binary executables and ports**

<table>
<tr><th>Binary executable</th><th>Port</th><th>Direction</th><th>Scope</th></tr>
<tr><td>ehrecvr.exe</td><td>random</td><td>Outbound</td><td>Internet</td></tr>
<tr><td>ehrec.exe</td><td>random</td><td>Outbound</td><td>Internet</td></tr>
<tr><td>ehexthost.exe</td><td>random</td><td>Outbound, Inbound</td><td>Internet</td></tr>
<tr><td>mcupdate.exe</td><td>random</td><td>Outbound</td><td>Internet</td></tr>
</table>

**Table 3. Digital cable receiver device (OCUR)**

<table>
<tr><th>Binary executable</th><th>Port</th><th>Direction</th><th>Scope</th></tr>
<tr><td>ehprivjob.exe</td><td>UDP 5001-5006</td><td>Inbound</td><td>Local Subnet</td></tr>
<tr><td>svchost.exe</td><td>UDP 1900</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>System</td><td>TCP 2869</td><td>Outbound, Inbound</td><td>Local Subnet</td></tr>
<tr><td>ehprivjob.exe</td><td>TCP 554</td><td>Outbound</td><td>Local Subnet</td></tr>
<tr><td>ehprivjob.exe</td><td>UDP 5757-5772</td><td>Outbound</td><td>Local Subnet</td></tr>
</table>
 
The word *support* refers to the *host firewall's capability* to make internet streaming & media sharing for media player network sharing services, work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportMobileBroadBand

*WFP-based products must allow mobile broadband devices that are compliant with Windows mobile broadband driver model to function correctly.*

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

WFP-based products must allow mobile broadband devices that are compliant with the Windows mobile broadband driver model to function correctly.
This is to ensure that host firewall functionality does not block the mobile broadband connectivity and the firewall functionality works with MB devices.
Windows provides native support for mobile broadband (MB) data cards & embedded modules to work with Windows. The MB devices need to implement their driver as per Windows mobile broadband driver model. The MB driver model defines how the devices should be exposed to Windows and network packet format in which MB devices should exchange data between network and system.

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportPeerNameResolution

*WFP-based products must support Peer Name Resolution Protocol and the Peer-to-Peer Grouping Protocol.*

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

Host firewalls support the Peer Name Resolution Protocol (PNRP) and the Peer-to-Peer Grouping Protocol, which are required by some Peer-to-Peer applications. The Peer Name Resolution Protocol provides secure, serverless name resolution, and the Peer-to-Peer Grouping Protocol provides secure, reliable multi-party communication. The following guidelines may be useful in meeting this requirement:

1.  Host firewalls support native IPv6 (NETWORK-0244) as well as Teredo (NETWORK-0248) and IPv6 packets to IPv4 protocol 41 (^to4) (NETWORK-0249).

2.  Host firewalls can allow for the system to send outbound, and receive inbound, UDP packets over port 3540.

3.  Host firewalls can allow for the system to send outbound, and receive inbound, TCP packets over port 3587.

The word *support* refers to the *host firewall's capability* to allow successful DHCP exchanges, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes*:

Please refer to the following documents for more information, these documents:
 

-   HomeGroup firewall requirements: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

-   Network location dialog: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

-   PNRP: <http://technet.microsoft.com/en-us/appcompat/default.aspx>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportRemoteAssistance

*WFP-based products must support Remote Assistance scenarios.*

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

The Remote Assistance scenario is used by a helper to connect to a computer and to show the user a solution to the problem. The following guidelines may help meet this requirement:
Host firewalls allow the computer to be reached by native IPv4, native IPv6, Teredo, and 6to4 (pass the corresponding tests) and also allow traffic from the Remote Assistance application within Windows® (msra.exe) through the firewall.
The word *support* refers to the *host firewall's capability* to make Remote Assistance work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
For information on how Remote Assistance works in general, please see the article below:
<http://go.microsoft.com/fwlink/?LinkID=116842&clcid=0x409>
 

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportRemoteDesktop

*WFP-based products must support remote desktop.*

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

Remote Desktop Connection is a technology that allows you to connect to a remote computer in a different location. Remote desktop is a key Windows® scenario that would be relevant for consumers with multiple PCs at home trying to access content that exists on one PC, from another PC.
The following guideline may help meet this requirement:

Host firewalls allow inbound TCP packets over Destination Port 3389 to support this scenario. This scenario will need to work with native IPv4, native IPv6, 6to4, and Teredo packets.
The word *support* refers to the *host firewall's capability* to make remote desktop work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
For more information on remote desktop, please see the article below:
<http://go.microsoft.com/fwlink/?LinkID=116841&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportTeredo

*WFP-based products must support Teredo.*

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

Teredo may be used as a connectivity mechanism to support certain Windows scenarios such as remote assistance, instant messaging and others. Hence, preserving Teredo connectivity is critical to supporting Windows consumer scenarios.
For this requirement, the following must be met:

-   Host firewalls allow DNS resolution of teredo.ipv6.microsoft.com.

-   To allow client to Teredo server communication, host firewalls must allow for the system to send outbound UDP/IPv4 packets to UDP port 3544.

-   To allow Teredo connectivity, host firewalls must allow inbound and outbound UDP/IPv4 traffic over the Teredo client system ports. These ports can be obtained using the FWPMSystemPortsGet notification to determine the system port numbers used for communication using the Teredo interface.

-   Host firewalls support ICMP error messages & discovery functions (NETWORK-0250 logo requirement).

-   Host firewalls allow UPnP framework packets over UDP port 1900, and UPnP frameworkpackets over TCP port 2869.

The word *support* refers to the *host firewall's capability* to make Teredo work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Please refer to the following article below for further information on Teredo:
<http://go.microsoft.com/fwlink/?LinkID=116836&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.Scenario.SupportVirtualPrivateNetworking

*WFP-based products must support VPN scenarios in Windows.*

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

The following protocols and ports must be allowed:

-   IP protocol 50: Allow ESP traffic            

-   IP protocol 51: Allow AH traffic            

-   UDP Port 500 / 4500: Allow ISAKMP traffic           

-   TCP / UDP Port 88: Allow Kerberos traffic

This ensures that firewalls support IPsec scenarios, such as IPsec VPN, which are used on client PCs to connect securely over the internet.
In addition, host firewalls should allow successful IPsec communication over both IPv4 and IPv6. Host firewalls should also allow UDP packets over port 1701, and TCP packets over port 443 to support this scenario. It is also recommended that host firewalls allow TCP packets specific over port 1723. IP protocol 47 based packets should also be allowed by the host firewall.
The word *support* refers to the *host firewall's capability* to make the VPN scenarios work, if the application/user/network needs it. The host firewall must also have properly configured objects, such as filters, to support the required functionality, even though the functionality may not be enabled by default in the UI.

*Design Notes:*
Please refer to the following article for further information: <http://go.microsoft.com/fwlink/?LinkID=116843&clcid=0x409>

### Filter.Driver.WindowsFilteringPlatform.Scenario.vSwitch.InteropWithOtherExtensions

*WFP must not block traffic from another vSwitch extension (WFP or LWF) by default, and should only do so when following specific user/admin intention or protecting the system against a specific threat.*

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

WFP must not block traffic from another vSwitch extension (WFP or LWF) by default, and should only do so when following specific user/admin intention or protecting the system against a specific threat.

### Filter.Driver.WindowsFilteringPlatform.Scenario.vSwitch.NoEgressModification

*WFP-based products that operate in the vSwitch must not modify packets on the Egress path of the vSwitch.*

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

WFP-based products that operate in the vSwitch must not modify packets on the Egress path of the vSwitch.

### Filter.Driver.WindowsFilteringPlatform.Scenario.vSwitch.SupportLiveMigration

*WFP-based products that operate in the vSwitch must present a minimal MOF for Live Migration.*

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

WFP-based products that operate in the vSwitch must present a minimal MOF for Live Migration. In the MOF, it must declare itself Logo compliant for Live Migration and allow itself to be migrated or not block migration by default. The total time for migrations for Live Migration cannot be longer than 2 seconds.

### Filter.Driver.WindowsFilteringPlatform.Scenario.vSwitch.SupportRemoval

*WFP-based products that operate in the vSwitch must be allowed to be removed when the admin disabled WFP for the vSwitch instance.*

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

WFP-based products that operate in the vSwitch must be allowed to be removed when the admin disabled WFP for the vSwitch instance.

### Filter.Driver.WindowsFilteringPlatform.Scenario.vSwitch.SupportReordering

*WFP-based products that operate in the vSwitch must respond to WFP vmSwitch reorder events.*

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

WFP-based products that operate in the vmSwitch must respond to WFP vmSwitch reorder events.
