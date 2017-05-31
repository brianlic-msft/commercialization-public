---
title: Device.Graphics
Description: 'Requirements for the base feature set required of all graphic devices.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.Graphics

 - [Device.Graphics.AdapterBase](#device.graphics.adapterbase)
 - [Device.Graphics.AdapterRender.D3D101Core](#device.graphics.adapterrender.d3d101core)
 - [Device.Graphics.AdapterRender.D3D101WDDM11](#device.graphics.adapterrender.d3d101wddm11)
 - [Device.Graphics.AdapterRender.D3D101WDDM12](#device.graphics.adapterrender.d3d101wddm12)
 - [Device.Graphics.AdapterRender.D3D10ComputeShader](#device.graphics.adapterrender.d3d10computeshader)
 - [Device.Graphics.AdapterRender.D3D10Core](#device.graphics.adapterrender.d3d10core)
 - [Device.Graphics.AdapterRender.D3D10D3D11LogicOps](#device.graphics.adapterrender.d3d10d3d11logicops)
 - [Device.Graphics.AdapterRender.D3D10Multisampling4X](#device.graphics.adapterrender.d3d10multisampling4x)
 - [Device.Graphics.AdapterRender.D3D10Multisampling8X](#device.graphics.adapterrender.d3d10multisampling8x)
 - [Device.Graphics.AdapterRender.D3D10WDDM11](#device.graphics.adapterrender.d3d10wddm11)
 - [Device.Graphics.AdapterRender.D3D10WDDM12](#device.graphics.adapterrender.d3d10wddm12)
 - [Device.Graphics.AdapterRender.D3D111Core](#device.graphics.adapterrender.d3d111core)
 - [Device.Graphics.AdapterRender.D3D11ASTC](#device.graphics.adapterrender.d3d11astc)
 - [Device.Graphics.AdapterRender.D3D11ConservativeRasterization](#device.graphics.adapterrender.d3d11conservativerasterization)
 - [Device.Graphics.AdapterRender.D3D11Core](#device.graphics.adapterrender.d3d11core)
 - [Device.Graphics.AdapterRender.D3D11DoublePrecisionShader](#device.graphics.adapterrender.d3d11doubleprecisionshader)
 - [Device.Graphics.AdapterRender.D3D11DriverCommandLists](#device.graphics.adapterrender.d3d11drivercommandlists)
 - [Device.Graphics.AdapterRender.D3D11DriverConcurrentObjectCreation](#device.graphics.adapterrender.d3d11driverconcurrentobjectcreation)
 - [Device.Graphics.AdapterRender.D3D11Level9WDDM12](#device.graphics.adapterrender.d3d11level9wddm12)
 - [Device.Graphics.AdapterRender.D3D11Level9WDDM13](#device.graphics.adapterrender.d3d11level9wddm13)
 - [Device.Graphics.AdapterRender.D3D11PartialPrecision](#device.graphics.adapterrender.d3d11partialprecision)
 - [Device.Graphics.AdapterRender.D3D11RasterizerOrderedViews](#device.graphics.adapterrender.d3d11rasterizerorderedviews)
 - [Device.Graphics.AdapterRender.D3D11StencilReference](#device.graphics.adapterrender.d3d11stencilreference)
 - [Device.Graphics.AdapterRender.D3D11TypedUAVLoads](#device.graphics.adapterrender.d3d11typeduavloads)
 - [Device.Graphics.AdapterRender.D3D11WDDM12](#device.graphics.adapterrender.d3d11wddm12)
 - [Device.Graphics.AdapterRender.D3D11WDDM12DoublePrecisionShader](#device.graphics.adapterrender.d3d11wddm12doubleprecisionshader)
 - [Device.Graphics.AdapterRender.D3D11WDDM13](#device.graphics.adapterrender.d3d11wddm13)
 - [Device.Graphics.AdapterRender.D3D11WDDM20](#device.graphics.adapterrender.d3d11wddm20)
 - [Device.Graphics.AdapterRender.D3D11WDDM21](#device.graphics.adapterrender.d3d11wddm21)
 - [Device.Graphics.AdapterRender.D3D12ASTC](#device.graphics.adapterrender.d3d12astc)
 - [Device.Graphics.AdapterRender.D3D12ConservativeRasterization](#device.graphics.adapterrender.d3d12conservativerasterization)
 - [Device.Graphics.AdapterRender.D3D12Core](#device.graphics.adapterrender.d3d12core)
 - [Device.Graphics.AdapterRender.D3D12Multiadapter](#device.graphics.adapterrender.d3d12multiadapter)
 - [Device.Graphics.AdapterRender.D3D12RasterizerOrderedViews](#device.graphics.adapterrender.d3d12rasterizerorderedviews)
 - [Device.Graphics.AdapterRender.D3D12StencilReference](#device.graphics.adapterrender.d3d12stencilreference)
 - [Device.Graphics.AdapterRender.D3D12TypedUAVLoads](#device.graphics.adapterrender.d3d12typeduavloads)
 - [Device.Graphics.AdapterRender.D312VolumeTiledResources](#device.graphics.adapterrender.d312volumetiledresources)
 - [Device.Graphics.IndirectDisplay.Wired](#device.graphics.indirectdisplay.wired)
 - [Device.Graphics.WDDM](#device.graphics.wddm)
 - [Device.Graphics.WDDM.Display](#device.graphics.wddm.display)
 - [Device.Graphics.WDDM.DisplayRender](#device.graphics.wddm.displayrender)
 - [Device.Graphics.WDDM.Render](#device.graphics.wddm.render)
 - [Device.Graphics.WDDM11](#device.graphics.wddm11)
 - [Device.Graphics.WDDM11.Display](#device.graphics.wddm11.display)
 - [Device.Graphics.WDDM11.DisplayRender](#device.graphics.wddm11.displayrender)
 - [Device.Graphics.WDDM11.DisplayRender.D3D9Overlay](#device.graphics.wddm11.displayrender.d3d9overlay)
 - [Device.Graphics.WDDM11.Render](#device.graphics.wddm11.render)
 - [Device.Graphics.WDDM11.Render.DXVAHD](#device.graphics.wddm11.render.dxvahd)
 - [Device.Graphics.WDDM12](#device.graphics.wddm12)
 - [Device.Graphics.WDDM12.Display](#device.graphics.wddm12.display)
 - [Device.Graphics.WDDM12.DisplayOnly](#device.graphics.wddm12.displayonly)
 - [Device.Graphics.WDDM12.DisplayRender](#device.graphics.wddm12.displayrender)
 - [Device.Graphics.WDDM12.DisplayRender.ProcessingStereoscopicVideoContent](#device.graphics.wddm12.displayrender.processingstereoscopicvideocontent)
 - [Device.Graphics.WDDM12.DisplayRender.RuntimePowerMgmt](#device.graphics.wddm12.displayrender.runtimepowermgmt)
 - [Device.Graphics.WDDM12.Render](#device.graphics.wddm12.render)
 - [Device.Graphics.WDDM12.RenderOnly](#device.graphics.wddm12.renderonly)
 - [Device.Graphics.WDDM12.StandbyHibernateFlags](#device.graphics.wddm12.standbyhibernateflags)
 - [Device.Graphics.WDDM13](#device.graphics.wddm13)
 - [Device.Graphics.WDDM13.DisplayRender](#device.graphics.wddm13.displayrender)
 - [Device.Graphics.WDDM13.DisplayRender.CoolingInterface](#device.graphics.wddm13.displayrender.coolinginterface)
 - [Device.Graphics.WDDM13.DisplayRender.WirelessDisplay](#device.graphics.wddm13.displayrender.wirelessdisplay)
 - [Device.Graphics.WDDM13.EnhancedPowerManagement](#device.graphics.wddm13.enhancedpowermanagement)
 - [Device.Graphics.WDDM13.Render](#device.graphics.wddm13.render)
 - [Device.Graphics.WDDM20](#device.graphics.wddm20)
 - [Device.Graphics.WDDM20.Core](#device.graphics.wddm20.core)
 - [Device.Graphics.WDDM20.DisplayRender](#device.graphics.wddm20.displayrender)
 - [Device.Graphics.WDDM20.Display.VirtualModeSupport](#device.graphics.wddm20.display.virtualmodesupport)
 - [Device.Graphics.WDDM21](#device.graphics.wddm21)
 - [Device.Graphics.WDDM22](#device.graphics.wddm22)
 - [Device.Graphics.WDDM22.DisplayRender](#device.graphics.wddm22.displayrender)
 - [Device.Graphics.WDDM22.DisplayRender.HighDynamicRrange](#device.graphics.wddm22.displayrender.highdynamicrrange)
 - [Device.Graphics.WDDM22.DisplayRender.ColoManagement](#device.graphics.wddm22.displayrender.colomanagement)
 - [Device.Graphics.WDDM22.Render.BrowserSecurity](#device.graphics.wddm22.render.browsersecurity)
 - [Device.Graphics.WDDM22.AdapterRender.D3D11.ParametrizedSwizzlesR1](#device.graphics.wddm22.adapterrender.d3d11.parametrizedswizzlesr1)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12Core](#device.graphics.wddm22.adapterrender.d3d12core)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.WindowsHolographic](#device.graphics.wddm22.adapterrender.d3d12.windowsholographic)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.DepthBoundTest](#device.graphics.wddm22.adapterrender.d3d12.depthboundtest)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.ASTC](#device.graphics.wddm22.adapterrender.d3d12.astc)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.StereoPrimitives](#device.graphics.wddm22.adapterrender.d3d12.stereoprimitives)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.MVPMRTArrayIndexRouting](#device.graphics.wddm22.adapterrender.d3d12.mvpmrtarrayindexrouting)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.ProgrammableMSAA](#device.graphics.wddm22.adapterrender.d3d12.programmablemsaa)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.9on12 ](#device.graphics.wddm22.adapterrender.d3d12.9on12)
 - [Device.Graphics.WDDM22.AdapterRender.D3D11D3D12.SystemShaderCache](#device.graphics.wddm22.adapterrender.d3d11d3d12.systemshadercache)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.DXILCore](#device.graphics.wddm22.adapterrender.d3d12.dxilcore)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.WaveOps](#device.graphics.wddm22.adapterrender.d3d12.dxil.waveops)
 - [Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.Int64](#device.graphics.wddm22.adapterrender.d3d12.dxil.int64)

<a name="device.graphics.adapterbase"></a>
## Device.Graphics.AdapterBase

*The base feature set required by all graphic devices.*

### Device.Graphics.AdapterBase.ApplicationVerifier

*Graphics driver components must comply with the Application Verifier test criteria.*

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

All user-mode modules (.dll or .exe files) that are part of a graphics driver must satisfy the test criteria for Application Verifier tests. During the testing of the driver, Application Verifier must be turned on for processes where the driver modules are executing. Application Verifier will cause a break when an error is detected.

For graphics drivers, AppVerifier is required for critical executables (i.e., DWM.exe as an example) used to test the stability or robustness of the graphics driver.
In addition, Application Verifier must be enabled on IHV's control panel executable as part of this requirement.
These Application Verifier tests must be turned on for the processes during testing:

-   com
-   exceptions
-   handles
-   heaps
-   inputoutput
-   leak
-   locks
-   memory
-   rpc
-   threadpool
-   tls
-   hangs

### Device.Graphics.AdapterBase.DriverVersion

*The driver files for a graphics adapter or chipset have properly formatted file versions.*

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

The driver information file (.inf), kernel mode driver (.sys), and user mode driver (.dll) file version info must match. In addition, version info for any files identified in the \[SignatureAttributes\] section of the .inf as PETrust binaries must match the .inf. It is recommended that file version info for additional binaries in a driver package match the .inf.

To be consistent with the prevailing file versioning requirements for legacy Operating systems, file version formatting must follow an AA.BB.CCCCC.DDDDD pattern where:

-   AA indicates the Driver model version of the most capable device listed in the .inf

-   BB (for WDDM v1.2 drivers and higher)

    -   indicates highest available D3D Feature Level of the most capable device listed in the .inf

-   BB (for WDDM v1.1 drivers and lower)

    -   indicates highest available DDI version supported by the most capable device listed in the .inf

-   CCCCC is a number up to 5 digits from 0 to 65535 chosen by the vendor

-   DDDDD is a number up to 5 digits from 0 to 65535 chosen by the vendor

Values for AA field:

| Driver Model | AA value |
|--------------|----------|
| WDDM v2.x    | 21       |
| WDDM v2.0    | 20       |
| WDDM v1.3    | 10       |
| WDDM v1.2    | 9        |
| WDDM v1.1    | 8        |
| WDDM v1.0    | 7        |
| XDDM         | 6        |

Values for BB field (WDDM v1.2 and later):

| DirectX Feature Level | BB value |
|-----------------------|----------|
| 12\_x                 | 21       |
| 12\_1                 | 20       |
| 12\_0                 | 19       |
| 11\_1                 | 18       |
| 11\_0                 | 17       |
| 10\_1                 | 16       |
| 10\_0                 | 15       |
| 9\_3                  | 14       |
| 9\_2                  | 14       |
| 9\_1                  | 14       |

Values for BB field (WDDMv1.1 and earlier):

| DDI version                      | BB value |
|----------------------------------|----------|
| D3D11-DDI on Feature Level 11\_0 | 17       |
| D3D11-DDI on Feature Level 10    | 16       |
| D3D10-DDI                        | 15       |
| D3D9 DDI                         | 14       |

**For example**:

NOTE: There is no requirement to pad numbers with leading zeros, i.e., 123 does not need to be represented as 00123 for the CCCCC or DDDDD fields. In previous versions of the Windows OS the last two fields were 4 digits, i.e., CCCC.DDDD. Therefore the examples for driver versions prior to Windows 10 and WDDM v2.0 only have 4 digits.

-   Windows Vista WDDM v1.0:

    -   D3D9 DDI drivers can use 7.14.0000.0000 to 7.14.9999.9999

    -   D3D10 DDI drivers can use 7.15.0000.0000 to 7.15.9999.9999

-   Windows 7 WDDM v1.1:

    -   D3D9 DDI drivers can use 8.14.0000.0000 to 8.14.9999.9999

    -   D3D10 DDI drivers can use 8.15.0000.0000 to 8.15.9999.9999

    -   D3D11 DDI with FL\_10\_0 drivers can use 8.16.0000.0000 to 8.16.9999.9999

    -   D3D11 DDI with FL\_11\_0 drivers can use 8.17.0000.0000 to 8.17.9999.9999

-   Windows 8 WDDM v1.2 driver:

    -   FL\_10\_0 HW can use 9.15.0000.0000 to 9.15.9999.9999

    -   FL\_10\_1 HW can use 9.16.0000.0000 to 9.16.9999.9999

    -   FL\_11\_0 HW can use 9.17.0000.0000 to 9.17.9999.9999

    -   FL\_11\_1 HW can use 9.18.0000.0000 to 9.18.9999.9999

-   Windows 8.1 WDDM v1.3 driver:

    -   FL\_10\_0 HW can use 10.15.0000.0000 to 10.15.9999.9999

    -   FL\_10\_1 HW can use 10.16.0000.0000 to 10.16.9999.9999

    -   FL\_11\_0 HW can use 10.17.0000.0000 to 10.17.9999.9999

    -   FL\_11\_1 HW can use 10.18.0000.0000 to 10.18.9999.9999

-   Windows 10 WDDM v2.0 driver:

    -   FL\_11\_1 HW can use 20.18.0000.0000 to 20.18. 65535.65535

    -   FL\_12\_0 HW can use 20.19.0000.0000 to 20.19. 65535.65535

    -   FL\_12\_1 HW can use 20.20.0000.0000 to 20.20. 65535.65535

**Enforcement:**

A mandatory test in the HLK certification playlist for Windows 10 builds higher than 10586 will enforce the rules above. The test will be optional for older OS versions. For Windows 10 builds after 10586 the WDDM version has been updated to 2.1. Another way to view this is that the mandatory requirement only applies to drivers that are built for WDDM 2.1 or higher.

### Device.Graphics.AdapterBase.PowerManagementCompliance

*A graphics adapter must comply with VESA and ACPI power management specifications to enable system sleep.*

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

To ensure correct implementation of operating system-controlled power management, graphic adapters and their drivers must respond to:

-   Required device (D0 and D3) power states as highlighted in the WDK

-   Operating system power management for ACPI power states

-   \*VESA BIOS Power Management Functions, which defines extensions to VGA ROM BIOS services for power management. (\*This line does not apply to UEFI GOP based platforms.)

### Device.Graphics.AdapterBase.RegistryEntries

*An application that installs the device driver for a graphics device must create the required registry entries.*

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

The following registry entries must be created during video driver installation:
 

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\InstalledDisplayDrivers: This key should contain the User-mode driver name.

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.MemorySize

The below Hardware Information values are written by the WDDM driver:

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.ChipType

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.DACType

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.AdapterString

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.BiosString

-   REG\_BINARY: HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Video\\PART\_GUID\\ID\\HardwareInformation.MemorySize

The following INF directives must be included in the INF:

-   Feature Score - This is a General Installation setting that must be supported by all WDDM drivers.

-   Copy Flags to Support PNP Stop directive

-   Driver\\Services Start Type directive

-   Capability Override settings to disable OpenGL

-   \[Version\] section directives

-   \[SourceDiskNames\] section directives

-   General x64 directives

-   General \[Install\] section directives

The Driver DLL must have a properly formatted file version as defined in the requirement Device.Graphics.AdapterBase.DriverVersion.

### Device.Graphics.AdapterBase.RunFromDriverStore

*The driver files for a graphics adapter or chipset are loaded from the Driver Store.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>


**Description**

Drivers must be written so that their components (User Mode Driver, Kernel Mode Driver, etc.) can run directly from the Driver Store. They must not have any dependencies on system paths such as Windows\\System32. This includes selecting the *Run from Driver Store* option in the driver information file (.inf).

Note that once this change is made, unique names or absolute paths must be used to load dependencies. For drivers choosing to implement the additional optional side-by-side capability, service names must also be unique per driver version or class of hardware.

**Business Justification:**

Having drivers run from the Driver Store will improve the upgrade experience. It also enables vendors to support additional “side by side” functionality if they so choose – for example, this would enable the scenario of having two or more GPUs from different families in the same machine running different driver versions.

An additional benefit is that it reduces the disk footprint because drivers must exist in the Driver Store anyway and having an additional copy in Windows\\System32 results in duplication.

**Enforcement**:

The settings in the driver information file (.inf) will be verified by an HLK test for Windows 10 builds higher than 10586.

### Device.Graphics.AdapterBase.SubsystemResettable

*A graphics subsystem must be resettable to a normal operational state.*

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

If the GPU is hung for any reason, independent of what the hardware is processing at the time, it must be resettable to a normal operational state. This basically implies that TDR must be supported by any GPU.

Hybrid system should be able to handle TDR just like non-hybrid system and have mechanism to reset either (or both) the GPU to bring the system back to a functioning state when the operating system detects a hang.

*Design Notes*

The ability to reset the GPU is independent of the current working state of the system.

### Device.Graphics.AdapterBase.Symbols

*Symbols must be submitted along with the driver for certification*

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

When graphics drivers are submitted for certification, matching symbol files must be submitted at the same time via the WHKL “Add symbols” workflow. Microsoft uses matching symbols internally for failure analysis. Without these symbols, it is unlikely Microsoft will be able to analyze failures and assist partners in diagnosing driver issues. Symbols for the following files must be included:

-   .sys files

-   .dll files listed in the \[SignatureAttributes\] section of the driver .inf as "PETrust" binaries

Symbols may by “public” or “private” per [MSDN guidance](https://msdn.microsoft.com/en-us/library/windows/hardware/ff550665.aspx).


## Device.Graphics.AdapterRender

*The Render feature of a graphics device.*

### Device.Graphics.AdapterRender.MinimumDirectXLevel

*A graphics adapter must implement the minimum hardware acceleration capabilities.*

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

**Description**

The display subsystem is required to implement the DirectX 9 hardware specification and the driver is required to expose through the D3D9 UMD DDI the capabilities of Direct3D 10 Feature Level 9\_3 as described in MSDN here:

-   <http://msdn.microsoft.com/en-us/library/ff476876.aspx>

-   <http://msdn.microsoft.com/EN-US/library/ff476150.aspx>

-   <http://msdn.microsoft.com/EN-US/library/ff476149.aspx>

-   <http://msdn.microsoft.com/en-us/library/ff471324.aspx>

NOTE: For Windows Server, graphics drivers are optional. Display Only graphics drivers do not render so they do not have a minimum DirectX requirement. If a Full Graphics driver is loaded on a server, then it must conform to the minimum DirectX feature level.

### Device.Graphics.AdapterRender.RGBFrameBuffer

*A display chipset must implement the specified component order and endian representation for an 8-bpp or greater integer RGB frame buffer formats.*

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

**Description**

For an N-bit-per-component RGB frame buffer format, the lowest N bits must contain the blue component, the next N bits must contain the green component, the next N bits must contain the red component, and the remaining 32-(3 x N) bits may contain alpha. The resulting 32-bit value must be stored in memory in little-endian format.

### Device.Graphics.AdapterRender.YUVSupport

*A display driver that supports YUV textures must process textures and functions correctly.*

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

**Description**

If the hardware supports YUV texture surfaces and the capability is reported, then the driver must be able to process these surfaces without any intermediate transforms and function correctly.

<a name="device.graphics.adapterrender.d3d101core"></a>
## Device.Graphics.AdapterRender.D3D101Core

*D3D 10.1 core feature *

### Device.Graphics.AdapterRender.D3D101Core.D3D101CorePrimary

*If the graphics device supports Direct3D 10.1, it must comply with the Direct3D 10.1 and DXGI Specifications.*

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

If the graphics devices implements Direct3D 10.1, it must meet all the requirements defined in the *Direct3D 10.1 specification* and must provide sufficient performance for Direct3D 10.1 features. 

Since Direct3D 10.1 is a superset of Direct3D 10, the implementation of Direct3D 10.1 also requires the support of the Direct3D 10 feature set.  

All features required by this specification must be exposed by the device driver including those features defined for the DXGI DDI header. 

<a name="device.graphics.adapterrender.d3d101wddm11"></a>
## Device.Graphics.AdapterRender.D3D101WDDM11

*D3D 10.1 core feature with WDDM 1.1 additions*

### Device.Graphics.AdapterRender.D3D101WDDM11.D3D101v11Primary

*If a WDDM 1.1 graphics device supports Direct3D 10.1, it must comply with the Direct3D 10.1 and DXGI Specifications and support BGRA.*

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

If the graphics hardware implements Direct3D 10.1, it must meet all the requirements defined in the *Direct3D 10.1 specification* and must provide sufficient performance for Direct3D 10.1 features. 

Since Direct3D 10.1 is a superset of Direct3D 10, implementation of Direct3D 10.1 also requires support of the Direct3D 10 feature set.  Additionally, the following features originally defined in the D3D9 hardware specification are now required:

-   BGRA

All features required by this specification must be exposed by the device driver including those features defined for the DXGI DDI header. 

<a name="device.graphics.adapterrender.d3d101wddm12"></a>
## Device.Graphics.AdapterRender.D3D101WDDM12

*D3D 10.1 core feature with WDDM 1.2 additions*

### Device.Graphics.AdapterRender.D3D101WDDM12.D3D101v12Primary

*If a WDDM 1.2 graphics device supports Direct3D 10.1, it must comply with the Direct3D 10.1, DXGI and D3D10 portion of the Direct3D 11.1 Feature Specifications.*

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

If the graphics hardware implements Direct3D 10.1, it must meet all requirements that are defined in the *Direct3D 10.1 specification* and must provide sufficient performance for Direct3D 10.1 features. 

Since Direct3D 10.1 is a superset of Direct3D 10, the implementation of Direct3D 10.1 also requires support of the Direct3D 10 feature set.  Additionally, the following features originally defined in the D3D9 hardware specification are now required:

-   BGRA
-   Half Precision pixel formats (5551, 565, 4444)
-   Same Surface Blts

Please see the *Direct3D 11.1 Features Spec* for complete details of all new features required to be exposed with a WDDM 1.2 driver for D3D10+ hardware.

All features required by this specification must be exposed by the device driver, including those features defined for the DXGI DDI header. 

 

<a name="device.graphics.adapterrender.d3d10computeshader"></a>
## Device.Graphics.AdapterRender.D3D10ComputeShader

*Direct3D 10 Shader Model 4\_\* Compute Shader Functionality*

### Device.Graphics.AdapterRender.D3D10ComputeShader.D3D10CoreC

*If the graphics hardware implements Direct3D 10 Shader Model 4\_\* Compute Shader Functionality, it must conform to the D3D11 hardware specifications.*

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

The D3D11 Specification allows for optionally implementing Shader Model 4\_\* Compute Shader functionality on Direct3D 10 hardware.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D11 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d10core"></a>
## Device.Graphics.AdapterRender.D3D10Core

*D3D 10 core feature *

### Device.Graphics.AdapterRender.D3D10Core.D3D10CorePrimary

*If a graphics device supports Direct3D 10, it must comply with the Direct3D 10 and DXGI specifications.*

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

If the graphics hardware implements Direct3D 10, it must meet all requirements defined in the *Direct3D 10 specification* and must provide sufficient performance for Direct3D 10 features. 

All features required by this specification must be exposed by the device driver, including those features defined for the DXGI DDI header. The following list includes some of the required features called out in the Direct3D 10 specification:

-   Geometry shader
-   Stream output
-   Integer instruction set
-   New compressed formats
-   Render to vertex buffer
-   Render to cube map
-   Render to volume

<a name="device.graphics.adapterrender.d3d10d3d11logicops"></a>
## Device.Graphics.AdapterRender.D3D10D3D11LogicOps

*D3D10-D3D11 Logic Ops*

### Device.Graphics.AdapterRender.D3D10D3D11LogicOps.D3D10CoreD

*If the graphics hardware implements Logic Ops functionality, it must conform to the D3D11 hardware specifications.*

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

The D3D11.1 Specification allows for optionally implementing Logic Ops functionality on D3D10, D3D10.1 and D3D11 hardware.   If the hardware supports and exposes support for this functionality, it must conform to the specifications for this feature as defined in the *D3D11.1 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d10multisampling4x"></a>
## Device.Graphics.AdapterRender.D3D10Multisampling4X

*D3D10 Multisampling (4X)*

### Device.Graphics.AdapterRender.D3D10Multisampling4X.D3D10CoreA

*If the graphics hardware implements D3D10 4x Multisampling, it must conform to the D3D10 hardware specifications.*

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

The D3D10 Specification allows for optionally implementing 4X Multisampling.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D10 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d10multisampling8x"></a>
## Device.Graphics.AdapterRender.D3D10Multisampling8X

*Direct3D 10 Multisampling (8X)

### Device.Graphics.AdapterRender.D3D10Multisampling8X.D3D10CoreB

*If the graphics hardware implements Direct3D 10 8X Multisampling, then it must conform to the Direct3D 10 hardware specifications.*

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

The D3D10 Specification allows for optionally implementing 8X Multisampling.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D10 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d10wddm11"></a>
## Device.Graphics.AdapterRender.D3D10WDDM11

*D3D 10 core feature with WDDM 1.1 additions*

### Device.Graphics.AdapterRender.D3D10WDDM11.D3D10v11Primary

*If the graphics hardware implements Direct3D 10 and the driver is WDDM1.1, it must comply with the Direct3D 10 and DXGI Specifications and support BGRA.*

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

If the graphic hardware implements Direct3D 10 and the driver is WDDM1.1, it must meet all requirements defined in the *Direct3D 10 specification* and must provide sufficient performance for Direct3D 10 features. Additionally, the following features originally defined in the D3D9 Hardware specification are now required:

-   BGRA

All features required by this specification must be exposed by the device driver including those features defined for the DXGI DDI header. The following list includes some of the required features called out in the Direct3D 10 specification:

-   Geometry shader
-   Stream output
-   Integer instruction set
-   New compressed formats
-   Render to vertex buffer
-   Render to cube map
-   Render to volume

<a name="device.graphics.adapterrender.d3d10wddm12"></a>
## Device.Graphics.AdapterRender.D3D10WDDM12

*D3D 10 core feature with WDDM 1.2 additions*

### Device.Graphics.AdapterRender.D3D10WDDM12.D3D10v12Primary

*If the graphics hardware implements Direct3D 10 and the Driver is WDDM1.2, it must comply with the Direct3D 10, DXGI, and the D3D10 additions in the Direct3D 11.1 Feature Specifications.*

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

If the graphic hardware implements Direct3D 10 and the driver is WDDM1.2, it must meet all requirements defined in the *Direct3D 10 specification* and must provide sufficient performance for Direct3D 10 features. Additionally, the following features originally defined in the D3D9 Hardware specification are now required:

-   BGRA
-   Half Precision pixel formats (5551, 565, 4444)
-   Same Surface Blts

 
Please see the *Direct3D 11.1 Features Spec* for complete details of all new features required to be exposed with a WDDM 1.2 driver for D3D10+ hardware.

All features required by this specification must be exposed by the device driver including those features defined for the DXGI DDI header. The following list includes some of the required features called out in the Direct3D 10 specification:

-   Geometry shader
-   Stream output
-   Integer instruction set
-   New compressed formats
-   Render to vertex buffer
-   Render to cube map
-   Render to volume

### Device.Graphics.AdapterRender.D3D10WDDM12.Stereoscopic3DArraySupport

*WDDM1.2 drivers must support Stereoscopic 3D in D3D by adding expanded array support.*

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

Support required by WDDM 1.2
 

| DDI or feature                                                                                                                                       | WDDM 1.1                    | WDDM 1.2                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|---------------------------------------------------|
| Creation of backbuffers (and primaries) using D3D10DDIARG\_CREATERESOURCE & D3D11DDIARG\_CREATERESOURCE                                              | Restricted to ArraySize = 1 | Generalized to ArraySize = 2                      |
| DXGI UM backbuffer DDIs (DXGI\_DDI\_ARG\_BLT, DXGI\_DDI\_ARG\_ROTATE\_RESOURCE\_IDENTITIES, DXGI\_DDI\_ARG\_PRESENT, DXGI\_DDI\_ARG\_SETDISPLAYMODE) | Restricted to backbuffers   | Same, but including stereo back buffers           |
| Presentation in general (kernel and user)                                                                                                            | Restricted to backbuffers   | Same, but including stereo back buffers           |
| Sharing                                                                                                                                              | Restricted to ArraySize = 1 | Generalized to *any* ArraySize (including &gt; 2) |
| GDI interop                                                                                                                                          | Restricted to ArraySize = 1 | Generalized to *any* ArraySize (including &gt; 2) |
| HLSL non-arrayed sampler declarations                                                                                                                | Restricted to ArraySize = 1 | Generalized to *any* ArraySize (including &gt; 2) |

 
HLSL non-arrayed sampler declarations indicates allowing certain shaders that sample from single-subresource-resources currently to also sample from single-subresource-views of resources with multiple subresources.
 
Note that drivers must support extended array for Stereo 3D APIs, but for fullscreen exclusive Stereo 3D apps to display, the driver should also support Stereo scanout on the output.  For example, in a multi-adapter system with two WDDM 1.2 graphics adapters, either adapter may be used to create a stereo *windowed* swapchain, even if only one of the adapters actually supports stereo output.

 

<a name="device.graphics.adapterrender.d3d111core"></a>
## Device.Graphics.AdapterRender.D3D111Core

*D3D 11.1 core feature *

### Device.Graphics.AdapterRender.D3D111Core.D3D111CorePrimary

*If a graphics device supports Direct3D 11.1, it must comply with the Direct3D 11.1 and DXGI Specifications.*

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

A graphics device must meet all requirements defined in the *Direct3D 11.1 specification* and must provide sufficient performance for Direct3D 11.1 features.
 

Direct3D 11.1 is a superset of Direct3D 11 (which is a strict superset of Direct3D 10.1 and Direct3D 10); therefore, implementation of Direct3D 11.1 also requires full support for the features defined by the Direct3D 10, Direct3D 10.1 and Direct3D 11 specifications respectively.

All features required by this specification must be exposed by the device driver, including those features defined for the DXGI DDI header. 

<a name="device.graphics.adapterrender.d3d11astc"></a>
## Device.Graphics.AdapterRender.D3D11ASTC

### Device.Graphics.AdapterRender.D3D11ASTC.CoreRequirement

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

D3D11 drivers that implement ASTC LDR support must support sampling from all 2D ASTC formats. ASTC formats are not individually supportable, and thus must all be support for ASTC to be considered supported. Here are a list of all ASTC formats that must be support for ASTC LDR Support to be valid: (All formats have \_TYPELESS, and \_SRGB equivalent)

-   DXGI\_FORMAT\_4X4
-   DXGI\_FORMAT\_5X4
-   DXGI\_FORMAT\_5X5
-   DXGI\_FORMAT\_6X5
-   DXGI\_FORMAT\_6X6
-   DXGI\_FORMAT\_8X5
-   DXGI\_FORMAT\_8X6
-   DXGI\_FORMAT\_8X8
-   DXGI\_FORMAT\_10X5
-   DXGI\_FORMAT\_10X6
-   DXGI\_FORMAT\_10X8
-   DXGI\_FORMAT\_10X10
-   DXGI\_FORMAT\_12X10
-   DXGI\_FORMAT\_12X12

<a name="device.graphics.adapterrender.d3d11conservativerasterization"></a>
## Device.Graphics.AdapterRender.D3D11ConservativeRasterization

### Device.Graphics.AdapterRender.D3D11ConservativeRasterization.CoreRequirement

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

Display drivers for Direct3D 11 should implement DDIs related to Conservative Rasterization, with allowance for tiers of functionality:

 - Uncertainty Range:
 - Inner Coverage
 - Post-snap degenerate culling
 - Other Pipeline Interactions:
   - TIR
   - MSAA
   - SampleMask w/ Inner Coverage
   - Clip Distance
   - Queries
   - oMask
   - HelperPixel coverage
   - Attribute Interpolation (extrapolation)
   - Early Z w/ Depth Extrapolation

For additional details, refer to the Conservative Rasterization spec.

<a name="device.graphics.adapterrender.d3d11core"></a>
## Device.Graphics.AdapterRender.D3D11Core

*D3D 11 core feature *

### Device.Graphics.AdapterRender.D3D11Core.D3D11CorePrimary

*If a graphics device implements Direct3D 11, it must comply with the Direct3D 11 and DXGI Specifications.*

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

If a graphics device implements Direct3D 11, it must meet all requirements defined in the *Direct3D 11 specification* and must provide sufficient performance for Direct3D 11 features.

Since Direct3D 11 is a superset of Direct3D 10, implementation of Direct 3D 11 also requires support of Direct3D 10.1 feature set and by extension Direct3D 10. 

All features required by this specification must be exposed by the device driver including those features defined for the DXGI DDI header.

<a name="device.graphics.adapterrender.d3d11doubleprecisionshader"></a>
## Device.Graphics.AdapterRender.D3D11DoublePrecisionShader

*Direct3D 11 Double Precision Shader Functionality*

### Device.Graphics.AdapterRender.D3D11DoublePrecisionShader.D3D11CoreC

*If the graphics hardware implements Direct3D 11 Double Precision, it must conform to the feature specification as outlined in the D3D11 hardware specification.*

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

The D3D11 Specification allows for optionally implementing Double Precision Shader functionality on Direct3D 11 hardware.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D11 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d11drivercommandlists"></a>
## Device.Graphics.AdapterRender.D3D11DriverCommandLists

*Direct3D 11 Driver Command Lists*

### Device.Graphics.AdapterRender.D3D11DriverCommandLists.D3D11CoreB

*If the graphics hardware implements the Direct3D 11 driver command list, it must conform to the feature specification as defined in the D3D11 hardware specification.*

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

The D3D11 Specification allows for optionally implementing DriverCommandListfunctionality on Direct3D 11 hardware. If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the D3D11 Hardware Specification.

<a name="device.graphics.adapterrender.d3d11driverconcurrentobjectcreation"></a>
## Device.Graphics.AdapterRender.D3D11DriverConcurrentObjectCreation

*Direct3D 11 Driver Concurrent Object Creation*

### Device.Graphics.AdapterRender.D3D11DriverConcurrentObjectCreation.D3D11CoreA

*If the graphics hardware implements the Direct3D 11 Driver Concurrent Object Creation, it must conform to the feature specification as defined in the D3D11 hardware specification.*

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

The D3D11 Specification allows for optionally implementing Driver Concurrent Object creation functionality on Direct3D 11 hardware.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D11 Hardware Specification*. 

<a name="device.graphics.adapterrender.d3d11level9wddm12"></a>
## Device.Graphics.AdapterRender.D3D11Level9WDDM12

*WDDM 1.2 updates to the D3D9 UM DDI*

### Device.Graphics.AdapterRender.D3D11Level9WDDM12.D3D9UMDDIUpdate

*If the graphics hardware driver implements the WDDM1.2 specification, it must include the D3D9 User Mode DDI additions as defined by the D3D11.1 API/DDI Specification.*

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

A WDDM 1.2 graphics driver is required to implement the D3D9 Adapter DDI and D3D9 DDI additions as defined in the *D3D11.1 API/DDI specification* in addition to the D3D9 DDI, as defined by the DirectX 9 hardware and driver specifications.
 

<a name="device.graphics.adapterrender.d3d11level9wddm13"></a>
## Device.Graphics.AdapterRender.D3D11Level9WDDM13

WDDM1.3 updates to the D3D9 UM DDI

### Device.Graphics.AdapterRender.D3D11Level9WDDM13.LargeCaptureTextures

*Direct3D Large Capture Textures*

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

All 9 UMDs, regardless of maximum feature level of hardware, must now properly validate the texture size parameters being passed to CreateResource2.

Graphics drivers must now gracefully fail (by returning a E\_INVALIDARG) CAPTURE texture create requests that exceed the capabilities of the hardware.

Any CAPTURE textures that are approved for creation must behave identical to CAPTURE textures as they are defined.

### Device.Graphics.AdapterRender.D3D11Level9WDDM13.Level9Instancing

*Level 9 Instancing*

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

In Windows, the OS will be making increased use of D3D Instancing to reduce CPU/GPU usage. All WDDM1.3 drivers must support Instancing as described in the Feature Level 9\_3.

### Device.Graphics.AdapterRender.D3D11Level9WDDM13.NativeStagingBuffers

*Level9 Native Staging Buffer Performance Validation*

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

Directx9 level graphics hardware that implement WDDM1.3 must support the D3D9 Native Staging buffers DDI.

### Device.Graphics.AdapterRender.D3D11Level9WDDM13.NativeUpdateSubresource

*Direct3D Level9 Native UpdateSubresource*

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

For Windows, the Direct3D9 DDI spec will include native support for the UpdateSubresource DDI. When D3D9-level parts implement this DDI, the UpdateSubresource API calls for a given amount of memory must be executed no slower than a CPU copy operation.

### Device.Graphics.AdapterRender.D3D11Level9WDDM13.TimestampCounterSupport

*Direct3D Level9 Timestamps and Counters*

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

Timestamp Query support will be made mandatory for all 9-level WDDM 1.3 drivers, specifically these Query types:

1.  D3DDDIQUERYTYPE\_TIMESTAMP
2.  D3DDDIQUERYTYPE\_TIMESTAMPDISJOINT
3.  D3DDDIQUERYTYPE\_TIMESTAMPFREQ

Additionally, the CheckDounter and CheckCounterInfo Direct3D11 Counter DDIs must be supported.

<a name="device.graphics.adapterrender.d3d11partialprecision"></a>
## Device.Graphics.AdapterRender.D3D11PartialPrecision

*D3D11 Partial Precision shader support*

### Device.Graphics.AdapterRender.D3D11PartialPrecision.D3D11CoreE

*If the graphic hardware implements the D3D11.1 Partial Precision Shader Functionality, it must conform to the feature specification as defined in the D3D11.1 hardware specification.*

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

The D3D11.1 Specification allows for optionally implementing Partial Precision Shader functionality on D3D9, D3D10\*, and Direct3D 11 hardware with a WDDM 1.2 driver.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D11.1 Hardware Specification*.  


<a name="device.graphics.adapterrender.d3d11rasterizerorderedviews"></a>
## Device.Graphics.AdapterRender.D3D11RasterizerOrderedViews

### Device.Graphics.AdapterRender.D3D11RasterizerOrderedViews.CoreRequirement 

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

**Description**:

<a name="device.graphics.adapterrender.d3d11stencilreference"></a>
## Device.Graphics.AdapterRender.D3D11StencilReference

### Device.Graphics.AdapterRender.D3D11StencilReference.CoreRequirement

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

Display drivers for Direct3D11 should implement DDIs related to Pixel Shader Stencil Reference:

 - Writes to SV\_STENCILREF function as expected

For additional information, refer to the [PS-Specified Stencil Ref spec](http://windowsteams/devx/GRFX/d3d/D3D%20Next%20Design/MQ%20Planning%20Documents/PS-Specified%20Stencil%20Reference%20Value%20-%20Unified%20Spec.docx?web=1).

<a name="device.graphics.adapterrender.d3d11typeduavloads"></a>
## Device.Graphics.AdapterRender.D3D11TypedUAVLoads

### Device.Graphics.AdapterRender.D3D11TypedUAVLoad.CoreRequirement

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

Display drivers for Direct3D11 should implement DDIs related to Typed UAV Loads:

-   Support typed load for all required UAV formats if typed UAV load flag is set

-   Support typed load for optionally declared types

For more information, refer to the [Typed UAV Loads spec](http://windowsteams/devx/GRFX/d3d/D3D%20Next%20Design/MQ%20Planning%20Documents/UAV%20Typed%20Load%20Draft%20Specification.docx?web=1)

<a name="device.graphics.adapterrender.d3d11wddm12"></a>
## Device.Graphics.AdapterRender.D3D11WDDM12

*D3D 11 core feature with WDDM 1.2 additions*

### Device.Graphics.AdapterRender.D3D11WDDM12.D3D11v12Primary

*If a WDDM 1.2 graphics device implements Direct3D 11, it must comply with the Direct3D 11, DXGI, and the D3D10 portion of the Direct3D 11.1 Features Specification.*

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

If a graphics device implements Direct3D 11, it must meet all requirements defined in the Direct3D 11 specification and must provide sufficient performance for Direct3D 11 features.

Since Direct3D 11 is a superset of Direct3D 10, the implementation of Direct 3D 11 also requires support of the Direct3D 10.1 feature set and by extension Direct3D 10. 

In Windows, the following features originally defined in the D3D9 Hardware specification are now also required:

-   Half Precision pixel formats (5551, 565, 4444)
-   Same Surface Blts

Please see the *Direct3D 11.1 Features Spec* for complete details of all new features required to be exposed with a WDDM 1.2 driver for D3D10+ hardware.

All features required by this specification must be exposed by the device driver, including those features defined for the DXGI DDI header.

<a name="device.graphics.adapterrender.d3d11wddm12doubleprecisionshader"></a>
## Device.Graphics.AdapterRender.D3D11WDDM12DoublePrecisionShader

*Direct3D 11 Double Precision Shader Functionality with additional ops codes introduced with WDDM 1.2*

### Device.Graphics.AdapterRender.D3D11WDDM12DoublePrecisionShader.D3D11v12C

*If the graphics hardware implements the Direct3D 11 Double Precision Shader Functionality with WDDM 1.2 driver additions, it must conform to the feature specifications as defined in the D3D11 hardware specification.*

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

The D3D11 Specification allows for optionally implementing Double Precision Shader functionality on Direct3D 11 hardware.   If the hardware includes support for and the driver exposes this functionality, it must conform to the specifications for this feature as defined in the *D3D11 Hardware Specification*.   For Windows, if a WDDM 1.2 Graphics device driver supports Double Precision Shader functionality, it is required to support the extended double precision math as described in the *Shader Model Improvements Specification*.

<a name="device.graphics.adapterrender.d3d11wddm13"></a>
## Device.Graphics.AdapterRender.D3D11WDDM13

*D3D11.1 Tiled Resource support*

### Device.Graphics.AdapterRender.D3D11WDDM13.MapDefault

*Map Default*

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

For Direct3D Feature Level 11\_0 and higher parts, the WDDM1.3 drivers must allow mappable DEFAULT buffers to be created. Apps will be able to request these mappable resources by setting the CPU\_Read/CPU\_Write access flags as described in the WDDM1.3 spec. The mappable DEFAULT buffers should behave identically to existing DEFAULT buffers today from an API perspective (other than being able to be mapped). The mapping/CPU-access performance of mappable DEFAULT buffers should be comparable to STAGING buffers.

<a name="device.graphics.adapterrender.d3d11wddm20"></a>
## Device.Graphics.AdapterRender.D3D11WDDM20



### Device.Graphics.AdapterRender.D3D11WDDM20.CoreRequirement

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

<ol style="list-style-type: decimal">
<li><p><strong>High Performance Timing Data:</strong></p>
<p>Note: This feature is Mandatory for a WDDM 2.0 driver supporting D3D11.</p>
<p>“High Performance Graphics Timing Data” provides light weight and highly detailed timing data for graphics workloads. This data is used by analysis tools to identify performance or other graphics related issues in Windows applications or the graphics stack.</p>
<p>A WDDM2.0 driver must ensure that the graphics device/driver provides the following:</p>
<ul>
<li><p>A high resolution GPU Timer</p></li>
<li><p>12.5 MHz (80ns resolution) or better.</p></li>
<li><p>At least 32 bits of timestamp resolution</p></li>
<li><p>The GPU timestamp can be sampled for all engines in a GPU</p></li>
<li><p>The GPU timestamp can be sampled at the end of the GPU pipeline</p></li>
<li><p>The GPU timestamp frequency can be sampled.</p></li>
<li><p>The GPU timestamp is invariant and is unaffected by p-state transitions.</p></li>
</ul>
<p>Among the other changes for this feature, this will include the addition of two new flags to the existing DdiControlEtwLogging interface; when these flags are set so that the first flag is value of 1 and the second flag is a value of 0, then the driver must ensure that:</p>
<ul>
<li><p>All engine components must ensure that they are never clock- or power-gated as long as the flag remains enabled, and must in general refrain from entering any idle states. The components must remain active to ensure there is no latency added due to power transitions.</p></li>
<li><p>All engine components must ensure that their processing frequencies and functional bus bandwidths are kept at their maximum stable operating values. Thermal events requiring P-State transition down should still occur to prevent damage to the hardware, but P-States should be defined so that these are exceptional occurrences that are not normally seen in cool lab environments.</p></li>
<li><p>The sampled GPU timestamp can be correlated with previously issued graphics commands</p></li>
<li><p>Generation of timing data is off by default, but can be turned on and off at any time.</p></li>
<li><p>The overhead of collecting this performance data is no slower than using the timestamp query technique that is already available in D3D9 and D3D10+</p></li>
<li><p>Timing data can be collected in direct command lists and bundles. Timing data can be enabled/disabled on a per-command list basis.</p></li>
<li><p>Resulting data on Tile based deferred rendering hardware appears as if it was generated on an immediate mode rendering device.</p></li>
</ul>
</li>
</ol>


<a name="device.graphics.adapterrender.d3d11wddm21"></a>
## Device.Graphics.AdapterRender.D3D11WDDM21

WDDM 2.1 is an optional version level introduced for Windows 10 builds greater than 10586. If a driver implements WDDM 2.1 then it must implement all of the WDDM 2.1 Requirements. WDDM 2.0 drivers will continue to run on the newer Windows 10 builds.

### Device.Graphics.AdapterRender.D3D11WDDM21.CoreRequirement

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

<ol>
<li><p>**Extended NV12/ 420 Shared Texture Support**</p>

<p>Note: This feature is Mandatory for a WDDM 2.1 driver supporting D3D11.</p>

<p>The driver must support the sharing of a few texture formats with more properties, in order to enable frame server scenarios. The goal is zero-copy between capture devices and video engines.</p></li>

<li><p>**eFSE/UWP Optimization Support**</p>

<p>Note: This feature is Mandatory for a WDDM 2.1 driver supporting D3D11 or D3D9.</p>

<p>The driver must support the new pfnAcquireResource/pfnReleaseResource methods intended to enable driver optimizations for eFSE (emulated Full Screen Exclusive) / UWP (Universal Windows Platform) performance parity with FSE.</p></li>
</ol>

<a name="device.graphics.adapterrender.d3d12astc"></a>
## Device.Graphics.AdapterRender.D3D12ASTC

### Device.Graphics.AdapterRender.D3D12ASTC.CoreRequirement

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

Display drivers for Direct3D12 must meet all requirements with sufficient performance defined in the Direct3D 12 Specifications.

D3D12 drivers that implement ASTC LDR support must support sampling from all 2D ASTC formats. ASTC formats are not individually supportable, and thus must all be support for ASTC to be considered supported. Here are a list of all ASTC formats that must be support for ASTC LDR Support to be valid: (All formats have \_TYPELESS, and \_SRGB equilovants.)

 - DXGI\_FORMAT\_4X4
 - DXGI\_FORMAT\_5X4
 - DXGI\_FORMAT\_5X5
 - DXGI\_FORMAT\_6X5
 - DXGI\_FORMAT\_6X6
 - DXGI\_FORMAT\_8X5
 - DXGI\_FORMAT\_8X6
 - DXGI\_FORMAT\_8X8
 - DXGI\_FORMAT\_10X5
 - DXGI\_FORMAT\_10X6
 - DXGI\_FORMAT\_10X8
 - DXGI\_FORMAT\_10X10
 - DXGI\_FORMAT\_12X10
 - DXGI\_FORMAT\_12X12

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.adapterrender.d3d12conservativerasterization"></a>
## Device.Graphics.AdapterRender.D3D12ConservativeRasterization

### Device.Graphics.AdapterRender.D3D12ConservativeRasterization.CoreRequirement

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

Display drivers for Direct3D12 must implement DDIs related to Conservative Rasterization, with allowance for tiers of functionality:

 - Uncertainty Range:
 - Inner Coverage
 - Post-snap degenerate culling
 - Other Pipeline Interactions:
 - TIR
 - MSAA
 - SampleMask w/ Inner Coverage
 - Clip Distance
 - Queries
 - oMask
 - HelperPixel coverage
 - Attribute Interpolation (extrapolation)
 - Early Z w/ Depth Extrapolation

For additional details, refer to the [Conservative Rasterization spec](http://windowsteams/devx/GRFX/d3d/D3D%20Next%20Design/MQ%20Planning%20Documents/Conservative%20Rasterization%20-%20Unified%20Spec.docx?web=1).

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.adapterrender.d3d12core"></a>
## Device.Graphics.AdapterRender.D3D12Core

*D3D 12 core feature *

### Device.Graphics.AdapterRender.D3D12Core.CoreRequirement

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

**Description:**

<p>Display drivers for Direct3D12 must meet all requirements defined in the <strong><em>Direct3D 12 Specifications</em></strong>.</p>

<ol style="list-style-type: decimal">
<li><p><strong>User Heaps</strong></p>
<p>The GPU must read and write data to and from memory pages. When such pages are accessible by the CPU, they must be able to be marked as write-back or write-combine for the CPU.</p>
<p>The driver must honor write-combine requests to efficiently operate with other adapters and engines on the system. GPUs must fully support the other page properties orthogonally.</p>
<p>The GPU must be able to read and write single-dimensional buffer data &amp; multi-dimensional texture data to and from such pages for all GPU operations. However, restrictions and undefined behavior exists and is explained in the specification.</p>
<p>It is acceptable for resources and heaps to be mapped while the GPU is actively reading or writing from such pages. Please refer the DDI specification for details on the GPU read write operations</p>

<blockquote>
<p>GPUs capable of I/O coherence must use it when write-back is required or chosen for pages that reside in physical system memory.</p>

<p>Data typically associated with buffers and pitch-linear texture data operations are required to be aligned properly for consumption by the GPU. Both buffer and pitch-linear data may reside next to each other and even overlap.</p>
</blockquote>

<p>Pitch-linear requirements &amp; restrictions are as follows:</p>

<ul>
<li><p>Only a single 3D subresource, at a time, is required of pitch-linear/ row-major copying.</p></li>
<li><p>Only a single 2D subresource, at a time, is required of pitch-linear/ row-major sampling, rendering.</p></li>
<li><p>The base address/ offset of pitch-linear texture data must be 512-byte aligned or less.</p></li>
<li><p>The width stride must be 128-byte aligned, or less, for all texel element sizes. The width stride is 32-bit and can be much greater than the tightest stride that is correctly aligned for a particular texture width.</p></li>
<li><p>Arbitrary height, up to the D3D maximum, is supported orthogonally.</p></li>
<li><p>For volume textures, the depth stride is height times width stride.</p></li>
<li><p>Compressed render targets must be able to be resolved to enable the CPU to read/ write the texels.</p></li>
</ul>
<p>Buffer alignment restrictions are not changed over D3D11:</p>
<ul>
<li><p>Constant data reads must be a multiple of 256 bytes from the beginning of the heap (i.e. only from addresses that are 256-byte aligned), or less.</p></li>
<li><p>Index data reads must be a multiple of the index data type size (i.e. only from addresses that are naturally aligned for the data), or less.</p></li>
<li><p>Draw*Indirect data must be from offsets that are multiples of 4 (i.e. only from addresses that are DWORD aligned), or less.</p></li>
</ul>

<ul>
  <li>
    <p>When the GPU supports standard swizzle, the GPU must support all multi-dimensional operations as orthogonally as other textures, such as texture from, render to, copy to &amp; from, re-swizzle to &amp; from, etc.</p>
	<ul>
		<li><p>Element size for block-compressed formats and ASTC formats must be same as the block size.</p></li>
		<li><p>GPU must support standard swizzle from all engines, including scan-out.</p></li>
		<li><p>Compressed render targets must be able to be resolved to enable the CPU to read/ write the texels.</p></li>
		<li><p>Standard swizzle data must be aligned to 4KB and 64KB page boundaries.</p></li>
	</ul>
  </li>
  <li>
	<p>The GPU must not require texture alignment greater than 64KB, except for MSAA resources with sample count greater than 1.</p>
  </li>
  <li>
    <p>Support page-based virtual addressing of physical memory from all engines on the GPU.</p>
    <ul>
	  <li>
	    <p>When the GPU supports GPU virtual addressing with proper security boundaries to allow user mode modification, it must be supported from all engines to realize its full benefit.</p>
	  </li>
    </ul>
  </li>
</ul>
</li>

<li><p><strong>Resource Binding:</strong></p>
<p>Display drivers for the Direct3D 12 API must implement DDIs related to object descriptors and descriptor heap (as follows), with allowance for tiers of functionality:</p>
<ul>
<li><p>Capability Query about Resource Binding Tiers</p></li>
<li><p>Descriptor Heaps</p></li>
<li><p>Setting Descriptor Heaps</p></li>
<li><p>Creating Descriptors</p></li>
<li><p>Copying Descriptors</p></li>
<li><p>Creating a Root Table Layout</p></li>
<li><p>Setting a Root Table Layout</p></li>
<li><p>Setting Descriptor Tables on the Root Table</p></li>
<li><p>Setting Constants on the Root Table</p></li>
<li><p>Setting Descriptors on the Root Table (Bypassing Descriptor Heap/Tables)</p></li>
<li><p>Setting IA/VB/SO/RT/DS Descriptors On A Command List / Bundle</p></li>
<li><p>View Manipulation</p>
<p>Please see sections of “Levels of Hardware Support” and “DDI” in the D3D12 Resource Binding - Functional Spec for more details.</p></li>
</ul></li>

<li><p><strong>High Performance Timing Data:</strong></p>
<p>“High Performance Graphics Timing Data” provides light weight and highly detailed timing data for graphics workloads. This data is used by analysis tools to identify performance or other graphics related issues in Windows applications or the graphics stack.</p>

<ul>
<li><p>A WDDM1.3 driver must ensure that the graphics device/driver provides the following:</p></li>
<li><p>A high resolution GPU Timer</p></li>
<li><p>12.5 MHz (80ns resolution) or better.</p></li>
<li><p>At least 32 bits of timestamp resolution</p></li>
<li><p>The GPU timestamp can be sampled for all engines in a GPU</p></li>
<li><p>The GPU timestamp can be sampled at the end of the GPU pipeline</p></li>
<li><p>The GPU timestamp frequency can be sampled.</p></li>
<li><p>The GPU timestamp is invariant and is unaffected by p-state transitions.</p></li>
<li><p>Among the other changes for this feature, this will include the addition of two new flags to the existing DdiControlEtwLogging interface; when these flags are set so that the first flag is value of 1 and the second flag is a value of 0, then the driver must ensure that:</p></li>
<li><p>All engine components must ensure that they are never clock- or power-gated as long as the flag remains enabled, and must in general refrain from entering any idle states. The components must remain active to ensure there is no latency added due to power transitions.</p></li>
<li><p>All engine components must ensure that their processing frequencies and functional bus bandwidths are kept at their maximum stable operating values. Thermal events requiring P-State transition down should still occur to prevent damage to the hardware, but P-States should be defined so that these are exceptional occurrences that are not normally seen in cool lab environments.</p></li>
<li><p>The sampled GPU timestamp can be correlated with previously issued graphics commands</p></li>
<li><p>A D3D12 driver must be able to sample a beginning of pipeline stamp in addition to an end of pipeline timestamp. The time on the beginning of pipeline timestamp must be from when the GPU begins execution of a correlated graphics command on its processing units it uses to execute the command.</p></li>
<li><p>Generation of timing data is off by default, but can be turned on and off at any time.</p></li>
<li><p>The overhead of collecting this performance data is no slower than using the timestamp query technique that is already available in D3D9 and D3D10+</p></li>
<li><p>Timing data can be collected in direct command lists and bundles. Timing data can be enabled/disabled on a per-command list basis.</p></li>
<li><p>Resulting data on Tile based deferred rendering hardware appears as if it was generated on an immediate mode rendering device.</p></li>
</ul>
</li>

<li><p><strong>Timestamp Queries:</strong></p>
<ul>
<li><p>A straightforward mapping of D3D11 UAV counters, stream-output counters, and queries to the D3D12 API constructs must produce results that pass the relevant D3D11 HLK tests.</p></li>
<li><p>D3D12 drivers must implement the new binary occlusion query correctly.</p></li>
<li><p>A GPU page fault must occur when a shader accesses a non-existent UAV counter.</p></li>
<li><p>Shader dynamic indexing of UAV counters must work correctly</p></li>
<li><p>Timestamp queries must work on 3D and compute command queues.</p></li>
<li><p>Predication must work correctly for all rendering operations (including those contained in a bundle)</p></li>
<li><p>Stream-output, UAV counters, and predication buffers must work correctly with all D3D12 resource heap types.</p></li>
</ul>
</li>

<li><p><strong>Indirect Rendering:</strong></p>
<ul>
<li><p>A D3D12 driver must implement GPU drawing/dispatch from indirect agument buffers.</p></li>
<li><p>Rendering with an aribtrary indirect argument buffer should produce the same results as the equivalent set of D3D12 command list API calls.</p></li>
<li><p>Indirect argument buffers must be supported in all D3D12 heap types.</p></li>
<li><p>Aribtrary byte strides (which are multiples of 4) between per-draw structures must be supported.</p></li>
<li><p>A single command list which both generates an indirect argument buffer and consumes it must work correctly (drivers must synchronize properly).</p></li>
<li><p>D3D12 drivers must program the GPU to compute the minimum of the MaxDrawCount passed to the driver, and the DrawCount passed in an indirect argument buffer.</p></li>
</ul>
</li>

<li><p><strong>Pipeline State Caching:</strong></p>

<ul>
<li><p>A D3D12 driver must implement DDIs for retrieving hardware-native shader code for a pipeline state object, and DDIs for reconstructing pipeline states from this cached shader code.</p></li>
<li><p>Any pipeline state that can be constructed at the API must be cacheable, including compute pipelines.</p></li>
<li><p>Using a pipeline state constructed from cached shader code must produce identical rendering results compared to one produced from HLSL-compiled bytecode.</p></li>
</ul>
</li>

</ol>


Business Justification:

All display drivers which implement the D3D12 DDI must do so in a consistent manner.  This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.


<a name="device.graphics.adapterrender.d3d12multiadapter"></a>
## Device.Graphics.AdapterRender.D3D12Multiadapter

### Device.Graphics.AdapterRender.D3D12Multiadapter.CoreRequirement

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

**Description:**

Display drivers for Direct3D12 must meet all requirements with sufficient performance defined in the 

**Direct3D 12 Specifications**.

D3D12 display drivers must support cross-adapter shared surfaces as described in the Direct3D 12 Specifications.

If the driver runs on linked display adapters then the Direct3D 12 linked adapter functionality is required.

Note: This feature is Mandatory for a driver claiming to be D3D12 compliant driver.

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.adapterrender.d3d12rasterizerorderedviews"></a>
## Device.Graphics.AdapterRender.D3D12RasterizerOrderedViews

### Device.Graphics.AdapterRender.D3D12RasterizerOrderedViews.CoreRequirement

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

Display drivers for Direct3D12 must implement DDIs related to Raster Order Views:

 - Correct ordering of operations on all RasterizerOrdered\* types

For additional details, refer to the [ROV spec](http://windowsteams/devx/GRFX/d3d/D3D%20Next%20Design/MQ%20Planning%20Documents/ROVs%20-%20Unified%20Spec.docx?web=1).

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.adapterrender.d3d12stencilreference"></a>
## Device.Graphics.AdapterRender.D3D12StencilReference

### Device.Graphics.AdapterRender.D3D12StencilReference.CoreRequirement

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

**Description**:

Display drivers for Direct3D12 must implement DDIs related to Pixel Shader Stencil Reference:

 - Writes to SV\_STENCILREF function as expected

For additional information, refer to the [PS-Specified Stencil Ref spec](http://windowsteams/devx/GRFX/d3d/D3D%20Next%20Design/MQ%20Planning%20Documents/PS-Specified%20Stencil%20Reference%20Value%20-%20Unified%20Spec.docx?web=1).

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.adapterrender.d3d12typeduavloads"></a>
## Device.Graphics.AdapterRender.D3D12TypedUAVLoads

### Device.Graphics.AdapterRender.D3D12TypedUAVLoad.CoreRequirement

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

Display drivers for Direct3D12 must implement DDIs related to Typed UAV Loads:

 - Support typed load for all required UAV formats if typed UAV load flag is set
 - Support typed load for optionally declared types

For more information, refer to the <a href="http://windowsteams/devx/GRFX/d3d/D3D Next Design/MQ Planning Documents/UAV Typed Load Draft Specification.docx?web=1">Typed UAV Loads</a> spec.


**Business Justification**

All display drivers which implement the D3D12 DDI must do so in a consistent manner.  This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.


<a name="device.graphics.adapterrender.d312volumetiledresources"></a>
## Device.Graphics.AdapterRender.D312VolumeTiledResources

### Device.Graphics.AdapterRender.D3D12VolumeTiledResources.CoreRequirement

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

**Description**:

Drivers reporting support for Volume Tiled Resources (via exposing Tiled Resources Tier 3) must conform to the specifications for this feature outlined in the D3D IHV specs. An example of an interesting spec detail for Volume Tiled Resources is the required tile shapes for various surface formats when used in a Volume Tiled Resource. All other behaviors for this feature fall under the general specifications for tiled resources in general, as well as volume textures in general – as this feature is the intersection of the two.

**Business Justification:**

All display drivers which implement the D3D12 DDI must do so in a consistent manner. This enables the D3D12 API to have a consistent behavior across many platforms, which reduces the cost to ISVs of developing 3D applications on PC/Tablet/Phone/XBOX platforms.

<a name="device.graphics.indirectdisplay.wired"></a>
## Device.Graphics.IndirectDisplay.Wired

*Display feature requirements for wired indirect displays.*

### Device.Graphics.IndirectDisplay.Wired.Base

*Requirements for a wired indirect display.*

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

An indirect display is a display device (e.g., monitor) connected to a remote Indirect Display device that receives the image from a user mode driver conforming to Microsoft's Indirect Display framework on the sender system, performs some processing and then displays the image on the monitor.

On sender system the display image needs CPU interaction in order to be processed and transmitted to the Indirect Display device. This CPU interaction may be direct manipulation of the image or just programming hardware to process the image.

Some examples are, but not limited to, universal docking stations, USB display dongles and Monitors with USB display capabilities. 

**Common Indirect Display DDIs **

Indirect displays must implement all required DDI’s listed for indirect display drivers in the WDK.

**Requirements:**

**UMDF and DevFund Requirements:** An indirect display driver must be a UMDF driver and must adhere to all pertanent Device Fundemental requirements. The following DevFund Driver Framework UMDF requirements must be met, but not limited to.

-   Device.DevFund.DriverFramework.UMDF

    -   Device.DevFund.DriverFramework.UMDF.Reliability

    -   Device.DevFund.DriverFramework.UMDF.WDFProperINF

**Graphics Requirement:** Indirect display drivers must adhere to the follow graphics requirements.

-   Device.Graphics.AdapterBase.PowerManagementCompliance - This should come from the USB Req

-   Device.Graphics.AdapterBase.Symbols

-   Device.Graphics.WDDM.Display.GammaCorrection – (optional requirement)

-   Device.Graphics.WDDM.Display.I2CSupport – (optional requirement)

-   Device.Graphics.WDDM.Display.Multimon

-   Device.Graphics.WDDM12.Display.ContainerIDSupport

-   Device.Graphics.WDDM12.Display.ModeEnumeration

-   Device.Graphics.WDDM.DisplayRender.OutputProtection

HDCP support is optional but the device must implement OPM and have an appropriate OPM certificate.

<a name="device.graphics.wddm"></a>
## Device.Graphics.WDDM

*The base feature set implemented by drivers supporting all versions of the WDDM.*

### Device.Graphics.WDDM.Base

*Graphics drivers must be implemented per the WDDM 1.0 spec.*

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

As implied by the WDDM 1.0 Specification, display drivers must minimally support D3D9 and Pixel Shader 2.0.

WDDM 1.0 introduces the following key requirements:

-   User-mode Display Driver
-   Video Memory Manager
  - (p1) Linear Memory Manager
  - (p1) Rectangular Memory Manager
-   GPU Scheduler
-   Mode-Switch Architecture Cleanup
-   Merged Miniport and DLL
-   Recovery from Hardware Hangs
-   Simplified Kernel-mode Objects
-   Legacy DDI Consolidation
-   Hot-plug of Display Cards, Hot Docking, and Support for "Clone View"

**MSDN documentation is updated based on the WDDM 1.0 Specification. Please verify MSDN documentation for WDDM 1.0 requirements.**

### Device.Graphics.WDDM.Checklist

*All graphics devices must comply with base requirements checklist for graphics cards, chipsets, and drivers.*

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

All graphics cards must adhere to the following checklist:
**Memory Allocations and Access** (applicable for all form factors)

-   The GPU must not access an allocation after the last DMA buffer that was submitted to the GPU referencing that allocation, is reported as complete.

-   The GPU must not access any allocations that were not specified in the allocation list associated with the DMA buffer being executed.

**Card/Chipset Requirements** (not applicable for server devices)

-   For a multi-headed display adapter, it is recommended that the display adapter expose all display resources through a single function and not as a multifunction device. If a sound controller or tuner is part of the device, the device can then be exposed as a multifunction device.

<!-- -->

-   If a second display class function is exposed for legacy compatibility, the adapter must be fully functional without using the second head. The second (or additional) functional heads must:

<!-- -->

-   Have sub-class 80 (other) to avoid a generic driver being used.

-   Not have an expansion ROM.

-   Not describe more than 1 MB of total memory space resources.

-   Not duplicate the frame buffer resources.

-   Not describe any interrupt resources.

-   Not describe any I/O space resources.

-   Non display base class functions on the same device, such as a multimedia device class, sub class video device, or sub class audio device, are not subject to these restrictions.

**WDDM Driver Checklist** (not applicable for non-WDDM drivers)

-   WDDM drivers must not report a submission fence as completed until the operation for the associated submission is truly completed. This is required by the scheduling model in WDDM. The WDDM must not use the DDI in such a way that the stability of Windows is compromised.

-   WDDM drivers must insert a fence/interrupt pair for each fence requested and must not hold off reporting the completion of that fence. The fence must be reported as soon as the associated required interrupt is generated by the GPU. For example, it must not wait until the timer interrupt or until the next VSync. This is required by the Scheduling model in DDM.

-   WDDM drivers must not wait or block during DdiSubmitCommand, which is necessary from the perspective of the Video Scheduler in WDDM. The driver must not wait or block during a DdiBuildPagingBuffer call as well.

-   The WDDM driver must not expose more than one node per physical engine. The driver and GPU cannot schedule a single physical engine between multiple nodes.

-   The WDDM driver must not map a virtual address to video memory that is directly exposed to an application. This is fundamental to the implementation of video memory management support in the WDDM driver. The WDDM driver must not hide or expose video memory in a way that the video memory manager is unaware of.
    Exceptions to this are allowed specifically for the implementation of GPU Developer Tools (Debuggers, Profilers, …).  Such an exception must apply only in a scenario where the GPU developer tools, in order to perform, need to map video memory to virtual address space, for the duration of the session and only for the process of the application being operated on.

-   The WDDM driver must not expose any memory segments that are used for the sole purpose of reporting additional video memory than is actually present for its appropriate use. The correct amount of video memory must be reported for use by various applications through Windows. The WDDM driver can use up to 5% of the system memory for internal use such as cursor bitmaps, ring buffer, etc; any amount above this must not be used to hide or expose video memory in a fashion such that the video memory manager is unaware of.

-   A WDDM driver must use ACPI for all interactions with the system BIOS. SMI is currently allowed, but is highly discouraged by Microsoft. See WinHEC 2005 presentation, *TWAR05007.*

*Design Notes*

For more information on any of the items in the Details section, refer to the Windows Driver Kit and search for the relevant keywords.

### Device.Graphics.WDDM.GPUFenceCommands

*A GPU that is capable of processing fence commands in the command queue must trigger an interrupt to the CPU when it consumes a fence command.*

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

When the hardware consumes a fence command, it must notify the operating system by triggering an interrupt to the CPU, with the fence ID communicated to the ISR.

*Design Notes*

See the Windows Driver Kit

<a name="device.graphics.wddm.display"></a>
## Device.Graphics.WDDM.Display

*The base feature set implemented by drivers supporting all versions of the WDDM Display DDIs.*

### Device.Graphics.WDDM.Display.Base

*Graphics drivers must be implemented per the WDDM 1.0 specification.*

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

See requirement **Device.Graphics.WDDM.Base**
 

### Device.Graphics.WDDM.Display.GammaCorrection

*A graphics adapter must support gamma correction in hardware without using any additional graphics memory bandwidth.*

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

ICM uses the ability to perform gamma correction for the attached monitor and to allow game applications to switch palettes. This capability also supports transition effects in applications. To support ICM, the display adapter or chipset gamma must be programmatically adjustable.

To perform gamma correction in hardware, downloadable RAM DAC entries (LUT) must be included.

The LUT must implement at least 256 entries per component input for 8-bit color channel components. Hardware may implement the LUT for larger component resolutions by using interpolation if at least 128 sample points are used.

This ability must be supported without requiring the use of graphics memory bandwidth. This ability must be supported for RGBA8888 and RGBA1010102 pixel formats.
 

### Device.Graphics.WDDM.Display.HotPlugDetection

*A graphics adapter must reliably detect the connect and disconnect event of display devices.*

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

Windows supports two levels of display detection - interruptible and poll-able.

-   Interruptible is defined as the case where the graphics adapter is able to automatically detect a change in display connectivity and report it to Windows. The ability of the hardware to automatically generate an interrupt for display connectivity change is called Hot Plug Detect (HPD). The HPD must not cause any visual corruption on any display already connected to the system.

-   Poll-able is defined as the case where Windows has to explicitly query the graphics adapter to query for a change in the display connectivity. In some cases, visual corruption might be displayed for a very brief time.

  
All standard digital connectors (DisplayPort, HDMI, DVI) support HPD and the graphics adapter must report these connectors as interruptible. Once the hardware generates the interrupt, the graphics adapter must notify Windows via the DxgkCbIndicateChildStatus DDI found here: <http://msdn.microsoft.com/en-us/library/ff559522.aspx>.

Analog connectors (HD-15, S-Video, Component, Composite) are not required to support interruptible display detection. However, it is possible that HPD can be implemented in the hardware (e.g., load sensing, I2C) for such connectors. In such a case, the graphics adapter must report this connector as interruptible as above. Software polling cannot be used to achieve HPD functionality for analog connectors.

For those analog connectors, where HPD is not implemented in the hardware, the graphics adapter must report the connector as polled. In such a case, the graphics adapter must only perform detection on the connector when explicitly requested by Windows via the D3DKMTPollDisplayChildren DDI, found here: <http://msdn.microsoft.com/en-us/library/ff547077.aspx>.

*Design Notes*

See the Windows Driver Kit: <http://msdn.microsoft.com/en-us/library/ff559522.aspx> for " DxgkCbIndicateChildStatus."

The following HPD methods are VESA standards: DVI HPD is covered in the VESA Plug and Play (PnP) Standard for the Display/Graphics Subsystem, Release A. DisplayPort HPD is covered in all versions of the DisplayPort standard.

### Device.Graphics.WDDM.Display.I2CSupport

*A graphics device driver must have I2C support in WDDM.*

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

The following is the set of interfaces that every WDDM driver is required to implement for I2C support:

 - DxgkDdiI2CReceiveDataFromDisplay
 - DxgkDdiI2CTransmitDataToDisplay

These interfaces are documented in the WDK and can be found here: <http://msdn.microsoft.com/en-us/library/ff567386.aspx>.


### Device.Graphics.WDDM.Display.Multimon

*If a graphics adapter supports more than 1 source and 1 target, it must support all multiple-monitor configurations in Windows.*

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

A graphics driver can enumerate sources and targets based on its capabilities. Windows queries the driver for the number of sources and targets by calling the DxgkDdiEnumVidPnCofuncModality DDI, found here <http://msdn.microsoft.com/en-us/library/ff559649.aspx>. Windows supports the following monitor configurations:

-   Single monitor configuration - Only one physical monitor is active and the entire desktop is displayed on it.

-   Extended monitor configuration - Multiple monitors are active in and different parts of the desktop are displayed on it. GDI must be made aware of the monitor boundaries such that Windows features like maximize, aero snap etc work according to spec.

-   Duplicate monitor configuration - The exact same desktop contents are displayed on multiple monitors.

The number of targets must always be greater than or equal to the number of sources.

If the driver enumerates exactly 1 source and 1 target, then no multiple monitor configurations are supported.

If the driver enumerates exactly 1 source and multiple targets, then the driver must support single monitor and duplicate monitor configurations.

If the driver enumerates multiple sources and multiple targets, then the driver must support all the supported configurations. Additionally:

-   The capability of each source when enabled by itsself, with respect to resolution, Direct 3D, protected content playback, should be the same. The capabilities of the target will vary based on the target type.

-   The operating system must be able to drive any target from any source, although the driver can constrain which targets can be driven in combination.

Multiple-monitor support is built into Windows; therefore, graphics drivers must not include any special code to provide support already available in the OS.

It must be possible for a user to set all the configurations supported using the Windows Display Control Panel and by pressing the Win+P key combination.

<a name="device.graphics.wddm.displayrender"></a>
## Device.Graphics.WDDM.DisplayRender

*The base feature set implemented by drivers supporting all versions of the WDDM for both Display and Render DDIs.*

### Device.Graphics.WDDM.DisplayRender.Base

*Graphics drivers must be implemented per the WDDM 1.0 specification.*

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

See requirement **Device.Graphics.WDDM.Base**

### Device.Graphics.WDDM.DisplayRender.DriverSetupCompatible

*Graphics drivers must be implemented per the WDDM 1.0 specification.*

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

All WDDM graphics drivers being submitted for posting to Windows Update targeting Windows Client SKUs must install correctly on injection into the Windows OS image driver store during OS setup.

### Device.Graphics.WDDM.DisplayRender.OutputProtection

*A display adapter must support output connectors with content protection features and provides control via Protected Media Path-Output Protection Manager (PVP-OPM) and Certified Output Protection Protocol (COPP).*

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

To enable the playback of premium video content, digital video outputs must support a digital monitor link protection mechanism such as HDCP to obtain Windows 8 Client Logo. This requirement is applicable for all full graphics devices.

The OPM API and Media Foundation PMP require display drivers to properly implement the OPM DDIs to handle premium content. High grade premium content will not be passed to the display driver unless the display driver has a PVP-OPM certificate. Drivers that support the OPM DDIs must have a driver certificate to testify that the compliance rules, robustness rules, and terms of the PVP-OPM legal agreement, have been met.
The display driver must support both the COPP\* and PVP-OPM driver interfaces for controlling and signaling video output protection state.

Output protection behaviors are specified by the PVP-OPM compliance rules.  The document is available to graphics vendors by request to wmla@microsoft.com.

The WDDM driver must implement the necessary Display Mode Management DDIs and structures as documented in the Windows Driver Kit and the WDDM documentation to enable TV playback and Analog Content Protection (ACP) support for Media Center\*.

D3DKMDT\_VIDPN\_PRESENT\_PATH\_CONTENT: Media center will use this information to change the TV mode (TV\_PLAYBACK vs. WIN\_GRAPHICS)

D3DKMDT\_VIDPN\_PRESENT\_PATH\_COPYPROTECTION\_TYPE and D3DKMDT\_VIDPN\_PRESENT\_PATH\_COPYPROTECTION\_SUPPORT: These structures are necessary to provide ACP support through the LDDM driver.

S-Video and composite video output interfaces must support the following:

 - CGMS-A on Line 20 as specified by IEC 61880
 - CGMS-A on Line 21 as specified by EIA-608-B

Component (YPbPr) outputs must support the following:

 - CGMS-A with redistribution control as specified by EIA-805

When the TV-out interface is enabled, the display driver must expose a 720x480 60-Hz display mode and/or a 720x576 50-Hz display mode. These display modes must be exposed by the video miniport and added to the default timings list for Windows applications to set when connected to a standard definition TV.

Supports SDTV Modes:<br/>
The WDDM miniport driver must set this parameter to TRUE for the video output to expose SDTV modes like NTSC, PAL, or SECAM.

Cable Ready systems with CableCARD support with digital video outputs (for example HDMI, or DP) must support a CableLabs approved digital monitor link protection mechanism such as HDCP.

 
*Design Notes*

-   S-Video and composite video output interfaces may be implemented through the same connector. If a proprietary interface is used, an adapter must be made available either included with the system or available for purchase at point of sale. A system or device that uses 7-pin S-Video connectors is not required to provide an adapter so long as the first four pins on the 7-pin connector are electrically compatible with a standard 4-pin S-Video connector. Microsoft recommends including SCART output when appropriate for the region of sale.

-   \* COPP, ACP, CGMS-A, analog TV-out, and SDTV support are required on x86 and x64 architectures and operating systems only.

### Device.Graphics.WDDM.DisplayRender.Stability

*All WDDM graphics drivers must not generate any hangs or faults under prolonged stress conditions.*

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

Graphics drivers must function properly, and not generate any hangs or faults throughout the duration of stress testing as specified in the "4-hour WDDM Profile".

To "stress" a graphics driver, Comparative Reliability Analyzer for Software and Hardware (CRASH) launches and terminates other test applications to simulate real-world scenarios.

<a name="device.graphics.wddm.render"></a>
## Device.Graphics.WDDM.Render

*The base feature set implemented by drivers supporting all versions of the WDDM Render DDIs.*

### Device.Graphics.WDDM.Render.Base

*Graphics drivers must be implemented per the WDDM 1.0 specification.*

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

See requirement **Device.Graphics.WDDM.Base**

### Device.Graphics.WDDM.Render.VideoDecoding

*Display drivers must support the DirectX VA 2.0 Video Decoder DDI.*

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

Display WDDM drivers must support the following DXVA 2.0 Video Decoder DDI.

WDDM drivers must support the following DXVA modes:

-   DXVA\_ModeH264\_VLD

-   DXVA2\_ModeVC1\_D OR DXVADDI\_ModeVC1\_D2010

If hardware supports acceleration for MPEG2, WDDM drivers support at least one of the following sets of MPEG2 GUIDs:

-   DXVA2\_ModeMPEG2\_VLD and DXVA2\_ModeMPEG2\_iDCT

-   DXVA2\_ModeMPEG2\_VLD and DXVA2\_ModeMPEG2\_MoComp

-   DXVA2\_ModeMPEG2\_iDCT

-   DXVA2\_ModeMPEG2and1\_VLD

If hardware supports acceleration for H.265, it must support HEVC/H.265 modes:

-   D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN

-   D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN10 (optional if hardware does not support Main10 profile)

It is highly recommended for drivers to support D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN10, as Main 10 is very common format for premium HEVC content.

If hardware supports acceleration for VPx, it must support VPx modes:

-   D3D11\_DECODER\_PROFILE\_VP8\_VLD

-   D3D11\_DECODER\_PROFILE\_VP9\_VLD\_PROFILE0

-   D3D11\_DECODER\_PROFILE\_VP9\_VLD\_PROFILE2 (optional if hardware does not support profile 2)

WDDM drivers must support DXGI\_FORMAT\_420\_OPAQUE and DXGI\_FORMAT\_NV12 as decoder output formats. NV12 is recommended for scenarios requiring shader interop. For HEVC Main 10, drivers must support DXGI\_FORMAT\_P010 as decoder output format.

If the display adapter supports hardware-accelerated decode of H.264, it must support either the DXVA\_ModeH264\_MoComp GUID or the DXVA\_ModeH264\_VLD GUID.

If the display adapter support hardware accelerated decode of HEVC, it must support the DXVA\_ModeHEVC\_VLD\_Main GUID.

Finally, WDDM drivers must support Standardized AES 128 H.264\*\*\* and MPEG2, if MPEGE2 acceleration is supported.

*Design Notes*

\*\*\* Standardized AES 128 support is required on x86 and x64 architectures and operating systems only.

### Device.Graphics.WDDM.Render.VideoProcessing

*A display WDDM driver must support the DirectX VA 2.0 Video Processor DDI.*

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

If implemented, display WDDM drivers must support the DXVA 2.0 Video Processor DDI and implement support for the following Video Processor Device GUIDs:

-   DXVADDI\_VideoProcProgressiveDevice
-   DXVADDI\_VideoProcBobDevice

The following DXVA2 video processor caps must be supported for each of the video processor device GUIDs:

-   DXVADDI\_VIDEOPROCESS\_YUV2RGB
-   DXVADDI\_VIDEOPROCESS\_YUV2RGBEXTENDED
-   DXVADDI\_VIDEOPROCESS\_STRETCHX
-   DXVADDI\_VIDEOPROCESS\_STRETCHY
-   DXVADDI\_VIDEOPROCESS\_SUBRECTS
-   DXVADDI\_VIDEOPROCESS\_SUBSTREAMS
-   DXVA2\_VideoProcess\_SubStreamsExtended
-   DXVA2\_VideoProcess\_Constriction

In addition, to support DXVADDI\_VIDEOPROCESS\_YUV2RGBEXTENDED caps, the following color parameters must be supported when color-space converting from a YUV surface to a RGB surface:

-   D3DDDIARG\_VIDEOPROCESSBLT.DestFormat.NominalRange

    -   DXVADDI\_NominalRange\_Unknown (should be interpreted as 0\_255 if a sophisticated algorithm is not implemented)
	
    -   DXVADDI\_NominalRange\_0\_255
	
    -   DXVADDI\_NominalRange\_16\_235

-   D3DDDIARG\_VIDEOPROCESSBLT.pSrcSurfaces\[\].SampleFormat.VideoTransferMatrix

    -   DXVADDI\_VideoTransferMatrix\_Unknown (should be interpreted as BT601 unless the source surface is greater than 576 height in which case should be interpreted as BT709)

    -   DXVADDI\_VideoTransferMatrix\_BT709

    -   DXVADDI\_VideoTransferMatrix\_BT601

The following YUV formats must be supported as the video stream:

-   YUY2 - 8-bit packed 4:2:2
-   NV12 - 8-bit planar 4:2:0

If the video processor supports a 10-bit YUV subsampling, the following corresponding format must be supported:

-   Y210 - 10-bit packed 4:2:2
-   Y410 - 10-bit packed 4:4:4
-   P210 - 10-bit planar 4:2:2
-   P010 - 10-bit planar 4:2:0

If the video processor supports 16-bit YUV formats, the following formats must be supported:

-   Y216 - 16-bit packed 4:2:2
-   Y416 - 16-bit packed 4:4:4
-   P216 - 16-bit planar 4:2:2
-   P016 - 16-bit planar 4:2:0

The following YUV format must be supported as the video sub-streams:

-   AYUV - 8-bit packed 4:4:4

For these formats, color converting YUV-to-RGB blits run through the VideoProcessBlt function must at least be able to use BT. 601 and BT. 709 conversion matrices. This process allows the graphics to switch between the YUV-to-RGB matrix transforms for different color formats, to ensure proper handling of video that originates from different standard color spaces such as those defined in ITU-R Recommendations BT. 601 and BT.709, is required.

Tolerance threshold: 50dB of quality difference between reference and DXVAHD modes

-   Color conversion support of the following for playback, transcode and capture scenarios:

    -   NV12-&gt;ARGB32
    -   YUY2-&gt;ARGB32
    -   ARGB32-&gt;NV12 (both full-swing and studio-swing)
    -   420O-&gt;NV12
    -   420O-&gt;ARGB32
    -   AYUV-&gt;NV12

-   Rescaling support for the above conversions

-   Rotation support

-   Extended Range (Full-Swing) support for transcode and capture scenarios

Support for updated DX9 and DX10+ user mode DDIs as documented on Connect at: <https://connect.microsoft.com/site1304/Downloads/DownloadDetails.aspx?DownloadID=47236>.

<a name="device.graphics.wddm11"></a>
## Device.Graphics.WDDM11

*The base feature set implemented by drivers supporting WDDM 1.1.*

### Device.Graphics.WDDM11.Base

*A graphic driver that is written for a discrete graphic adapter or an integrated graphics adapter device must meet all requirements defined in the WDDM 1.1 specifications.*

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

WDDM 1.1 introduces the following key requirements over WDDM 1.0:

-   Hardware acceleration of select GDI features.

-   Implementation of DMM DDIs for Connecting and Configuring Displays

-   Support for 32-bit BGRA pixel format compatible with GDI. (Through DirectX10 and later DDIs.)

-   Provide additional information to aid in debugging VSync TDRs.

-   Kernel mode drivers must be compiled with Frame Pointer Optimizations (FPO) disabled.

-   Optional features, if implemented, must be incorporated according to the specifications and WDK documentation, including Standardized AES128, DXVA-HD, overlays, and Direct3D11.

**MSDN documentation is updated based on the WDDM 1.1 Specification. Please consult MSDN documentation for WDDM 1.1 requirements.**

<a name="device.graphics.wddm11.display"></a>
## Device.Graphics.WDDM11.Display

*The base feature set implemented by drivers supporting all versions of the WDDM Display DDIs.*

### Device.Graphics.WDDM11.Display.Base

*A graphic drivers that is written for a discrete graphic adapter or an integrated graphics adapter device must meet all requirements defined in the WDDM 1.1 specifications.*

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

See requirement **Device.Graphics.WDDM11.Base**

<a name="device.graphics.wddm11.displayrender"></a>
## Device.Graphics.WDDM11.DisplayRender

*The base feature set implemented by drivers supporting all versions of the WDDM for both Display and Render DDIs.*

### Device.Graphics.WDDM11.DisplayRender.Base

*A graphic driver that is written for a discrete graphic adapter or an integrated graphics adapter device must meet all requirements defined in the WDDM 1.1 specifications.*

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

See requirement **Device.Graphics.WDDM11.Base**

<a name="device.graphics.wddm11.displayrender.d3d9overlay"></a>
## Device.Graphics.WDDM11.DisplayRender.D3D9Overlay

*The optional feature implemented by WDDM 1.1 drivers and greater allowing for surfaces to be presented in a hardware overlay.*

### Device.Graphics.WDDM11.DisplayRender.D3D9Overlay.D3D9Overlay

*A WDDM1.1 driver must support Direct3D 9 overlays.*

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

If the WDDM1.1 driver supports Direct3D 9 overlays, the video overlay presentation requirements are as follows:

-   A WDDM v1.1 driver must set the D3DCAPS\_OVERLAY bit in the D3DCaps9.Caps field.

-   A WDDM v1.1 driver must support query type D3DDDICAPS\_CHECKOVERLAYSUPPORT to the user mode pfnGetCaps DDI call.

-   A WDDM v1.1 driver must support overlays in at least one valid configuration (Displaymode, OverlayFormat, Width, and Height) when called to DDICHECKOVERLAYSUPPORTDATA for supported overlay and the Max width and height of supported overlay must be greater than zero.

<a name="device.graphics.wddm11.render"></a>
## Device.Graphics.WDDM11.Render

*The base feature set implemented by drivers supporting all versions of the WDDM Render DDIs.*

### Device.Graphics.WDDM11.Render.Base

*A graphic driver that is written for a discrete graphic adapter or an integrated graphics adapter device must meet all requirements defined in the WDDM 1.1 specifications.*

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

See requirement **Device.Graphics.WDDM11.Base**

<a name="device.graphics.wddm11.render.dxvahd"></a>
## Device.Graphics.WDDM11.Render.DXVAHD

*The optional feature that is implemented by WDDM 1.1 drivers supporting the new state-based video processing DDIs.*

### Device.Graphics.WDDM11.Render.DXVAHD.DXVAHD

*WDDM1.1 driver supports DXVA-HD*

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

If the WDDM1.1 driver supports DXVA-HD, then the following input formats (D3DDDICAPS\_DXVAHD\_GETVPINPUTFORMATS) must be supported:

-   YUY2
-   AYUV
-   NV12
-   X8R8G8B8
-   A8R8G8B8

Also the driver must support the following output formats ( D3DDDICAPS\_DXVAHD\_GETVPOUTPUTFORMATS):

-   X8R8G8B8
-   A8R8G8B8



<a name="device.graphics.wddm12"></a>
## Device.Graphics.WDDM12

*The base feature set implemented by drivers supporting WDDM 1.2.*

### Device.Graphics.WDDM12.Base

*Graphics drivers must be implemented per the WDDM 1.2 specification.*

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
    <p>
        The WDDM v1.2 is a superset of WDDM 1.1, and WDDM 1.0.  <br />
        Below is a summary these WDDM versions:
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>Operating System</th>
                <th>Driver Models Supported</th>
                <th>D3D versions supported</th>
                <th>Features enabled</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Windows Vista</td>
                <td>
                    WDDM 1.0<br />
                    XDDM on Server and limited UMPC
                </td>
                <td>D3D9, D3D10</td>
                <td>Scheduling, Memory Management, Fault tolerance, D3D9 &amp; 10</td>
            </tr>
            <tr class="even">
                <td>Windows Vista SP1 / Windows 7 client pack</td>
                <td>
                    WDDM 1.05<br />
                    XDDM on Server 2008
                </td>
                <td>D3D9, D3D10, D3D10.1</td>
                <td>+ BGRA support in D3D10, D3D 10.1</td>
            </tr>
            <tr class="odd">
                <td>Windows 7</td>
                <td>
                    WDDM 1.1<br />
                    XDDM on Server 2008 R2
                </td>
                <td>D3D9, D3D10, D3D10.1, D3D11</td>
                <td>
                    GDI Hardware acceleration,<br />
                    Connecting and configuring Displays, DXVA HD, D3D11
                </td>
            </tr>
            <tr class="even">
                <td>Windows 8</td>
                <td>WDDM 1.2</td>
                <td>D3D9, D3D10, D3D10.1, D3D11, D3D11.1</td>
                <td>
                    Smooth Rotation,<br />
                    3D Stereo,<br />
                    D3D11 Video,<br />
                    GPU Preemption,<br />
                    TDR Improvements<br />
                    Diagnostic Improvements,<br />
                    Performance and Memory usage Optimizations,<br />
                    Power Management,<br />
                    etc.
                </td>
            </tr>
        </tbody>
    </table>

    <p>WDDM v1.2 also introduces new types of graphics drivers, targeting specific scenarios and is described below:</p>
    <ul>
        <li><p>WDDM Full Graphics Driver: This is the full version of the WDDM graphics driver that supports hardware accelerated 2D &amp; 3D operations. This driver is fully capable of handling all the render, display, and video functions. WDDM 1.0 and WDDM 1.1 are full graphics drivers. All Windows 8 client systems must have a full graphics WDDM 1.2 device as the primary boot device.</p></li>
        <li><p>WDDM Display Only Driver: This driver is only supported as a WDDM 1.2 driver and enables IHVs to write a WDDM based kernel mode driver that is capable of driving display only devices. The OS handles the 2D or 3D rendering using a software simulated GPU.</p></li>
        <li><p>WDDM Render Only Driver: This driver is only supported as a WDDM 1.2 driver and enables IHVs to write a WDDM driver that supports only rendering functionality. Render only devices are not allowed as the primary graphics device on client systems.</p></li>
    </ul>
    <p>Table below explains the scenario usage for the new driver types:</p>
    <table>
        <thead>
            <tr class="header">
                <th> </th>
                <th>Client</th>
                <th>Server</th>
                <th>Client running in a Virtual Environment</th>
                <th>Server Virtual</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Full Graphics</td>
                <td>Required as boot device</td>
                <td>Optional</td>
                <td>Optional</td>
                <td>Optional</td>
            </tr>
            <tr class="even">
                <td>Display Only</td>
                <td>Not allowed</td>
                <td>Optional</td>
                <td>Optional</td>
                <td>Optional</td>
            </tr>
            <tr class="odd">
                <td>Render Only</td>
                <td>Optional as non primary adapter</td>
                <td>Optional</td>
                <td>Optional</td>
                <td>Optional</td>
            </tr>
            <tr class="even">
                <td>Headless</td>
                <td>Not allowed</td>
                <td>Optional</td>
                <td>N/A</td>
                <td>N/A</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>WDDM v1.2 Feature caps</strong>
    </p>
    <p>The table below lists the requirements for a WDDM v1.2 driver to specify to Windows the WDDM Driver Type, version, and the feature caps (visible to dxgkrnl) that WDDM v1.2 drivers are required to set. If a driver has wrongfully claimed itself as &quot;WDDM v1.2&quot; or has implemented partial features (only some of the mandatory features), then it will fail to create an adapter and the system will fall back to the Microsoft Basic Display Driver.</p>
    <p><strong>WDDM Driver Requirements</strong></p>
    <table>
        <thead>
            <tr class="header">
                <th>WDDM driver type</th>
                <th>DDI requirements</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Full Graphics</td>
                <td>Implement all the Render-specific and the Display-specific required DDIs</td>
            </tr>
            <tr class="even">
                <td>Display-Only</td>
                <td>Implement all the Display-specific DDIs and return a null pointer for all the Render-specific DDIs</td>
            </tr>
            <tr class="odd">
                <td>Render-Only</td>
                <td>
                    Implement all the Render-specific DDIs and return a null pointer for all the Display-specific DDIs<br />
                    <strong>OR</strong><br />
                    Implement all the DDIs for a full WDDM driver but report DISPLAY_ADAPTER_INFO::NumVidPnSources = 0 and DISPLAY_ADAPTER_INFO::NumVidPnTargets = 0
                </td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>WDDM v1.2 Feature Caps</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>Feature</th>
                <th>WDDM Driver Type</th>
                <th>Feature Caps</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td> </td>
                <td> <strong>Full Graphics</strong></td>
                <td><strong>Render Only</strong></td>
            </tr>
            <tr class="even">
                <td>WDDM version</td>
                <td><strong>M</strong></td>
                <td><strong>M</strong></td>
            </tr>
            <tr class="odd">
                <td>Bugcheck and PnP Stop support for Non VGA</td>
                <td><strong>M</strong></td>
                <td><strong>NA</strong></td>
            </tr>
            <tr class="even">
                <td>Optimized screen rotation Support</td>
                <td><strong>M</strong></td>
                <td><strong>NA</strong></td>
            </tr>
            <tr class="odd">
                <td>GPU Preemption</td>
                <td><strong>M</strong></td>
                <td><strong>M</strong></td>
            </tr>
            <tr class="even">
                <td>FlipOnVSyncMmIo</td>
                <td><strong>M</strong></td>
                <td><strong>M</strong></td>
            </tr>
            <tr class="odd">
                <td>TDR Improvements</td>
                <td><strong>M</strong></td>
                <td><strong>M</strong></td>
            </tr>
            <tr class="even">
                <td>Optimizing the graphics stack to improve performance on sleep &amp; resume</td>
                <td><strong>O</strong></td>
                <td><strong>O</strong></td>
            </tr>
            <tr class="odd">
                <td>Stereoscopic 3D: New infrastructure to process and present stereoscopic content</td>
                <td><strong>O</strong></td>
                <td><strong>NA</strong></td>
            </tr>
            <tr class="even">
                <td>DirectFlip</td>
                <td><strong>M</strong></td>
                <td><strong>NA</strong></td>
            </tr>
            <tr class="odd">
                <td>GDI Hardware acceleration (This is a required WDDM v1.1 feature)</td>
                <td><strong>M</strong></td>
                <td><strong>M</strong></td>
            </tr>
            <tr class="even">
                <td>GPU power management of idle and active power</td>
                <td><strong>O</strong></td>
                <td><strong>O</strong></td>
            </tr>
        </tbody>
    </table>
</html>

<a name="device.graphics.wddm12.display"></a>
## Device.Graphics.WDDM12.Display

*Display feature requirements for all WDDM12 drivers that support the display specific DDIs*

### Device.Graphics.WDDM12.Display.Base

*Requirements for a WDDM graphics adapter to support display functionality*

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

WDDM has been extended to support a WDDM driver that is only responsible for Display Scan out capabilities. Such a driver is not allowed to support any Rendering capabilities.

A driver is considered a WDDM Display Only driver if it implements the following DDIs.
 

**Common WDDM DDIs **

These DDIs are for the common device functionalities such as PnP support and Power support. These functions are required by all WDDM drivers, and if not implemented, the driver will not be started by Windows. These DDIs are already [documented in the WDK](http://msdn.microsoft.com/en-us/library/ff554066.aspx).

**Required:**

 - DxgkDdiAddDevice
 - DxgkDdiStartDevice
 - DxgkDdiStopDevice
 - DxgkDdiRemoveDevice
 - DxgkDdiDispatchIoRequest
 - DxgkDdiSetPowerState
 - DxgkDdiUnload

**Optional:**

 - DxgkDdiInterruptRoutine\*
 - DxgkDdiDpcRoutine
 - DxgkDdiNotifyAcpiEvent
 - DxgkDdiQueryInterface
 - DxgkDdiControlEtwLogging
 - DxgkDdiEscape
 - DxgkDdiCollectDbgInfo

\* **DxgkDdiInterruptRoutine** function is required if the current hardware device reports a hardware interrupt. In this case, if the driver did not supply this DDI function, the OS would fail the initialization. If the current hardware does not have a hardware interrupt and the driver supplies this DDI function, the OS will still allow this driver to be loaded and DxgkDdiInterruptRoutine will never be called.

\* **DdiNotifyAcpiEvent** DDI function is used to notify graphics drivers on some ACPI events. It is optional for the rendering device. On normal WDDM graphics devices, this DDI function will return a flag to indicate dxgkrnl.sys to take some further actions such as reset display mode or poll the connected monitors. For the rendering only device, these flags are not used and must be set to zero.
 

**Display Only DDIs **

The following DDI functions are required to be implemented by a Display Only driver. If the driver does not supply all of these DDIs, Windows will fail to initialize this driver.

 - DxgkDdiQueryChildRelations
 - DxgkDdiQueryChildStatus
 - DxgkDdiQueryDeviceDescriptor
 - DxgkDdiResetDevice
 - DxgkDdiQueryAdapterInfo
 - DxgkDdiSetPalette \*
 - DxgkDdiSetPointerPosition \*\*
 - DxgkDdiSetPointerShape \*\*
 - DxgkDdiIsSupportedVidPn
 - DxgkDdiRecommendFunctionalVidPn \*\*\*
 - DxgkDdiEnumVidPnCofuncModality
 - DxgkDdiSetVidPnSourceVisibility
 - DxgkDdiCommitVidPn
 - DxgkDdiUpdateActiveVidPnPresentPath
 - DxgkDdiRecommendMonitorModes
 - DxgkDdiGetScanLine
 - DxgkDdiQueryVidPnHWCapability
 - DxgkDdiPresentDisplayOnly
 - DxgkDdiReleasePostDisplayOwnership
 - DxgkDdiSystemDisplayEnable
 - DxgkDdiSystemDisplayWrite
 - DxgkDdiI2CReceiveDataFromDisplay
 - DxgkDdiI2CTransmitDataFromDisplay

\* **DxgkDdiSetPalette** is a required DDI. If the driver does not support any palette mode, it should still supply this DDI.

\*\* **DxgkDdiSetPointerPosition** and **DxgkDdiSetPointerShape** are required DDIs. If the driver does not support any hardware cursor, it should still supply these two DDIs.

\*\*\* **DxgkDdiRecommendFunctionalVidPn** is a required DDI. If the driver does not support any ACPI event, it should still supply this DDI.

### Device.Graphics.WDDM12.Display.ContainerIDSupport

*A graphics adapter must support the DDI for Container ID.*

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

A graphics adapter must implement the **DxgkDdiGetDeviceContainer** DDI. Windows will use this DDI to ask the driver for the container ID. The driver must try and obtain the Container ID from the display hardware.

In case the Display device does not provide a Container ID, then Windows will automatically manufacture a Container ID for the display. The uniqueness of the Container ID is achieved by using the Manufacture ID, Product ID, and Serial number of the display obtained from the EDID. Using this information, a driver for another device can generate the same container ID as the display device by using the RtlGenerateClass5Guid function included in wdm.h.

### Device.Graphics.WDDM12.Display.DisplayOutputControl

*Support for WDDM taking control of display output while the WDDM driver is running*

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

There is a need for a more seamless hand off of the display control between Windows and the WDDM graphics driver. This means that in some cases, Windows needs to take over the control of the Display scan out without having to PnP Stop the WDDM Driver.

One such scenario is when Windows needs to bug check the system and display the blue screen. This set of DDIs enables that cleaner hand off.

The following DDIs are required to be implemented by a Full and Display Only WDDM 1.2 driver.

 - DxgkDdiSystemDisplayEnable
 - DxgkDdiSystemDisplayWrite

These DDIs are [documented here on WDK](http://msdn.microsoft.com/en-us/library/ff554066.aspx): <http://msdn.microsoft.com/en-us/library/ff554066.aspx>.

The following are the requirements for WDDM driver while implementing these DDIs:

-   When Windows calls DxgkDdiSystemDisplayEnable, a driver must cancel all the GPU operations or reset GPU to an idle state.

-   Windows will provide a Target ID as part of the DDI call. The driver must continue to drive the display associated with the target ID.

    -   The driver must check the connectivity of the display on the provided Target ID. If specified target does not have a display connected, the driver should fail this call with STATUS\_NOT\_SUPPORTED.

    -   The driver must disable the signal to all other displays connected to the adapter except the target ID provided.

        -   If this is not possible, the driver should try and put a blank image on all other displays.

        -   If this is not possible, the driver must leave the last image on the screen unchanged.

-   For the selected Target ID, the driver must keep the current display mode and provide this mode back to Windows as part of the DDI call.

    -   In case the driver is not able to maintain the current mode OR the target ID is not part of the active topology, the driver should try and set the native resolution of the display OR a high res mode. At the very least, the driver must reset to a mode that is larger than or equals to 640x480 24 bpp color format on the specified target.

    -   It is NOT required that the driver should use linear frame buffer mode. But the driver should support the write operation from a D3DDDIFMT\_A8R8G8B8 source to this frame buffer.

-   This function might be called at the high IRQL level or after the system has been bugcheck. The driver should put this function in the non-paged code section and only use non-paged memory.

    -   Windows kernel mode functions might NOT be available when this function is called.

-   Once the driver has handed over Display Control to Windows, Windows will use the DxgkDdiSystemDisplayWrite DDI to update the screen image. Windows will use the DDI to write a block of image from specified source image to the screen that is reset via DxgkDdiSystemDisplayEnable function. This function will pass to the driver the start address of source image as well as the stride, width, and height. The color format of source image is always D3DDDIFMT\_X8R8G8B8. Windows guarantees that the source image is in non-paged memory. The driver must write this source image to current screen at (PostionX, PositionY).

-   This function might be called at the high IRQL level or after the system has been bugcheck. The driver should put this function in the non-paged code section and only use non-paged memory.

    -   Windows kernel mode functions might NOT be available when this function is called.

-   It is recommended to use the CPU to write the image from source to the frame buffer since the bugcheck might be caused by repeated TDR and the GPU might be in an unknown condition.

### Device.Graphics.WDDM12.Display.ModeEnumeration

*Mode enumeration requirements*

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

**Target modes**

-   A graphics adapter must be able to scan out any resolution that is greater than or equal to 1024 x 768 progressive at 32 bpp and a maximum timing that is up to 148.5 Mhz pixel clock per the VESA and Industry Standards and Guidelines for Computer Display Monitor Timing (DMT) Nov 2007 Update or  CEA-861-E specs. The graphics driver may support modes that are greater than or less than these constraints, but the driver is not required to do so.

-   The graphics drier is not required to support any interlaced timings, but may choose to do so.

-   During DxgkDdiEnumVidPnCofuncModality DDI call, the supported target modes must be greater than or equal to the pinned source modes except for analog TV connector type or if the target cannot support any timing with a resolution of 1024 x 768 or greater. This means that for all other conditions, the driver is only allowed to scale up. A driver can support downscaling if the user requests it specifically for overscan compensation on TVs.

**Source modes**

-   A graphics adapter must support the native resolution of the integrated panel.

-   If the graphics adapter has enough bandwidth, it must support the native resolution of any connected display.

-   A graphics driver must enumerate at least one source mode for every achievable detailed timing in the EDID of the display.

-   If the only mode supported by the display device is less than or equal to 640 x 480, then the driver can downscale in this case. However, the source mode must be at least 800 x 600.

-   A graphics driver must only enumerate sources modes of 32 bpp or higher.

**For Duplicate (Clone) mode**

-   If there are 2 displays configured in duplicate mode, the graphics adapter must support the setting of the following configuration:

	-   If there are any common detailed timings between the 2 displays that are less than or equal to 1920 x 1080 progressive at 32 bpp, the graphics adapter must support driving the displays at this timing in the duplicate mode.


-   At a minimum, 1024 x 768 must be supported in duplicate mode.

-   For more than 2 displays configured in duplicate mode, the graphics adapter may choose an appropriate mode to support.

-   At a minimum, irrespective of the number of displays in duplicate mode, the graphics adapter must be able to support a Source Mode of 1024 x 768 progressive at 32 bpp in the duplicate mode.

**For Extend mode**

-   If there are 2 displays configured in extended mode, the graphics adapter must support setting the following configuration:

	-   On systems with integrated displays: Native resolution on integrated display  and simultaneously up to 1920 x 1080 progressive at 32 bpp on the non-integrated display

	-   Up to 1920 x 1080 progressive at 32 bpp on each non-integrated display

-   For more than 2 displays configured in extended mode, the graphics adapter may choose an appropriate set of modes to support based on available bandwidth.

### Device.Graphics.WDDM12.Display.PnpStopStartSupport

*Support for PnP Stop in WDDM*

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

Since the introduction of WDDM, every driver is required to support PnP Start and Stop. This requirement enhances the support for PnP start and stop in WDDM.

Once a WDDM driver is stopped, Windows needs to take over the display control and when the driver is started, Windows needs to hand back display control to the driver.

WDDM 1.2 introduces a new DDI to add support for UEFI based systems and also to improve the user experience in such a scenario.

The following DDIs are required to be implemented by a Full and Display Only WDDM 1.2 driver.

 - DxgkDdiReleasePostDisplayOwnership

The following are the requirements for the driver when implementing this DDI.

-   Windows will provide a Target ID as part of the DDI call. The driver must continue to drive the display associated with the target ID.

    -   The driver must check the connectivity of the display on the provided Target ID. If specified target does not have a display connected, the driver should fail this call with STATUS\_NOT\_SUPPORTED.

    -   The driver must disable the signal to all other displays connected to the adapter except the target ID provided.

        -   If this is not possible, the driver should try and put a blank image on all other displays.

        -   If this is not possible, the driver must leave the last image on the screen unchanged.

-   If there is an ACPI ID associated with the target ID, then that must be provided back to Windows as part of the return data structure PDXGK\_DISPLAY\_INFORMATION.

-   For the selected Target ID, the driver must keep the current display mode and provide this mode back to Windows as part of the DDI call.

    -   In case the driver is not able to maintain the current mode OR the target ID is not part of the active topology, the driver should select an alternate active target and try and maintain the current resolution of that target. If that is not possible, the driver should try and set the native resolution of the display OR a high res mode. At the very least, the driver must reset to a mode which is larger than or equals to 800x600 24bpp (D3DDDIFMT\_R8G8B8) or 32bpp (D3DDDIFMT\_X8R8G8B8).

    -   If no target is active, then the driver should attempt to enable a target. Preferably the internal panel (if available).

-   The driver must clean the current frame buffer, disable hardware cursor, disable all overlays, and set to default GAMMA ramp.

-   The driver must make the current frame buffer linear (either by using swizzle range or disabling swizzle mode).

-   The driver must make the current frame buffer accessible by CPU.

-   The driver must ensure that visibility is set to "enabled" on the specified target.

### Device.Graphics.WDDM12.Display.ProvideLinearFrameBuffer

*A graphics device can provide a linear frame buffer usable by Windows.*

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

There are numerous scenarios where components in the Windows OS need to be able to update the display when an IHV driver is not loaded. Some of these scenarios are: Boot, Bugcheck, safemode, driver upgrades, etc. To ensure a graphics device is compatible with these Windows scenarios, it must:

1.  Ensure updates to the frame buffer must be scanned out without requiring addition IHV/OEM.

2.  software/drivers. Provide a linear frame buffer that is CPU accessible on demand from the IHV driver.

3.  On UEFI systems at boot using UEFI 2.3 GOP.

4.  On BIOS systems using VBE 3.0 standards.

<a name="device.graphics.wddm12.displayonly"></a>
## Device.Graphics.WDDM12.DisplayOnly

*The optional feature set implemented by WDDM 1.2 drivers that support only the display specific DDIs.*

### Device.Graphics.WDDM12.DisplayOnly.Base

*Requirements for a WDDM graphics adapter to support display functionality*

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

WDDM has been extended to support a WDDM driver that is only responsible for Display Scan out capabilities. Such a driver is not allowed to support any Rendering capabilities.

A driver is considered a WDDM Display Only driver if it only implements the following DDIs and does not implement any of the render DDIs.
 

**Common WDDM DDIs **

These DDIs are for the common device functionalities such as PnP support and Power support. These functions are required by all WDDM drivers, and if not implemented, the driver will not be started by Windows. These DDIs are already [documented in the WDK](http://msdn.microsoft.com/en-us/library/ff554066.aspx): <http://msdn.microsoft.com/en-us/library/ff554066.aspx>.

**Required:**
 - DxgkDdiAddDevice
 - DxgkDdiStartDevice
 - DxgkDdiStopDevice
 - DxgkDdiRemoveDevice
 - DxgkDdiDispatchIoRequest
 - DxgkDdiSetPowerState
 - DxgkDdiUnload

**Optional:**
 - DxgkDdiInterruptRoutine\*
 - DxgkDdiDpcRoutine
 - DxgkDdiNotifyAcpiEvent
 - DxgkDdiQueryInterface
 - DxgkDdiControlEtwLogging
 - DxgkDdiEscape
 - DxgkDdiCollectDbgInfo

\* **DxgkDdiInterruptRoutine** function is required if the current hardware device reports hardware interrupt. In this case, if the driver did not supply this DDI function, the OS would fail the initialization. If the current hardware does not have interrupt and the driver supplies this DDI function, the OS will still allow this driver to be loaded and **DxgkDdiInterruptRoutine** will never be called.

\* **DdiNotifyAcpiEvent** DDI function is used to notify graphics drivers on some ACPI events. It is optional for a rendering device. On normal WDDM graphics devices, this DDI function will return a flag to indicate dxgkrnl.sys to take some further actions such as reset display mode or poll the connected monitors. For the rendering only device, these flags are not used and must be set to zero.
 

**Display Only DDIs **

Following DDI functions are required to be implemented by a Display Only driver. If the driver does not supply all of these DDIs, Windows will fail to initialize this driver.

 - DxgkDdiQueryChildRelations
 - DxgkDdiQueryChildStatus
 - DxgkDdiQueryDeviceDescriptor
 - DxgkDdiResetDevice
 - DxgkDdiQueryAdapterInfo
 - DxgkDdiSetPalette \*
 - DxgkDdiSetPointerPosition \*\*
 - DxgkDdiSetPointerShape \*\*
 - DxgkDdiIsSupportedVidPn
 - DxgkDdiRecommendFunctionalVidPn \*\*\*
 - DxgkDdiEnumVidPnCofuncModality
 - DxgkDdiSetVidPnSourceVisibility
 - DxgkDdiCommitVidPn
 - DxgkDdiUpdateActiveVidPnPresentPath
 - DxgkDdiRecommendMonitorModes
 - DxgkDdiGetScanLine
 - DxgkDdiQueryVidPnHWCapability
 - DxgkDdiPresentDisplayOnly
 - DxgkDdiReleasePostDisplayOwnership
 - DxgkDdiSystemDisplayEnable
 - DxgkDdiSystemDisplayWrite

\* **DxgkDdiSetPalette** is a required DDI. If the driver does not support any palette mode, it should still supply this DDI.

\*\* **DxgkDdiSetPointerPosition** and **DxgkDdiSetPointerShape** are required DDIs. If the driver does not support any hardware cursor, it should still supply these two DDIs.

\*\*\* **DxgkDdiRecommendFunctionalVidPn** is a required DDI. If the driver does not support any ACPI event, it should still supply this DDI.

*Design Note:*
The only color format supported for display only drivers is D3DDDIFMT\_A8R8G8B8; therefore, these drivers should only enumerate source modes of this format.

<a name="device.graphics.wddm12.displayrender"></a>
## Device.Graphics.WDDM12.DisplayRender

*The optional feature set implemented by WDDM 1.2 drivers supporting both display and render DDIs.*

### Device.Graphics.WDDM12.DisplayRender.Base

*Requirements for a WDDM graphics adapter implementing both Render and Display DDIs*

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

WDDM has been extended to support a WDDM driver that is only responsible for Display Scan out capabilities. Such a driver is not allowed to support any Rendering capabilities.

WDDM has also been extended to support a WDDM driver that is only responsible for Rendering and Compute DDIs. Such a driver is not allowed to support any Display Scan out capabilities.

Driver's implementing both sets of DDI's (Display and Render) are considered full graphics adapters.
 

**Common WDDM DDIs **

These DDIs are for the common device functionalities such as PnP support and Power support. These functions are required by all WDDM drivers, and if not implemented, the driver will not be started by Windows. These DDIs are already [documented in the WDK](http://msdn.microsoft.com/en-us/library/ff554066.aspx): <http://msdn.microsoft.com/en-us/library/ff554066.aspx>.

**Required:**
 - DxgkDdiAddDevice
 - DxgkDdiStartDevice
 - DxgkDdiStopDevice
 - DxgkDdiRemoveDevice
 - DxgkDdiDispatchIoRequest
 - DxgkDdiSetPowerState
 - DxgkDdiUnload

**Optional:**
 - DxgkDdiInterruptRoutine\*
 - DxgkDdiDpcRoutine
 - DxgkDdiNotifyAcpiEvent
 - DxgkDdiQueryInterface
 - DxgkDdiControlEtwLogging
 - DxgkDdiEscape
 - DxgkDdiCollectDbgInfo

\*DxgkDdiInterruptRoutine function is required if current hardware device reports hardware interrupt. In this case, if the driver did not supply this DDI function, the OS would fail the initialization. If the current hardware does not have an interrupt and the driver supplies this DDI function, the OS will still allow this driver to be loaded and DxgkDdiInterruptRoutine will never be called.
 

**Display Only DDIs **

Following DDI functions are required to be implemented by a Display Only driver. If the driver does not supply all of these DDIs, Windows will fail to initialize this driver.
 - DxgkDdiQueryChildRelations
 - DxgkDdiQueryChildStatus
 - DxgkDdiQueryDeviceDescriptor
 - DxgkDdiResetDevice
 - DxgkDdiQueryAdapterInfo
 - DxgkDdiSetPalette \*
 - DxgkDdiSetPointerPosition \*\*
 - DxgkDdiSetPointerShape \*\*
 - DxgkDdiIsSupportedVidPn
 - DxgkDdiRecommendFunctionalVidPn \*\*\*
 - DxgkDdiEnumVidPnCofuncModality
 - DxgkDdiSetVidPnSourceVisibility
 - DxgkDdiCommitVidPn
 - DxgkDdiUpdateActiveVidPnPresentPath
 - DxgkDdiRecommendMonitorModes
 - DxgkDdiGetScanLine
 - DxgkDdiQueryVidPnHWCapability
 - DxgkDdiPresentDisplayOnly
 - DxgkDdiReleasePostDisplayOwnership
 - DxgkDdiSystemDisplayEnable
 - DxgkDdiSystemDisplayWrite

\* **DxgkDdiSetPalette** is a required DDI. If the driver does not support any palette mode, it should still supply this DDI.

\*\* **DxgkDdiSetPointerPosition** and **DxgkDdiSetPointerShape** are required DDIs. If the driver does not support any hardware cursor, it should still supply these two DDIs.

\*\*\* **DxgkDdiRecommendFunctionalVidPn** is a required DDI. If the driver does not support any ACPI event, it should still supply this DDI.

\* **DdiNotifyAcpiEvent** DDI function is used to notify graphics drivers on some ACPI events. It is optional for a rendering device. On normal WDDM graphics devices, this DDI function will return a flag to indicate dxgkrnl.sys to take some further actions such as reset the display mode or poll the connected monitors. For the rendering only device, these flags are not used and must be set to zero.
 

**Rendering only DDIs **

These DDI functions are for the rendering functionalities.

**Required:**

 - DxgkDdiInterruptRoutine
 - DxgkDdiDpcRoutine
 - DxgkDdiResetDevice
 - DxgkDdiCreateDevice
 - DxgkDdiDestroyAllocation
 - DxgkDdiDescribeAllocation
 - DxgkDdiOpenAllocation
 - DxgkDdiCloseAllocation
 - DxgkDdiGetStandardAllocationDriverData
 - DxgkDdiSubmitCommand
 - DxgkDdiPreemptCommand
 - DxgkDdiBuildPagingBuffer
 - DxgkDdiResetFromTimeout
 - DxgkDdiRestartFromTimeout
 - DxgkDdiQueryCurrentFence
 - DxgkDdiControlInterrupt
 - DxgkDdiDestroyDevice
 - DxgkDdiPresent
 - DxgkDdiCreateAllocation
 - DxgkDdiPatch
 - DxgkDdiRender
 - DxgkDdiRenderKm

**Optional:**

If the rendering hardware supports swizzling ranger, the driver should also supply the two following functions:

 - DxgkDdiAcquireSwizzlingRange
 - DxgkDdiReleaseSwizzlingRange
 

<a name="device.graphics.wddm12.displayrender.processingstereoscopicvideocontent"></a>
## Device.Graphics.WDDM12.DisplayRender.ProcessingStereoscopicVideoContent

*The optional feature set implemented by WDDM 1.2 drivers that support stereoscopic video processing.*

### Device.Graphics.WDDM12.DisplayRender.ProcessingStereoscopicVideoContent.ProcessingStereoscopicVideoContent

*If a display adapter supports presentation and processing of stereoscopic video content, it must conform to the DXGI specification for Stereo 3D.*

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

WDDM 1.2 drivers may optionally process video data encoded for stereo. If the driver publishes that it can support stereo, it must support the processing of content in horizontally and vertically arranged left and right eye views, as well as separate streams for the left and right eye views.
In addition, if the driver publishes that it can support stereo, it may optionally also process the following stereo content layouts:

-   Row interleaved  
-   Column interleaved  
-   Checkerboard  
-   Flipped Configurations

Finally, the driver may optionally support new stereo processing features:

-   Mono offset
-   Stereo Eye Adjustment

For all optional content layouts and processing features, the driver must publish the appropriate cap to indicate if it supports the feature.

<a name="device.graphics.wddm12.displayrender.runtimepowermgmt"></a>
## Device.Graphics.WDDM12.DisplayRender.RuntimePowerMgmt

*The optional feature set implemented by WDDM 1.2 drivers that support the runtime power management DDIs.*

### Device.Graphics.WDDM12.DisplayRender.RuntimePowerMgmt.RuntimePowerMgmt

*If implemented - WDDM 1.2 drivers must use the new WDDM 1.2 GPU Power Management DDI for F-state and p-state power management.*

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

WDDM 1.2 drivers can optionally support F-state and p-state Power Management.
For more details on the use of the SoC GPU Power Management WDDM v1.2 DDI, please refer to the Windows WDK documentation.

<a name="device.graphics.wddm12.render"></a>
## Device.Graphics.WDDM12.Render

*The base feature set implemented by WDDM 1.2 drivers that support the render specific DDIs.*

### Device.Graphics.WDDM12.Render.Base

*Requirements for a WDDM graphics adapter to support render functionality*

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

WDDM has been extended to support a WDDM driver that is only responsible for Rendering and Compute DDIs. Such a driver is not allowed to support any Display Scan out capabilities.

A driver is considered a WDDM Render Only driver if one of the following two conditions is met:

-   The driver implements all the DDIs required for a full WDDM driver, but reports 0 sources and 0 targets.

-   The driver implements all the Render specific DDIs and returns a null pointer for all the Display specific DDIs. The DDIs required for this are called out below.

**Common WDDM DDIs **

These DDI functions are for the common device functionalities such as PnP support and Power support. These functions are required by all WDDM drivers, and if not implemented, the driver will not be started by Windows. These DDIs are already documented in the WDK: <http://msdn.microsoft.com/en-us/library/ff554066.aspx>.

**Required:**
 - DxgkDdiAddDevice
 - DxgkDdiStartDevice
 - DxgkDdiStopDevice
 - DxgkDdiRemoveDevice
 - DxgkDdiDispatchIoRequest
 - DxgkDdiSetPowerState
 - DxgkDdiUnload

**Optional:**

 - DdiNotifyAcpiEvent \*

\* DdiNotifyAcpiEvent DDI function is used to notify graphics drivers on some ACPI events. It is optional for a rendering device. On normal WDDM graphics devices, this DDI function will return a flag to indicate dxgkrnl.sys to take some further actions such as reset display mode or poll the connected monitors.  For the rendering only device, these flags are not used and must be set to zero.
 

**Rendering only DDIs **

These DDI functions are for the rendering functionalities.

**Required:**
 - DxgkDdiInterruptRoutine
 - DxgkDdiDpcRoutine
 - DxgkDdiResetDevice
 - DxgkDdiCreateDevice
 - DxgkDdiDestroyAllocation
 - DxgkDdiDescribeAllocation
 - DxgkDdiOpenAllocation
 - DxgkDdiCloseAllocation
 - DxgkDdiGetStandardAllocationDriverData
 - DxgkDdiSubmitCommand
 - DxgkDdiPreemptCommand
 - DxgkDdiBuildPagingBuffer
 - DxgkDdiResetFromTimeout
 - DxgkDdiRestartFromTimeout
 - DxgkDdiQueryCurrentFence
 - DxgkDdiControlInterrupt
 - DxgkDdiDestroyDevice
 - DxgkDdiPresent
 - DxgkDdiCreateAllocation
 - DxgkDdiPatch
 - DxgkDdiRender
 - DxgkDdiRenderKm

**Optional:**
If the rendering hardware supports swizzling ranger, the driver should also supply the two following functions:
 - DxgkDdiAcquireSwizzlingRange
 - DxgkDdiReleaseSwizzlingRange
 

### Device.Graphics.WDDM12.Render.D3D11VideoDecoding

*A display driver must support the DirectX 11 Video Decoder DDI.*

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

Display WDDM 1.2 drivers support the DirectX 11 Video Decoder DDI.

WDDM drivers must support at least one of the following sets of H.264 GUIDs:

-   D3D11\_DECODER\_PROFILE\_H264\_VLD\_NOFGT
-   D3D11\_DECODER\_PROFILE\_H264\_VLD\_FGT
-   D3D11\_DECODER\_PROFILE\_H264\_VLD\_WITHFMOASO\_NOFGT

WDDM drivers support at least one the following VC1 modes:

-   D3D11\_DECODER\_PROFILE\_VC1\_VLD
-   D3D11\_DECODER\_PROFILE\_VC1\_D2010

If-implemented: WDDM drivers support at least one of the following MPEG2 modes:

-   D3D11\_DECODER\_PROFILE\_MPEG2\_VLD and D3D11\_DECODER\_PROFILE\_MPEG2\_IDCT
-   D3D11\_DECODER\_PROFILE\_MPEG2\_VLD and D3D11\_DECODER\_PROFILE\_MPEG2\_MOCOMP
-   D3D11\_DECODER\_PROFILE\_MPEG2\_IDCT
-   D3D11\_DECODER\_PROFILE\_MPEG2AND1\_VLD

If-implemented: HEVC/H.265 modes

-   D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN
-   D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN10

It is highly recommended for drivers to support D3D11\_DECODER\_PROFILE\_HEVC\_VLD\_MAIN10 as Main 10 is a very common format for premium HEVC content.

If-implemented: VPx modes:

-   D3D11\_DECODER\_PROFILE\_VP8\_VLD
-   D3D11\_DECODER\_PROFILE\_VP9\_VLD\_PROFILE0
-   D3D11\_DECODER\_PROFILE\_VP9\_VLD\_PROFILE2 (optional if hardware does not support profile 2)

Finally, WDDM drivers must support DXGI\_FORMAT\_420\_OPAQUE and DXGI\_FORMAT\_NV12 as decoder output formats. For HEVC Main 10, drivers must support DXGI\_FORMAT\_P010 as decoder output format.

WDDM drivers must support Standardized AES 128 (defined in the WDDM v1.1 specifications) for H.264\*\*\* and MPEG2, if MPEGE2 acceleration is supported.

Design Notes

\*\*\* Standardized AES 128 support is required on x86 and x64 architectures and operating systems only.

### Device.Graphics.WDDM12.Render.D3D11VideoProcessing

*A display driver must support the appropriate DDIs for DirectX 11 video processing.*

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

The following video processor device capability DDIs must be supported:

-   BOB Deinterlacing

    -   DXVAHDDDI\_PROCESSOR\_CAPS\_DEINTERLACE\_BOB
    -   D3D11\_1DDI\_VIDEO\_PROCESSOR\_PROCESSOR\_CAPS\_DEINTERLACE\_BOB 

-   Constriction

    -   DXVAHDDDI\_FEATURE\_CAPS\_CONSTRICTION
    -   D3D11\_1DDI\_VIDEO\_PROCESSOR\_FEATURE\_CAPS\_CONSTRICTION

-   Rotation

    -   DXVAHDDDI\_FEATURE\_CAPS\_ROTATION
    -   D3D11\_1DDI\_VIDEO\_PROCESSOR\_FEATURE\_CAPS\_ROTATION

-   Arbitrary stretching/shrinking

-   Both full and nominal RGB ranges must be supported on the input and the output YCbCr data, specifically:

    -   0 to 255

        -   DXVAHDDDI\_STREAM\_STATE\_INPUT\_COLOR\_SPACE\_DATA

RGB\_Range field is set to 0:

-   DXVAHDDDI\_BLT\_STATE\_OUTPUT\_COLOR\_SPACE\_DATA RGB\_Range field is set to 0

    -   D3D11\_1DDI\_VIDEO\_PROCESSOR\_COLOR\_SPACE RGB\_Range field set to 0

-   16 to 235

    -   DXVAHDDDI\_STREAM\_STATE\_INPUT\_COLOR\_SPACE\_DATA

RGB\_Range field is set to 1:

-   DXVAHDDDI\_BLT\_STATE\_OUTPUT\_COLOR\_SPACE\_DATA RGB\_Range field is set to 1

    -   D3D11\_1DDI\_VIDEO\_PROCESSOR\_COLOR\_SPACE RGB\_Range field set to 1

-   BT. 601 and BT. 709 conversion matrices must be supported on the input and the output YCbCr data, specifically:

-   DXVAHDDDI\_STREAM\_STATE\_INPUT\_COLOR\_SPACE\_DATA.YCbCr\_Matrix

    -   Both setting the field to 0 (representing BT.601) and 1 (representing BT.709) must be supported.

-   DXVAHDDDI\_BLT\_STATE\_OUTPUT\_COLOR\_SPACE\_DATA.YCbCr\_Matrix

    -   Both setting the field to 0 (representing BT.601) and 1 (representing BT.709) must be supported.

-   D3D11\_1DDI\_VIDEO\_PROCESSOR\_COLOR\_SPACE.YCbCr\_Matrix

    -   Both setting the field to 0 (representing BT.601) and 1 (representing BT.709) must be supported.

-   Arbitrary background color

-   Per-stream source rectangle

-   Per-stream destination rectangle

-   Overall destination rectangle

-   At least one stream

The following formats must be supported for input:

-   D3DFMT\_420\_OPAQUE
-   D3DFMT\_NV12
-   D3DFMT\_YUY2
-   Any formats supported as output from DXVA 2.0 decode or DirectX 11 Video decode

Depending on the feature level made available by the driver for Direct3D (e.g., 9.1 - 9.3 for Direct3D 9 DDIs, 10.0 for Direct3D 10 DDIs, etc.), the following formats must be supported for output:

-   9.1 - 9.3 Feature Levels

    -   D3DFMT\_A8R8G8B8
    -   D3DFMT\_NV12

-   10.0 - 10.1 Feature Levels

    -   DXGI\_FORMAT\_R16G16B16A16\_FLOAT
    -   DXGI\_FORMAT\_R8G8B8A8\_UNORM
    -   DXGI\_FORMAT\_R10G10B10A2\_UNORM
    -   DXGI\_FORMAT\_R8G8B8A8\_UNORM\_SRGB
    -   DXGI\_FORMAT\_NV12

    -   The following formats are also required if the driver supports these as a swapchain format:

        -   DXGI\_FORMAT\_B8G8R8A8\_UNORM
        -   DXGI\_FORMAT\_B8G8R8A8\_UNORM\_SRGB
        -   DXGI\_FORMAT\_R10G10B10\_XR\_BIAS\_A2\_UNORM

-   11.0 Feature Level and beyond

    -   DXGI\_FORMAT\_R16G16B16A16\_FLOAT
    -   DXGI\_FORMAT\_R8G8B8A8\_UNORM
    -   DXGI\_FORMAT\_R10G10B10A2\_UNORM
    -   DXGI\_FORMAT\_R8G8B8A8\_UNORM\_SRGB
    -   DXGI\_FORMAT\_NV12,  DXGI\_FORMAT\_B8G8R8A8\_UNORM
    -   DXGI\_FORMAT\_B8G8R8A8\_UNORM\_SRGB
    -   DXGI\_FORMAT\_R10G10B10\_XR\_BIAS\_A2\_UNORM

**Design Notes**

MPEG-2 support is required on x86 and x64 architectures and operating systems only.

### Device.Graphics.WDDM12.Render.DirectFlip

*A driver must support the DirectFlip DDI.*

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

The driver must publish the SupportDirectFlip field as TRUE in the DXGK\_DRIVERCAPS structure.
WDDM 1.2 drivers for the Direct3D 11 DDI must implement the D3D11\_1DDI\_CHECKDIRECTFLIPSUPPORT DDI and return TRUE from the DDI when it is called with at least the following parameters:

-   The app resource matches the DWM resource in format and pixel dimensions.

-   The D3DDDI\_CHECKDIRECTFLIP\_IMMEDIATE flag is not set.

WDDM 1.2 drivers for the Direct3D 9 DDI must implement the D3DDDIARG\_CHECKDIRECTFLIPSUPPORT DDI and return TRUE from the DDI when it is called with at least the following parameters:

-   The app resource matches the DWM resource in format and pixel dimensions.

-   The D3DDDI\_CHECKDIRECTFLIP\_IMMEDIATE flag is not set.

The driver must support the creation of shared primary swapchains, specifically identified as resources created with:

-   pPrimaryDesc as non-NULL.

-   D3D10\_DDI\_RESOURCE\_MISC\_SHARED set in MiscFlags.

-   D3D10\_DDI\_BIND\_SHADER\_RESOURCE, D3D10\_DDI\_BIND\_PRESENT, and D3D10\_DDI\_BIND\_RENDER\_TARGET all set in BindFlags.

When the SharedPrimaryTransition bit is set in the DXGK\_SETVIDVIDPNSOURCEADDRESS DDI, the driver must:

-   Validate that the hardware can seamlessly switch between the two allocations.

-   Perform a seamless switch to the new primary indicated by the DDI.

### Device.Graphics.WDDM12.Render.FlipOnVSyncMmIo

*WDDM1.2 drivers must support a memory mapped I/O (MMIO)-based flip that takes effect on the next vertical sync.*

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

All WDDM1.2 drivers must publish the FlipOnVSyncMmIo field as TRUE in the DXGK\_FLIPCAPS structure, and implement behavior outlined under FlipOnVSyncMmIo here:
<http://msdn.microsoft.com/en-us/library/ff561069.aspx>.
 

### Device.Graphics.WDDM12.Render.OfferReclaim

*WDDM 1.2 drivers must use the Offer and Reclaim DDI to reduce the memory footprint.*

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

WDDM 1.2 drivers must use the new UMD Offer and Reclaim DDI to reduce the overhead of memory resources created for temporary surfaces in local video and system memory.  An example is the use of staging buffers to accelerate the process of uploading data to GPU local memory.  By offering these resources, the operating system can reuse the memory without risking the expense of destroying and recreating them at high frequency.
WDDM Drivers also often keep allocations that an application is no longer using so that if the application creates another allocation with the same properties, it can give back the old one.  This reduces the performance impact of rapidly destroying and re-creating allocations, a common bad behavior for applications, but it also can have a very high memory cost.  By offering those allocations, the WDDM 1.2 driver can keep most of its performance without wasting memory.
Below are detailed sub-requirements:

-   WDDM 1.2 drivers must always "Offer" internal staging buffers once they have been used. These temporary buffers generally hold data being moved or copied from a source to a destination. In Windows 7 and previous operating systems, these temporary surfaces are left in memory even though they were no longer in use.

-   WDDM 1.2 drivers must always "Offer" the deferred deletions of surfaces that are recycled. If a driver decides to defer the destruction of a surface, it must at least offer it to the video memory manager.

-   WDDM 1.2 driver should only Offer packed allocations when all of the individual resources contained in the allocation have been Offer-ed. The allocation as a whole should be reclaimed when any individual resources have been reclaimed.

-   WDDM 1.2 drivers must always Offer discarded allocations if it implements its own renaming mechanism.

-   WDDM 1.2 drivers should never pack allocations larger than 64 KB with other allocations, guaranteeing for application that offer will give them the expected benefit.

For more details on the use of the Offer and Reclaim WDDM v1.2 DDI, please refer to the Windows WDK documentation.

### Device.Graphics.WDDM12.Render.PreemptionGranularity

*WDDM 1.2 drivers must report the granularity level of GPU Preemption.*

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

A WDDM 1.2 driver must report the GPU Preemption granularity for running Graphics and Compute scenarios.
The WDDM 1.2 must do the following:

-   The WDDM 1.2 driver must first set the "PreemptionAware" flag and the "MultiEngineAware" flag in the \_DXGK\_VIDSCHCAPS structure through the DxgkDdiQueryAdapterInfo DDI.

-   The WDDM 1.2 driver must set the appropriate GPU Preemption granularity through "D3DKMDT\_PREEMPTION\_CAPS PreemptionCaps".

There is no mandatory requirement on the actual level of preemption for Graphics or Compute. For example, if a GPU does not support any level of Mid-DMA Buffer Graphics Preemption such as that on the triangle boundary or others, then it can report this cap as D3DKMDT\_GRAPHICS\_PREEMPTION\_DMA\_BUFFER\_BOUNDARY. Similarly, if it does not support any level of finer grained preemption for Compute, then it must report the cap as D3DKMDT\_COMPUTE\_PREEMPTION\_DMA\_BUFFER\_BOUNDARY.

However, if the GPU does support Mid-DMA Buffer or Packet Preemption, then the WDDM 1.2 driver must choose the appropriate cap in order to take advantage of the benefits offered by finer grained GPU Preemption for Graphics and/or Compute.

For more details on the use of the GPU Preemption WDDM v1.2 DDI, please refer to the Windows WDK documentation.

### Device.Graphics.WDDM12.Render.PremiumContentPlayback

*Protected Environment Signature requirement for WDDM1.2 drivers *

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

Any WDDM 1.2 user mode graphics driver binary required for premium content playback must be properly signed as required by the Windows Protected Environment (PE) license program. Compliance with the PE license program is already required by section 3.1 of the PVP-OPM license agreement. Specifically, each binary in the required set must be signed to an approved root recognized by Windows OS Code Integrity for PE, and have either or both of the following signing characteristics:

1.  Catalog signature with an overall attribute of PE TRUSTED, with a hash entry for each specific file setting a field and value of PETrusted=1.

2.  Embedded signature with per-page hashes.

Additionally, the process of determining what signature each module needs is being standardized. Each INF file now must include a SignatureAttributes section uniquely identifying what type of signature is applicable for the associated driver binaries. Adding this section to existing inf files is a very simple process.

An example follows:

```
[SignatureAttributes]
NameOfFile.dll = SignatureAttributes.PETrust
[SignatureAttributes.PETrust]
PETrust=true
```

### Device.Graphics.WDDM12.Render.TDRResiliency

*WDDM 1.2 drivers for GPUs that support Per-Engine Reset must implement the Windows DDI for TDR Resiliency.*

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

A WDDM 1.2 driver for a GPU supporting Per-Engine Reset must implement the TDR DDI for improved reliability and resiliency.
The WDDM 1.2 driver must do the following:

-   The WDDM 1.2 driver must satisfy the WDDM 1.2 GPU Preemption requirement.

-   The WDDM 1.2 driver must implement the following GPU Engine DDIs:

<!-- -->

-   QueryDependentEngineGroup

-   QueryEngineStatus

-   ResetEngine

<!-- -->

-   WDDM 1.2 drivers must continue supporting the pre-Windows 8 TDR behavior of Adapter-wide Reset and Restart. Semantics of these existing DDIs remain the same as before Windows 8.

For more details on the use of the GPU Preemption and TDR Improvements WDDM v1.2 DDI, please refer to the Windows WDK documentation.

### Device.Graphics.WDDM12.Render.UMDLogging

*WDDM 1.2 drivers must implement WDDM User-Mode Driver or UMD Logging to aid diagnosability.*

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

A WDDM 1.2 driver must expose the relationship between the Direct3D resources and Video Memory allocations by implementing the UMD logging ETW interfaces. Below are the specific requirements for the drivers:

-   UMD must report the allocation size specified in the CreateResource call, even if the size of the memory allocated is greater.

-   UMD must log the MapAllocation event for each of its internal allocation and specify the purpose of that allocation.

-   UMD must log the MapAllocation event for each renamed surface.

-   UMD must log the MapAllocation for every surface that it packs into an existing surface.

-   UMD must log the MapAllocation for every surface that currently exists in the event of a rundown.

-   UMD must log the MapAllocation in response to CreateResource call, even if no new memory is allocated.

-   UMD must log the UnmapAllocation each time its internal allocation is destroyed.

-   UMD must log the UnmapAllocation each time an application destroys an allocation, even if actual memory allocation is not destroyed.

-   UMD must log the UnmapAllocation each time it closes one of the renamed allocations.

-   UMD must log the UnmapAllocation for each surface that is packed into a larger allocation.

In addition to logging MapAllocation and UnmapAllocation events as they happen, the Graphics Driver must be able to report all existing mappings between resources and allocations at any point in time.

For more details on the use of the UMD Logging WDDM v1.2 DDI, please refer to the Windows WDK documentation.

### Device.Graphics.WDDM12.Render.XPSRasterizationConformance

*WDDM 1.2 drivers must support XPS Rasterization.*

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

To ensure a quality printing experience on Windows, the WDDM1.2 graphic drivers must support XPS Rasterization.

<a name="device.graphics.wddm12.renderonly"></a>
## Device.Graphics.WDDM12.RenderOnly

*The optional feature set implemented by WDDM 1.2 drivers which support only the render specific DDIs.*

### Device.Graphics.WDDM12.RenderOnly.Base

*Requirements for a WDDM graphics adapter to support render functionality*

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

WDDM has been extended to support a WDDM driver that is only responsible for Rendering and Compute DDIs. Such a driver is not allowed to support any Display Scan out capabilities.

A driver is considered a WDDM Render Only driver if one of the following two conditions is met:

-   The driver implements all the DDIs required for a full WDDM driver, but reports 0 sources and 0 targets.

-   The driver implements all the Render specific DDIs and returns a null pointer for all the Display specific DDIs. The DDIs required for this are called out below.

**Common WDDM DDIs **

These DDI functions are for the common device functionalities such as PnP support and Power support. These functions are required by all WDDM drivers, and if not implemented, the driver will not be started by Windows. These DDIs are already documented in the WDK, <http://msdn.microsoft.com/en-us/library/ff554066.aspx>.

**Required:**

 - DxgkDdiAddDevice
 - DxgkDdiStartDevice
 - DxgkDdiStopDevice
 - DxgkDdiRemoveDevice
 - DxgkDdiDispatchIoRequest
 - DxgkDdiSetPowerState
 - DxgkDdiUnload

**Optional:**

 - DdiNotifyAcpiEvent \*

\* DdiNotifyAcpiEvent DDI function is used to notify graphics drivers on some ACPI events. It is optional for a rendering device. On normal WDDM graphics devices, this DDI function will return a flag to indicate dxgkrnl.sys to take some further actions such as reset display mode or poll the connected monitors.  For the rendering only device, these flags are not used and must be set to zero.
 

**Rendering only DDIs **

These DDI functions are for the rendering functionalities.

**Required:**

 - DxgkDdiInterruptRoutine
 - DxgkDdiDpcRoutine
 - DxgkDdiResetDevice
 - DxgkDdiCreateDevice
 - DxgkDdiDestroyAllocation
 - DxgkDdiDescribeAllocation
 - DxgkDdiOpenAllocation
 - DxgkDdiCloseAllocation
 - DxgkDdiGetStandardAllocationDriverData
 - DxgkDdiSubmitCommand
 - DxgkDdiPreemptCommand
 - DxgkDdiBuildPagingBuffer
 - DxgkDdiResetFromTimeout
 - DxgkDdiRestartFromTimeout
 - DxgkDdiQueryCurrentFence
 - DxgkDdiControlInterrupt
 - DxgkDdiDestroyDevice
 - DxgkDdiPresent
 - DxgkDdiCreateAllocation
 - DxgkDdiPatch
 - DxgkDdiRender
 - DxgkDdiRenderKm

**Optional:**
If the rendering hardware supports swizzling ranger, the driver should also supply the two following functions:

 - DxgkDdiAcquireSwizzlingRange
 - DxgkDdiReleaseSwizzlingRange
 

<a name="device.graphics.wddm12.standbyhibernateflags"></a>
## Device.Graphics.WDDM12.StandbyHibernateFlags

*The optional feature implemented by WDDM 1.2 drivers supporting the new stand by hibernation flags.*

### Device.Graphics.WDDM12.StandbyHibernateFlags.StandbyHibernateFlags

*WDDM v1.2 graphics drivers can optionally specify if they support the Windows optimized standby or hibernate flags.*

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

To improve the performance on sleep & resume for standby and hibernate, a WDDM 1.2 driver can utilize the new StandbyHibernateFlags (PreservedDuringStandby, PreservedDuringHibernate, and PartiallyPreservedDuringHibernate). To utilize this feature, drivers must set one or more of the StandbyHibernateFlags when enumerating segment capabilities. Doing so indicates that eviction should be skipped during power state transition for the corresponding segments. Verification of memory retention during power transition will be verified for all WDDM 1.2 driver setting a StandbyHibernateFlag.

<a name="device.graphics.wddm13"></a>
## Device.Graphics.WDDM13

*The base feature set implemented by drivers supporting WDDM1.3.*

### Device.Graphics.WDDM13.Base

*Graphic drivers must implement WDDM1.3.*

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

WDDM 1.3 is required for all new systems that are shipped with Windows 10.

<html>
    <table>
        <thead>
            <tr class="header">
                <th>Feature Name</th>
                <th>Applicable DX H/W Class</th>
                <th>Full Graphics Driver x86/x64</th>
                <th>Render Only Driver x86/x64</th>
                <th>Full Graphics Driver ARM/RT</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Hybrid Graphics (GPU Kernel)</td>
                <td>DX11+</td>
                <td>If implemented</td>
                <td>NA</td>
                <td>NA</td>
            </tr>
            <tr class="even">
                <td>Multiplane Overlays (GPU Kernel)</td>
                <td>All</td>
                <td>If implemented</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Wireless display support</td>
                <td>All</td>
                <td>If implemented</td>
                <td>NA</td>
                <td>If implemented</td>
            </tr>
            <tr class="even">
                <td>48 Hz Video Playback</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Shared Surface support for more formats</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Present Overhead Optimization</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Kernel Performance: GPU engine enumeration</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Power Management Enhancements: GPU p-state support</td>
                <td>All</td>
                <td>If implemented</td>
                <td>If implemented</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Power Management Enhancements: Stable P-State</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Power Management Enhancements: GPU f-state hysteresis</td>
                <td>All</td>
                <td>If implemented*</td>
                <td>If implemented</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Power Management Enhancements: Aggressive V-sync</td>
                <td>All</td>
                <td>If implemented</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Access to thermal interface</td>
                <td>All</td>
                <td>If implemented</td>
                <td>If implemented</td>
                <td>If implemented</td>
            </tr>
            <tr class="odd">
                <td>Rendering Performance Improvements: D3D9 Staging Buffers</td>
                <td>All</td>
                <td>
                    <p>Mandatory for DX9.x HW</p>
                    <p>Optional for DX10+</p>
                </td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Rendering Performance Improvements: D3D9 Native UpdateSubResource</td>
                <td>All</td>
                <td>
                    <p>Mandatory for DX9.x HW</p>
                    <p>Optional for DX10+</p>
                </td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Rendering Performance Improvements: D3D9 Timestamps and Counters</td>
                <td>All</td>
                <td>
                    <p>Mandatory for DX9.x HW</p>
                    <p>Optional for DX10+</p>
                </td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Rendering Performance Improvements: D3D Resource Trim</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Rendering Performance Improvements: Feature Level 9 Instancing</td>
                <td>All</td>
                <td>Mandatory for DX9.x HW</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>Rendering Performance Improvements: D3D9 Large Capture Textures</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Rendering Performance Improvements: Map Default</td>
                <td>DX11+</td>
                <td>Mandatory</td>
                <td>NA</td>
                <td>NA</td>
            </tr>
            <tr class="even">
                <td>Tiled Resources</td>
                <td>DX11.1</td>
                <td>If implemented</td>
                <td>If Implemented</td>
                <td>If implemented</td>
            </tr>
            <tr class="odd">
                <td>Independent Flip</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>NA</td>
                <td>Mandatory</td>
            </tr>
            <tr class="even">
                <td>D3D Modification for Tools: High Performance Timing Data</td>
                <td>All</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
            <tr class="odd">
                <td>Full Range YUV Support</td>
                <td>DX10+</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
                <td>Mandatory</td>
            </tr>
        </tbody>
    </table>
    <p><strong>*</strong>Mandatory if implementing Connected Standby</p>
    <p>There are no additional requirements for Display only Driver; Hence, it is not called out in the table.</p>
    <p><strong>D3D Requirements:</strong></p>
    <table>
        <thead>
            <tr class="header">
                <th>DirectX Hardware</th>
                <th>KMD Requirements</th>
                <th>UMD Requirements</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>D3D9</td>
                <td>Required: WDDM v1.3</td>
                <td>Required: D3D9 - UMD DDI</td>
            </tr>
            <tr class="even">
                <td>D3D10</td>
                <td>Required: WDDM v1.3</td>
                <td>
                    <p>Required: D3D9 - UMD DDI</p>
                    <p>Required: D3D10- UMD DDI</p>
                    <p>Required: D3D11.1 - UMD DDI</p>
                </td>
            </tr>
            <tr class="odd">
                <td>D3D10.1</td>
                <td>Required: WDDM v1.3</td>
                <td>
                    <p>Required: D3D9 - UMD DDI</p>
                    <p>Required: D3D10- UMD DDI</p>
                    <p>Required: D3D10.1- UMD DDI</p>
                    <p>Required: D3D11.1 - UMD DDI</p>
                </td>
            </tr>
            <tr class="even">
                <td>D3D11</td>
                <td>Required: WDDM v1.3</td>
                <td>
                    <p>Required: D3D9 - UMD DDI</p>
                    <p>Required: D3D10- UMD DDI</p>
                    <p>Required: D3D10.1- UMD DDI</p>
                    <p>Required: D3D11 - UMD DDI</p>
                    <p>Required: D3D11.1 - UMD DDI</p>
                </td>
            </tr>
            <tr class="odd">
                <td>D3D11.1</td>
                <td>Required: WDDM v1.3</td>
                <td>
                    <p>Required: D3D9 - UMD DDI</p>
                    <p>Required: D3D10- UMD DDI</p>
                    <p>Required: D3D10.1- UMD DDI</p>
                    <p>Required: D3D11 - UMD DDI</p>
                    <p>Required: D3D11.1 - UMD DDI</p>
                </td>
            </tr>
        </tbody>
    </table>
</html>

<a name="device.graphics.wddm13.displayrender"></a>
## Device.Graphics.WDDM13.DisplayRender

*The parent feature node of requirements that have an impact for the display and render GPU.*

### Device.Graphics.WDDM13.DisplayRender.48HzVideoPlayback

*WDDM1.3 drivers must support 48 Hz Video Playback.*

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

Graphic Drivers implementing WDDM1.3 must implement DDIs that:

1.  Report whether the collective system can seamlessly switch to 48 Hz (intersection of SOC and display panel capabilities).

2.  If so, allow the refresh rate (such as 48 Hz) to be specified on each particular Present DDI.

The HCK test will validate that the refresh rate with within a 0.5% tolerance of the requested value, again assuming the graphics driver reports support for the particular refresh rate. This will be validated for devices *that report support for 48 Hz or 50 Hz through the capabilities DDI* through an HCK test, which is described in detail in the 48 Hz IHV spec.

### Device.Graphics.WDDM13.DisplayRender.IndependentFlip

*IndependentFlip support*

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

All WDDM 1.3 drivers MUST support independentFlip. As such, all WDDM 1.3 drives MUST set the UINT FlipIndependent member to 1 in the updated DXGK\_FLIPCAPS structure. See the IndependentFlip DDI Document for more details about the updated DXGK\_FLIPCAPS structure.

<a name="device.graphics.wddm13.displayrender.coolinginterface"></a>
## Device.Graphics.WDDM13.DisplayRender.CoolingInterface

*Feature for Thermal Hints*

### Device.Graphics.WDDM13.DisplayRender.CoolingInterface.ThermalHints

*Optional Thermal Hints support for WDDM1.3 drivers *

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

WDDM graphics 1.3 or later drivers must check for the new added DeviceUid field in the QUERY\_INTERFACE structure OS passed in by the DxgkDdiQueryInterface function and return a valid interface function on the OS specified device.

If ACPI firmware adds the current graphics device into ACPI ThermalZone, then the IHV miniport must support the DxgkDdiQueryInterface on the GUID\_THERMAL\_COOLING\_INTERFACE for the current graphics device.

**Validation:**

ACPI.sys will only query the thermal cooling interface if the current device is in a thermal zone. Dxgkrnl.sys can validate that the IHV miniport driver supports the GUID\_THERMAL\_COOLING\_INTERFACE when ACPI queries this interface. In this case, WHCK can receive the error log that the miniport driver fails the DxgkDdiQueryInterface call on GUID\_THERMAL\_COOLING\_INTERFACE and fail the WHCK test.

<a name="device.graphics.wddm13.displayrender.wirelessdisplay"></a>
## Device.Graphics.WDDM13.DisplayRender.WirelessDisplay

*The optional feature set implemented by WDDM 1.3 drivers that support the Miracast functionality.*

### Device.Graphics.WDDM13.DisplayRender.WirelessDisplay.BasicWirelessDisplay

*Optional Wireless Display support for WDDM1.3 drivers *

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

NOTE: In Windows 10 the Wireless Display framework was changed significantly so that most of the work is done by the OS. The requirements in this section do not apply to WDDM 2.0 Drivers. However, existing WDDM 1.3 Drivers can continue to use this mechanism.

-   This is an optional feature for WDDM 1.3 drivers.

-   The WDDM Miracast user mode driver must be a separate DLL.

-   If a driver supports Miracast display, then it must enumerate only one Miracast target along with other supported targets.

-   A driver must accurately report the target type to Windows. Any time Windows connects to a Miracast device, the driver must use the new target type irrespective of the connection between the Miracast end point and the display device.

-   A driver must only indicate the arrival of a monitor once the Miracast session is established, the device capabilities have been obtained, HDCP negotiations has taken place, and the user mode driver is ready to stream display to the device.

-   A driver must use the new DDIs for any private communication between UMD and KMD. A driver must not poll for packet state.

-   A driver must use the new DDIs for any private communication between UMD and KMD. A driver must not poll for packet state.

-   All memory access by the GPU must be allocated through DirectX APIs. A driver must not carve out or hide memory that is used for the implementation.

-   All hardware being used for the implementation must be exposed to Windows to enable accurate power management.

-   A driver must report v-sync on the wireless displays.

-   A driver must use published Windows networking APIs from the user mode and must not use any private interfaces with the NW driver.

-   Every time the receiver requests an i-frame, the driver must log it with Windows using a new DDI.

-   If the Miracast device supports Audio, the driver must enumerate an Audio end point to Windows similar to how it is enumerated for HDMI/Display Port. The container ID for the audio device must match that of the corresponding Miracast display device.

-   When Windows sets the MC display to “monitor idle”, the driver must set the “power saving mode” as defined in the MC standard. When the user provides input to resume from monitor idle, the MC display must be brought back to full power and the user must be able to use it without having to reconnect.

-   The user mode Miracast driver must complete the new DDI to stop a Miracast session, within 3 seconds.

-   A driver must conform with the same resolution enumeration requirement as other target types as specified in the WHCK.

-   In the event that there is no display physically connected to the Miracast sink, then the driver must still allow the connection to succeed but must not report the display to Windows. Once the display is physically connected, then the driver must report it to windows.

-   In the event that a user physically disconnects the display from the Miracast sink device, the driver must report the display removal and Windows will disconnect from the session.

-   A WDDM driver must be capable of supporting HDCP over Miracast.

-   If a sink device does not support HDCP, the driver must still allow the connection to succeed.

-   In case the driver TDR's, the driver should appropriately terminate the session.

<a name="device.graphics.wddm13.enhancedpowermanagement"></a>
## Device.Graphics.WDDM13.EnhancedPowerManagement

*Graphics Kernel Power Management Enhancements*

### Device.Graphics.WDDM13.EnhancedPowerManagement.FState

*F-State Hysteresis*

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

WDDM 1.3 introduces some power management enhancements. If implemented then:

LATENCY TIME VALIDATION

For a transition from a lower power F-State to a higher one, it is expected that the time it takes to complete the transition will not be more than 10% over the transition latency time reported by the driver.

### Device.Graphics.WDDM13.EnhancedPowerManagement.VSYNC

*Aggressive VSYNC*

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

WDDM 1.3 introduces some power management enhancements:

IN PHASE VSYNC

While the Vsync is enabled, 98% of the Vsyncs must be within 500 us of the expected value with no Vsyncs exceeding a variance of more than 1.5 ms.

<a name="device.graphics.wddm13.render"></a>
## Device.Graphics.WDDM13.Render

*The base feature set implemented by WDDM 1.3 drivers that support the render specific DDIs.*

### Device.Graphics.WDDM13.Render.CheckDDIBoundaries

*Hybrid Graphics*

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

**Graphics drivers should not circumvent DDI boundaries.**

-   No system level or runtime level API detouring is allowed – The driver is not allowed to intercept OS system or runtime calls, or modify arguments passed by OS system or runtime APIs, or wrap the objects returned from the API entrypoints.

-   Access and use of internal data structures is not allowed.

-   No driver layering is allowed - Only one user mode/kernel mode driver is allowed to be loaded and communicate with the runtime and kernel binaries.

### Device.Graphics.WDDM13.Render.DirtyRect

*Optional DirtyRect support for WDDM1.3 drivers *

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

WDDM1.3 introduces the ability to support DirtyRect. If DirtyRect is implemented, then it must follow the specification.

### Device.Graphics.WDDM13.Render.GPUNode

*Graphics Kernel Performance*

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

If WDDM1.3 is implemented, then the driver must:

-   The driver must specify a valid enum value for each engine per physical adapter.

-   The driver must specify one engine of type DXGK\_ENGINE\_TYPE\_3D per physical adapter.

-   For each engine, the given enum value must meet the requirements as stated in the engine definitions table in the DDI.

### Device.Graphics.WDDM13.Render.HighPerformanceTimingData

*High Performance Graphics Timing Data*

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

“High Performance Graphics Timing Data” provides lightweight and highly detailed timing data for graphics workloads. This data is used by analysis tools to identify performance or other graphics related issues in Windows applications or the graphics stack.

A WDDM1.3 driver must ensure that the graphics device/driver provides the following:

-   A high resolution GPU Timer

    -   12.5 MHz (80ns resolution) or better.

    -   At least 32 bits of timestamp resolution.

    -   The GPU timestamp can be sampled for all engines in a GPU.

    -   The GPU timestamp can be sampled at the end of the GPU pipeline.

    -   The GPU timestamp frequency can be sampled.

    -   The GPU timestamp is invariant and is unaffected by p-state transitions.

<!-- -->

-   Among the other changes for this feature, this will include the addition of two new flags to the existing DdiControlEtwLogging interface; when these flags are set so that the first flag is value of 1 and the second flag is a value of 0, then the driver must ensure that:

    -   All engine components must ensure that they are never clock- or power-gated as long as the flag remains enabled, and must in general refrain from entering any idle states. The components must remain active to ensure that there is no latency added due to power transitions.

    -   All engine components must ensure that their processing frequencies and functional bus bandwidths are kept at their maximum stable operating values. Thermal events requiring P-State transition down should still occur to prevent damage to the hardware, but P-States should be defined so that these are exceptional occurrences that are not normally seen in cool lab environments.

<!-- -->

-   The sampled GPU timestamp can be correlated with previously issued graphics commands.

-   The generation of timing data is off by default, but can be turned on and off at any time.

-   The overhead of collecting this performance data is no slower than using the timestamp query technique that is already available in D3D9 and D3D10+.

-   Timing data can be collected via the D3D9 driver on feature level 9 hardware, and the D3D10 driver on feature level 10+ hardware.

-   The resulting data on Tile based deferred rendering hardware appears as if it was generated on an immediate mode rendering device.

### Device.Graphics.WDDM13.Render.PresentOverheadOptimization

*Present Overhead Optimization *

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

WDDM1.3 drivers must support the new DDI, Present1, on Feature Level 9 hardware through the D3D9 DDI, as well as on Feature 10+ hardware through the D3D11 DDI. WDDM1.3 drivers on Feature Level 10+ hardware can optionally support this feature through the D3D9 DDI; however, such support should be consistent with its support for all other Optional Performance Features (e.g., Shared Surface Support).

To ensure the desired performance characteristics when Present1 is used, the following is required:

-   Rendering as a result of calling the new DDI must be same as the rendering as a result of using traditional multiple single-present DDI calls.

-   The driver must only call the Present callback once per DDI call (and not once per resource).

### Device.Graphics.WDDM13.Render.SharedSurfaceSupport

*Shared Surface Support*

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

WDDM1.3 drivers must support these new formats and capabilities for shared surfaces:

-   Drivers support new formats on Level 9 hardware,

    -   A8\_UNORM

    -   R8\_UNORM

    -   R8G8\_UNORM

-   Driver supports shared surfaces in new formats (A8\_UNORM, R8G8\_UNORM, R8\_UNORM, BC1\_\*, BC2\_\*, and BC3\_\*) with the following capabilities on Feature Level 9 hardware through the D3D9 DDI, as well as on Feature 10+ hardware through the D3D11 DDI. WDDM1.3 drivers on Feature Level 10+ hardware can optionally support this feature through the D3D9 DDI; however, such support should be consistent with its support for all other Optional Performance Features (e.g., Present Overhead Support).

    -   Resources sharing;

    -   Resources can be used as render target;

    -   Resources can be blended;

    -   Resources can be filtered;

    -   Resources can be accessed.

### Device.Graphics.WDDM13.DisplayRender.MultiplaneOverlaySupport

*Multi-plane Overlay support*

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

All WDDM 1.3 display drivers must report multi-plane overlay capabilities of the hardware using the DDI defined by the Multi-plane Overlay Support DDI specification. WDDM 1.3 drivers that claim to support multi-plane overlays must meet all of the following hardware criteria:

1.  Hardware must support non-overlapping planes.

    -   One plane can cover one portion of the screen while another plane can cover a different, mutually exclusive, portion of the screen.

    -   If there is any portion of the screen not covered by a plane, the hardware must scan out black for that area. The hardware can assume that there is a virtual plane at the bottom-most Z order that is filled with black.

2.  Hardware must support overlapping planes. Blending between the planes using pre-multiplied alpha must be supported. The hardware must also be able to enable/disable alpha blending on a per-plane basis.

3.  When only one output is active, the active output must support multi-plane overlays. In the case of clone mode where multiple outputs are simultaneously active, the hardware should not report that it supports multi-plane overlays unless all active outputs support multi-plane overlays.

4.  The DWM’s swapchain (plane 0) must be able to interact with the other overlay planes.

5.  All planes must be able to be enabled and disabled, including plane 0 (the DWM’s swapchain).

6.  All planes must support source and destination clipping, including plane 0 (the DWM’s swapchain).

7.  At least one plane must support shrinking and stretching, independent from other planes that may be enabled.

8.  Planes that support scaling must support both bilinear filtering and better than bilinear filtering quality.

9.  At least one plane must support:

    -   Both 601 and 709 YUV to RGB matrix conversion for YUV formats.

    -   Both normal range YUV luminance (16 - 235) and full range YUV luminance (0 – 255).

10. The following register latching scenarios must be handled:

  -   All per-plane attributes (buffer address, clipping, scaling, etc.) must atomically post on the vertical retrace period. When updating a block of registers, they must all post atomically (i.e., if the VSYNC occurs after writing 10 of 20 registers pertaining to the overlay plane, none of them will post until the next VSYNC since they cannot all post on the current VSYNC).

  -   Each plane can be updated independently from the other planes. For example, if the plane 0 registers have been updated prior to the VSYNC and we update the plane 1 registers when the VSYNC occurs, the plane 1 updates might wait until the next VSYNC, but the plane 0 updates should occur on time.

  -   When multiple planes are updated during a single present call, the updates should occur atomically. For example, if a single present call is updating plane 0 and enabling plane 1, the plane 0 registers should not post on the VSYNC unless the plane 1 registers also post on the same VSYNC.

11.  Transformation, scaling, and blending should occur as follows (in the specified order):

  -   The source allocation is clipped according to the specified source rectangle. The source rectangle is guaranteed to be bounded within the size of the source allocation.

  -   Apply Horizontal image flip, then Vertical image flip if requested.

  -   Apply scaling according to the destination rectangle, apply clipping according to the clip rectangle, and apply the appropriate filtering when scaling.

  -   Blend with allocations at other layers. Blending should be performed from top to bottom (or until hit opaque layer) in Z-order. If alpha blending is requested, hardware must honor the per-pixel-alpha and color value is pre-multiplied by alpha. Pseudo code is indicated below, this does “source over destination” operation repeatedly from top to bottom, (((Layer\[0\] over Layer\[1\]) over Layer\[2\]) over … Layer\[n\]). Outside of the destination rectangle, each layer must be treated as transparent (0,0,0,0).

> Color = Color\[0\]; // layer 0 is topmost.
>
> Alpha = Color\[0\].Alpha;
>
> for (i = 1; Alpha &lt; 1 && i &lt; LayersToBlend; i++)
>
> {
>
> Color += ((1 - Alpha) \* Color\[i\]);
>
> Alpha += ((1 - Alpha) \* Color\[i\].Alpha);
>
> }
>
> Output Color;

It is OK if hardware blends bottom to top as long as the output result is the same. In this case, the following blend algorithm should be used:

> Color = Color\[LayersToBlend-1\]; // Bottom most layer
>
> Alpha = Color\[LayersToBlend-1\].Alpha;
>
> if (LayersToBlend &gt; 1)
>
> {
>
> for (i = LayersToBlend - 2; Alpha &lt; 1 && i &gt;= 0; i--)
>
> {
>
> Color = Color\[i\] + (1 – Color\[i\].Alpha) \* Color;
>
> Alpha = Color\[i\].Alpha + (1 – Color\[i\].Alpha) \* Alpha;
>
> }
>
> }
>
> Output Color;

-   Black color must be displayed at the area where not covered by any of destination rectangles from any layers. Hardware can assume there is a conceptual virtual black bottom most layer that is the size of the screen.


### Device.Graphics.WDDM13.Render.TrimSupport

*Direct3D Trim*

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

The Trim API is new in the WDDM1.3 updates to the D3D9 UM DDI. Graphics devices must support this API and the driver must do the following:

-   After a device calls Trim, the graphics driver memory usage must return to within 5% of its usage after initial device creation.

-   The responsiveness of the graphics driver for rendering operations after calling Trim must be comparable to that of the driver after initial Direct3D device creation.

-   Calling Trim must not change the state of the Direct3D device – all rendering operations should continue to be evaluated normally.

<a name="device.graphics.wddm20"></a>
## Device.Graphics.WDDM20

### Device.Graphics.WDDM20.CoreRequirement

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

<ol style="list-style-type: decimal">
<li><p>Core.MemoryResidencyModel</p>

<p>A WDDM 2.0 driver must meet all requirements with defined in the WDDM 2.0 Specification.</p>
<p>Drivers must support the new model for managing memory residency for WDDM 2.0 as defined in the Memory Residency model specification.</p>
<p>Drivers must explicitly create one or more paging queues for each D3D Device. Synchronization of operations of the paging queues must be done using Monitored Fences. Asynchronous Trim callbacks can occur which the UMD must handle by evicting resources until memory usage is below the specified limit.</p>
<p>A residency list of resources in memory must be maintained by the UMD for each D3D Device. UMD must use Trim/Flush/Wait to make progress in case an application uses more than its allocated memory.</p>
<p>For compatibility with D3D11 and earlier versions, the UMD must manage residency based on Bind and Unbind operations.</p>
<p>UMD must handle Offer and Reclaim requests differently in order to correctly maintain the Residency list.</p>

<table>
<thead>
<tr class="header">
<th>Feature Name</th>
<th>Applicable DX H/W Class</th>
<th>Full Graphics Driver</th>
<th>Render Only Driver</th>
<th>Display Only driver</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>MakeResident and Evict</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Lock2 support</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Monitored Fence support</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>GPU Sync Points</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Trim Callback support</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Offer/Reclaim support</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>MakeResident and Evict</td>
<td>All</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
</tbody>
</table>
</li>

<li><p>Virtual Memory:</p>

<p>A WDDM 2.0 driver must meet all requirements defined in the WDDM 2.0 Specification.</p>
<p>Drivers must support the new model for managing memory residency for WDDM 2.0.</p>
<p>All engines that implement GPU virtual addressing must support capabilities defined in the GPU Virtual Memory DDI Specification including setting relevant capability bits.</p>
<p>References to all resources must be via their virtual addresses and the virtual addresses must remain constant for the lifetime of the resources.</p>
<p>It is mandatory to support single GPU address space per GPU logical adapter per process.</p>
<p>Engines that support virtual addressing must support GPUMMU model for virtual addressing and must not have any dependency on physical addressing. Support for the IOMMU model of virtual addressing is optional.</p>
<p>Drivers must support multi-level page tables and must support a mixture of 4KB and 64KB page tables.</p>
<p>Display and Capture surfaces for integrated GPUs must be addressable via the Aperture Segment.</p>
<p>Display surfaces in discrete GPUs must be allocated contiguously from a memory segment.</p>

<table>
<thead>
<tr class="header">
<th>Feature Name</th>
<th>Applicable DX H/W Class</th>
<th>Full Graphics Driver</th>
<th>Render Only Driver</th>
<th>Display Only</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Virtual Paging support</td>
<td>All</td>
<td>If VA is implemented</td>
<td>If VA is implemented</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Multi-level Page Table support</td>
<td>All</td>
<td>If VA is implemented</td>
<td>If VA is implemented</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Side-by-side 4K/64K Page Tables</td>
<td>All</td>
<td>If VA is implemented</td>
<td>If VA is implemented</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Page-based Memory Segment Management</td>
<td>All</td>
<td>If VA is implemented</td>
<td>If VA is implemented</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Tiled Resources</td>
<td>DX11.1+</td>
<td>Mandatory</td>
<td>Mandatory</td>
<td>N/A</td>
</tr>
<tr class="even">
<td>Programmable CPU Host Aperture support</td>
<td>All</td>
<td>If applicable</td>
<td>If applicable</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>LDA support</td>
<td>All</td>
<td>If applicable</td>
<td>If applicable</td>
<td></td>
</tr>
</tbody>
</table>
</li>

<li><p><strong>Map Default</strong></p>

<p>Display drivers for D3D11/D3D12 must meet all requirements defined in the <strong><em>D3D 11/D3D12 Specifications</em></strong>.</p>
<p>When such pages are accessible by the CPU, they must be able to be marked as write-back or write-combine for the CPU.   Memory used by default, CPU-accessible textures must be marked as write-back if CPU-read is enabled.  If CPU-write is enabled the memory must be marked as write-combine, except on cache coherent UMA designs.</p>
<p>Pitch-linear requirements &amp; restrictions are as follows:</p>

<ul>
<li><p>The base address/ offset of mapped resources must be at least 16-byte aligned.</p></li>
<li><p>Compressed render targets must be able to be resolved to enable the CPU to read/ write the texels.</p></li>
</ul>

<p>Memory requirements &amp; restrictions are as follows:</p>

<ul>
<li><p>The base address/ offset of mapped resources must be at least 16-byte aligned.</p></li>
<li><p>Compressed render targets must be able to be resolved to enable the CPU to read/ write the texels.</p></li>
<li><p>The texture must be resident in system memory</p></li>
<li><p>The texture must not be renamed or shadow-copied as a result of mapping</p></li>
<li><p>Swizzle ranges must not be used while the texture is mapped</p></li>
</ul>
<ul>
<li><p>When the GPU supports standard swizzle, the GPU must support all multi-dimensional operations as orthogonally as other textures, such as texture from, render to, copy to &amp; from, re-swizzle to &amp; from, etc.</p>
<ul>
<li><p>Element size for block-compressed formats and ASTC formats must be same as the block size.</p></li>
<li><p>GPU must support standard swizzle from all engines, including scan-out.</p></li>
<li><p>Compressed render targets must be able to be resolved to enable the CPU to read/ write the texels.</p></li>
</ul></li>
</ul>
<p>Standard swizzle data must be aligned to 4KB and 64KB page boundaries.</p>
</li>
</ol>

Business Justification:

WDDM 2.0 introduces new set of features and DDI changes designed to work optimally with next version of Windows.


<a name="device.graphics.wddm20.core"></a>
## Device.Graphics.WDDM20.Core

*The base feature set implemented by drivers supporting WDDM2.0.*

### Device.Graphics.WDDM20.Core.Base

WDDM2.0

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

Graphics drivers can optionally implement WDDM 2.0 if they do not support D3D12. However, D3D12 support requires WDDM 2.0.

Windows 10 introduces a new set of features and DDI changes that will be referred to as WDDM2.0. The implementation of WDDM2.0 is optional although it is required for implementing a driver that supports D3D12. If implemented, the WDDM2.0 specification must be followed.

**D3D Requirements:**

<table>
<thead>
<tr class="header">
<th>DirectX Hardware</th>
<th>KMD Requirements</th>
<th>UMD Requirements</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>D3D9</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="even">
<td>D3D10</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D10 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D11.1 - UMD DDI</td>
</tr>
<tr class="odd">
<td>D3D10.1</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D10 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D10.1 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D11.1 - UMD DDI</td>
</tr>
<tr class="odd">
<td>D3D11</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D10 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D10.1 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D11 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D11.1 - UMD DDI</td>
</tr>
<tr class="even">
<td>D3D11.1</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D10 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D10.1 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D11 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D11.1 - UMD DDI</td>
</tr>
<tr class="odd">
<td>D3D12</td>
<td>Required: WDDM 2.0</td>
<td>Required: D3D9 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D10 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D10.1 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D11 - UMD DDI</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Required: D3D11.1 - UMD DDI</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Required: D3D12 - UMD DDI</td>
</tr>
</tbody>
</table>

<a name="device.graphics.wddm20.displayrender"></a>
## Device.Graphics.WDDM20.DisplayRender

*The parent feature node of requirements that have an impact for the display and render GPU.*

### Device.Graphics.WDDM20.DisplayRender.HardwareContentProtection

*A GPU must support hardware-based content protection.*

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

The GPU driver for the next version of Windows must adhere to the Graphics – D3D11 Content Protection DDI Specifications. 

The GPU driver and hardware must pass the Microsoft Hardware Content Protection tests. 

Requires a network connection and access to PlayReady Content Protection test servers.

<a name="device.graphics.wddm20.display.virtualmodesupport"></a>
## Device.Graphics.WDDM20.Display.VirtualModeSupport

### Device.Graphics.WDDM20.Display.VirtualModeSupport.CoreRequirement

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

**Description**:

WDDM2.0 drivers must report support for virtual resolution changes and DWMClone, via the new VirtualModeSupport member in DXGK\_DISPLAY\_DRIVERCAPS\_EXTENSION, by setting VirtualModeSupport to 1 when the OS calls DxgkDdiQueryAdapterInfo on DXGKQAITYPE\_DISPLAY\_DRIVERCAPS\_EXTENSION. 

<a name="device.graphics.wddm21"></a>
## Device.Graphics.WDDM21

WDDM 2.1 is an optional version level introduced for Windows 10 builds greater than 10586. If a driver implements WDDM 2.1 then it must implement all of the WDDM 2.1 Requirements. WDDM 2.0 drivers will continue to run on the newer Windows 10 builds.

### Device.Graphics.WDDM21.CoreRequirement

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

**Description**:

A WDDM 2.1 driver must meet all requirements defined in the WDDM 2.1 Specification. In particular, drivers should implement the following (depending on hardware capabilities):

1.  Offer / Reclaim

	WDDM 2.1 drivers must support the changes to the Offer / Reclaim feature.

2.  Video Protected Region

	Hardware that implements a single-range VPR (Video Protected Region) must support the new Move Paging DDIs so that the VPR can be defragmented.

3.  Large Page PTE Encoding

	If the hardware supports large page PTEs, e.g., 64KB, these are supported by WDDM 2.1 and should be implemented.

4.  Pre/Post Present Optimizations

	A new callback in WDDM 2.1 (UpdateAllocationProperties) allows for scenarios involving Pre/Post Present optimizations. This is optional.

### Device.Graphics.WDDM21.FlipQueueLatency

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

**Description**:

A WDDM2.1 driver must support a 64bit PresentID member in DXGK\_MULTIPLANE\_OVERLAY\_VSYNC\_INFO2 assigned to each flip request for a particular MPO plane. This value will be passed to the driver at the time of the flip request, and the driver must report back the currently acknowledged PresentId value in the VSync ISR callback.

The ability to queue more than one flip-on-VSync request on the same MPO plane must be controlled by the MaxQueuedMultiPlaneOverlayFlipVSync member in DXGK\_DRIVERCAPS.

For hardware that cannot support more than one in flight flip-on-VSync request, the driver must set MaxQueuedMultiPlaneOverlayFlipVSync to 1.

If the OS passes a non-negative MaxImmediateFlipLine (member of DXGK\_MULTIPLANE\_OVERLAY\_PLANE3) to the driver and the driver detects that the hardware has not yet started to scan out of horizontal line &gt;= MaxImmediateFlipLine, the driver must perform an immediate flip for the new surface.

In the case where a converted immediate flip overrides a previous pending flip-on-VSync, the driver must report the immediate flip conversion success.

The driver must pass GPU clock and frequency values in the VSync ISR callback (DXGKARGCB\_NOTIFY\_INTERRUPT\_DATA).

<a name="device.graphics.wddm22"></a>
## Device.Graphics.WDDM22

*WDDM 2.2 is an optional version level introduced for Windows 10 version 1607 builds greater than 14393. If a driver implements WDDM 2.2 then it must implement all of the WDDM 2.1 Requirements. WDDM 2.0 drivers will continue to run on the newer Windows 10 builds*
    
<a name="device.graphics.wddm22.adapterrender.d3d11.parametrizedswizzlesr1"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D11.ParametrizedSwizzlesR1

### Device.Graphics.WDDM22.AdapterRender.D3D11.ParametrizedSwizzlesR1.CoreRequirements

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

If implementing D3D11 for WDDM 2.2, graphics drivers must divulge the address swizzle patterns used for textures by the GPU.

**Business Justification:**

Tools need simpler ways to capture & playback the memory used by GPUs. Microsoft middleware needs UMA optimizations, but doesn’t require standard swizzle. Games are interested in uploading resource data with the CPU and without GPU involvement.

<a name="device.graphics.wddm22.adapterrender.d3d11d3d12.systemshadercache"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D11D3D12.SystemShaderCache

*This feature is optional for D3D11 and D3D12, however, if a driver chooses to implement this feature for either D3D version the feature must also be implemented for the other D3D version*

### Device.Graphics.WDDM22.AdapterRender.D3D11D3D12.SystemShaderCache.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description: **

The D3D11 and D3D12 runtimes will provide access to a system shader cache infrastructure to the IHV driver to leverage. If a D3D11 driver opts to take advantage of this, they may leverage the provided callbacks with no additional requirements. If a D3D12 driver opts to take advantage of this, they must ensure that they only use the callbacks in response to appropriate DDI invocations.

For D3D12, the driver may only invoke the shader cache callbacks in response to the pfnCreatePipelineState DDI, or the pfnCreateCommandSignature DDI. The callbacks must be invoked on the same thread that called into the driver. Additionally, when called in response to pfnCreatePipelineState, the driver must provide the HRTPIPELINESTATE handle that was passed to the driver.

**Business Justification:**

Having a shader cache improves application startup time.


<a name="device.graphics.wddm22.adapterrender.d3d12.9on12"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.9on12 

### Device.Graphics.WDDM22.AdapterRender.D3D12.9on12.FloatingPointBehavior

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

In implementing D3D12 in WDDM 2.2, drivers have the option to support 9on12 Floating Point Behavior. This feature is a method for asking drivers to tweak shader arithmetic behavior in ways to be compatible with legacy D3D9 applications.

**Business Justification: **

Application compatibility.


<a name="device.graphics.wddm22.adapterrender.d3d12.astc"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.ASTC

### Device.Graphics.WDDM22.AdapterRender.D3D12.ASTC.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description: **

In implementing D3D12 in WDDM 2.2, drivers have the option to support for ASTC texture formats.

**Business Justification:**

This feature may be critical for platform competitiveness.


<a name="device.graphics.wddm22.adapterrender.d3d12.depthboundtest"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.DepthBoundTest

### Device.Graphics.WDDM22.AdapterRender.D3D12.DepthBoundTest.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

In implementing D3D12 in WDDM 2.2, drivers have the option to support Depth Bound Testing. This feature allows a programmer to discard pixels (or samples) based on a minimum and maximum depth value as compared against the currently stored depth value (not the one output by the PS under testing). 

This API will be exposed as a PSO enable/disable toggle in order to support hardware that sets depth buffer read state in the PSO, and Command List method in order to support dynamically changing the Depth Bounds. It will allow the setting of two floating point values: a minimum floating point depth value and a maximum floating point depth value. 

**Business Justification:**

 This supports Xbox/Windows D3D parity. 


<a name="device.graphics.wddm22.adapterrender.d3d12.dxil.int64"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.Int64

### Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.Int64.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

If a driver chooses to implement Int64 it must implement ShaderModel6 outlined in the above section. In addition, to declare support for 64-bit int operations, a driver should set the Int64Ops member of the D3D12DDI_SHADER_CAPS_0015 structure to TRUE. It should then process the use of 64-bit signed and unsigned values in intrinsics and arithmetic opcodes as per their specification.

**Business Justification:**

The 64-bit int requirement, if implemented, allows shader authors to simplify code dealing with 64-bit int quantities natively, allowing improved hardware utilization and improved performance. Again, this can be used to provide better performance for games and some scientific applications.

<a name="device.graphics.wddm22.adapterrender.d3d12.dxil.waveops"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.WaveOps

### Device.Graphics.WDDM22.AdapterRender.D3D12.DXIL.WaveOps.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

If a driver chooses to implement WaveOps it must implement ShaderModel6 outlined in the above section. In addition, to declare support for wave intrinsics, a driver should set the WaveOps member of the D3D12DDI_SHADER_CAPS_0012 structure to TRUE and initialize the WaveLaneCountMin and WaveLaneCountMax according to its capabilities, with a minimum value of at least 4 and a maximum value of at least its minimum. It should then process built-in functions related to wave operations as per their specification.

**Business Justification:**

The wave intrinsics requirement, if implemented, allows shader authors to exploit intra-wave communication, with guarantees around data visibility and synchronization that lead to better hardware utilization and improved performance. This leads to more competitive games and better user experiences.

<a name="device.graphics.wddm22.adapterrender.d3d12.dxilcore"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.DXILCore

### Device.Graphics.WDDM22.AdapterRender.D3D12.DXILCore.ShaderModel6

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

Shader Model 6 is a new shader model that may be supported by drivers for D3D12. The major innovation here is the support of a new program representation, which also allows for the optional support for wave intrinsic functions and 64-bit int values. This feature is optional for WDDM 2.2 D3D12 drivers however if implementing, drivers must implement the following requirement.

To declare support for the feature, a driver must enumerate Shader Model 6 or higher as the highest supported shader model (D3D12DDI_SHADER_MODEL_6_0_RELEASE_0011). It should then accept shaders with major version 6, which will be encoded in DXIL bitcode rather than DXBC bytecode.

**Business Justification:**

Shader Model 6 modernizes the program representation and aligns it with LLVM, a popular open source toolchain that provides a wealth of supporting resources and which allows developers to familiarize themselves faster and reuse expertise from other compiler projects. This will lead to shorter cycles to deliver innovation as well as opening the platform to third-party tooling scenarios, feature and quality contributions from the development community, and partnering with academic research communities.


<a name="device.graphics.wddm22.adapterrender.d3d12.mvpmrtarrayindexrouting"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.MVPMRTArrayIndexRouting

### Device.Graphics.WDDM22.AdapterRender.D3D12.MVPMRTArrayIndexRouting.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

In implementing D3D12 in WDDM 2.2, drivers have the option to support Multi-Viewport and Multi-RT-Array-Index Routing. This feature provides ability for shader before rasterizer to route output geometry to specific viewport(s) and RTArray index(es).

**Business Justification:**

Beneficial to VR scenarios, platform rendering efficiency.

<a name="device.graphics.wddm22.adapterrender.d3d12.programmablemsaa"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.ProgrammableMSAA

### Device.Graphics.WDDM22.AdapterRender.D3D12.ProgrammableMSAA.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

In implementing D3D12 in WDDM 2.2, drivers have the option to support Programmable MSAA. This feature provides ability for application to select MSAA sample patterns.

**Business Justification: **

Beneficial to console parity, customer request, platform completeness.

<a name="device.graphics.wddm22.adapterrender.d3d12.stereoprimitives"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.StereoPrimitives

### Device.Graphics.WDDM22.AdapterRender.D3D12.StereoPremitives.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description: **

In implementing D3D12 in WDDM 2.2, drivers have the option to support stereo primitives. This feature provides ability for shader before rasterizer to output, in addition to usual xyzw position, an additional x value, allowing two projections translated on the x axis to be output from a single shader invocation.

**Business Justification:**

Beneficial to VR scenarios, platform rendering efficiency.


<a name="device.graphics.wddm22.adapterrender.d3d12.windowsholographic"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12.WindowsHolographic

### Device.Graphics.WDDM22.AdapterRender.D3D12.WindowsHolographic.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description: **

Windows Holographic (WH) is an optional feature, however to support WH, graphics drivers must implement D3D12. In addition to D3D12 implementation, either the driver must support WDDM 2.2 or the driver must be on WDDM 2.0 with Graphics Preemption and Compute Preemption support:

- DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY
- DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY

Relevant WDDM 2.2 features required for WH support include:  

- RealtimeCommandQueues 
- PeriodicFrameNotification 
- Late Latch

Each feature is described separately in sections above.

**Business justification: **

See business justification for each above feature in previous sections.


<a name="device.graphics.wddm22.adapterrender.d3d12core"></a>
## Device.Graphics.WDDM22.AdapterRender.D3D12Core

*D3D12 is an optional feature for WDDM 2.2 drivers, however, if implementing D3D12 in WDDM 2.2, drivers must support these features*

### Device.Graphics.WDDM22.AdapterRender.D3D12Core.ExsistingSysMemHeaps

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Drivers have already been required to interop with system memory allocated externally from the driver, using cross-adapter features. Drivers must now interop with all system memory in the same way, even when the driver allocates system memory itself. The runtime will use system memory features like write-watch without the driver’s explicit awareness. The driver must also report a cap which indicates whether the GPU honors system memory page settings, like read-only.

**Business Justification: **

D3D12 tools must use write-watch memory to improve their performance. 

### Device.Graphics.WDDM22.AdapterRender.D3D12Core.FastPSOComplies

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

D3D12 will add a flag to CreatePipelineState and shader creation methods, which indicates that the IHV driver should forego optimization during compilation of the relevant shaders, in order to achieve a quicker completion time.

**Business Justification: **

D3D9On12 and D3D11On12 are unable to invoke the driver shader compiler until a full set of state is known at draw-time. To continue making forward progress, these layers need a PSO as quickly as possible, and will replace it with an optimized compilation at a later time.


### Device.Graphics.WDDM22.AdapterRender.D3D12Core.HeapPrioritiesR1

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

Drivers are required to set priorities such that application gain some amount of control over the effective heap priority. This gives applications some amount of control over demotion and promotion without having to implement it manually.

**Business Justification: **

D3D12 applications need simpler ways to manage heap residency, in order to quickly support GPUs with diverse amounts of physical memory. Applications may gain enough control to minimize variability when stretching 2GB scenarios to run with UltraHD resolutions or higher MSAA settings. Or, applications may even be able to lower their physical memory minimum adapter requirements.


### Device.Graphics.WDDM22.AdapterRender.D3D12Core.LateLatch

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Late-Latching requires atomic GPU memory operations as well as some control over GPU engine command dispatching & GPU cache invalidation.

**Business Justification:**

 These changes improve efficiency and reduce latency for Windows Holographic scenarios.


### Device.Graphics.WDDM22.AdapterRender.D3D12Core.ParametrizedSwizzlesR1

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Graphics drivers must divulge the address swizzle patterns used for textures by the GPU.

**Business Justification: **

Tools need simpler ways to capture & playback the memory used by GPUs. Microsoft middleware needs UMA optimizations, but doesn’t require standard swizzle. Games are interested in uploading resource data with the CPU and without GPU involvement.


### Device.Graphics.WDDM22.AdapterRender.D3D12Core.RealtimeCommandQueues

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

The GPU must begin execution of a command submitted on a ‘realtime’ queue within 5ms of the ID3D12CommandQueue::ExecuteCommandList being invoked on the CPU. Ideally, the GPU will begin execution much more rapidly then that, but this is believed to be a sufficient ‘padding’ value to overcome test noise.

If an adapter does not report support for >=   DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY AND DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY preemption, AND the hardware supports a limited form of preemption that can be exposed to applications, the UMD must, in response to a flag from the runtime, allow a D3D12 Command Queue to be created that ‘globally’ preempts all other work on the system.
- Note: No action is needed from UMD if it is already reporting support for at least both of the preemption levels above, the D3D12 runtime will leverage that existing support.

Additionally, the whole point of preemption/real-time queues is to be able to maintain a good quality-of-service even in the event of system noise.

In the conformance test, ID3D12CommandQueue::ExecuteCommandList will be deemed to be invoked after it returns – a QueryPerformanceCounter call will be made immediately after.

To measure when the GPU begin execution, a timestamp query will be placed at the very beginning of the command list. ID3D12CommandQueue::GetClockCalibration will be used to correlate the CPU QPC value and the GPU timestamp value.

**Business Justification:**

The efficiency and latency improvements are required for Windows Holographic scenarios.

<a name="device.graphics.wddm22.displayrender"></a>
## Device.Graphics.WDDM22.DisplayRender

*If implementing WDDM 2.2, full graphics drivers must implement the following features. *

### Device.Graphics.WDDM22.DisplayRender.4HWID

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

The WDDM 2.2 graphics driver installation file (INF) must contain 4-part Hardware IDs. An example of such targeting in the graphics driver INF is “PCI\VEN_1000&DEV_0001&SUBSYS_00000001”. This unified graphics driver package must include system configuration settings which are limited to the INF file provided by the graphics IHV. Microsoft & the graphics IHVs will independently service these components for ongoing support of these features.
WDDM 2.2 graphics drivers must not use CHIDs for targeting through Windows Update. CHID usage is acceptable only if there is a strict dependency of a particular graphics driver on the firmware or other drivers which are not included in the graphics driver package. Any other usage of CHIDs will result in the revocation of the system certification. System manufacturers are encouraged to resolve the dependencies between the graphics driver and other system component drivers with their graphics IHV so as to enable a consistent and smooth upgrade experience for subsequent Windows releases.

**Business Justification:**

WDDM 2.2 enables a broad feature set across new hardware features such as HDR, Windows Holographic and several other software improvements. To enable these premium experiences on a variety of Windows PC form factors, WDDM 2.2 graphics drivers from graphics IHVs must include 4-part Hardware ID targeting in a single driver package.


<a name="device.graphics.wddm22.displayrender.colomanagement"></a>
## Device.Graphics.WDDM22.DisplayRender.ColoManagement

### Device.Graphics.WDDM22.DisplayRender.ColorManagement.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

The display colorspace transform feature allows an OEM or third party to perform more sophisticated display color calibration and color enhancement than was previously possible using legacy gamma ramps. This feature exposes a pipeline with 1DLUTs, 3x3 color matrix, and optional 3DLUT that operates on the final/flattened framebuffer before it is scanned out to the display. 

In RS2 the CSC transform is exposed to applications in a very restricted capability, specifically only for display calibration based on ICC profiles. Other scenarios traditionally enabled by legacy gamma ramps, such as fullscreen effects like fade in/out, are out of scope for RS2. 

ColorspaceTransform.Matrix3x3: A driver which implements this requirement supports a colorspace transform pipeline containing gamma correction and 3x3 color matrix stages. 

ColorspaceTransform.3DLUT: A driver which implements this requirement must also implement the Matrix3x3 requirement. It supports a pipeline containing both the 3x3 color matrix and 3DLUT. 

**Business Justification:**

Display color accuracy is transitioning from a key differentiator for premium PCs to being mandatory for a successful premium device. OEMs and third party display calibration vendors have used a combination of industry standard gamma LUTs, which are not expressive enough to perform all the color transforms needed, or IHV-specific solutions, which are only available on specific hardware platforms. 

This feature exposes a richer set of colorspace transform capabilities in a hardware-agnostic way that is fully integrated into the main OS. It also opens up non desktop form factors. 

### Device.Graphics.WDDM22.DisplayRender.DisplayDetection

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Connection state issues can cause unexpected device behavior for users, such as windows being rearranged or resized. The DisplayDetection feature requests a detailed report of connection state changes from the driver to the OS to better react to the myriad of ways that the connection state can change. 

By exposing the specifics of the activity to the OS, there is less pressure on the driver to account for all the possible changes and let the OS react more intelligently. This is more prevalent for DisplayPort Link Training since the expectation is that the connection will only disappear for a short time to complete the capability query. Having knowledge that link training is occurring allows the OS to expect a short loss of connection that is expected to come back, which means it can avoid changing to the mode with that display disconnected.

Also, issues can arise when multiple displays are connected simultaneously and so we’d like to highlight some changes to help avoid those. Namely, the driver must report any targets inherent to the adapter and new targets are reported when connected to targets that were previously reported. It is also important that when multiple displays are reported to be connected simultaneously, the displays should be reported all together as a batch instead of sending them one by one.

Finally, there can be cost savings by front-loading any integrated displays to the PnP. Currently, they are exposed by the driver in the same way that external displays are, even though their properties won’t change. During driver initialization, the OS will query for the descriptors, native display timing, monitor link info, and other static attributes.

**Business Justification: **

This issue can create a lot of customer dissatisfaction due to the annoyance it can cause since users must manually move and resize their windows to recreate their original setup.

Furthermore, it can also create the illusion that these issues are caused by their monitor or PC/OS and attempt to return these when the issue could actually just be caused by a faulty connection. 

### Device.Graphics.WDDM22.DisplayRender.DisplayWireFormatInfo

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**
In previous DDIs, wire format was left as a detail for the driver implementer to decide based on the source pixel format and the display output capabilities. This ambiguity meant that the OS had no way to know or control if a mode change would be a hard mode change requiring a reconfiguration of the pixel stream with the display device and a likely multi-frame loss of signal, or a soft mode change involving only display controller changes and/or parameter changes on the display device.

The driver is required to report the specific timings for each monitor mode as before, however now the supported bit depth and color encoding format sent to the monitor must be included.  

Specifically, the driver must report the specific timings for each monitor mode through the updated DxgkDdiEnumVidPnCofuncModality function.

**Business Justification:** 
This requirement is one of many required to support High Dynamic Range (HDR).

IHVs and OEMs are looking for ways to differentiate in order to garner higher margins beyond commodity devices and to delight their customers.  In gaming, video, and other areas the latest technology advancement is UHD (Ultra-high definition).  Although 4K is currently the best known manifestation of this, HDR (along with wider color gamuts) provides the real payoff with this technology, allowing for “ultra-realistic” games, videos, and creation scenarios.  


<a name="device.graphics.wddm22.displayrender.highdynamicrrange"></a>
## Device.Graphics.WDDM22.DisplayRender.HighDynamicRrange

### Device.Graphics.WDDM22.DisplayRender.HighDynamicRange.CoreRequirement

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description:**

High Dynamic Range (HDR) support requires the following changes:
- A DDI to report the proper monitor information, including whether HDR is supported and the maximum nits supported by the display.
- A mechanism for the application to know whether a specific colorspace is supported. 
- A mechanism to pass the colorspace information of the plane.
- A mechanism to pass the HDR metadata describing how the content was authored to the display output.
- A mechanism that allows the HW to switch between fp16 to 10:10:10:2 and back again without causing any major artifacts (e.g. full mode changes that blank the monitor). 

Specifically, the driver must:

- Report the specific timings for each monitor mode through the updated DxgkDdiEnumVidPnCofuncModality function 
- Implement the DXGKARG_SETTIMINGSFROMVIDPN DDI
- Implement pfnPresentMultiPlaneOverlay1 DDI
- Implement DXGKDDI_SETVIDPNSOURCEADDRESSWITHMULTIPLANEOVERLAY3 DDI
- Implement DXGKDDI_CHECKMULTIPLANEOVERLAYSUPPORT3 DDI
- Support HDR metadata and colorsapce information passed to these KM DDIs
- Support and indicate flipping between FP16, SDR 8bit RGB, and HDR10 allocations

In addition, for video playback:

- VPBlt must have the following format color space conversion support:

|Format In DXGI_FORMAT_|Color Space In DXGI_COLOR_SPACE_|Format Out DXGI_FORMAT_|Color Space Out DXGI_COLOR_SPACE_|Required For                      |
|----------------------|--------------------------------|-----------------------|---------------------------------|----------------------------------|
|P010                  |YCBCR_STUDIO_G2084_LEFT_P2020   |R16G16B16A16_FLOAT     |RGB_FULL_G10_NONE_P709           |HDR with FP16 DWM composed desktop|
|                      |YCBCR_STUDIO_G22_LEFT_P2020     |                       |                                 |                                  |
|                      |YCBCR_STUDIO_G22_LEFT_P709      |                       |                                 |                                  |
|P010                  |YCBCR_STUDIO_G2084_LEFT_P2020   |B8G8R8A8_UNORM         |RGB_FULL_G22_NONE_P709           |HDR with sRGB DWM composed desktop|
|                      |YCBCR_STUDIO_G22_LEFT_P2020     |                       |                                 |                                  |
|                      |YCBCR_STUDIO_G22_LEFT_P709      |                       |                                 |                                  |

- The new DDI VideoProcessorSetStreamHDRMetaData for metadata type  DXGI_HDR_METADATA_TYPE_HDR10 must be supported
- DXVA profile  D3D11_DECODER_PROFILE_HEVC_VLD_MAIN10 must be supported
- It’s also recommended that D3D11_DECODER_PROFILE_VP9_VLD_10BIT_PROFILE2 is supported

**Business Justification: **

IHVs and OEMs are looking for ways to differentiate in order to garner higher margins beyond commodity devices and to delight their customers.  In gaming, video, and other areas the latest technology advancement is UHD (Ultra-high definition).  Although 4K is currently the best known manifestation of this, HDR (along with wider color gamuts) provides the real payoff with this technology, allowing for “ultra-realistic” games, videos, and creation scenarios.  

### Device.Graphics.WDDM22.DisplayRender.MultiPlaneOverlay3

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Extending the current MultiPlaneOverylay (MPO) implementation to simplify the presentation path as well as support a variety of new features in RS2.

In some scenarios, Windows will use multi-plane overlays to emulate mode changes without performing a real mode change.  Since not all hardware supports multi-plane overlay capabilities, the multi-plane overlay DDI is extended to include support for hardware scalers that stretch the final image to fit the monitor (sometimes referred to as panel fitters).

Additionally, HDR will be supported using some of the existing MPO DDIs and by extending some others.

Specifically, drivers must:

- Implement pfnPresentMultiPlaneOverlay1 DDI
- Implement DXGKDDI_SETVIDPNSOURCEADDRESSWITHMULTIPLANEOVERLAY3 DDI
- Implement DXGKDDI_CHECKMULTIPLANEOVERLAYSUPPORT3 DDI

**Business Justification: **

This requirement is also one of many required to support High Dynamic Range (HDR) and Panel Fitters.

IHVs and OEMs are looking for ways to differentiate in order to garner higher margins beyond commodity devices and to delight their customers.  In gaming, video, and other areas the latest technology advancement is UHD (Ultra-high definition).  Although 4K is currently the best known manifestation of this, HDR (along with wider color gamuts) provides the real payoff with this technology, allowing for “ultra-realistic” games, videos, and creation scenarios.  

### Device.Graphics.WDDM22.DisplayRender.PeriodicFrameNotification

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**
Periodic frame notifications are used in VR scenarios to allow the VR compositor Last Stage Re-projection (LSR) GPU work be scheduled within a fixed time ahead of every VSYNC in order to minimize overall latency between head motion and photon hitting the user’s eye. This is a major improvement over what is possible to do today using VSYNC synchronization, shaving in the order of 10ms worth of latency.
Driver are required to implement the new kernel mode DDI introduced by this feature, typically leveraging programmable VLine interrupt capabilities on the hardware.

**Business Justification:**
VR scenarios are becoming increasingly common both from third party as well as first party with the upcoming Windows Holographics. Periodic frame notification is a critical part of reducing overall perceived latency and for providing end user a great VR experience.


### Device.Graphics.WDDM22.DisplayRender.ReducedBlackScreen

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

This feature makes changes in the boot sequence so that users can get a smoother and less glitchy boot experience. Currently, there are two periods of time when a user starts up their machine when they are subjected to a completely blank screen. The first period of blackscreen, which occurs during the transition from UEFI to graphics driver initialization, can be eliminated with collaboration between the driver and OS to ensure content is always being shown and the transition itself is seamless. Furthermore, this feature calls for changes that help bridge the continuity during this transition by inheriting the hardware display settings.

One of the reasons this first blackscreen exists is because there is a period of time when the UEFI frame buffer stops driving the display before the OS is able to render content when the driver is initializing. This feature calls for the UEFI frame buffer to remain available and to continue driving the display during driver initialization so content will always be available. Furthermore, to eliminate a glitchy transition, the graphics driver should switch away from using the UEFI frame buffer on the first present of the OS provided frame buffer. 

The other aspect of ensuring a seamless transition is that the two frame buffers are outputting content with the same display settings (i.e. if the UEFI frame buffer is rendering at 480p and the OS provided frame buffer is at native 1080p, then the jump in resolution won’t look smooth to the user). To accomplish this, the graphics driver and UEFI GOP component have to coordinate such that the driver is able to inherit the display mode set by the UEFI GOP (as well as its contents for render continuity). Additionally, the OS must be able to know when the driver is capable of inheriting these display settings and be able to query for these settings as well. 

**Business Justification:**

A glitchy and inconsistent boot sequence hurts the quality feel of premium devices by making them feel less refined than their competition. It is a fairly ugly experience when users see no content for extended periods of time, changing resolutions, different color schemes, etc. This work to improve the feeling of booting up a device helps improve user experiences with their OS and machines. 

These periods of blackscreen have also led to user concerns that their machines may be crashing when they aren’t seeing anything being rendered to their displays. By constantly drawing content to the user, they are given more evidence that the system is still operating properly.  

### Device.Graphics.WDDM22.DisplayRender.SetTimings

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

The new DDI to control setting up the display configuration is SetTimingsFromVidPN which replaces the CommitVidPN call used in previous WDDM versions.  The new DDI differs from the old one in multiple respects but specifically relating to the MPO DDI convergence, the allocation handle for the base plane is not passed to the new DDI and there is no longer a requirement that a frame buffer be allocated for the base plane prior to enabling or modifying a path.  

SetTimingsFromVidPn always describes the final state intended by the OS which allows the driver to optimize how hardware is assigned and also leaves the driver in control of how to perform a combination of changes rather than working through an intermediate state from the OS.

Specifically, the driver must implement the DXGKARG_SETTIMINGSFROMVIDPN DDI.

**Business Justification: **

This requirement is one of many required to support High Dynamic Range (HDR).

IHVs and OEMs are looking for ways to differentiate in order to garner higher margins beyond commodity devices and to delight their customers.  In gaming, video, and other areas the latest technology advancement is UHD (Ultra-high definition).  Although 4K is currently the best known manifestation of this, HDR (along with wider color gamuts) provides the real payoff with this technology, allowing for “ultra-realistic” games, videos, and creation scenarios.  

<a name="device.graphics.wddm22.render.browsersecurity"></a>
## Device.Graphics.WDDM22.Render.BrowserSecurity

### Device.Graphics.WDDM22.Render.BrowserSecurity.ArbitraryCodeGuard

*User mode drivers must be built in a way that supports Arbitrary Code Guard*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

Arbitrary Code Guard (ACG) is a security mitigation that, when applied to a process, prevents that process from allocating any new code pages. 

In order to be ACG compliant, the user mode driver needs to be compiled such that the driver does not emit pages that are both writeable and executable or are writable and then later become executable. To ensure proper compilation, the user mode driver should not merge the import table into an executable code section. This can be prevented by making sure that the /merge flag of the Visual C++ linker is not set to merge the ".rdata" section into a code section. The compiled binary should also have a SectionAlignment value that is at least equal to its PAGE_SIZE.

In addition to proper compilation, user mode drivers should also either entirely remove JIT code or use out-of-proc JIT code generation.

### Device.Graphics.WDDM22.Render.BrowserSecurity.ControlFlowGuard

*User mode drivers must be built in a way that supports Control Flow Guard.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description:**

The **/guard:cf** option causes the compiler and linker to analyze control flow for indirect call targets at compile time, and then to insert code to verify the targets at runtime. By default,** /guard:cf** is off and must be explicitly enabled.
If the check fails at runtime on a CFG-aware operating system, the operating system closes the program.

_*Design Notes:*_

CFG-enabled code works fine on "CFG-unaware" versions of Windows and is therefore fully compatible with them.

**Business Justification:**

Although all Windows 10 in-box binaries are protected by Control Flow Guard (CFG) today, many non-Microsoft drivers which lack CFG protection continue to get loaded in the context of user mode processes. To close the gap in memory corruption mitigation coverage created by such 3rd party drivers not having CFG enabled, our first step with this requirement is to promote CFG’s adoption across all graphics drivers loaded into browser processes, which were targeted due to the browser’s prominence as a Windows attack vector

