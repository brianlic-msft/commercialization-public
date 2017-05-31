---
title: Device.Input.Digitizer
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

# Device.Input.Digitizer
 
 - [Device.Input.Digitizer.Base](#device.input.digitizer.base)
 - [Device.Input.Digitizer.Pen](#device.input.digitizer.pen)
 - [Device.Input.Digitizer.PrecisionTouchpad](#device.input.digitizer.precisiontouchpad)

<a name="device.input.digitizer.base"></a>
## Device.Input.Digitizer.Base

### Device.Input.Digitizer.Base.ContactReports

*Digitizer reliability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device.Digitizer.Touch.NoiseSupression**.

A digitizer shall only report data corresponding to user input. No other data, often referred to as "Phantom” or “Ghost contacts" shall be reported. This applies both when the system is actively receiving user input and when it is not receiving user input and under both AC and DC power conditions (where applicable).

### Device.Input.Digitizer.Base.HIDCompliant

*HID compliant device firmware and/or HID mini-port driver*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device. Digitizer.Touch.HIDCompliantFirmware**

All digitizers are required to be human interface device (HID) compliant and adhere to the specification for their respective usage in order to report input to Windows.

Please see the Device.Input.Digitizer.Base.ThirdPartyDrivers for additional information on use of inbox HID mini-port drivers vs 3<sup>rd</sup> party HID mini-port drivers.

For more information on implementation, see:

For the reporting requirements, see the collection of topics at [*http://msdn.microsoft.com/en-us/library/windows/hardware/jj151569.aspx*](http://msdn.microsoft.com/en-us/library/windows/hardware/jj151569.aspx)

For HID over I2C requirements, see [*http://msdn.microsoft.com/en-us/library/windows/hardware/Dn642101.aspx*](http://msdn.microsoft.com/en-us/library/windows/hardware/Dn642101.aspx)

For HID over USB requirements, see [*http://www.usb.org/developers/devclass\_docs/HID1\_11.pdf*](http://www.usb.org/developers/devclass_docs/HID1_11.pdf)

For HID over Bluetooth requirements, see [*http://developer.bluetooth.org/TechnologyOverview/Documents/HID\_SPEC.pdf*](http://developer.bluetooth.org/TechnologyOverview/Documents/HID_SPEC.pdf)

**Business Justification**

The Human Interface Device (HID) protocol is the industry recognized standard that Microsoft requires for input devices. This requirement guarantees Windows compatibility and serviceability with any compliant digitizer solution.

### Device.Input.Digitizer.Base.ThirdPartyDrivers

*Servicing and 3<sup>rd</sup> party driver availability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

*Applicability: “Windows Desktop”*

If a Windows Precision Touchpad digitizer utilizes a 3rd party HID mini-port driver, it shall be part of the OEM shipping image (and restore image) and available on Windows Update. Any 3rd party HID mini-port driver shall also be functional in WinPE. It is highly recommended that an inbox HID mini-port driver is utilized wherever possible for Windows Precision Touchpad implementations.

Special note: A touchpad may not be marketed as a Windows Precision Touchpad unless all the applicable compatibility requirements are met.

All Integrated Windows touch and pen devices shall be fully functional without the use of any 3rd party HID mini-port or filter drivers provided one is available for the associated bus used for connectivity. While Windows recommends that a device be shipped as tested, an OEM may elect to ship a Windows 10 compatible HID mini-port driver and/or filter driver that provides additional functionality after the device has met all associated HLK requirements including **Device.Input.Digitizer.Base.ThirdPartyDrivers** provided that all other requirements are met when that driver is installed. Any 3<sup>rd</sup> party HID mini-port driver which is used in instances where an inbox driver is not available for the bus selected for connectivity, that driver shall be part of the OEM shipping image (and restore image) and available on Windows Update. Any 3rd party HID mini-port driver shall also be functional in WinPE.

Microsoft highly recommend the touchpad module to support Microsoft Precision Touchpad via Firmware. This recommendation may become a requirement for the future release of the Windows Hardware Compatibility Program at Microsoft's discretion.

*Applicability: “Windows Mobile”*

If a Windows Precision Touchpad, integrated touch or integrated pen digitizer utilizes a 3rd party HID mini-port driver, it shall be part of the OEM Base Support Package (BSP) for the system. It is highly recommended that an inbox HID mini-port driver is utilized wherever possible.

**Business Justification**

This requirement ensures that digitizers are always available for user input regardless of servicing scenarios and or clean installations. There are instances where the digitizer may be the only source of input for a given device

<a name="device.input.digitizer.pen"></a>
## Device.Input.Digitizer.Pen

### Device.Input.Digitizer.Pen.Accuracy

*Pen contact accuracy*

|                |                            |
|----------------|----------------------------|
| Target Feature | Device.Input.Digitizer.Pen |

**Description**

The requirement Device.Digitizer.Pen.HoverAccuracy has been merged with this requirement.

When the pen tip is in contact with the screen, the delta between actual contact location and what the device reports shall be:

-   &lt;= +/- 0.5 mm (center)

-   &lt;= +/- 1 mm (within 3.5mm of all edges)

When hovering (with tip not in contact), the physical delta between physical location and what the device reports shall be &lt;= +/- 1 mm (center).

**Business Justification**

This requirement ensures compatibility with DirectInk and inbox pen experiences; specifically:

-   When the pen is in contact with the screen ensuring that ink appears to originate from the pen tip, and ensuring ability to target small controls.

-   When the pen is hovering over the screen, ensuring that cursor position is perceived to be accurate by the user

### Device.Input.Digitizer.Pen.Buffering

*Buffering for buses with High Resume latency*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This is an “If-Implemented” requirement. Active pen solutions that use a bus with high resume latency such as USB with selective suspend or Bluetooth shall implement an input report buffer capable of handling &gt;= 100ms of data.

Input report buffer size (in bytes) = Input Report Size &times; (100ms/Maximum Report Rate)

While this is a requirement for devices that use a bus with high resume latency, it is recommended that solutions that use other buses also implement an input report buffer to avoid interrupt processing glitches that can occur.

**Business Justification**

Due to host controller or bus resume times from low power states, devices may need to implement buffering to ensure no user interaction data is lost during power transitions.

### Device.Input.Digitizer.Pen.ContactReports

*Digitizer Reliability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device.Digitizer.Touch.NoiseSupression**

A digitizer shall only report data corresponding to user input. No other data, often referred to as "Phantom” or “Ghost contacts" shall be reported. This applies both when the system is actively receiving user input and when it is not receiving user input and under both AC and DC power conditions (where applicable).

### Device.Input.Digitizer.Pen.CustomGestures

*Custom Run-Time System Gestures*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Irrespective of reporting implementation, additional custom run-time pen gestures are prohibited with the exception of wake gestures.

**Business Justification**

This requirement ensures compatibility with DirectInk.

-   Ensures that there is no interference with the core inking experience.

-   Ensures compatibility with the inbox gesture engine.

### Device.Input.Digitizer.Pen.Eraser

*Eraser Affordance*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

An integrated Windows pen solution shall have a hardware affordance on the pen that provides eraser functionality compliant with the associated protocol. The erase functionality must be enabled by default.

Microsoft will allow an exception for active pens that support only a single barrel button until January 01, 2016: 

Microsoft strongly recommends that all pens support erase functionality by default.  An integrated Windows pen solution that contains support for only a single barrel button will be allowed to ship without an eraser affordance until January 1, 2016.  After January 1, 2016, an integrated Windows pen solution shall have a hardware affordance on the pen that provides eraser functionality compliant with the associated protocol and the erase functionality must be enabled by default.

**Business Justification**

This requirement ensures that interactions with the pen are intuitive and efficient. This implementation enables software developers to develop for eraser functionality while remaining agnostic to the eraser implementation.

Note:  Active pens that enable eraser functionality provide the most natural means to erase digital ink.  Active pens that enable eraser functionality also free the application developer from having to develop UI to switch pen context from ink mode to erase mode.  Therefore it is strongly recommended that all pens support erase functionality by default.

### Device.Input.Digitizer.Pen.HIDCompliant

*HID Compliant Device Firmware and/or HID Mini-port Driver*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Device.Input.Digitizer.Base.HIDCompliant.

### Device.Input.Digitizer.Pen.HoverRange

*Hover Range*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Pen.PenRange

A pen digitizer shall report the pen location and that it is *in range* starting when the pen tip is at least 5mm away from the screen.

**Business Justification**

This requirement ensures compatibility with DirectInk and more specifically:

-   Ensures that users receive on-screen feedback regarding the pen location and tool context in a timely manner.

-   Ensures compatibility with Windows palm rejection functionality.

### Device.Input.Digitizer.Pen.Jitter

*Jitter and Linearity*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Reported jitter from an integrated Windows pen shall be:

-   Moving Jitter

    -   &lt;= +/- 0.4 mm (center)

    -   &lt;= +/- 0.6 mm (within 3.5mm of all edges)

-   Stationary Jitter

    -   &lt;= +/- 0.3 mm (center)

    -   &lt;= +/- 0.5 mm (within 3.5mm of all edges)

-   Hover Stationary Jitter &lt;= +/- 0.5mm (center)

**Business Justification**

This requirement ensures compatibility with DirectInk and more specifically:

-   When the pen tip is in contact with the screen and moving, ink accurately reflects actual pen strokes of the user

-   When the pen is held stationary (either when in contact with the screen or hovering), jitter is not perceivable to the user.

### Device.Input.Digitizer.Pen.Latency

*Response Latencies*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Pen digitizers shall have response latencies per the following:

-   Cold Boot Latency

    -   An integrated Windows pen shall be immediately responsive once the display is active

    -   Cold Boot is defined as the period from application of power to the controller until the controller is ready to accept HID commands

-   Down Latency (Idle) &lt;= 150ms (If-Implemented)

    -   This requirement is applicable if an idle power state has been implemented

    -   Down latency (Idle) is defined as the delay between the pen making initial contact with the screen when the device is in an idle power state and having the associated report delivered to the host.

-   Down Latency (Active) &lt;= 35ms (center)

    -   Down latency (Active) is defined as the delay between the pen making initial contact with the screen when the device is in an active power state and having the associated report delivered to the host.

-   Move Latency &lt;= 30ms (center)

    -   While a pen tip is in motion (and in contact with the screen), move latency is defined as the delay between the pen being at a physical location and having the associated report delivered to the host

**Business Justification**

This requirement ensures:

-   Devices are readily available for user interactions after a system power state transition.

-   When pen makes initial contact with the screen, lag in visual feedback is not perceivable to most users.

-   When pen is in contact with the screen and moving, end-to-end latency of inking and other interactions are not perceivable to most users.

### Device.Input.Digitizer.Pen.Pressure

*Pressure Reporting*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Pen digitizers shall report &gt;= 256 levels of pressure.

A logarithmic curve shall be used to report the applied force on the pen tip. When the pen tip is in contact with the screen and the activation force has been exceeded, the device should report the tip switch as set. The maximum activation Force for an integrated Windows pen is &lt;= 20g.

The ideal pressure curve (for a device with 256 levels) is illustrated in Figure 1, however the associated HLK tests will ensure that the device reports pressure within the ranges defined by the upper bound and lower bound. For devices that have greater number of pressure levels, the same curve should be applied but scaled to the number of levels logically reported.

**Figure 1 - Ideal Pressure Reporting Curve for a Device with 256 Pressure Levels**
![Ideal Pressure Reporting Curve for a Device with 256 Pressure Levels](images/ideal-pressure-reporting-curve.png)



**Business Justification**

This requirement ensures compatibility with DirectInk and more specifically:

-   Ensures sufficient granularity and representation for variation in applied pressure as perceived by the user while inking.

### Device.Input.Digitizer.Pen.ReportRate

*Report Rate*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Pen.100HzSampleRate

An integrated Windows pen digitizer shall have a report rate &gt;= 133Hz.

**Business Justification**

This requirement ensures compatibility with DirectInk and more specifically:

-   Ensures sufficient points are sampled to represent handwriting accurately at typical handwriting velocities.

### Device.Input.Digitizer.Pen.Resolution

*Input resolution*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Pen.PenResolution

A pen digitizer’s input resolution shall be &gt;= the native display resolution or 150 dpi (whichever is greater).

**Business Justification**

This requirement ensures that every pixel can be inked on screen and provides a smooth pen experience.

### Device.Input.Digitizer.Pen.ThirdPartyDrivers

*Servicing and 3<sup>rd</sup> Party Driver Availability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

See Device.Input.Digitizer.Base.ThirdPartyDrivers.

<a name="device.input.digitizer.precisiontouchpad"></a>
## Device.Input.Digitizer.PrecisionTouchpad

### Device.Input.Digitizer.PrecisionTouchpad.Accuracy

*Accuracy*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows precision touchpads shall report the absolute digitizer position &lt;= 2 mm from actual position for all contacts.

**Business Justification**

Requirement ensures an accurate moussing and gesturing surface.

### Device.Input.Digitizer.PrecisionTouchpad.Buffering

*Buffering for buses with high resume latency.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This is an “If-Implemented” requirement. USB or Bluetooth connected Windows precision touchpads shall implement an input report buffer capable of handling &gt;= 100 ms of data based on the maximum number of contacts supported by the device Input report buffer size (in bytes):

= Maximum \# of Contacts Supported &times; Input Report Size &times; (100 ms/Maximum Report Rate)

While this requirement applied to USB and Bluetooth devices, it is recommended that other devices also implement an input report buffer to avoid interrupt processing glitches that can occur.

**Business Justification**

Due to host controller or bus resume times from low power states, devices may need to implement buffering to ensure that no user interaction data is lost during power transitions.

### Device.Input.Digitizer.PrecisionTouchpad.Buttons

*Physical buttons and button reporting*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The following requirements have been merged into this requirement:

-   Device.Input.PrecisionTouchpad.Hardware.ClickpadPress
-   Device.Input.PrecisionTouchpad.Hardware.PressurePadPress

If Windows precision touchpads implement external buttons and are not clickpads or pressurepads, there must be at least two buttons to represent left and right click buttons.

If there is more than one button, buttons shall be reported as an array of button flags. Handling buttons beyond the first two (primary and secondary clicks) should be the role of the driver and/or mouse collection.

**(If Implemented)** Both clickpad-based and non-clickpad-based Windows precision touchpads shall report a button down state when exerted pressure exceeds 140g-190g within 1cm of the bottom edge.  Windows precision touchpads shall not report a button down state when exerted pressure is equal to or less than 140g within 1cm of the bottom edge.

**(If Implemented)** External buttons on Windows precision touchpads shall report a button down state when exerted pressure exceeds 140g-190g. This is tested at 140g-190g to tolerate manufacturing variance and the test can be performed with a simple test right in the center of each button (for as many buttons there are).


**Business Justification**

Clickable regions should be comfortably usable.

If external buttons are implemented, there must be at least two hardware buttons to represent both left and right click to ensure that the device has full mouse capabilities.

### Device.Input.Digitizer.PrecisionTouchpad.ContactReports

*Digitizer Reliability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device.Digitizer.Touch.NoiseSupression**

A digitizer shall only report data corresponding to user input. No other data, often referred to as "Phantom” or “Ghost contacts" shall be reported. This applies both when the system is actively receiving user input and when it is not receiving user input and under both AC and DC power conditions (where applicable).

### Device.Input.Digitizer.PrecisionTouchpad.ContactTipSwitchHeight

*Contact Tip Switch Height*

Windows precision touchpads shall not report contacts &gt; 0.5 mm above the digitizer surface.

**Business Justification**

Prevents unintended contact activations from occurring and helps to avoid palm invoked activations during typing.

### Device.Input.Digitizer.PrecisionTouchpad.DeviceTypeReporting

*Device type*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows precision touchpads must report their device button type (e.g., pressure-pad, click-pad) via a HID feature report if a button is present under the digitizer.  A device that does not have a clickable digitizer must not expose this feature report.

For more information on implementation, see [http://msdn.microsoft.com/en-us/library/windows/hardware/jj126202.aspx](http://msdn.microsoft.com/en-us/library/windows/hardware/jj126202%28v=vs.85%29.aspx)*.* 

**Business Justification**

Fundamental to ensure the correct button handling is performed by the operating system.

### Device.Input.Digitizer.PrecisionTouchpad.Dimensions

*Dimensions*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The requirement **Device.Input.PrecisionTouchpad.Hardware.Length** and **Device.Input.PrecisionTouchpad.Hardware.Height** have been merged with this one.

Windows precision touchpads shall be &gt;= 64 mm in length (horizontal measurement of touchpad) x &gt;= 32 mm (vertical measurement).

**Business Justification**

Precision touchpads must maintain a minimum size to allow users to interact properly with moussing across long distances and performing multi-finger gestures.

### Device.Input.Digitizer.PrecisionTouchpad.FingerSeparation

*Finger Separation *

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Input.PrecisionTouchpad.Performance.MinSeparation.

Windows precision touchpads shall not alias two contacts aligned at a minimum separation of 8mm or less edge-to-edge.

**Business Justification**

This requirement ensures finger count and position remain accurate during multi-finger interactions.

### Device.Input.Digitizer.PrecisionTouchpad.HIDCompliant

*HID Compliant Device Firmware and/or HID Mini-port Driver*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Device.Input.Digitizer.Base.HIDCompliant.

### Device.Input.Digitizer.PrecisionTouchpad.InputResolution

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows precision touchpads shall report a logical maximum for x linearly proportional to the width of the touchpad and shall report a logical maximum for y linearly proportional to the length of the touchpad. The top left corner of the touchpad shall be the origin (0,0). All Windows precision touchpads are at least 300 dpi; therefore, for the minimum size Windows precision touchpads, the logical maximum for x shall be &gt;= 767 and the logical maximum for y shall &gt;= 384.

**Business Justification**

This requirement ensures that users can perform precise manipulations and cursor positioning.

### Device.Input.Digitizer.PrecisionTouchpad.Jitter

*Jitter and linearity*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The requirement Device.Input.Digitizer.PrecisionTouchpad.Linearity has been merged to this requirement.

One Contact

-   Windows precision touchpads shall not report any jitter when a single stationary precision contact is on the digitizer surface.

Multiple Contacts

-   Windows precision touchpads shall report contacts with &lt;= 2mm of jitter when multiple stationary contacts are initially placed on the digitizer surface, however no stationary jitter is permitted after the contacts have moved and become stationary again.

Any Number of Contacts

-   Windows precision touchpads shall maintain linearity within 0.5mm for all contacts reported across edge to edge travel horizontally, vertically, and diagonally.

-   Within 3.5mm of any edge, precision touchpads shall maintain linearity within 1.5mm for all contacts reported.

-   Windows precision touchpads shall not report any backward motion jitter for contacts in motion. Backward jitter is defined as a subsequent report of contact location in the opposite direction of contact travel.

**Business Justification**

Ensures that precision moussing and gestures work correctly and that pausing during gesturing does not result in jittering visuals.

### Device.Input.Digitizer.PrecisionTouchpad.Latency

*Response latencies*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The following requirements have been merged into this requirement:

-   Device.Input.PrecisionTouchpad.Performance.ActiveTouchdownLatency

-   Device.Input.PrecisionTouchpad.Performance.IdleTouchdownLatency

-   Device.Input.PrecisionTouchpad.Performance.PanLatency

Touch down Latency:

-   Active:

    -   Windows precision touchpads shall have &lt;= 35 ms touch down latency in the active state. Touch down latency is defined as the time between contact with the digitizer and the subsequent input report being received by the host.

-   Idle:

    -   Windows precision touchpads shall have &lt;= 150 ms touch down latency in the idle state.

    -   Touch down latency is defined as the time between contact with the digitizer and the subsequent input report being received by the host.

Move Latency:

-    Windows precision touchpads shall have panning latency &lt;= 70 ms. Panning latency is defined as the period between the movement on the digitizer and the subsequent change being received by the host.

Cold boot Latency:

-    Windows precision touchpads shall be immediately responsive once the display is active on systems emerging from cold boot. Cold boot is defined as the period from application of power to the controller until the controller is ready to accept HID commands.

**Business Justification**

This requirement ensures that core user experiences involving taps, moussing, and gesturing are still performant (i.e., tapping a button, control, hyperlink, etc.).

The touchpad device should be readily available for user input once the system has booted or resumed from a low power state irrespective of its bus connectivity.

Additional UX study on the impact of panning latency for indirect input devices justifies increased panning latency compared to direct input devices.

### Device.Input.Digitizer.PrecisionTouchpad.MinMaxContacts

*Contact count*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows precision touchpads shall not report being capable of supporting more than a maximum of 5 unique contacts. Windows precision touchpads shall report being capable (and be capable) of supporting a minimum of 3 unique contacts.

**Business Justification**

Precision touchpads require at least three fingers to have access to all Windows interactions. Four or more fingers are supported for a wider range of available interactions. Multihand interactions are not suited for touchpad use, so more than 5 contacts support is unneeded.

### Device.Input.Digitizer.PrecisionTouchpad.ReportRate

*Report Rates*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Input.PrecisionTouchpad.Performance.ReportRate.

Windows precision touchpads shall report at &gt;= 125Hz (and no greater than 250Hz) when a single contact is on the digitizer. Windows precision touchpads shall report all contacts at &gt;= Display Refresh Rate + 10Hz (up to 125 Hz) when a multiple contacts are on the digitizer.

**Business Justification**

Maintain mouse experience requirements and competitive performance at &gt;= 125 Hz. Gesture performance in-line with touch requirements that are backed by the experience needs of Direct Manipulation to avoid stuttering.

### Device.Input.Digitizer.PrecisionTouchpad.SelectiveReporting

*Selective reporting*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows precision touchpads shall support the hosts request via a HID feature report to selectively report digitizer contacts and button presses. The host may request to receive reports for either digitizer contacts or button presses, neither, or both. Windows precision touchpads shall optimize their power consumption based on host selection.

**Business Justification**

This requirement ensures that precision touchpad digitizers properly respond to user configuration requests to enable/disable the device.

### Device.Input.Digitizer.PrecisionTouchpad.ThirdPartyDrivers

*Servicing and 3<sup>rd</sup> Party Driver Availability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Device.Input.Digitizer.Base.ThirdPartyDrivers.

 # Device.Input.Digitizer.Touch

### Device.Input.Digitizer.Touch.Accuracy

*Accuracy*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Description**

This requirement was formerly known as Device.Digitizer.Touch.PhysicalInputPosition

A touch digitizer shall report the position of all contacts within the following allowances:

-   &lt;= +/- 1mm when contact location is greater than 3.5mm from digitizer edge

-   &lt;= +/- 2mm when contact location is within 3.5mm of digitizer edges

**Business Justification**

This requirement ensures accurate and reliable touch interactions.

### Device.Input.Digitizer.Touch.Buffering

*Buffering for Buses with High Resume Latency*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This is an “If-Implemented” requirement. A Windows touch solution connected over USB or Bluetooth shall implement an input report buffer capable of handling &gt;= 100ms of data based upon the maximum number of contacts supported by the device

Input report buffer size (in bytes) (for Single Finger Hybrid Reporting): = Maximum \# of Contacts Supported &times; Input Report Size &times; (100ms/Maximum Report Rate)

While this is a requirement for devices that use a bus with high resume latency, it is recommended that solutions that use other buses also implement an input report buffer to avoid interrupt processing glitches that can occur.

**Business Justification**

Due to host controller or bus resume times from low power states, devices may need to implement buffering to ensure no user interaction data is lost during power transitions.

### Device.Input.Digitizer.Touch.ContactReports

*Digitizer Reliability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device.Digitizer.Touch.NoiseSupression**

A digitizer shall only report data corresponding to user input. No other data, often referred to as "Phantom” or “Ghost contacts" shall be reported. This applies both when the system is actively receiving user input and when it is not receiving user input and under both AC and DC power conditions (where applicable).

### Device.Input.Digitizer.Touch.CustomGestures

*Custom run-time system gestures*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Only gestures designed to wake the system are allowed. Custom gestures designed to work with user interface elements are prohibited.

**Business Justification**

This requirement ensures that the platform maintains a consistent and reliable gesture experience across all Windows devices.

### Device.Input.Digitizer.Touch.FingerSeparation

*Finger separation*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Touch.InputSeparation

All contacts shall be uniquely tracked and reported when &lt;= 8mm apart measured from edge-to-edge.

**Business Justification**

This requirement ensures compatibility with inbox gestures such as pinch/zoom, multi-finger taps, and parallel finger manipulations can be performed reliably.

### Device.Input.Digitizer.Touch.HIDCompliant

*HID Compliant Device Firmware and/or HID Mini-port Driver*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Device.Input.Digitizer.Base.HIDCompliant.

### Device.Input.Digitizer.Touch.Jitter

*Jitter and linearity*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Touch.DigitizerJitter

Stationary Jitter shall not exceed a maximum of &lt;= +/- 0.5mm away from the edges and &lt;= +/- 1mm within 3.5mm of edges

Moving Jitter shall not exceed a maximum of &lt;= +/- 1mm away from the edges and &lt;= +/- 2mm within 3.5mm of edges

Jitter is not permissible in any direction opposite of contact travel for non-stationary contacts.

**Business Justification**

This requirement ensures compatibility with inbox gestures, manipulations and inking and more specifically that:

-   Tap interactions work with small controls

-   Content should not jitter when being held stationary after a manipulation.

-   Free-form panning manipulates content in the direction that the user intended

-   Finger painting/inking looks acceptable

### Device.Input.Digitizer.Touch.Latency

*Response latency*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Touch.ResponseLatency

A touch digitizer shall have response latencies as follows:

<html>
    <ul>
        <li>
            <p>Down Latency (Active)&lt;= 35ms</p>
            <ul>
                <li><p>Active down latency is defined as the period between contact with the digitizer and the subsequent input report being received by the host.</p></li>
            </ul>
        </li>
        <li>
            <p>Down Latency (Idle) &lt;= 150ms</p>
            <ul>
                <li><p>Idle down latency is defined as the period between contact with the digitizer and the subsequent input report being received by the host while the digitizer is connected standby.</p></li>
            </ul>
        </li>
        <li><p>Move Latency</p>
		    <table>
				<thead>
					<tr class="header">
						<th>Screen Size (Diagonal )</th>
						<th>Maximum Latency</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd">
						<td>&lt; 7”</td>
						<td>&lt;= 35ms</td>
					</tr>
					<tr class="even">
						<td>&gt;= 7”</td>
						<td>&lt;= 25ms</td>
					</tr>
				</tbody>
			</table>
		</li>

        <li><p>Move latency is defined as the period between a contact being at a physical position and having that position reported to the host.</p></li>

        <li>
            <p>Cold Boot Latency -</p>
            <ul>
                <li><p>Touch digitizers shall be immediately responsive once the display is active.  Cold boot is defined as the period from application of power to the controller until the controller is ready to accept HID commands.</p></li>
            </ul>
        </li>
    </ul>
    <p><strong>Business Justification</strong></p>
    <p>This requirement ensures the following:</p>
    <ul>
        <li><p>Content sticks close to the physical finger position when under manipulation.</p></li>
        <li><p>Devices are readily available for user interactions after a system power state transition.</p></li>
        <li><p>User interactions involving a tap are responsive even when in a low power state.</p></li>
    </ul>
</html>

### Device.Input.Digitizer.Touch.MinContactCount

*Minimum simultaneous reportable contacts*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as **Device.Digitizer.Touch.5TouchPointMinimum**.

A touch digitizer shall support a minimum of five simultaneous touch contacts.

**Business Justification**

This requirement ensures compatibility with inbox gestures, accessibility tools, and 3rd party applications.

### Device.Input.Digitizer.Touch.ReportRate

*Report rate*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement was formerly known as Device.Digitizer.Touch.ReportingRate

When in an active power state, the touch digitizer reporting rate shall be maintained at a minimum of Display Refresh Rate and a maximum of 250Hz. All reports shall be uniquely sampled.

For example:

| Display Refresh Rate | Touch Reporting Rate |
|----------------------|----------------------|
| 60Hz                 | &gt;= 60Hz           |
| 120Hz                | &gt;= 120Hz          |

**Business Justification**

This requirement ensures a compatible, smooth and stutter-free gesturing experience when performing pan and pinch/zoom interactions utilizing the Windows Direct Manipulation framework.

### Device.Input.Digitizer.Touch.Resolution

*Input resolution*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

At a minimum, the touch digitizer resolution will be equal the native display resolution or greater. Every pixel of the display in an integrated touch digitizer is required to be accessible to touch input. Every pixel includes pixels on the edges and in the corners of the display.
For additional details on verification and testing of this requirement please see <http://go.microsoft.com/fwlink/?LinkID=234575>

**Business Justification**

This requirement ensures that every pixel is available for touch interaction and ensures a reliable and smooth touch experience.

### Device.Input.Digitizer.Touch.ThirdPartyDrivers

*Servicing and 3<sup>rd</sup> Party Driver Availability*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

See Device.Input.Digitizer.Base.ThirdPartyDrivers.
