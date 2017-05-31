---
title: Device.Display.Monitor
Description: 'Requirements for displays, intended to ensure a good end-user experience.'
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
# Device.Display.Monitor

 - [Device.Display.Monitor](#device.display.monitor)
-->

<a name="device.display.monitor"></a>
## Device.Display.Monitor

### Device.Display.Monitor.Base

*Base requirements for displays must ensure a good end user experience.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All connectors on the monitor must be set to a mode that will not apply CE style overscan or underscan by default. It is ok for the monitor to provide an option to allow the user to configure overscan/underscan using an on screen display.

All video displays that provide an HDMI connector, must support the ITC flag as defined in the HDMI specification.

All digital displays are required to have a single HPD signal transition from low to high on device connection and power up. Periodic toggling of the HPD signal after connection or power up is not allowed. 

Multiple transition lead source to notify the OS of multiple device arrival and removal event; causing undesirable mode set flashing.

### Device.Display.Monitor.DigitalLinkProtection

*Display monitors that support digital inputs must support digital link protection on all digital inputs.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Displays with digital inputs, such as Digital Visual Interface (DVI), High-Definition Multimedia Interface, (HDMI), DisplayPort, etc.. must support a digital monitor link protection mechanism such as High-bandwidth Digital Content Protection (HDCP).

### Device.Display.Monitor.EDID

*A display device must implement the EDID data structure.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The monitor must transmit an EDID structure that contains all required fields, as defined in VESA Enhanced Extended Display Identification Data Standard (E-EDID), Release A, Section 3. This EDID must also contain a unique Manufacturer Name, Product code ID, and Serial Number. (The serial number is not required for an integrated panel on a mobile or all in one system.)

For analog CRTs, EDID content must indicate at least one VESA mode at 75 Hz or higher for each supported resolution.

All monitors must support E-EDID by implementing an EDID 1.3 or later data structure that:

-   Includes timing data for the preferred display mode in Timing \#1.

<!-- -->

-   For an LCD or other fixed-format display, this display mode is the native, progressively scanned mode of the panel.

-   For other display types, this is the optimal, progressively scanned display mode that is based on the size and capabilities of the device, and must meet the requirements for refresh rates defined above.

<!-- -->

-   Implements the screen size or aspect ratio fields, bytes 0x15 and 0x16 per the supported EDID version with accurate dimensions.

-   Sets byte 0x18, Bit 1 to indicate that the preferred mode meaning per the supported EDID version.

-   Includes a unique serial number in at least one of the ID Serial Number field or a Display Product Serial Number string in one of the base block 18-byte descriptors.

-   Implements a Display Product Name string in one of the base block 18-byte descriptors, optional for an integrated panel. This string must be suitable for user interface usage.

-   Implements a Display Range Limits in one of the base block 18-byte descriptors, unless the device is a Non-Continuous Frequency (multi-mode) display.

Mobile and other all-in-one systems must transmit an EDID structure in one of three ways:

-   LCD panel provides one, which is similar to an externally attached monitor.

-   If the LCD panel does not provide one, then the WDDM miniport is responsible for defining and providing it to the operating system.

-   The WDDM driver may execute the ACPI \_DDC method on the child device associated with the internal panel to retrieve an EDID from the system BIOS.

Display devices that implement features that have more than 8 bits per primary color must use EDID 1.4 in order to ensure that these capabilities can be expressed to the OS and applications.

*Design Notes*

The ACPI specification defines the method to acquire the EDID from the BIOS to achieve equivalent functionality as specified in ACPI 2.0b, Appendix B, or later.

### Device.Display.Monitor.Modes

*Requirement for resolution support for display devices*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A display device can have multiple connectors. The following are the required modes that a display must support on each connector and indicate the support via the EDID (a display is free to support additional modes and call them out in the EDID as well).

NOTE: In Windows 10, no minimum refresh rate is required. For native display resolution, the recommended minimum is 60 Hz progressive or the closest frequency appropriate for the region. Lower refresh rates might result in a poor user experience.

**For an integrated panel:**
The native resolution of the panel must be greater than or equal to 1024 x 768.
 
**For HD15, DVI, HDMI, and DisplayPort connector: **

The native resolution of the panel must be greater than or equal to 1024 x 768.

The following modes must be supported by the display and included in the Established timings in the EDID:

-   640 x 480 at 60 Hz progressive (Byte 23h, bit 5 in the Established timing)

-   800 x 600 at 60 Hz progressive (Byte 23h, bit 0 in the Established timing)

-   1024 x 768 at 60 Hz progressive (Byte 24h, bit 3 in the Established timing)

These modes can be supported as full screen or centered.

**For all other connectors like S-Video, Component, and Composite:**
The connector must support the maximum allowable mode as defined in the specification of the standard.

### Device.Display.Monitor.Stereoscopic3DModes

*A stereo 3D external display or internal mobile panel must support a stereo mode equivalent to its native or preferred resolution.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The native or preferred resolution of the stereo 3D display must have an equivalent stereo mode. The native or preferred resolution of the display is exposed through its EDID.

Example: If the native resolution of the stereo 3D display is 1920 x 1200 in mono, then it must also support the same native resolution in the stereo mode.

