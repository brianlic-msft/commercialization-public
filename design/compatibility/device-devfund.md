---
title: Device.DevFund
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

# Device.DevFund

 - [Device.DevFund.CDA](#device.devfund.cda)
 - [Device.DevFund.DeviceGuard](#device.devfund.deviceguard)
 - [Device.DevFund.DriverFramework.KMDF](#device.devfund.driverframework.kmdf)
 - [Device.DevFund.DriverFramework.UMDF](#device.devfund.driverframework.umdf)
 - [Device.DevFund.Firmware](#device.devfund.firmware)
 - [Device.DevFund.HALExtension](#device.devfund.halextension)
 - [Device.DevFund.INF](#device.devfund.inf)
 - [Device.DevFund.Memory](#device.devfund.memory)
 - [Device.DevFund.Reliability](#device.devfund.reliability)
 - [Device.DevFund.Reliability.3rdParty](#device.devfund.reliability.3rdparty)
 - [Device.DevFund.Reliability.Interrupts](#device.devfund.reliability.interrupts)
 - [Device.DevFund.ReliabilityDisk](#device.devfund.reliabilitydisk)
 - [Device.DevFund.Rollback](#device.devfund.rollback)
 - [Device.DevFund.Security](#device.devfund.security)
 - [Device.DevFund.Server](#device.devfund.server)
 - [Device.DevFund.Server.Nano](#device.devfund.server.nano)
 - [Device.DevFund.Server.PCI](#device.devfund.server.pci)
 - [Device.DevFund.StaticTools](#device.devfund.statictools)

<a name="device.devfund.cda"></a>
## Device.DevFund.CDA

*Custom Driver Access for privileged application usage.*

### Device.DevFund.CDA.Application

*Custom Driver Access*

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

If a device driver supports a privileged app performing Custom Driver Access, it must declare a restricted interface. 

By declaring a restricted interface, the following requirements must be met:
 

-   Assert that the device io control interfaces provided by this device driver are intended to be accessed by a privileged app running in an app container that accesses hardware functionality using CreateDeviceAccessInstance() and IDeviceIoControl() on Windows 10.   

<!-- -->

-   The restricted interface cannot be opened directly from an app container.

A device driver declares an interface is restricted by setting the DEVPKEY\_DeviceInterface\_Restricted property to true on that interface.  

<a name="device.devfund.deviceguard"></a>
## Device.DevFund.DeviceGuard

*All kernel drivers must be built to be compatible with <http://aka.ms/DeviceGuard>*

### Device.DevFund.DeviceGuard.DriverCompatibility

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows 10 has a new feature called [Device Guard](http://aka.ms/DeviceGuard) that gives organizations the ability to lock down devices in a way that provides advanced malware protection against new and unknown malware variants as well as Advanced Persistent Threats (APTs). Device Guard can use hardware technology and virtualization to isolate the Code Integrity (CI) decision-making function from the rest of the Windows operating system. When using virtualization-based security to isolate Code Integrity, the only way kernel memory can become executable is through a Code Integrity verification. This means that kernel memory pages can never be Writable and Executable (W+X) and executable code cannot be directly modified.

Details are available in the [Windows Hardware Certification blog](http://go.microsoft.com/fwlink/p/?LinkId=627463).

The following attributes must be set on the sys file

| CompanyName             | Company name                           |
|-------------------------|----------------------------------------|
| FileDescription         | File/Product description of the driver |
| OriginalFilename        | Original file name                     |
| ProductName             | Product name                           |
| VS\_FIXEDFILEINFO:      | &nbsp; |
| &nbsp;&nbsp;&nbsp;FileVer                 | File version number                    |
| &nbsp;&nbsp;&nbsp;ProdVer                 | Product version number                 |

You can find more details on the [VERSIONINFO resource on MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa381058.aspx).

<a name="device.devfund.driverframework.kmdf"></a>
## Device.DevFund.DriverFramework.KMDF

*Driver framework requirements for KMDF*

### Device.DevFund.DriverFramework.KMDF.Reliability

*Kernel Mode Driver Framework (KMDF) drivers must be architected to maximize reliability and stability and do not "leak" resources such as memory and KMDF objects.*

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

Kernel-Mode Driver Framework (KMDF) drivers must use pool memory responsibly. Handles that the drivers pass to device driver interfaces (DDIs) must conform to the pattern of the parameter. The state of the drivers must be consistent with the use of **WDFREQUEST** objects and **WDFQUEUE** objects.
Event callback functions that the driver registers must adhere to interrupt request level (IRQL) restrictions.

*Design Notes*

For more information about developing drivers that meet this requirement, visit the following websites:
<http://msdn.microsoft.com/en-us/library/aa973499.aspx>
<http://www.microsoft.com/whdc/driver/wdf/KMDF.mspx>
The following tools can be enabled to validate this requirement for all KMDF drivers:

-   Windows® Driver Foundation (WDF) Verifier.

-   Handle tracking. Handle tracking will be enabled on all KMDF objects.

-   Enhanced Verifier for Framework 1.9 KMDF drivers. Enhanced Verifier is new for Framework 1.9. This tool can be enabled by using the EnhancedVerifierOptions registry value. To enable Enhanced Verifier, set the following registry values for the driver's Parameters\\Wdf key:

```
HKLM\\System\\CurrentControlSet\\Services\\\\Parameters\\Wdf
EnhancedVerifierOptions   REG\_DWORD  1
VerifierOn                REG\_DWORD  1
TrackHandles              MULTI\_SZ        \*
```

-   Driver Verifier. To enable Driver Verifier, use the following command:

<blockquote>
<b>verifier /flags 0xfb /driver</b>
</blockquote>

This command will run the KMDF driver under Driver Verifier with all flags set except the Low Resource Simulation flag. For more information about Driver Verifier, visit the following website:
http://msdn.microsoft.com/en-us/library/ff545448.aspx
In the Windows Logo Kit, the WDF Test can be run to validate this requirement.

### Device.DevFund.DriverFramework.KMDF.WDFProperINF

*Windows Driver Framework (WDF) driver INF files must be properly structured.*

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

<ul>
<li><p>All information (INF) files in Windows Driver Foundation (WDF) driver packages must call WDF-specific sections properly. Correctly structured INF sections help to ensure that the driver will be installed properly. However, even when a driver is installed, a poorly or wrongly configured section can cause unpredictable problems during the operation of the driver or device. These problems can be prevented by following the guidelines for WDF INF settings.<br />
To meet this requirement, all WDF INF files must have the following:</p></li>
<li><p>A coinstaller section, as follows:</p></li>
<code>[DDInstall.Coinstallers]<br />
CopyFiles=<br />
AddReg=<br />
 </code></li>

<li><p>A WDF section, as follows:</p>

<p>For Kernel-Mode Driver Framework (KMDF) drivers:</p>
<code>[DDInstall.Wdf]<br />
KmdfService= &lt;ServiceName&gt;, &lt;Kmdf\_Install&gt;<br />
[Kmdf\_Install]<br />
KmdfLibraryVersion=
<br />
</code>

<p>For User-Mode Driver Framework (UMDF) drivers:</p>
<code>[DDInstall.Wdf]<br />
UmdfService=&lt;ServiceName&gt;,&lt;Umdf\_Install&gt;<br />
UmdfServiceOrder=<br />
UmdfDispatcher [Only for USB Drivers and Drivers with file handle I/O targets]=<br />
UmdfImpersonationLevel[optional]=<br/><br/>
[Umdf\_Install]<br/>
UmdfLibraryVersion=<br />
DriverCLSID=<br />
ServiceBinary=<br />
<br />
 </code>
</li>

<li><p>All UMDF driver INF files must have a WUDFRD service installation section, as follows:</p>

<code>[WUDFRD\_ServiceInstall]<br />
DisplayName = &quot;Windows Driver Foundation - User-mode Driver Framework<br />
Reflector&quot;<br />
ServiceType = 1<br />
StartType = 3<br />
ErrorControl = 1<br />
ServiceBinary = %12%\WUDFRd.sys<br />
LoadOrderGroup = Base<br />
<br />
 </code>
</li>

<li><p>All WDF drivers that use a WinUSB driver must have the following service installation settings:</p>

<code>[WinUsb\_ServiceInstall]<br />
DisplayName = &quot;WinUSB Driver&quot;<br />
ServiceType = 1<br />
StartType = 3<br />
ErrorControl = 1<br />
ServiceBinary = %12%\WinUSB.sys<br />
<br />
 </code>
</li>

<li><p>Service names, hardware IDs (HWIDs), display names, and UMDF class identifiers (CLSIDs) cannot be pasted from WDF samples.</p></li>
</ul>

<p><em>Design Notes:</em><br />
For more information about WDF-specific INF settings, visit the following websites:<br />
<a href="http://www.microsoft.com/whdc/driver/wdf/wdfbook.mspx" class="uri">http://www.microsoft.com/whdc/driver/wdf/wdfbook.mspx</a><br />
http://msdn.microsoft.com/en-us/library/ff560526.aspx<br />
http://msdn.microsoft.com/en-us/library/ff560526.aspx</p>


<a name="device.devfund.driverframework.umdf"></a>
## Device.DevFund.DriverFramework.UMDF

*Driver framework requirements for UMDF*

### Device.DevFund.DriverFramework.UMDF.Reliability

*User Mode Driver Framework (UMDF) drivers must be secure, stable, reliable, and not have application compatibility issues.*

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

To help ensure that all User-Mode Driver Framework (UMDF) drivers meet security standards, are stable and reliable, and do not have application compatibility issues, drivers must not have any object leaks.
Object leaks can be diagnosed by enabling object tracking. If a memory leak occurs, set the Reference Count Tracking setting to "On." This setting logs the history for "add of reference" and "release of reference" counts.

These features can be set to "On" by using the following registry values:
```
HKLM\\Software\\Microsoft\\WindowsNT\\CurrentVersion\\WUDF\\Services\\{193a1820-d9ac-4997-8c55-be817523f6aa}
TrackObjects REG\_DWORD 1
TrackRefCounts REG\_DWORD 1
```

UMDF drivers must also meet the following requirements:

-   The drivers must not attempt to use invalid handles.

-   The drivers must use critical sections and file locks properly. The primary purpose of the locks test is to help ensure that the application properly uses critical sections.

-   The drivers must not cause heap memory corruption.

-   The drivers must correctly use virtual address space manipulation functions, such as **VirtualAlloc**, **VirtualFree**, and **MapViewOfFile**.

-   The drivers must not hide access violations by using structured exception handling.

-   The drivers must correctly use thread local storage functions.

-   The drivers must use COM correctly.

Partners can verify that the drivers meet these requirement by enabling Microsoft® Application Verifier's handles, locks, heaps, memory, exceptions, and Transport Layer Security (TLS) settings for the UMDF host process (that is, WUDFHost.exe) during driver development and testing.
For more information, see the *Developing Drivers with the Windows Driver Foundation* book at the following website:
<http://www.microsoft.com/whdc/driver/wdf/wdfbook.mspx>.

*Design Notes*

Application Verifier will help check UMDF drivers extensively to help ensure stable and reliable drivers.
For all UMDF drivers, Application Verifier will be enabled when driver reliability tests are executed.

Application Verifier can be downloaded from the following Microsoft website:
http://www.microsoft.com/downloads/en/details.aspx?FamilyID=c4a25ab9-649d-4a1b-b4a7-c9d8b095df18.

To enable Application Verifier for WUDFHost.exe, run the following command:
appverif -enable handles locks heaps memory COM exceptions TLS -for WUDFHost.exe.

For more information about UMDF, visit the following website: <http://www.microsoft.com/whdc/driver/wdf/UMDF.mspx>.

### Device.DevFund.DriverFramework.UMDF.WDFProperINF

*Windows Driver Framework (WDF) driver INF files must be properly structured.*

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

All information (INF) files in Windows Driver Foundation (WDF) driver packages must call WDF-specific sections properly. Correctly structured INF sections help ensure that the driver will be installed properly. However, even when a driver is installed, a poorly or wrongly configured section can cause unpredictable problems during the operation of the driver or device. These problems can be prevented by following the guidelines for WDF INF settings.

To meet this requirement, all WDF INF files must have the following:

<ul>
<li><p>A coinstaller section, as follows:</p></li>
<li><code>[DDInstall.Coinstallers]<br />
CopyFiles=<br />
AddReg=<br />
<br />
 </code></li>

<li><p>A WDF section, as follows:</p>

<p>For Kernel-Mode Driver Framework (KMDF) drivers:</p>
<code>[DDInstall.Wdf]<br />
KmdfService= &lt;ServiceName&gt;, &lt;Kmdf\_Install&gt;<br />
[Kmdf\_Install]<br />
KmdfLibraryVersion=</code>
<p>For User-Mode Driver Framework (UMDF) drivers:</p>
<code>[DDInstall.Wdf]<br />
UmdfService=&lt;ServiceName&gt;,&lt;Umdf\_Install&gt;<br />
UmdfServiceOrder=<br />
UmdfDispatcher [Only for USB Drivers and Drivers with file handle I/O targets]=<br />
UmdfImpersonationLevel[optional]=<br /><br />
[Umdf\_Install]<br />
UmdfLibraryVersion=<br />
DriverCLSID=<br />
ServiceBinary=<br />
 </code>
</li>

<li><p>All UMDF driver INF files must have a WUDFRD service installation section, as follows:</p></li>
<li><code>[WUDFRD\_ServiceInstall]<br />
DisplayName = &quot;Windows Driver Foundation - User-mode Driver Framework<br />
Reflector&quot;<br />
ServiceType = 1<br />
StartType = 3<br />
ErrorControl = 1<br />
ServiceBinary = %12%\WUDFRd.sys<br />
LoadOrderGroup = Base<br />
<br />
 </code></li>

<li><p>All WDF drivers that use a WinUSB driver must have the following service installation settings:</p>

<code>[WinUsb\_ServiceInstall]<br />
DisplayName = &quot;WinUSB Driver&quot;<br />
ServiceType = 1<br />
StartType = 3<br />
ErrorControl = 1<br />
ServiceBinary = %12%\WinUSB.sys<br />
<br />
 </code>
</li>

<li><p>Service names, hardware IDs (HWIDs), display names, and UMDF class identifiers (CLSIDs) cannot be pasted from WDF samples.</p></li>
</ul>

<p><em>Design Notes</em><br />
For more information about WDF-specific INF settings, visit the following websites:<br />
<a href="http://www.microsoft.com/whdc/driver/wdf/wdfbook.mspx" class="uri">http://www.microsoft.com/whdc/driver/wdf/wdfbook.mspx</a><br />
http://msdn.microsoft.com/en-us/library/ff560526.aspx<br />
http://msdn.microsoft.com/en-us/library/ff560526.aspx</p>


<a name="device.devfund.firmware"></a>
## Device.DevFund.Firmware

*Driver package requirements for firmware update package*

### Device.DevFund.Firmware.UpdateDriverPackage

*These requirements apply to any firmware update driver package that is submitted to Microsoft for approval and signing.*

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

In addition to standard driver requirements, the following requirements apply to firmware update driver package:

-   A firmware package must payload the update for only one resource.

-   A firmware package must be configurable (see Device.DevFund.INF.\* for more details).

-   After a successful firmware upgrade, the firmware version in the .INF file of the driver package, the resource version (in ESRT), and the last attempted version (in ESRT) for that resource must match.

-   The name of the binary file in the firmware package must not conflict with any of the previous firmware versions.

-   A successful firmware upgrade must not reduce or eliminate the functionality of any devices in the system.

<a name="device.devfund.halextension"></a>
## Device.DevFund.HALExtension

### Device.DevFund.HALExtension.HAL

*These requirements apply to HAL Extensions that is submitted to MS for approval and signing.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 Mobile ARM</p>
</td></tr></table>

**Description**

In addition to standard driver requirements, the following requirements apply to HAL

-   HAL Extension should work with system HAL seamlessly.

-   HAL Extension should be signed correctly.

<a name="device.devfund.inf"></a>
## Device.DevFund.INF

*INF restictions*

### Device.DevFund.INF.AddReg

*When using an AddReg directive, each AddReg entry must specify HKR as the registry root.*

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

HKR (meaning "relative root") is the only registry root identifier that can be referenced in an AddReg section in an INF file. Other root identifiers, including HKCR, HKCU, HKLM, and HKU, are restricted from use in an AddReg section. The AddReg directive is intended to be used for device installation and configuration purposes only.

*Design Notes*

All registry keys declared in an AddReg section of an INF file must use the relative root identifier (HKR) as the registry root value, unless an explicit exception exists as outlined in this requirement.

The following example shows the registration of a COM object using AddReg directives. Building on this example, it is possible to customize all of the object's parameters:
```
\[COMobj.AddReg\]
HKCR,CLSID\\{&lt;CLSID&gt;},,,"&lt;MFT DLL description&gt;"
HKCR,CLSID\\{&lt;CLSID&gt;}\\InprocServer32,,%REG\_EXPAND\_SZ%,"%%SystemRoot%%\\System32\\mftxyz.dll"
HKCR,CLSID\\{&lt;CLSID&gt;}\\InprocServer32,ThreadingModel,,"Both"
```

A complete list of COM registry entries with details on their use can be found in the MSDN at: http://msdn.microsoft.com/en-us/library/ms694355.aspx.

The following example shows the registration of an MFT filter using AddReg directives:
```
\[MFT.AddReg\]
HKCR,CLSID\\{&lt;CLSID&gt;},,,"&lt;MFT DLL description&gt;"
HKCR,CLSID\\{&lt;CLSID&gt;}\\InprocServer32,,%REG\_EXPAND\_SZ%,"%%SystemRoot%%\\System32\\mftxyz.dll"
HKCR,CLSID\\{&lt;CLSID&gt;}\\InprocServer32,ThreadingModel,,"Both"
HKCR,MediaFoundation\\Transforms\\&lt;CLSID&gt;,InputTypes,%REG\_BINARY%,76,45,87,2d,5e,23,...
HKCR,MediaFoundation\\Transforms\\&lt;CLSID&gt;,OutputTypes,%REG\_BINARY%,22,5e,23,46,43,10,...
HKCR,MediaFoundation\\Transforms\\&lt;CLSID&gt;,,%REG\_SZ%,"MFT Friendly Name"
HKCR,MediaFoundation\\Transforms\\&lt;CLSID&gt;,MFTFlags,%REG\_DWORD%, 0x00000004
HKCR,MediaFoundation\\Transforms\\&lt;CLSID&gt;,Attributes,REG\_BINARY%, 41,46,4d,
HKCR,MediaFoundation\\Transforms\\Categories\\&lt;MFTCategoryGUID&gt;\\&lt;CLSID&gt;
HKLM,SOFTWARE\\Microsoft\\Windows Media Foundation\\ByteStreamHandlers\\audio/xyz,&lt;CLSID&gt;,,"XYZ Stream Handler"
```

Additionally, when registering a DECODE or ENCODE HMFT, one of the following registry keys must also be set:

```
DECODE HMFT
HKLM,SOFTWARE\\Microsoft\\Windows Media Foundation\\HardwareMFT,EnableDecoders, %REG\_DWORD%, 1
```

```
ENCODE HMFT
HKLM,SOFTWARE\\Microsoft\\Windows Media Foundation\\HardwareMFT,EnableEncoders, %REG\_DWORD%, 1
```

More details on MFTs can be found in the MSDN at: <http://msdn.microsoft.com/en-us/library/windows/desktop/ms703138.aspx>.

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures. Note that there are some exceptions to this requirement to accommodate the registration of Component Object Model (COM) objects and Media Foundation Transforms (MFT) using the AddReg directive. Refer to the Design Notes section of this requirement for additional details.</p>
</tr>
</table>


### Device.DevFund.INF.AddService

*INF files can only install driver-related services.*

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

An INF AddService directive can only reference services that are driver related. Services that are not driver related, such as a Microsoft Win32 service, cannot be referenced or installed using an INF file.

*Design Notes*

An INF AddService directive service-install-section may only specify a ServiceType type-code of the following:

-   SERVICE\_DRIVER

-   SERVICE\_KERNEL\_DRIVER

-   SERVICE\_FILE\_SYSTEM\_DRIVER

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</tr>
</table>


### Device.DevFund.INF.ClassInstall32

*INF files must not define a custom class installer within a ClassInstall32 section.*

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

An INF file may not specify a custom class installer within a ClassInstall32 section. Therefore, a driver package cannot execute a custom class installer during device installation.

*Design Notes*

Developers should use one of the existing inbox device setup classes for their device. If it is necessary to define a new device setup class, the new setup class cannot employ a class installer as part of the device installation process. The following example shows an INF ClassInstall32 section, which defines a custom class installer and therefore fails this requirement.

```
\[ClassInstall32.ntx86\]            ; Declare a ClassInstall32 section for the x86
                                                ; architecture.
AddReg=SetupClassAddReg    ; Reference to the ClassInstall32 AddReg section.

; Place additional class specific directives here

\[SetupClassAddReg\]                ; Declare a class specific AddReg section.

; Device class specific AddReg entries appear here.

; The next line defines the class installer that will be executed when
; installing devices of this device-class type. Defining a registry entry
; of this type is no longer supported and the driver package fails to meet
; this device fundamental requirement.
**\[HKR,,Installer32,,"class-installer.dll,class-entry-point"\] **
```

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</tr>
</table>



### Device.DevFund.INF.ComplexDeviceMatching

*INF directives related to complex device matching logic are not supported.*

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

INF files will not support complex device matching logic. Specifically, the capability to specify a DeviceID for a device that should not be installed, when a matching HardwareID or CompatibleID exists in the DDInstall section, will not be supported.

*Design Notes*

The following INF directive may not be referenced in an INF file:

-   ExcludeID

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</tr>
</table>


### Device.DevFund.INF.DDInstall.CoInstallers

*INF files must not reference any co-installers within a DDInstall.CoInstallers section.*

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

An INF file may not reference any co-installers within a DDInstall.CoInstallers section. Therefore, a driver package cannot execute any co-installers during device installation.

*Design Notes*

Execution of co-installers is prohibited during device installation. The following examples show the registration of a device-specific co-installer and a device-class co-installer. Both types of co-installers are not permitted in an INF file and inclusion will result in failure to meet the requirement.
Device-specific co-installer example:

```
; Registering one or more device-specific co-installers requires adding
; adding a REG\_MULTI\_SZ value using an AddReg directive. The following
; shows the general form for registering a device-specific co-installer.
;  :
;  :
\[DestinationDirs\]         ; Destination dir for the co-installer dll
XxxCopyFilesSection = 11           ; DIRID\_for %WINDIR%\\System32 dir
                                   ; Xxx = driver or device prefix
;  :
;  :
\[XxxInstall.OS-platform.CoInstallers\]       ; Define co-installers section
CopyFiles = XxxCopyFilesSection             ; Copy files directive
AddReg = Xxx.OS-platform.CoInstallers\_AddReg        ; Add registry directive

\[XxxCopyFilesSection\]              ; Define the co-installer copy files
XxxCoInstall.dll                   ; section

\[Xxx.OS-platform.CoInstallers\_AddReg\]       ; Define the co-installer AddReg
                                            ; section

; The next line defines the co-installer that will be executed when
; installing this device. Defining a registry entry of this type is no
; longer supported and the driver package fails to meet this device
; fundamental requirement.
**HKR,,CoInstallers32,0x00010000,"XxxCoInstall.dll, \\**
**  XxxCoInstallEntryPoint"**
Device-class co-installer example:
\[Xxx.OS-platform.CoInstallers\_AddReg\]       ; Define the co-installer AddReg
                                            ; section

; Similar format to the device-specific co-installer example, except the
; registry location is under HKLM. The next line defines the co-installer
; executed after any installation operations complete for the given device
; setup class GUID. Defining a registry entry of this type is no
; longer supported and the driver package fails to meet this device
; fundamental requirement.
**HKLM,System\\CurrentControlSet\\Control\\CoDeviceInstallers, \\**
**{SetupClassGUID}, 0x00010008,"DevClssCoInst.dll\[,DevClssEntryPoint\]"**
```

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</tr>
</table>



### Device.DevFund.INF.DeviceConfigOnly

*INF files cannot reference INF directives that are not directly related to the configuration of a device.*

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

INF directives that provide configuration functionality beyond what is necessary to configure device hardware are no longer supported. The INF file and all supporting files in the driver package must be used only for device installation and configuration.

*Design Notes*

The following INF directives may not be referenced in an INF file:

1.  RegisterDlls
2.  UnregisterDlls
3.  ProfileItems
4.  UpdateInis
5.  UpdateIniFields
6.  Ini2Reg

Note that while the RegisterDlls directive can no longer be declared in an INF file, it is still possible to register Component Object Model (COM) and Media Foundation Transform (MFT) objects from an INF file using the AddReg directive. The AddReg directive allows the declaration of COM/MFT registration keys under the HKLM registry hive. For information on the use of the AddReg directive for this purpose, refer to the Device.DevFund.INF.AddReg Windows Hardware Certification requirement.

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
<td>
</tr>
</table>


 

### Device.DevFund.INF.DeviceResourceConfig

*INF based device resource configuration and non-PnP related configuration cannot be performed within an INF file.*

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

INF files cannot be used to perform device resource configuration or non-PnP related configuration tasks. Serveral INF directives and sections are no longer supported.

*Design Notes*

The following INF sections and directives cannot be referenced in an INF file:

-   \[DDInstall.LogConfigOverride\] section

-   LogConfig

-   \[DDInstall.FactDef\] section

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</td>
</tr>
</table>



### Device.DevFund.INF.FileCopyRestriction

*INF based file copy restrictions*

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

File copy destination locations are limited to prevent driver packages from installing drivers in inappropriate locations on the system.

*Design Notes*

When using the CopyFiles directive, the destination directory specified for a file must be one of the following DIRID values:

-   11 (corresponds to the %WINDIR%\\System32 directory) 

-   12 (corresponds to the %WINDIR%\\System32\\Drivers directory)

Only these destination directories expressed as the appropriate DIRID will be a valid copy file location.

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p>
</td>
</tr>
</table>



### Device.DevFund.INF.FileOrRegistryModification

*Deleting or modifying existing files, registry entries, and/or services is not allowed from within an INF file.*

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

INF file directives that delete or modify registry entries, services, and files are no longer supported.

*Design Notes*

The following INF directives may not be referenced in an INF file:

-   DelReg
-   DelService
-   DelPropertry
-   BitReg
-   DelFiles
-   RenFiles

<table>
<tr>
<th>Exceptions</th>
<td><p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p></td>
</tr></table>

### Device.DevFund.INF.InstallManagement

*Management of files installed using an INF file is restricted to the system.*

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

Any files that are installed onto the system using an INF file are managed exclusively by Windows. Plug and Play (PnP) prevents applications from directly modifying the files that are referenced in the INF.

*Design Notes*

An INF file must include the PnpLockDown directive set to value 1 in the \[Version\] section. This would appear as follows in the INF file:

```
\[Version\]
; Other Version section directives here.
PnpLockDown=1
```

<table>
<tr>
<th>Exceptions</th>
<td><p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p></td>
</tr></table>

### Device.DevFund.INF.LegacySyntax

*Legacy service configuration cannot be performed within an INF file.*

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

Service configuration using legacy INF syntax is no longer supported.

*Design Notes*

The following INF service install section directive may not be referenced in an INF file:

-   LoadOrderGroup

<table>
<tr>
<th>Exceptions</th>
<td><p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p></td>
</tr></table>

### Device.DevFund.INF.TargetOSVersion

*The TargetOSVersion decoration in an INF file cannot contain a ProductType flag or SuiteMask flag.*

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

Within the \[Manufacturer\] section of an INF file, a TargetOSVersion decoration is used to identify the target OS of the driver package. The TargetOSVersion decoration cannot contain a ProductType flag or SuiteMask flag.

*Design Notes*

In Windows 7 and earlier OS versions, the TargetOSVersion decoration is formatted as follows:

```
nt[Architecture].[OSMajorVersion][.[OSMinorVersion][.[ProductType][ \
  .[SuiteMask]]]]
```

Beginning in Windows 8, the ProductType field and SuiteMask field are no longer valid fields in the TargetOSVersion decoration.

<table>
<tr>
<th>Exceptions</th>
<td><p>This is a requirement for Windows 10 Mobile (ARM, ARM64, x86), but recommended for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) (x64, x86) and Windows Server 2016 Technical Preview x64. It will be required in the future for those architectures.</p></td>
</tr></table>

<a name="device.devfund.memory"></a>
## Device.DevFund.Memory

*Requirements related to memory profile*

### Device.DevFund.Memory.DriverFootprint

*Drivers must occupy a limited memory footprint.*

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

Drivers must occupy less than or equal to the following size of non-paged code pages in memory:

-   Non-paged code pages

| Driver Type | Graphics Drivers | All other driver types |
|-------------|------------------|------------------------|
| x86/ARM     | &lt;= 10 MB      | &lt;= 1.66 MB          |
| x64         | &lt;= 10 MB      | &lt;= 5.45 MB          |

-   **Driver locked allocations** (including MDL allocations and contiguous memory allocations)

    -   12 MB for all driver types for both architectures

-   **Non Paged Pool** - For Windows 10, drivers must occupy less than or equal to the following size of non-paged pool in memory:

| Driver type | Graphics Drivers | All other driver types |
|-------------|------------------|------------------------|
| x86/ARM     | 6 MB             | 4 MB                   |
| x64         | 10 MB            | 7 MB                   |

-   Thresholds are based in telemetry: X86/ARM – 4MB covers 80th percentile, X64 – 7MB covers 76th percentile from pool allocation samples

*Design Notes*

The corresponding test will check the size of the drivers non-paged code pages in MB.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td><p>Driver non-paged memory usage constitutes a fixed cost in terms of memory utilization for the overall lifetime of a system. These contribute substantially toward the total OS memory footprint, and most drivers are present in memory at all times. Optimizing driver memory will provide an improved user experience and better overall system responsiveness due to greater availability of memory for user applications.</p>
<p>Any reduction in non-pageable driver footprint directly improves the baseline memory consumption of the OS which increases scalability. Current WHCK tests for Windows 8 cover driver Locked allocations (MDL/Contiguous memory allocations) and non-paged driver code. Non Paged pool usage is the only non-pageable driver footprint aspect that is not covered by existing tests.</p></td>
</tr>
</table>

### Device.DevFund.Memory.NXPool

*All driver pool allocations must be in NX pool.*

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

Driver pool allocations must be made in the non-executable (NX) pool.

*Design Notes*

A new type of non-paged pool that is a non-executable (NX) pool has been introduced. Since it is non-executable, it is inherently more secure as compared to executable non-paged (NP) pool, and provides better protection against overflow attacks.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td><p>Moving allocations to the non-executable pool, the surface area of attack for a rogue binary's executable code is minimized.</p></td>
</tr>
</table>


<a name="device.devfund.reliability"></a>
## Device.DevFund.Reliability

*Reliability tests containing the content of the former DEVFUND tests.*

### Device.DevFund.Reliability.BasicReliabilityAndPerformance

*Drivers are architected to maximize reliability and stability and do not "leak" resources such as memory.*

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

Driver components must not cause the system to crash or leak resources. These resources include but are not limited to the following:

-   Memory
-   Graphics Device Interface (GDI) or user objects
-   Kernel objects such as files, mutex, semaphore, and device handles
-   Critical sections
-   Disk space
-   Printer handles

*Design Notes*

To improve the reliability and stability of Windows drivers, all drivers will be subjected to a series of generic driver quality tests. These tests include:

<dl>
<dt>Embedded Signature Verification Test</dt>
<dd><p>This test verifies that boot start drivers are embedded signed.</p></dd>

<dt>Device Install Check for File System Consistency</dt>
<dd><p>This test verifies that no system resources have been overwritten during the process of a device/driver install.</p></dd>

<dt>Device Install Check for Other Device Stability</dt>
<dd><p>This test verifies that no device or driver, except the device under test, has been affected by the device(s)/driver(s) install or co-install process.</p></dd>

<dt>PCI Root Port Surprise Remove Test</dt>
<dd><p>This test removes the PCI root port for the device (if applicable).</p></dd>

<dt>PNP (disable and enable) with IO Before and After</dt>
<dd><p>This test performs basic I/O and basic PNP disable/enable on the test device(s).</p></dd>

<dt>Reinstall with IO Before and After</dt>
<dd><p>This test uninstalls and reinstalls the drivers for test device(s) and runs I/O on these device(s).</p></dd>

<dt>Sleep with PNP (disable and enable) with IO Before and After</dt>
<dd><p>This test cycles the system through various sleep states and performs I/O and basic PNP (disable/enable) on test device(s) before and after each sleep state cycle.</p></dd>

<dt>Sleep with IO Before and After</dt>
<dd><p>This test cycles the system through various sleep states and performs I/O on device(s) before and after each sleep state cycle.</p></dd>

<dt>Sleep with IO During</dt>
<dd><p>This test cycles the system through various sleep states and performs I/O on device(s) during each sleep state cycle.</p></dd>

<dt>Plug and Play Driver Test</dt>
<dd><p>This test exercises PnP-related code paths in the driver under test.</p></dd>

<dt>Device Path Exerciser Test</dt>
<dd><p>This consists of a set of tests, each of which concentrates on a different entry point or I/O interface. These tests are designed to assess the robustness of a driver, not its functionality.</p></dd>

<dt>CHAOS Test</dt>
<dd><p>This test the runs PnP tests (disable/enable, rebalance, remove/restart, surprise remove, and DIF remove) and Driver Fuzz tests on the test device in parallel, while cycling the test system in and out of all of its supported sleep states (S1, S2, S3, S4 and Connected Standby) at the same time.</p></dd>
</dl>

All of these tests will be run with Driver Verifier enabled with standard settings.

In addition, Driver Verifier will be enabled on all applicable kit tests.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td><p>Power management/usage, PNP errors as well as IO related errors contribute to a poor end user experience and may often cause system hangs, crashes, and failures. These tests help to identify some common driver problems.</p></td>
</tr>
</table>


### Device.DevFund.Reliability.BasicSecurity

*Device driver must properly handle various user-mode as well as kernel to kernel I/O requests (DEVFUND-0004).*

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

Driver reliability and security are connected. Reliable drivers help protect the system from malicious attacks.
Compliance will be validated by running the Device Path Exerciser test against the device driver. Device Path Exerciser consists of a set of tests, each of which concentrates on a different entry point or I/O interface. These tests are designed to assess the robustness of a driver, not its functionality.

During a test, Device Path Exerciser typically sends hundreds of thousands of similar calls to the driver in rapid succession. The calls include varying data access methods, valid and invalid buffer lengths and addresses and permutation of the function parameters, including spaces, strings, and characters that might be misinterpreted by a flawed parsing or error-handling routine.

The device driver must comply with the reliability guidelines that are defined in the Windows Driver Kit. All user mode I/O requests and kernel-to-kernel I/O requests must be handled properly to help ensure secure devices and drivers.

Design Notes:

Potential security vulnerabilities include the failure to check for a buffer overflow, the inability to handle bad data from user mode, and the mishandling of unexpected entry points into the driver. If such vulnerabilities are left unidentified and uncorrected, malicious programs could potentially issue denial-of-service attacks or otherwise bypass system security.

For additional information, see the "Creating Reliable and Secure Drivers" and "Creating Reliable Kernel-Mode Drivers" topics in the Windows Driver Kit.

### Device.DevFund.Reliability.BootDriverEmbeddedSignature

*Boot drivers must be self-signed with an embedded signature.*

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

All boot start drivers must be embedded-signed using a Software Publisher Certificate (SPC) from a commercial certificate authority. The SPC must be valid for kernel modules. Drivers must be embedded-signed through self-signing before the driver submission.

*Design Notes*

For more information about how to embedded-sign a boot start driver, see Step 6: Release-Sign a Driver Image File by Using an Embedded Signature" at the following website: <http://go.microsoft.com/fwlink/?LinkId=237093>

After the file is embedded-signed, use SignTool to verify the signature. Check the results to verify that the root of the SPC's certificate chain for kernel policy is "Microsoft Code Verification Root." The following command line verifies the signature on the toaster.sys file:

<blockquote>
<b>signtool verify /kp /v amd64\\toaster.sys</b>
</blockquote>

```
Verifying: toaster.sys

SHA1 hash of file: 2C830C20CF15FCF0AC0A4A04337736987C8ACBE3

Signing Certificate Chain:

Issued to: Microsoft Code Verification Root

Issued by: Microsoft Code Verification Root

Expires: 11/1/2025 5:54:03 AM

SHA1 hash: 8FBE4D070EF8AB1BCCAF2A9D5CCAE7282A2C66B3

Successfully verified: toaster.sys

Number of files successfully Verified: 1

Number of warnings: 0

Number of errors: 0
```

In the Windows Logo Kit, this requirement will be tested by using the Embedded Signature Verification test.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>Boot drivers must be embedded-signed in order to work properly with the boot process.</p>
</tr>
</table>


### Device.DevFund.Reliability.DriverInstallUninstallReinstall

*Device and driver installation/un-installation/re-installation must be completed without any error. This includes function drivers for a multi-function device.*

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

Device and driver installation, uninstallation, or reinstallation must not fail in any case.

Driver installation must not cause the system to stop running or to restart without user interaction, unless the operating system requires a restart.

For multi-function devices that have separate drivers that enable separate functions, each driver must be capable of installing and uninstalling independently with no start order or hidden dependencies. A multi-function device is a single device that supports multiple functionalities.

Devices that use inbox drivers for operation must also meet this requirement. This requirement does not apply to Internet Small Computer System Interface (iSCSI) devices.

*Design Notes*

In the case of multi-function devices, a supervisory driver that loads different drivers for individual functions does not work well with Windows®. In particular, driver support is likely to be lost after an operating system reinstallation or upgrade, or when new drivers are distributed through Windows Update. Therefore, such supervisory drivers should be avoided.

This requirement will be tested by using the "Reinstall with IO" test.

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This requirement does not apply to Internet Small Computer System Interface (iSCSI) devices. PEP and HAL extensions will be considered for exemption from this requirement.</p>
</tr>
</table>


### Device.DevFund.Reliability.DriverUninstallInstallOtherDeviceStability

*Installing or uninstalling the driver must not reduce or eliminate functionality of other devices or other functional parts of the same device installed on the system.*

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

Installing or uninstalling a device driver must not reduce or eliminate functionality of other devices that are installed on the system.

This requirement also applies to functional units of a multi-function device, whether that functional unit is on the multi-function device or on the system as a whole.

*Design Notes*

The steps for testing this requirement are outlined in the Device install check for other device stability test: <http://msdn.microsoft.com/en-us/library/ff561407.aspx>.
 

### Device.DevFund.Reliability.NoReplacingSysComponents

*Vendor-supplied drivers or software must not replace system components.*

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

Driver or software installation must not overwrite any protected operating system files. This includes files that are not authored by Microsoft, but that are included as part of the operating system.

If a manufacturer’s information file (INF) copies any files that the operating system supplies, the INF must copy those files from the Windows® product disk or preinstalled source files, unless the component is a licensed, redistributable component.

Drivers that are not provided by the operating system are not allowed to be named after an operating system supplied driver.

### Device.DevFund.Reliability.NormalOpWithDEP

*All drivers must operate normally and execute without errors with Data Execution Prevention (DEP) enabled.*

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

To help ensure proper device and driver behavior and to enhance the security of Windows® systems against viruses and other security threats, all drivers must operate normally when Data Execution Prevention (DEP) is enabled. DEP monitors programs to help make sure that the programs use system memory safely. DEP also protects the system by closing any program that is trying to execute code from memory in an incorrect way.

To meet this requirement, drivers must not execute code from data pages such as default heap pages, various stack pages, and memory pool pages.

DEP is a set of hardware and software technologies that perform additional checks on memory to help prevent malicious code from running on a system. The primary benefit of DEP is to help prevent code execution from data pages. Typically, code is not executed from the default heap and the stack. Hardware-enforced DEP detects code that is running from these locations and raises an exception when execution occurs. Software-enforced DEP can help prevent malicious code from taking advantage of exception handling mechanisms in Windows.

*Design Notes*

For more information about DEP, including how to enable DEP, visit the following website: <http://support.microsoft.com/kb/875352>.

The test for DEP is currently part of the systems test category in the Windows Hardware Certification Kit (WHCK). A device version of this test will be introduced before this requirement is enforced for logos.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>DEP can help enhance the security of systems that are running Windows operating systems. DEP also helps protect against malicious code, viruses, and other security threats. Making this requirement fundamental for devices will help ensure that all drivers that are signed through the Hardware Logo Program are protected, and that the drivers prevent malware from being signed.</p>
</tr>
</table>


### Device.DevFund.Reliability.PnPIDs

*Plug and Play IDs embedded in hardware devices, including each functional unit of a multi-function device, must have device IDs to support Plug and Play.*

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

Each device that is connected to an expansion bus must be able to supply its own device ID. Each function or device on a multi-function add-on device that is individually enumerated must also provide a device ID for the bus that the function or device uses.

The following are the specific requirements for Plug and Play device IDs:

-   Each separate function or device on the system board must be separately enumerated. Therefore, each function or device must provide a device ID for the bus that it uses, as required in the current Plug and Play specification.

-   If a device on an expansion card is enumerated, the device must have a unique ID and its own resources according to the current device ID requirements for the bus to which the card is connected. This requirement includes devices that are separately enumerated on multi-function cards or multi-function chips.

-   A Plug and Play ID can be shared with other devices that have the same model name, as defined in the device-specific Plug and Play specification.

-   Each logical function of the device must have a distinct Plug and Play ID.

-   The install (INF) section must key off only the most specific ID according to the Plug and Play guidelines in the Windows® Driver Kit.

-   For legacy devices such as serial, parallel, and infrared ports, the legacy Plug and Play guidelines define requirements and clarifications for automatic device configuration, resource allocation, and dynamic disable capabilities.

Note: Devices that are completely invisible to the operating system, such as out-of-band systems management devices or Intelligent Input/Output (I2O) hidden devices, still must use Advanced Configuration and Power Interface (ACPI) methods to properly reserve resources and avoid potential conflicts.

The following are the exceptions to the individual device ID requirement for multi-function devices:
 
-   Multiple devices of the same device class, such as multiline serial devices, do not need individual device IDs.

-   Devices that are generated by an accelerator or auxiliary processor and that do not have independent hardware I/O do not need individual device IDs. That processor must have an ID, and the MF.sys file must be used to enumerate the dependent devices.

If an OEM uses a proprietary mechanism to assign asset or serial numbers to hardware, this information must be available to the operating system through Windows hardware instrumentation technology.

*Design Notes*

See Windows Hardware Instrumentation Implementation Guidelines (WHIIG), Version1.0, at the following website:
<http://go.microsoft.com/fwlink/?LinkId=237095>*.*

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>A unique Plug and Play ID provides a good end user experience for devices.  Because a unique device installs each device driver, this requirement helps prevent the issues that occur in Windows Update. This requirement now also includes all aspects of Plug and Play that are relevant for multi-function devices to enable a good Plug and Play experience when the device is used with Windows. This requirement enhances compatibility and reliability when Windows is used with certified devices.</p>
</tr>
</table>


### Device.DevFund.Reliability.PnPIRPs

*Drivers must support all PnP IRPs*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Drivers must support all Plug and Play I/O request packets (IRPs) according to the requirements on the following website:

<http://msdn.microsoft.com/en-us/library/ff558807.aspx>
The following IRPs are often the cause of driver issues. Special attention should be given to their implementation:

- Removal

  - IRP\_MN\_QUERY\_REMOVE\_DEVICE

  - IRP\_MN\_CANCEL\_REMOVE\_DEVICE

  - IRP\_MN\_REMOVE\_DEVICE

- Rebalancing

  - IRP\_MN\_QUERY\_STOP\_DEVICE

  - IRP\_MN\_QUERY\_RESOURCE\_REQUIREMENTS

  - IRP\_MN\_FILTER\_RESOURCE\_REQUIREMENTS

  - IRP\_MN\_CANCEL\_STOP\_DEVICE

  - IRP\_MN\_STOP\_DEVICE

  - IRP\_MN\_START\_DEVICE

  - IRP\_MN\_REMOVE

- Surprise Removal

  - IRP\_MN\_SURPRISE\_REMOVAL

 

### Device.DevFund.Reliability.ProperINF

*Device driver must have a properly formatted INF for its device class (DEVFUND-0001).*

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

Driver installation and removal must use Windows®-based methods. Therefore, only information file (INF)-based installation routines are allowed. A device driver must have a properly formatted INF for its device as described in the Windows Driver Kit (WDK) "Creating an INF File" topic.

*Design Notes*

The "INFTest against a single INF" test in the Windows Hardware Certification Kit (WHCK) validates this requirement. For more information about this test, see the Help documentation of the test kit.

Note: If the device does not provide an INF file (that is, the device uses the inbox driver and the INF file only), this requirement does not apply.

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>If the device does not provide an INF file (that is, the device uses the inbox driver and the INF file only), this requirement does not apply.</p>
</tr>
</table>



### Device.DevFund.Reliability.RemoteDesktopServices

*Client and server devices must function properly before, during, and after fast user switching or a Microsoft Remote Desktop Services session (DEVFUND-0009).*

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

Devices must support Fast User Switching (FUS) and Remote Desktop Services without losing data before, during, or after sessions. Any user interface (UI) for the device must be shown in the session to which the UI applies. Device usage must not be indefinitely blocked in alternate user sessions.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>FUS and Remote Desktop Services are Windows® features. To provide a good and consistent user experience, each device needs to work properly with these services.</p>
</tr>
</table>


### Device.DevFund.Reliability.PCSupportsLowPowerStates

*All devices and drivers must support S4 and S5* *and either S0 low power idle or S3 sleep states of the system they are integrated on or connected to.*

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

All devices and drivers must meet the following requirements for systems that are entering S4 (Hibernate) and S5 (Soft-off) and either S0 low power idle, or S3 (Sleep):
 

-   All devices and drivers must correctly support the request of a system that is going into S0, S3, S4, or S5 states.

-   Devices and drivers must not veto the request from the system.

-   The devices must support both the S0, S3, S4, and S5 states.

-   All devices must be capable of resuming from S0, S3, S4, and S5 sleep states and be fully functional after waking up.

-   The device and all its functional units (in the case of multi-function devices) must be enumerated appropriately after the device resumes.

-   All devices and drivers must respond properly to Plug and Play events, IOCtl calls, and I/O requests that are issued concurrently with sleep state transitions.

This requirement helps to ensure that all certified and signed devices will support the S0, S3, S4, and S5 sleep states when the devices are used as part of a system or are connected externally to a system. This requirement will help the systems to conserve power when the system is not being used. Power management is an important aspect of a good user experience. The system should be able to control which devices are put into a sleep state when the devices are not being used. All devices must comply with the request from the system to go into a sleep state and not veto the request, thereby putting an additional drain on the power source.

*Design Notes*

This requirement will be tested by using the "Sleep Stress with IO" test and the "PnPDTest with Concurrent IO in parallel with DevPathExer" test in the Windows Hardware Lab Kit (HLK).

The system that is used for testing must support S0, S3, S4, and S5.

Note that systems that support Connected Standby will not support S3, and may or may not support S4. Devices in such systems must support Connected Standby, and S4 requests of that system (if applicable).

### Device.DevFund.Reliability.Signable

*Device drivers must be able to be signed by Microsoft.*

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

All devices must have code signed drivers. Drivers that are submitted for the Windows® certification must be able to be code signed and must meet the Microsoft® guidelines that are defined in the Windows Driver Kit "WHQL Digital Signatures" topic. All boot start drivers must be embedded-signed by using a certificate that is valid for kernel modules. Devices must be embedded-signed via self-signing before the devices are submitted to Microsoft for certification. It is recommend that all drivers are embedded-signed via self-signing before the drivers are submitted to Microsoft, although this is only required for boot start drivers.

*Design Notes*

For requirements for digital signatures, see the "Driver Signing/File Protection" topic at the following website:
<http://go.microsoft.com/fwlink/?LinkId=36678>.

The INF2CAT signability verification tool installs automatically the first time that you create a submission on Microsoft's website. For more information about the INF2CAT tool, visit the following website:
<http://go.microsoft.com/fwlink/?LinkId=109929>.

**Additional Information**

<table>
<tr>
<th>Exceptions</th>
<td>
<p>This requirement does not apply to devices that use the inbox drivers of the operating system.</p>
</td>
</tr>
</table>


### Device.DevFund.Reliability.SWDeviceInstallsUsePnPAPIs

*Software-initiated device-installs must use Plug and Play APIs to install device drivers.*

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

Device installers that directly manipulate Plug and Play resources contribute to system instability. Therefore, direct manipulation of Plug and Play resources will be blocked on later releases of Windows®. To help to ensure compatibility with Windows releases, standard Plug and Play application programming interfaces (APIs) must be used to install device drivers.

*Design Notes*

In Windows Vista® and later operating systems, standard Plug and Play calls such as the **SetupCopyOEMInf** call pre-stage all required files for device installation on the system automatically. Pre-staging of driver packages will facilitate driver package migration during a system upgrade to Windows Vista or later Windows operating systems. We strongly encourage the use of the Driver Install Framework tools to meet this logo requirement. The use of DIFxAPI, DIFxAPP, or DPInst DIFx tools fulfills this requirement.

<a name="device.devfund.reliability.3rdparty"></a>
## Device.DevFund.Reliability.3rdParty

*Reliability tests containing content of the former DEVFUND tests.*

### Device.DevFund.Reliability.3rdParty.FormerTests

*Former Tests Mapping Requirement*

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

The feature Device.DevFund.Reliability.3rdParty and this requirement are a placeholder for mapping of former DevFund tests that are not found in the other requirements.

**Additional Information**

| Exceptions | This requirement does not apply to devices that use the inbox drivers of the operating system. |
|------------|------------------------------------------------------------------------------------------------|

<a name="device.devfund.reliability.interrupts"></a>
## Device.DevFund.Reliability.Interrupts

*Reliability with respect to device interrupts*

### Device.DevFund.Reliability.Interrupts.BasicReliabilityAndPerformance

*Drivers must not exceed the maximum number of interrupts, and must support resource arbitration down to a minimum level as defined by the operating system*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The driver must be able to tolerate system re-balancing of interrupt resources with any alternative chosen by the OS without failures, including the theoretical minimum of one line based interrupt.

Interrupt arbitration may require multiple iterations. Drivers must be prepared to tolerate cases where their initial interrupt request is rejected. In order to support optimal and timely interrupt arbitration, drivers should provide multiple alternatives at successively reduced interrupt count. Drivers should avoid requesting more than one interrupt per core when possible. Any request for greater than 2048 interrupts per device function will be rejected per the PCIe 3.0 defined MSI-X table entry limit of 2048 per device.

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>Requesting more than one interrupt per core can lead to IDT exhaustion in settings where many devices are present. Requesting a total number of interrupts based on the number of cores often leads to memory allocation issues.</p>
</tr>
</table>


<a name="device.devfund.reliabilitydisk"></a>
## Device.DevFund.ReliabilityDisk

*Reliability tests targeting disk devices*

### Device.DevFund.ReliabilityDisk.IOCompletionCancellation

*A device driver must follow the design details in the I/O Completion/Cancellation Guidelines (DEVFUND-0013).*

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

I/O completion and cancellation guidelines for drivers provide prescriptive requirements to help ensure that device drivers do not stop responding and can be fully cancelled. These requirements also suggest best practices that drivers can follow to improve performance.

Based on the guideline, all device drivers must meet the following requirements:

-   All I/O request packets (IRPs) that are cancelled must be completed within five seconds in an environment that is not resource constrained. No cancellation should be missed even though the cancellation requests may arrive at any instant, even before a driver's dispatch routine sees the IRP.

-   All resources that a cancelled IRP allocates must be released at IRP cancellation time to prevent hindering system performance under a high cancellation load. The cancellation of the IRP should shut down any I/O intensive process.

In addition, we strongly recommend that drivers do not depend on an additional allocation of resources during cancellation.

*Design Notes*

The Windows® I/O Manager includes enhancements to support cancellation of the MJ\_IRP\_CREATE process. The Win32 application programming interfaces (APIs) include enhancements to support the cancellation of synchronous operations, such as CreateFile. These enhancements allow I/O cancellation in more environments than in earlier operating systems. For more information, see the "I/O Completion/Cancellation Guidelines" whitepaper at the following website: <http://www.microsoft.com/whdc/driver/kernel/default.mspx>.

For more information about designing completion and cancellation logic for drivers, see the following topics in the Windows Development Kit (WDK):

Completing IRPs
Canceling IRPs
Cancel-Safe IRP Queues
Using the System's Cancel Spin Lock

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>The primary justification for this requirement is to prevent drivers from causing applications to stop responding. Additionally, users cannot terminate or restart the applications. Drivers that cause applications to stop responding are a significant cause of customer dissatisfaction.  A secondary justification for this requirement is to improve the customer experience by permitting I/O cancellation to occur on demand by a user, through the use of user interface (UI) elements such as a universal stop button or cancel buttons. This requirement was introduced in Windows Vista. The requirement adds demands to existing driver cancellation logic and adds the requirement that drivers support cancelling creation requests. Drivers that stop responding can lead to sometimes random application and operating system failures that result in lost customer productivity, lost customer data, and the need to reboot the computer. Beyond these very serious problems, nonexistent or poor I/O cancellation support prevents applications from successfully stopping operations without restarting the application.</p>
</tr>
</table>


<a name="device.devfund.rollback"></a>
## Device.DevFund.Rollback

*Driver Rollback*

### Device.DevFund.Rollback.Driver

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>


**Description**

In order for end users to be able to roll back a driver (i.e., reinstall the previously installed driver), device drivers must be able to be uninstalled and reinstalled with no failures.

<a name="device.devfund.security"></a>
## Device.DevFund.Security

*Additional TDI filter driver and LSP requirements related to security.*

### Device.DevFund.Security.NoTDIFilterAndLSP

*No TDI filters or LSPs are installed by the driver or associated software packages during installation or usage.*

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

**Additional Information**

<table>
<tr>
<th>Business Justification</th>
<td>
<p>Use of TDI filters and LSPs increase attack surface, and will therefore no longer be supported for future OS releases.</p>
</tr>
</table>


<a name="device.devfund.server"></a>
## Device.DevFund.Server

### Device.DevFund.Server.CommandLineConfigurable

*Windows Server device drivers which have configurable settings provide command line utility or function for device and driver management*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows® Server® device drivers that are configurable are required to supply a WMI or PowerShell-based, remoteable functionality for device and driver management. The following device categories are included:

 - Network, including teaming and Infiniband
 - Storage, including multipath I/O (MPIO)
 - Bus
 - Any other drivers that may have configurable settings

Note: Devices, such as printers, scanners, net switches, and storage arrays, that can be configured from ANY system (other servers, client systems, and so on) on the network don’t need to meet this requirement.

The specific requirements are the following:

 - The utility or tool functionality may use either PowerShell or Windows Management Instrumentation (WMI) functionality that the Windows Server Core installation option supports.

 - The utility or functionality must operate from the command line or be a WMI object and provider that is compatible with the Windows Management Instrumentation Command-line (WMIC) tool.

 - The utility must be provided as part of the driver package and be installed by default on the system with the driver.

 - The utility must be able to correctly query, display, and change any values that can be changed for the driver.

 - The utility must not incorrectly create or set options that do not exist for a specific device or driver. The utility must be capable of changing any setting if the operating system does not provide the ability to change that setting from the command line.

 - Changed values or ranges that the user inputs must be automatically checked to ensure that the user input is valid.

 - Changes that the utility makes must not require any network or storage stack restarts or system reboots, unless a boot, system, or paging behavior or location is modified.

 - Changes that the utility makes are persistent across reboots.

 - Help about the utility usage and options is available locally on the system. For example, the utility must provide a "/?" command-line option, or the WMI options for the product must be exposed through standard WMIC commands.

 - The utility should not be installed by the information file (INF).

 - The utility should be installed by default. This can be accomplished by using a co-installer.

This requirement does not apply to storage arrays, storage fabrics, switches, printers, or other devices that are external to the server system and that can be managed by any system that is attached to the Ethernet, Fibre Channel, or other network.

This requirement does not apply to any device that does not have configurable settings. For example, in a system that uses the graphical interface, there are no "Advanced", "Power Management", or other additional tabs in the Device Manager interface, nor are any utilities available from the vendor that achieve the same effect.

This requirement applies to any physical device, or device that has a PCI ID, that has a driver; to any driver that is in the network, storage, file system or other stacks; and to any device or driver that otherwise operates at kernel or user mode in the operating system instance on the server.

Design Notes:

Any device driver that does not meet this requirement will not be usable on Nano Server systems

Enforcement Date: Feb 2016

### Device.DevFund.Server.MultipleProcessorGroups

*Drivers must operate correctly on servers that have processors configured into multiple processor groups*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows® Server uses the concept of KGROUPs to extend the number of processors that a single instance of the operating system can support to more than 64. Both enlightened and unenlightened device drivers must operate correctly in multiple KGROUP configurations.

Design Notes:

For more information, see "Supporting Systems That Have More Than 64 Processors: Guidelines for
Developers," a white paper, at the following website:
http://www.microsoft.com/whdc/system/Sysinternals/MoreThan64proc.mspx

This requirement is tested for all server device categories. The test uses BCDEdit functionality to change the boot configuration database (BCD) of the operating system, thus changing the size of the processor groups (the
**groupsize** setting) so that multiple processor groups are created. The test also uses BCDEdit functionality to add the **groupaware** setting to the BCD. This changes the behavior of several now-legacy application programming interfaces (APIs) so that the test finds more code errors.

The operating system will not ship with any of these settings. These settings are for testing only and will not be supported in production. To reconfigure the system for normal operations, these settings must be removed from the BCD and the system must be rebooted. The system that is used for testing must include at least four processor cores.

Vendors may configure the system so that it is similar to the Windows Logo Kit (WLK) and Device Test Manager
(DTM) systems. Vendors can perform their own tests in a multiple processor group configuration, as follows.

The command lines to add the group settings and reboot the computer are the following:

> bcdedit.exe /set groupsize 2
>
> bcdedit.exe /set groupaware on
>
> shutdown.exe -r -t 0 -f

The command lines to remove the group settings and reboot the computer are the following:

> bcdedit.exe /deletevalue groupsize
>
> bcdedit.exe /deletevalue groupaware
>
> shutdown.exe -r -t 0 -f

### Device.DevFund.Server.OperateInServerCore

*Device drivers must install, configure, be serviced, and operate in Windows Server Core.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The hardware platforms on which Windows Server operating systems are deployed have evolved dramatically in the past decade. As these become graphic-less system designs for cost and deployment efficiencies, the customers expect to completely setup, deploy, configure and manage these hardware platforms using the minimal command line interface and automated scripting of Windows Server Core. Windows Server device drivers must evolve in a similar manner to allow the customers to pursue these operations unhindered.

A device driver must demonstrate its ability to install, configure, be serviced and operate without reliance on the presence of a GUI.

Design Notes:

Any device driver that does not meet this requirement will not be usable on Windows Server Core systems

Enforcement Date: Feb 2016

### Device.DevFund.Server.ServerPowerManagement

*Windows Server device drivers must support Query Power and Set Power Management requests*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

During transition into the hibernation (S4) system sleep state, device drivers receive power requests from the operating system. Device drivers must honor and must correctly handle the Query Power and Set Power power management requests. A device driver should never reject a Query Power request. When a device driver receives an S4 Set Power power management request, the driver must transition its devices into a D3 device power state and stop all I/O operations. This includes any direct memory access (DMA) transfers that are currently in progress. When the driver's devices are in a low power state, interrupts are disabled, and all in-progress I/O operations are halted.

The D3 state may be either D3 "Hot", to support devices that must respond to external stimuli, or D3 "Cold".

A device driver must not bind itself to a uniquely identifiable instance of system hardware, such as a specific processor.

*Design Notes*

For more information, see the "Driver Compatibility for Dynamic Hardware Partitioning" white paper at the following website: http://www.microsoft.com/whdc/system/platform/server/dhp.mspx

<a name="device.devfund.server.nano"></a>
## Device.DevFund.Server.Nano

*Basic requirements for Windows Server Nano*

### Device.DevFund.Server.Nano.Deployment

*All drivers intended for use with Windows Server Nano must meet these requirements*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

All drivers intended for use on Windows Server Nano must meet the following deployment requirements:

- Drivers must not be packaged as an MSI. All driver files (such as .inf and .sys files) must be available as a set of files that can be copied to a folder for use with Deployment Image Servicing and Management (DISM).
- Drivers must be installable offline using DISM.

All tools, utilities, or agents to be installed on Nano Server must be made available as a Windows Server Application (WSA) installer package.

### Device.DevFund.Server.Nano.Diagnostics

*All diagnostic utilities intended for use with Windows Server Nano must meet these requirements*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

All diagnostics tools and utilities intended for use in a Microsoft Azure Stack solution must support management by either of the following methods:

- Remotely, using Windows PowerShell or Windows Management Instrumentation (WMI).
- Using a command line tool that an admin can run on Nano Server by connecting to a Nano Server instance through a remote Windows PowerShell session or SSH.

If the tool or utility runs locally on Nano Server, it must be made available as a Windows Server Application (WSA) installer package.

In addition to the above, systems running Windows Server Nano must support Nano Server Recovery Console functionality by verifying that all of the appropriate features work properly on drivers used in Nano Server.

### Device.DevFund.Server.Nano.FirmwareUpdate

*Firmware Update requirements for Server Nano*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

All firmware update tools and utilities intended for use on Windows Server Nano must support installation by either of the following methods:

- Remote installation using Windows PowerShell or WMI
- Local installation using a command line tool that an admin can run on Nano Server by connecting to a Nano Server instance through a remote Windows PowerShell session or SSH

If the tool or utility runs locally on Nano Server, it must be made available as a Windows Server Application (WSA) installer package.

### Device.DevFund.Server.Nano.MonitoringAndTelemetry

*Monitoring requirements for Windows Server Nano.*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

All monitoring tools, utilities, and agents must support installation by either of the following methods:

- Remote installation using Windows PowerShell or WMI
- Local installation using a command line tool that an admin can run on Nano Server by connecting to a Nano Server instance through a remote Windows PowerShell session or SSH

If the tool, utility, or agent runs locally on Nano Server, it must be made available as a Windows Server Application (WSA) installer package.

For Microsoft Azure Stack, in particular, all monitoring has to be agentless, and agents will not be allowed on the hosts. Also see ‘if implemented’ Redfish requirement at System.Server.Manageability.Redfish

### Device.DevFund.Server.Nano.OperateInServerNano

*Device drivers must install, configure, be serviced, and operate in Windows Server Nano.*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

The hardware platforms on which Windows Server operating systems are deployed have evolved dramatically in the past decade. As these become graphic-less system designs for cost and deployment efficiencies, the customers expect to completely setup, deploy, configure and manage these hardware platforms using the minimal command line interface and automated scripting of Windows Server Nano. Windows Server device drivers must evolve in a similar manner to allow the customers to pursue these operations unhindered.

A device driver must demonstrate its ability to install, configure, be serviced and operate without reliance on the presence of a GUI.

Design Notes:

Any device driver that does not meet this requirement will not be usable on Windows Server Nano systems

### Device.DevFund.Server.Nano.PatchAndUpdate

*Patching requirements for Windows Server Nano.*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

All patches and updates must be able to install offline as part of image creation or online.


<a name="device.devfund.server.pci"></a>
## Device.DevFund.Server.PCI

*PCI*

### Device.DevFund.Server.PCI.PCIAER

*Windows Server PCI Express devices are required to support Advanced Error Reporting \[AER\] as defined in PCI
Express Base Specification version 2.1.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Tables 6-2, 6-3, 6-4 and 6-5 of the PCI Specification on how errors are detected in hardware, the default severity of the error, and the expected action taken by the agent which detects the error with regards to error reporting and logging.

All three methods of error reporting; completion status, error messages, error forwarding\\data poisoning.

Completion status enables the Requester to associate an error with a specific Request.

Error messages indicate if the problem is correctable or not, and fatal or not

Error forwarding\\data poisoning can help determine if a particular Switch along the path poisoned the TLP

The following table lists which errors in section 6.2 are required to be reported:

| Type of Errors                      | Required? | Action                                                         |
|-------------------------------------|-----------|----------------------------------------------------------------|
| ERR\_COR (correctable)              | No        | No action, not logged in Event Viewer, system takes no action. |
| ERR\_FATAL (fatal, non-correctable) | Yes       | WHEA handles, and logged in Event Viewer                       |
| ERR\_NONFATAL                       | Yes       | None                                                           |

<a name="device.devfund.statictools"></a>
## Device.DevFund.StaticTools

### Device.DevFund.StaticTools.CAandSDV

*Driver development includes static analysis to improve reliability using Code Analysis (CA) and Static Driver Verifier (SDV).*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Network and Storage driver submissions must include log files for Static Driver Verifier (SDV) and Code Analysis for Drivers (CA).

**Design Notes**

Microsoft's Static Analysis Tools, namely, Code Analysis for Drivers (CA) and Static Driver Verifier (SDV) have been found to be highly effective in improving driver reliability by identifying coding issues that would be otherwise difficult to find.

-   **Server only:** Issues discovered by CA and SDV that are determined to be “Server: Must Fix” must be corrected in driver code for compatibility submission. Any other issues discovered will be reported in a Static tools log but there is no requirement to fix those issues.

-   **Client only:** Issues discovered by CA and SDV will be reported in a Static tools log but no requirement to fix those issues.

The resulting DVL file output by Static Analysis tools will be captured by the Hardware Lab Kit for inclusion in the device submission package.

**How to create**

-   [Code analysis logs](http://go.microsoft.com/fwlink/p/?LinkId=723117)

-   [SDV logs](http://go.microsoft.com/fwlink/p/?LinkId=723119)

-   [DVL results file](http://go.microsoft.com/fwlink/p/?LinkId=723120)

**Note:** While recommended, there are no requirements that dictate that the submitted and subsequently distributed driver binary be compiled using the Microsoft Windows Device Kit or any other Microsoft tool.

**Note:** Microsoft reserves the right to add other device categories to the Static Analysis Tools requirement in future releases.

