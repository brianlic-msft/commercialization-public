---
title: Device.Input.FingerPrintReader
Description: 'General requirements for biometric fingerprint readers.'
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
# Device.Input.FingerPrintReader
 - [Device.Input.FingerPrintReader](#device.input.fingerprintreader)
-->

<a name="device.input.fingerprintreader"></a>
## Device.Input.FingerPrintReader 

### Device.Input.FingerPrintReader.Base

*Biometric fingerprint reader general requirements*

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

Biometric fingerprint readers certified under this program must be exposed through the Windows Biometric Framework (WBF). WBF plug-in components must implement all entry points and adhere to the WBF plug-in interfaces that are documented on MSDN ([*http://msdn.microsoft.com/library/dd401553.aspx*](http://msdn.microsoft.com/library/dd401553.aspx)).

The following general criteria must be met:

- The driver package must contain a WBDI driver, and a combination of plug-in adapters.
- Devices that operate in the advanced mode may implement a compound adapter. A compound adapter may contain a proprietary sensor, engine, and database adapter, or any combination of these adapters.
- The WBDI driver and plug-in components must not contain any malicious software such as Trojan horse or backdoor software.

All devices (peripheral or embedded) that leverage Windows Hello experiences for logon or user authentication must follow Windows Hello design language:  

- Windows provided biometric enrollment applications must be used to collect the user’s biometric data to generate a valid biometric template.    
- Windows Setting page must be used to manage the enrolled biometric data.   
- Windows feedback string above the lock screen (combined with glyphs) must be used to communicate to users about error cases (an unknown finger swiped) or instructions (move away) 

The plug-in components must not contain any malicious software such as Trojan horse or backdoor software.

The following table lists the hardware requirements for fingerprint sensors.

<table border="1">
<tbody>
<tr>
<td style="background-color: black;"><span style="color: #ffffff;">Requirement;</span></td>
<td style="background-color: black;" colspan="2"><span style="color: #ffffff;">Justification/Notes</span></td>
</tr>
<tr>
<td>Performance</td>
<td colspan="2">
<br>* Fingerprint recognition speed: < 350 ms from user touching sensor to recognition of the user for on host matching 
<br>* Enrollment samples: <= 20 samples needed for enrollment
<br>* Enrollment success rate: Enrollment is successful 99% of the time 
</td>
</tr>
<tr>
<td>Power Consumption</td>
<td>Operating (during capture) 100mW</td>
<td>Required for Connected Standby devices and recommended for others</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>When the fingerprint reader is not capturing fingerprint images regardless of if the system itself is in the sleep state or not -  1mW</td>
<td>Required for Connected Standby devices and recommended for others</td>
</tr>
<tr>
<td colspan="3">&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Security</td>
<td colspan="2">Large area sensors (a sensor matrix of 160 x160 pixels or more at a dpi of 320 or greater) 
<br>* False Accept Rate (FAR): < 0.001%  
<br>* Effective, real world FRR with Anti-spoofing or liveness detection: < 10% 
<br>* Presentation attack detection measures are a requirement. 
<br> 
Small area sensors (a sensor matrix of less than 160x160 at a dpi of 320 or greater) 
<br>* False Accept Rate (FAR): < 0.002%  
<br>* Effective, real world FRR with Anti-spoofing or liveness detection: < 10% 
<br>* Presentation attack detection measures are a requirement. 
<br>
<br>
Swipe sensors  
<br>* False Accept Rate (FAR): < 0.002%  
<br>* Effective, real world FRR with Anti-spoofing or liveness detection: < 10% 
<br>* Presentation attack detection measures are a requirement. 
<br>
<br>For more information on specific requirements behind the validation of presentation attack detection please reach out to asreqs@microsoft.com. 
</td>
</tr>
<tr>
<td>Sensor Type</td>
<td>Touch recommended if implemented</td>
<td>Touch sensor type is the preferred option compare to swipe sensor. Due to the nature, placement, and fixed orientation of swipe sensors especially on devices that can have multiple orientations (such as tablets that can function in landscape and portrait mode), they result in ergonomic challenges for the user which may result in failure to capture an accurate fingerprint thereby resulting in the need for multiple swipes.</td>
</tr>
<tr>
<td>WBF Compliant with HCK</td>
<td>Yes</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table> 

**Design Notes: **

Biometric devices measure an unchanging physical characteristic to uniquely identify an individual. Fingerprints are one of the most common biometric characteristic measured. Beginning with Windows 7, a new set of components, the Windows Biometric Framework, provides support for fingerprint biometric devices. These components, created using the Windows Biometric Framework API, can perform the following tasks:

- Capture biometric samples and use them to create a template.
- Securely save and retrieve biometric templates.
- Map each template to a unique identifier such as a GUID (globally unique identifier) or SID (system identifier).
- Enroll new biometric templates.

For more complete information about WBF and its components, see the "Introduction to the Windows Biometric Framework (WBF)" white paper at (http://msdn.microsoft.com/library/windows/hardware/gg463089.aspx)


### Device.Input.FingerPrintReader.Extensions

*Vendor-supplied drivers or other extension components must not wrap other extension components.*

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

Drivers and adapter plug-ins that extend the Windows Biometric Framework must not wrap other drivers or adapter plug-ins unless the practice is explicitly permitted by the component documentation supplied by Microsoft.

### Device.Input.FingerPrintReader.ManagementApps

*Biometric fingerprint reader management applications*

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

<html>
    <table>
        <thead>
            <tr class="header">
                <th></th>
                <th>ARM devices</th>
                <th>x86/x64 devices</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Enrollment experience (FMA)</td>
                <td>Not allowed. An inbox enrollment experience integrated with user settings page is available.</td>
                <td>
                    <p>Not recommended. The enrollment experience is provided inbox and integrated with the user settings page. A custom enrollment experience MAY be included with the WBF package and installed on the system however it will not be integrated into user settings page or Control Panel.</p>
                    <p>Custom enrollment experience is not allowed to enroll non-domain users.</p>
                </td>
            </tr>
        </tbody>
    </table>
    <p><strong>Exceptions</strong>
    <p>Devices targeted for consumer use MUST not have any 3rd party FMA installed. 3rd party FMAs may be installed and enabled on Windows devices targeted towards business (enterprise and small/medium businesses). In such instances, the user should be clearly notified if core inbox experiences will be negatively impacted by the use of the 3rd party FMA during enrollment.</p>
<html>

### Device.Input.FingerPrintReader.SensorEngineDB

*Fingerprint reader sensor, engine and storage plug-in requirement*

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

-   All interface entry points must be implemented, and each element must adhere to the definition of its respective adapter plug-in interface.

-   Plug-in components must support the sequenced invocation of their interfaces that result from invoking all the top-level Windows Biometric Framework (WBF) APIs.

-   The sequence of WBF API calls used by the WBF credential provider for Windows logon must be completed in 1.5 seconds or less.

-   The adapter must run under Application Verifier without generating any errors.

A driver package can support multiple devices, but must pass the certification criteria for each of the supported fingerprint readers separately. A separate submission must be made for each supported device.

| Adapter requirements  | Notes                                                                                                                                             |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Engine adapter        | Required unless the device is an advanced device that can match on device.                                                                        |
| Storage adapter       | Relying on inbox storage adapter is recommended unless there is a specific need to include a custom storage adapter such as for advanced sensors. |
| Sensor adapter        | Relying on inbox sensor adapter is recommended unless there is a specific need to include a custom sensor adapter.                                |
| Signature requirement | All adapters must be digitally signed, as described in the Windows Biometric Framework: Code-Signing Guidelines white paper at http://msdn.microsoft.com/library/windows/hardware/gg463093.aspx Additionally, the driver INF must also report the WindowsHello signature attribute and list each adapter DLL (and any dependent DLLs) as receiving the attribute. For more information on INF signature attribute configuration for Windows Hello please see: https://msdn.microsoft.com/windows/hardware/drivers/install/inf-signatureattributes-section |

### Device.Input.FingerPrintReader.WBDI

*Biometric fingerprint reader WBDI driver requirement*

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

Windows Biometric Driver Interface (WBDI) drivers must adhere to the following criteria:

-   All mandatory IOCTLs must be fully implemented and adhere to the WBDI specification.

-   If an optional IOCTL is implemented, it must adhere to the WBDI specification.

-   The WBDI driver must support the biometric IOCTL calling sequence.

-   If the biometric fingerprint reader is not a PnP device, it must create arrival and departure events as recommended in the WBDI specification.

-   The WBDI INF installer must set up the associated plug-in components and fingerprint management applications that are included in the driver package.

Guidelines in this requirement apply equally well to the kernel-mode and user-mode drivers. The following must be supported:

-   Backward and forward compatibility. Drivers must have a mechanism that determines different versions of user-mode and kernel-mode components. When two versions of the same driver have been installed on the PC, the kernel component must determine the correct driver to talk to. In remoting scenarios, the mismatch may occur even with a single driver.

The following items must not be used:

-   Out-of-band communications. Because the user-mode and kernel-mode drivers are running on the same PC, they might be coupled together through channels different from the I/O manager APIs. The goal is to ensure that drivers do not have out-of-band communication, implicit or explicit.

Here are some specific examples that would prevent terminal services redirection:

-   Shared memory must not be used directly between user-mode applications and either user-mode or kernel-mode drivers. For every data item sent and received, there must be a corresponding I/O request. Share the memory either through a mapped file or through locked pages of one direct I/O call.

-   Registry communication (that is, any registry keys that are set from user-mode drivers and read from kernel-mode drivers or vice versa). It is problematic when an application is running on the server and drivers are loaded on the client because the registry is set on the server, but not on the client.

-   Kernel objects (passing any kernel object handles in I/O buffers, such as handles to events or semaphores).

-   Data pointers (passing data pointers in I/O buffers). For example, a driver may try to read a linked list or other complicated data structure from the kernel.

-   Incompatibility between 32-bit and 64-bit platform implementations of the I/O request packet (IRP) requests (fields in the data structures that are compiled differently, depending on the bitness). Incompatibility of the structures based on bitness results in different offsets and data size for these structures. The data will not be interpreted correctly when a terminal services client and server are not the same platform.

-   Reliance on a strict timing expectation about how fast the kernel driver responds. Because drivers are remoting over the network, additional latency is added to the response from the hardware. That latency may range from 10 ms to serveral seconds. A possible cause for this could be slow network or packet losses. If a driver is programmed for a response that comes in time less than usual network latency, the remoting fails.

    Setting an access control list (ACL) or any other run-time security check that would prevent any application from opening a device driver. For example, a driver is allowed to accept calls only from particular service. Because all the calls are done on a TS client PC under security context of the remoting client process, they can fail.

**Design Notes** 

Biometric devices measure an unchanging physical characteristic to uniquely identify an individual. Fingerprints are the most common biometric characteristic measured. Beginning with Windows 7, a new set of components, the Windows Biometric Framework (WBF), provides support for fingerprint biometric devices. These components, created with the WBF API can perform the following tasks:

-   Capture biometric samples and uses them to create a template.

-   Securely save and retrieve biometric templates.

-   Map each template to a unique identifier such as a GUID (globally unique identifier) or SID (system identifier).

-   Enroll new biometric templates.

-   To expose a device through WBF, the device must be exposed through a driver that implements the WBDI driver as well as an appropriate combination of sensor, engine, and database plug-in components. For more complete information about WBF and its components, see "Introduction to the Windows Biometric Framework (WBF)," a white paper, at [*http://msdn.microsoft.com/library/windows/hardware/gg463089.aspx*](http://msdn.microsoft.com/library/windows/hardware/gg463089.aspx).


