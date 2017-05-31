---
title: Device.Imaging.Printer
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

# Device.Imaging.Printer

 - [Device.Imaging.Printer.Base](#device.imaging.printer.base)
 - [Device.Imaging.Printer.Mobile](#device.imaging.printer.mobile)
 - [Device.Imaging.Printer.Mobile.WSD20](#device.imaging.printer.mobile.wsd20)
 - [Device.Imaging.Printer.OXPS](#device.imaging.printer.oxps)
 - [Device.Imaging.Printer.USB](#device.imaging.printer.usb)
 - [Device.Imaging.Printer.WSD](#device.imaging.printer.wsd)
 - [Device.Imaging.Printer.XPS](#device.imaging.printer.xps)

<a name="device.imaging.printer.base"></a>
## Device.Imaging.Printer.Base

### Device.Imaging.Printer.Base.applicationVerifier

*Printer driver components must comply with Application Verifier test criteria.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All user-mode modules (.dll or .exe files) that are part of a printer driver must satisfy the criteria for Application Verifier tests. During driver testing, Application Verifier must be turned on for processes in which the driver modules execute. Application Verifier causes a break when Application Verifier detects an error.
For printer drivers, common applications that must have Application Verifier turned on during testing are the following:

-   Splwow64.exe.

-   Spoolsv.exe. The process loads the rendering and UI portions of the driver during print testing.

-   Printfilterpipelinesvc.exe. The process loads the XPS rendering filters.

-   Any vendor-supplied applications that are part of the driver package, such as a custom status monitor. All portions of the driver package that is being signed must be robust.

-   Any tests that load driver modules for rendering or UI purposes. The tests commonly load UI and rendering modules.

The following Application Verifier tests must be turned on for these processes during testing:

-   Heap
-   Locks
-   Handles
-   FilePaths
-   HighVersionLie
-   DFWChecksNonSetup
-   SecurityChecks
-   Printing

*Design Notes*

For information about Application Verifier, see <http://go.microsoft.com/fwlink/?LinkId=58371>*.*

### Device.Imaging.Printer.Base.configurationFiles

*Version 4 print drivers must provide valid configuration files.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Version 4 print drivers must provide valid configuration files.

-   These files must be syntactically valid according to the WDK.

-   When supported by the hardware, the configuration files must support the following features:

	-   Orientation
	-   Duplexing
	-   Collate
	-   N-Up
	-   Paper Size
	-   Paper Type
	-   Tray
	-   Quality
	-   Color
	-   Stapling
	-   Hole-punches
	-   Binding

-   GPD or PPD files should define the majority of the features and constraints represented in the driver's PrintCapabilities. JavaScript implementations should supplement these capabilities as needed.

-   JavaScript files must be syntactically valid according to the WDK.

	-   They must be included in the driver package and cannot be in a subdirectory in the package.

	-   They may be included only with version 4 print drivers.

	-   They should be designed securely and validate any untrusted data that will be parsed; this includes PrintCapabilities, PrintTicket, XPS Documents, and Property Bags.

### Device.Imaging.Printer.Base.connectionRecovery

*A printer must continue to operate normally if a computer becomes unavailable during a print job.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If a computer becomes unavailable during a print job (for example, if the computer enters a sleep state or a network failure or other event interrupts the connection between the computer and printer), the printer must recover so that normal print operations can continue without user interaction.

*Design Notes*

Specifically, the printer must not fail into a state in which the end user must manually power cycle the printer or clear a paper jam.
The printer does not have to complete or continue the failed print job when the computer becomes available again. However, when computer-to-printer communication is restored, new print jobs must be able to spool and complete normally.

### Device.Imaging.Printer.Base.deviceCapabilities

*A printer must correctly support the DeviceCapabilities and GetDeviceCaps application programming interfaces (APIs) based on the guidelines in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement clarifies the use of existing WLK tests. The Print Driver Device Capabilities test determines whether the printer driver returns the correct information for the **DeviceCapabilities** and **GetDeviceCaps** API calls.
For more information, see <http://msdn.microsoft.com/en-us/library/dd183552.aspx>
and <http://msdn.microsoft.com/en-us/library/ff566075.aspx>*.*

### Device.Imaging.Printer.Base.driverCategory

*Version 4 printer drivers must declare a valid printer category.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All V4 printer drivers must declare a valid DriverCategory in their driver manifest. 
V3 printer drivers are not required to declare a category.  If a V3 printer driver does declare a DriverCategory, it must be valid value.

The DriverCategory must be one of the following values:

-   PrintFax.Printer
-   PrintFax.Fax
-   PrintFax.Printer.File
-   PrintFax.Printer.Virtual
-   PrintFax.Printer.Service


### Device.Imaging.Printer.Base.DriverPDC

INF files must have correct syntax when PWG Raster rendering filter is included

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description**:

All v4 print drivers which make use of the PrintDeviceCapabilities DataFile type must implement their PrintDeviceCapabilities file properly. Drivers which make use of the PWG Raster standard rendering filter must provide a PrintDeviceCapabilities DataFile which conforms to this requirement.

### Device.Imaging.Printer.Base.GDLFile

*GDL files must use the correct syntax according to the guidelines in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement clarifies the use of existing WLK tests. The Generic Description Language (GDL) Correctness Test determines whether GDL files use the correct syntax according to the WDK.
For more information, see <http://msdn.microsoft.com/en-us/library/ff549787.aspx> *and* <http://msdn.microsoft.com/en-us/library/ff563355.aspx>*.*

### Device.Imaging.Printer.Base.infFile

*INF files must use the correct syntax according to the guidelines in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement clarifies the use of existing WLK tests.
INFGate determines whether INF files and v4 manifest use the correct syntax according to the WDK.
Version 4 print drivers use version 4 INFs and manifest files.
V4 driver INF must:

-   Define a PrinterDriverID for each driver in the INF to indicate when drivers are compatible for the sake of printer sharing.

   -   PrinterDriverID must be a GUID.

-   Set a DataFile as a GPD or PPD file.

-   Use only the following DestinationDirs: DriverStore, 66000; or Color directory, 66003.

-   Specify a filter xml pipeline config file named \*-pipelineconfig.xml, OR specify RequiredClass in the v4 driver manifest.

V4 driver manifest files must:

-   Define a PrinterDriverID for each driver in the manifest to indicate when drivers are compatible for the sake of printer sharing.

   -   PrinterDriverID must be a GUID.

-   Set a DataFile as a GPD or PPD file.

V4 drivers must not:

-   Utilize any of the following INF directives ClassInstall32, ClassInstall32.Services, DDInstall.Services, DDInstall.HW, DDInstall.CoInstallers, DDInstall.FactDef, DDInstall.LogConfigOverride, DDInstall.Interfaces, InterfaceInstall32, DefaultInstall, DefaultInstall.Services, AddReg, DelReg, DelFiles, RenFiles, AddService, DelService, AddInterface, BitReg, LogConfig, UpdateInis, UpdateIniFields, or Ini2Reg.

Version 3 INF files must use correct syntax according to the WDK.
For more information on v3 INF files, see <http://msdn.microsoft.com/en-us/library/ff560902.aspx> *and* <http://msdn.microsoft.com/en-us/library/ff563414.aspx>*.*



### Device.Imaging.Printer.Base.printProcessor

*Print processors must be implemented based on the guidelines in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement clarifies the use of existing WLK tests. The Print Processor API test helps to ensure that print processors are implemented based on WDK guidelines.
All print processors must support the following endpoints:

-   OpenPrintProcessor
-   ClosePrintProcessor
-   ControlPrintProcessor
-   EnumPrintProcessorDatatypesW
-   PrintDocumentOnPrintProcessor
-   GetPrintProcessorCapabilities

For more information, see <http://msdn.microsoft.com/en-us/library/ff566084.aspx>*.*

### Device.Imaging.Printer.Base.printRegions

*A printer must support printable regions accurately.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The printer must be able to print output for the entire area that appears in the printable region that the user can select in the Windows UI.

*Design Notes*

Note that if the printer supports a "borderless" printing feature, this restriction may be relaxed to allow for devices whose printable region extends beyond the dimensions of the physical media sheet. In these cases, the printer must be able to print output to the extent of the page dimension.

This test applies to all paper sizes that the printer physically supports. If the printer supports auto-scaling and the UI exposes additional paper sizes to the user that cannot be physically loaded into the printer, the printer must maintain correct aspect ratios during resizing. In this context, "auto-scaling" is any feature in the hardware or driver that changes the print job to fit on an available paper size without user interaction or warning.

If the printer does not support printing on a physical medium that is at least 4" x 4" in size, the printer is exempt from this requirement.

### Device.Imaging.Printer.Base.printTicket

*A printer driver must support PrintTicket/PrintCapabilities.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Print devices must fully support the **PrintTicket** and **PrintCapabilities** objects. Depending on your print driver implementation, this may or may not require implementing certain **PrintTicket** or **PrintCapabilities** interfaces. For more information, see the WDK documentation.

Printer drivers must support the public Print Schema element types for each keyword if the printer driver or print device includes the specified functionality. Printer drivers must also support the public Print Schema element types for each keyword if the appropriate functionality is present but non-configurable. The element types that the printer driver must support for each keyword include all such Features, Options, ParameterDef, ParameterRef, Property, and ScoredProperty that the public Print Schema definition contains. Printer drivers do not have to support public Print Schema keywords if the printer driver or print device does not include the specified functionality.

Printer drivers must support the following basic Print Schema element types:

-   DocumentCollate
-   JobCopiesAllDocuments
-   JobDuplexAllDocumentsContiguously
-   PageColorManagement
-   PageImageableSize
-   PageMediaSize
-   PageMediaType
-   PageOrientation
-   PageOutputColor
-   PageResolution
-   PageICMRenderingIntent
-   One of the following: JobInputBin, DocumentInputBin, or PageInputBin

### Device.Imaging.Printer.Base.rendering

*A printer must correctly render print jobs.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement clarifies the use of the following existing WLK tests to ensure that printers correctly render print jobs:

-   Pgremlin/Pgremlin2

	This test produces numerous pages of output that include shapes, gradient fills, alpha blends and some complex fonts. The test checks Device Driver Interface (DDI) calls that a driver can make.

-   WinFX Markup Content Rendering Test

	The WinFX Markup Content Rendering test loads eight WinFX XAML files and produces output on the specified printer.

-   Photo Print Test

	The Photo Print Test prints landscape- and portrait-oriented photos to exercise printer functionality.

For more information about Pgremlin, see <http://msdn.microsoft.com/en-us/library/ff566081.aspx>*.*
For more information about Pgremlin2, see <http://msdn.microsoft.com/en-us/library/ff566079.aspx>*.*
For more information about the WinFX Markup Content Rendering Test, see <http://msdn.microsoft.com/en-us/library/ff569275.aspx>*.*
For more information about the Photo Print Test, see <http://msdn.microsoft.com/en-us/library/ff565234.aspx>*.*

### Device.Imaging.Printer.Base.TCPMon

*Network-connected printers that support Port 9100 printing with the Microsoft Standard Port Monitor (TCPMon) must provide rich status for the device.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If the printer uses a network interface port connection and supports Port 9100 printing (raw printing) with the Microsoft Standard Port Monitor (TCPmon), it must also support Simple Network Management Protocol (SNMP), Host Resource Management Information Base (MIB), and Common Printer MIB, and Printer Port Monitor MIB 1.0 (IEEE-ISTO5107.1-2005) so that the operating system can provide rich status for the device.

<a name="device.imaging.printer.mobile"></a>
## Device.Imaging.Printer.Mobile

### Device.Imaging.Printer.Mobile.Mobile

Printer must implement the following items in the description to ensure proper functionality

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description**:

<html>
    <ol style="list-style-type: decimal">
        <li>
            <p>Printers must implement the &quot;MobilePrint&quot; category definition in their WS-Discovery message's PnP-X DeviceCategory element.</p>

            <p>Devices which support Windows Mobile Printing must add the &quot;MobilePrinter&quot; category to their WS-Discovery ThisModel response.</p>
            <p>The following table provides additional information about the MobilePrinter category keyword.</p>

            <table>
                <thead>
                    <tr class="header">
                        <th>Constant/Value</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td>
                            <p>PNPX_DEVICECATEGORY_PRINTER_MOBILE</p>
                            <p>L&quot;MobilePrinter&quot;</p>
                        </td>
                        <td>
                            <p>MobilePrinter category</p>
                            <p>Keywords: Printer</p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </li>

        <li><p>V4 print drivers that use PrintDeviceCapabilities must ensure that it is correctly defined by including a PrintDeviceCapabilities DataFile.</p></li>

        <li><p>If a v4 print driver includes the PWG Raster standard rendering filter, then a PrintDeviceCapabilities DataFile must be included.</p></li>
    </ol>
</html>


### Device.Imaging.Printer.Mobile.PDL

Printers with mobile print capability must support one of the following PDLs and conform to the relevant requirements for it.

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**PWG-Raster**

Printers supporting PWG Raster must conform to the PWG Raster industry standard and implement the following requirements.

<html>
    <ol style="list-style-type: decimal">
        <li><p>Follow all the rules described in PWG 5102.4-2012.</p></li>
        <li><p>Devices supporting duplex must support InsertPage directive.</p></li>
        <li><p>Devices must consume all color formats and resolutions that are advertised in PrintDeviceCapabilities file.</p></li>
        <li><p>Devices must support all advertised psk:PageMediaSizes from the PrintDeviceCapabilities file when encoded in to the PWG Raster Page Header according to PWG 5101.1's definition of self-describing media names.</p></li>
        <li>
		<p>Devices must support one of the following color formats</p>
			<ul>
				<li><p>Srgb_8</p></li>
				<li><p>Cmyk_8</p></li>
				<li><p>Sgray_8</p></li>
			</ul>
		</li>
        <li><p>Devices supporting WS-Print v2.0 must indicate support for at least one psk:PageResolution which is less than or equal to 360dpi.</p></li>
        <li><p>For mobile compatible mode, device must support 300 DPI output</p></li>
        <li><p>For mobile compatible mode, device must accept Letter or A4 formats.</p></li>
    </ol>
    <p><strong>PCLm</strong></p>
    <p>Printers supporting PCLm must conform to industry standard and implement the following requirements.</p>
    <ol style="list-style-type: decimal">
        <li><p>Device must support the default settings defined in section 4.2.9 of the Wi-Fi Direct Services Print Technical Specification v1.0:</p>
		<table>
			<thead>
				<tr class="header">
					<th><strong>Attribute</strong></th>
					<th><strong>Default setting</strong></th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd">
					<td>StripHeight</td>
					<td>16</td>
				</tr>
				<tr class="even">
					<td>Media</td>
					<td>Letter</td>
				</tr>
				<tr class="odd">
					<td>Resolution</td>
					<td>600</td>
				</tr>
				<tr class="even">
					<td>Duplex</td>
					<td>Simplex</td>
				</tr>
				<tr class="odd">
					<td>ColorSpace</td>
					<td>sRGB</td>
				</tr>
				<tr class="even">
					<td>Copies</td>
					<td>1</td>
				</tr>
				<tr class="odd">
					<td>Finishings</td>
					<td>None</td>
				</tr>
				<tr class="even">
					<td>Fit-to-page</td>
					<td>False</td>
				</tr>
				<tr class="odd">
					<td>Orientation</td>
					<td>Portrait</td>
				</tr>
				<tr class="even">
					<td>PrintQuality</td>
					<td>Normal</td>
				</tr>
			</tbody>
		</table>
	</li>
    <li><p>Device must support receiving content at 300 dpi</p></li>
    <li><p>Device must support receiving content compressed using flate, run-length encoding or DCTDecode</p></li>
    </ol>
    <p><strong>OXPS</strong></p>
	<p>Printer supporting OpenXPS must conform to industry standard and implement the following requirements.</p>
    <ol style="list-style-type: decimal">
        <li><p>If the device implements OpenXPS support, it must follow all rules described in ECMA-388</p></li>
        <li>
            <p>Device must process PrintTickets in the following order of precedence (most authoritative -&gt; least authoritative):</p>
            <ol style="list-style-type: lower-alpha">
                <li><p>Page-level PrintTicket embedded in document</p></li>
                <li><p>Document-level PrintTicket embedded in document</p></li>
                <li><p>CreatePrintJob2 Job-level PrintTicket</p></li>
                <li><p>Job-level PrintTicket embedded in document</p></li>
            </ol>
        </li>
    </ol>
    <p><strong>Microsoft XPS</strong></p>
    <p>Printer supporting Microsoft XPS must conform to documented specification.</p>
    <ol style="list-style-type: decimal">
        <li><p>Printer supporting Microsoft XPS must conform and follow all rules described in the Microsoft XML Paper Specification 1.0</p></li>
    </ol>
</html>

<a name="device.imaging.printer.mobile.wsd20"></a>
## Device.Imaging.Printer.Mobile.WSD20

### Device.Imaging.Printer.Mobile.WSD20.PDC

Printer supporting PrintDeviceCapabilities (PDC) must support the following items in the description

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

**Description**

1.  Printers supporting PrintDeviceCapabilities must conform with all of the rules set out in the Print Schema Specification v2.0, as well as the WDK.

2.  Only currently available features may be exposed in a PrintDeviceCapabilities file. Printers must describe their currently available Features, Options, and Parameters in a PrintDeviceCapabilities file.

    If any Features, Options or Parameters are conditionally available, depending on the state of an installable option such as a finisher, then these items must only be exposed in the PrintDeviceCapabilities file if the pre-requisite installable option is currently installed.

3.  All options in PageMediaSize must be exposed in PrintDeviceCapabilities files. Printers must describe all supported paper sizes using the psk:PageMediaSize feature in a PrintDeviceCapabilities file.

4.  All options in PageResolution must be exposed in PrintDeviceCapabilities files. Printers must describe their supported device resolutions using the psk:PageResolution feature in a PrintDeviceCapabilities file.

5.  Printers must describe at least one input bin using either the psk:JobInputBin, psk:DocumentInputBin, or psk:PageInputBin features.

6.  Printers supporting PWG Raster must contain PwgRasterDocumentTypesSupported element in the PrintDeviceCapabilities file to describe the supported color formats.

7.  Printers which indicate the deviceProcessing attribute in a PrintDeviceCapabilities file must support those features without interaction of the host. If the printer indicates that an Option or Parameter is processed in hardware using the deviceProcessing="true" attribute, then it MUST handle that Option or Parameter without the participation of the host.

### Device.Imaging.Printer.Mobile.WSD20.WSD20support

Printer supporting WS-Print 2.0 must implement the following requirements

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Terms: If-Implemented**

<html>
    <ol style="list-style-type: decimal">
        <li>
            <p>Printers supporting WS-Print v2.0 must describe and support the following MIME types, by including the wprt2:PrinterFormats element under the printer’s wprt:PrintCapabilities element.</p>
            <ul>
                <li>
                    <p>PrintDeviceCapabilities</p>
                    <ul>
                        <li><p>application/vnd.ms-PrintDeviceCapabilities+xml</p></li>
                    </ul>
                </li>
                <li>
                    <p>PrintJobTicket</p>
                    <ul>
                        <li><p>application/vnd.ms-PrintSchemaTicket+xml</p></li>
                    </ul>
                </li>
                <li>
                    <p>PrintDeviceResource</p>
                    <ul>
                        <li><p>application/vnd.ms-resx+xml</p></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><p>Printers supporting WS-Print v2.0 must handle PrintDeviceCapabilitiesChangeID. Printers must describe the PrintDeviceCapabilitiesChangeID element in the wprt:PrinterConfiguration element and create an event if the current PrintDeviceCapabilitiesChangeID changes.</p>
			<ul>
				<li><p>The PrintDeviceCapabilitiesChangeID must be consistent across power cycles of the device unless the state of the printer changes (eg, an installable option is added or removed).</p></li>
			</ul>
		</li>
        <li><p>Printer supporting WS-Print v2.0 must support one of the following PDLs by describing the corresponding MIME type in the wprt:PrinterCapabilities wprt:Format element.</p>
		    <ul>
				<li><p>application/oxps</p></li>
				<li><p>application/vnd.ms-xpsdocument</p></li>
				<li><p>image/pwg-raster</p></li>
				<li><p>application/pclm</p></li>
			</ul>
		</li>

        <li><p>Printers supporting WS-Print v2.0 must support retrieval of resource files in the following format using the GetPrintDeviceResources operation, or must return the NoLocalizedResources SOAP fault.</p>
		    <ul>
				<li><p>application/vnd.ms-resx+xml</p></li>
			</ul>
		</li>

        <li><p>Printer's WS-Print v2.0 implementation must support all new Operations described in the WS-Print v2.0 specification:</p>
		    <ul>
				<li><p>CreatePrintJob2</p></li>
				<li><p>PrepareToPrint</p></li>
				<li><p>GetBidiSchemaExtensions</p></li>
				<li><p>GetPrintDeviceResources</p></li>
				<li><p>GetPrintDeviceCapabilities</p></li>
			</ul>
		</li>

        <li><p>Printers supporting WS-Print v2.0 must process the PrintJobTicket element if it is included in the CreatePrintJob2 request. Printers must support PrintJobTickets formatted in the following format.</p>
		    <ul>
				<li><p>application/vnd.ms-PrintSchemaTicket+xml</p></li>
			</ul>
		</li>

        <li><p>Printers supporting Windows Mobile must implement WS-Print v2.0 in accordance to guidance in WDK.</p></li>
    </ol>
</html>

<a name="device.imaging.printer.oxps"></a>
## Device.Imaging.Printer.OXPS

### Device.Imaging.Printer.OXPS.OXPS

*V4 drivers that support OpenXPS must be implemented according to the rules specified in the WDK.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

For Windows 10, a correctly implemented version 4 print driver will satisfy the XPS requirements.  The v4 driver can support either MSXPS or Open XPS.
V4 print drivers that support OpenXPS, either exclusively or in dual-format support mode with XPS, must satisfy the following requirements:

-   Driver manifest must specify either "XpsFormat=OpenXPS", "XpsFormat=OpenXPS, XPS" or "XpsFormat=XPS, OpenXPS" in the DriverRender section.

-   The first filter must be able to consume OpenXPS document format when provided such by the print filter pipeline manager.

-   All filters must conform to the rendering rules in the ECMA Open XML Paper Specification v. 1.0 (Ecma 388).

-   All filters must conform to the PrintTicket processing rules in the PrintSchema Specification 1.0.

-   The v4 driver filter pipeline must produce a PDL that the target print device can interpret.

-   Filters in the v4 driver pipeline that support OpenXPS must NOT do the following:

	<!-- -->

	-   Call into the Common Language Runtime (CLR) or the WinFX run-time components for any functionality.

	-   Display user interface (UI) content.

	<!-- -->

-   OpenXPS supporting drivers must adhere to all other v4 rules.  Dual-format drivers must adhere to both OpenXPS and MSXPS requirements and successfully handle either format.

<a name="device.imaging.printer.usb"></a>
## Device.Imaging.Printer.USB

### Device.Imaging.Printer.USB.CompatID

*Printers must implement a Compatible ID in their IEEE1284 string according to the rules specified in the WDK.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Printers must implement a Compatible ID in their IEEE1284 string for devices that connect over USB and WSD using the Port Monitor MIB.
The Compatible ID must indicate:

-   Manufacturer Name or Code

-   Device Class Description

<!-- -->

Recommended:

<!-- -->

-   Include PDL

-   any other relevant device class information

-   Example: Fabrikam\_XPS\_A3\_laser

Devices that receive the Windows 7 logo before June 1, 2012 are exempt from this requirement.
Link to Compatible ID Whitepaper: <http://msdn.microsoft.com/en-us/windows/hardware/gg463313.aspx>

### Device.Imaging.Printer.USB.JSBidiExtender

*USB JavaScript Bidi Extenders are implemented according to the guidance in the WDK.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

USB JavaScript Bidi Extenders are implemented according to the guidance in the WDK:

-   They must be included in the driver package and cannot be in a subdirectory in the package.

-   They may only be included with version 4 print drivers.

-   They should be designed securely and validate any untrusted data that will be parsed.

-   They must be referenced in the v4 manifest files.

They must use syntactically valid JavaScript, implemented according to the WDK.

<a name="device.imaging.printer.wsd"></a>
## Device.Imaging.Printer.WSD

### Device.Imaging.Printer.WSD.CompatID

*Printers must implement a Compatible ID in their IEEE1284 string according to the rules specified in the WDK.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Printers must implement a Compatible ID in their IEEE1284 string for devices that connect over USB and WSD using the Port Monitor MIB.
The Compatible ID must indicate:

-   Manufacturer Name or Code

-   Device Class Description

Recommended:

-   Include PDL

-   any other relevant device class information

-   Example: Fabrikam\_XPS\_A3\_laser

See [How to implement compatible IDs in printing devices](http://msdn.microsoft.com/en-us/windows/hardware/gg463313.aspx), a white paper.

<a name="device.imaging.printer.xps"></a>
## Device.Imaging.Printer.XPS

### Device.Imaging.Printer.XPS.XPS

*A printer must have a driver that correctly implements the XPSDrv printer driver architecture.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The v4 driver can support either MSXPS or Open XPS.
V4 print drivers that support MSXPS, either exclusively or in dual-format support mode with Open XPS, must satisfy the following requirements:

-   Driver manifest must specify either "XpsFormat=OpenXPS", "XpsFormat=OpenXPS, XPS" or "XpsFormat=XPS, OpenXPS" in the DriverRender section.

-   The first filter must be able to consume the XPS document format when provided such by the print filter pipeline manager.

-   All filters must conform to the rendering rules in the XML Paper Specification.

-   All filters must conform to the PrintTicket processing rules in the PrintSchema Specification 1.0.

-   The v4 driver filter pipeline must produce a PDL that the target print device can interpret.

-   Filters in the v4 driver pipeline supporting XPS must NOT do the following:

<!-- -->

	-   Call into the Common Language Runtime (CLR) or the WinFX run-time components for any functionality.

	-   Display user interface (UI) content.

<!-- -->

-   XPS supporting drivers must adhere to all other v4 rules.  Dual-format drivers must adhere to both OpenXPS and MSXPS requirements and successfully handle either format.

A printer must have a driver that correctly implements the XPSDrv printer driver architecture. 

A driver that implements the XPSDrv printer driver architecture must not do the following:

-   Implement a GDI rendering module.

-   Implement a print processor.

If the XPSDrv driver supports a print device that can consume the XPS Document format as a printer description language (PDL), no filters are required. Otherwise, or if the driver supplies filters, the driver must satisfy the following requirements:

-   The first filter in the XPSDrv driver filter pipeline must consume the XPS Document format.

-   The XPSDrv driver filter pipeline must produce a PDL that the target print device can interpret.

-   Filters in the XPSDrv driver filter pipeline must do the following:

<!-- -->

	-   Conform to the rendering rules in the XML Paper Specification.

	-   Conform to the PrintTicket processing rules in the XML Paper Specification.

<!-- -->

-   Filters in the XPSDrv driver filter pipeline must not do the following:

<!-- -->

	-   Call into the Common Language Runtime (CLR) or the WinFX run-time components for any functionality.

	-   Display user interface (UI) content.

	XPSDrv must fully support the PrintTicket and PrintCapabilities objects. XPSDrv drivers must also support the following additional keywords in the described under the printTicket requirement.

	-   PageScaling

	-   JobDigitalSignatureProcessing

	-   PagePhotoPrintingIntent

	-   PageOutputQuality

	