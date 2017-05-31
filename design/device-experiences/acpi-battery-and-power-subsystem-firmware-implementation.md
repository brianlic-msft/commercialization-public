---
title: ACPI battery and power subsystem firmware implementation
description: This topic details how the platform should expose power subsystem information to the Windows power manager.
MS-HAID:
- 'cstandby.acpi\_battery\_and\_power\_subsystem\_firmware\_implementation'
- 'p\_weg\_hardware.acpi\_battery\_and\_power\_subsystem\_firmware\_implementation'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2BCD46A7-26C1-4943-A2BB-BD24792184F4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ACPI battery and power subsystem firmware implementation


Windows platforms are expected to expose their battery devices and AC adapters in firmware through ACPI by using standardized control method interfaces, as described in the [ACPI 5.0 specification](http://www.acpi.info/).

Every mobile Windows platform must have one power source device and one or more batteries. Information from these subsystems is used to convey power status to the user. This status includes such information as whether the platform is running on AC or DC power, the level of charge for each battery, and battery charging status. The Windows power manager aggregates this information and makes it available to the Windows battery meter and other power management components.

This topic details how the platform should expose power subsystem information to the Windows power manager. For more information, see Chapter 10, Power Source Devices, in the [ACPI 5.0 specification](http://www.acpi.info/).

**Note**  Some of the information described in this article is specific to Windows and is not detailed in the ACPI 5.0 specification.

 

## ACPI power supply object


The ACPI firmware must provide and implement a single ACPI power source device per section 10.3 of the [ACPI 5.0 specification](http://www.acpi.info/). This object must report itself with a Hardware ID (\_HID) of "ACPI0003".

**Note**  For systems that have multiple power sources, all physical power sources must be multiplexed through a single power device object in ACPI. This object must represent the composite status of power inputs for the system. Client systems must not provide multiple power source device objects. (Additional power source objects may be present on server systems that have multiple power supplies.)

 

This object must also implement the Power Source (\_PSR) method. This method returns the status of the power source and conveys whether the power source is currently online (AC power) or offline (on battery power). The \_PSR method must only report online (AC power) when the system is connected to main power. When the state of \_PSR changes, the platform must generate an interrupt and a Notify(0x80) command on the device in the ACPI namespace. This must be performed immediately after the platform detects the physical state change.

## ACPI battery control methods


The ACPI firmware must provide and implement an ACPI control method object for each battery in the system per section 10.2 of the ACPI 5.0 specification. Each battery device must do all of the following:

-   Identify itself with a Hardware ID (\_HID) of "PNP0C0A".
-   Implement the Status (\_STA) method to indicate if the device is enabled, disabled, or not present.
-   Report static information by using the Battery Information Extended (\_BIX) method.
-   Report battery status by using the Battery Status (\_BST) control method.
-   Support level-of-charge events by using the Battery Trip Point (\_BTP) mechanism.

Optionally, a battery device can implement the Slot Unit Number (\_SUN) or indicate battery order for the purposes of display in the user interface (UI).

The following discussion presents the details of these methods and describes their Windows-specific requirements.

## ACPI implementation of battery static information


The ACPI firmware must implement the \_BIX method for each battery to provide static information about the battery, including design capacity, cycle count, and serial number. The following table expands on the definitions of the fields that are described in section 10.2.2.2 of the ACPI 5.0 specification, and enumerates Windows-specific requirements for this information.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Description</th>
<th>Windows-specific requirements</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Revision</p></td>
<td><p>Indicates _BIX revision.</p></td>
<td><p>Must be set to 0x0.</p></td>
</tr>
<tr class="even">
<td><p>Power unit</p></td>
<td><p>Determines if the units reported by the hardware are milliamps and milliamp-hours or milliwatts and milliwatt-hours.</p></td>
<td><p>Must be set to 0x0 to indicate units are milliwatts and milliwatt-hours.</p>
<p>This value must not change at runtime.</p></td>
</tr>
<tr class="odd">
<td><p>Design capacity</p></td>
<td><p>Indicates the original capacity of the battery in milliwatt-hours.</p></td>
<td><p>Must be set to an accurate value and cannot be set to 0x0 or 0xFFFFFFFF. This value must not change at runtime.</p></td>
</tr>
<tr class="even">
<td><p>Last full battery charge</p></td>
<td><p>Indicates the current full charge capacity of the battery.</p></td>
<td><p>Must be set to an accurate value and cannot be set to 0x0 or 0xFFFFFFFF. This value must update each time cycle count increases.</p>
<p>This value must remain constant when the battery is discharging. We recommend that this value be updated only when the battery reaches full charge.</p></td>
</tr>
<tr class="odd">
<td><p>Battery technology</p></td>
<td><p>Indicates if the battery is rechargeable or one-use.</p></td>
<td><p>Must be set to 0x1 to indicate the battery is rechargeable.</p></td>
</tr>
<tr class="even">
<td><p>Design voltage</p></td>
<td><p>Indicates the design voltage of the battery.</p></td>
<td><p>Must be set to the design voltage of the battery when new in millivolts. Must not be set to 0x0 or 0xFFFFFFFF.</p>
<p>This value must not change at runtime.</p></td>
</tr>
<tr class="odd">
<td><p>Design capacity of Warning</p></td>
<td><p>Indicates an OEM-provided low battery warning level.</p></td>
<td><p>Windows ignores this value.</p></td>
</tr>
<tr class="even">
<td><p>Design capacity of Low</p></td>
<td><p>Indicates the critical battery level at which Windows must immediately shut down or hibernate before the system powers off.</p></td>
<td><p>Must be set to a value between 0 and 5 percent of the battery design capacity.</p></td>
</tr>
<tr class="odd">
<td><p>Battery capacity granularity 1</p></td>
<td><p>Indicates the minimum amount of remaining charge change that can be detected by the hardware between the Design Capacity of Warning and Design Capacity of Low.</p></td>
<td><p>Must be set to a value no larger than 1 percent of the battery design capacity.</p></td>
</tr>
<tr class="even">
<td><p>Battery capacity granularity 2</p></td>
<td><p>Indicates the minimum amount of remaining charge change that can be detected by the hardware between Last Full Charge Capacity and Design Capacity of Warning.</p></td>
<td><p>Must be set to a value no larger than 75 milliwatts (approximately 0.25 percent of a 25 watt-hour battery).</p>
<p>(1/400) of the battery design capacity.</p></td>
</tr>
<tr class="odd">
<td><p>Cycle count</p></td>
<td><p>Indicates the battery cycle count. Must be set to a value larger than 0x0.</p></td>
<td><p>Must not be set to 0xFFFFFFFF.</p></td>
</tr>
<tr class="even">
<td><p>Measurement accuracy</p></td>
<td><p>Indicates the accuracy of the battery capacity measurement.</p></td>
<td><p>Must be set to 95,000 or better, indicating 95 percent accuracy or better.</p></td>
</tr>
<tr class="odd">
<td><p>Max sampling time</p></td>
<td><p>The maximum supported sampling time between two successive _BST evaluations, which will show a difference in remaining capacity.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
<tr class="even">
<td><p>Min sampling time</p></td>
<td><p>The minimum supported sampling time between two successive _BST evaluations, which will show a difference in remaining capacity.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
<tr class="odd">
<td><p>Max averaging interval</p></td>
<td><p>The maximum averaging interval, in milliseconds, supported by the battery fuel gauge.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
<tr class="even">
<td><p>Min averaging interval</p></td>
<td><p>The minimum averaging interval, in milliseconds, supported by the battery fuel gauge.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
<tr class="odd">
<td><p>Model number</p></td>
<td><p>OEM-provided battery model number.</p></td>
<td><p>Must not be NULL.</p></td>
</tr>
<tr class="even">
<td><p>Serial number</p></td>
<td><p>OEM-provided battery serial number.</p></td>
<td><p>Must not be NULL.</p></td>
</tr>
<tr class="odd">
<td><p>Battery type</p></td>
<td><p>OEM-provided battery type information.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
<tr class="even">
<td><p>OEM information</p></td>
<td><p>OEM-provided information.</p></td>
<td><p>No specific requirement.</p></td>
</tr>
</tbody>
</table>

 

In addition to these requirements, the platform firmware must generate an interrupt and a Notify(0x81) command on the battery device in the ACPI namespace whenever any of the battery state data in \_BIX changes. This includes last full charge capacity, design capacity, and cycle count. This must be performed immediately after the state change is detected by the platform.

The last full charge capacity represents the estimated amount of energy the battery is expected to hold the last time the battery was fully charged. Windows assumes that this value is updated only when the battery has been charged. Therefore, the last full charge capacity value must not change while the battery discharges. We recommend that this only be updated when the battery reaches full charge.

## ACPI implementation of battery real-time status information


The ACPI firmware must implement the \_BST method for each battery to provide real-time status information about the battery, including remaining capacity and current rate of drain. The following table expands on the definitions of the fields that are described in section 10.2.2.6 of the [ACPI 5.0 specification](http://www.acpi.info/), and enumerates Windows-specific requirements for this information.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Description</th>
<th>Windows-specific requirements</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Battery state</p></td>
<td><p>Indicates if the battery is currently being charged, is discharging, or is in a critical state.</p></td>
<td><p>The Battery State must report charging only if the battery is charging. Likewise, the Battery State must report discharging only if the battery is discharging. A battery that is neither charging nor discharging must report neither bit.</p></td>
</tr>
<tr class="even">
<td><p>Battery present rate</p></td>
<td><p>Provides the current rate of drain in milliwatts from the battery.</p></td>
<td><p>Must be a value greater than 0x0 and less than 0xFFFFFFFF. Must be accurate within the value of Measurement Accuracy in _BIX.</p></td>
</tr>
<tr class="odd">
<td><p>Battery remaining capacity</p></td>
<td><p>Provides the remaining battery capacity in milliwatt-hours.</p></td>
<td><p>Must be greater than 0x0 and less than 0xFFFFFFFF. Must be accurate within the value of Measurement Accuracy in _BIX.</p></td>
</tr>
<tr class="even">
<td><p>Battery present voltage</p></td>
<td><p>Indicates the current voltage across the terminals of the battery.</p></td>
<td><p>Must be between a value of 0x0 and 0xFFFFFFFF in millivolts.</p></td>
</tr>
</tbody>
</table>

 

When any data in \_BST changes, the platform must generate an interrupt and a Notify(0x80) on the battery device in the ACPI namespace. This must be performed immediately after the physical state change is detected by the platform. This includes any change in the Battery State field for the charging bit (Bit0) or discharging bit (Bit1).

Additionally, the platform must implement the \_BTP-Battery Trip Point-method. \_BTP allows Windows to specify a remaining capacity threshold that when crossed, causes the platform to generate an interrupt and a Notify(0x80) on the battery device in the ACPI namespace. The \_BTP method prevents Windows from needing to poll the battery periodically.

## Windows OS-specific battery control methods


The [ACPI 5.0 specification](http://www.acpi.info/) affords for device and operating system-specific control methods through the Device-Specific Method or \_DSM control method. \_DSM is described in section 9.14.1 of the [ACPI 5.0 specification](http://www.acpi.info/).

Windows 8 supports the following \_DSM methods for Control Method Battery devices.

**Thermal charge rate direction**

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>UUID</p></td>
<td><p>4c2067e3-887d-475c-9720-4af1d3ed602e</p></td>
<td><p>GUID that indicates extensions to Windows Control Method Battery driver support.</p></td>
</tr>
<tr class="even">
<td><p>Revision ID</p></td>
<td><p>0</p></td>
<td><p>First revision of this capability.</p></td>
</tr>
<tr class="odd">
<td><p>Function index</p></td>
<td><p>0x1</p></td>
<td><p>Set battery charge throttle.</p></td>
</tr>
<tr class="even">
<td><p>Arguments</p></td>
<td><p>Thermal limit</p></td>
<td><p>Integer value from 0 to 100 indicating the thermal charge limit. A value of 40 percent indicates the battery should be charged at 40 percent of maximum rate. A value of 0 percent indicates battery charging should be stopped until this method is called again.</p></td>
</tr>
<tr class="odd">
<td><p>Return value(s)</p></td>
<td><p>None</p></td>
<td><p>N/A</p></td>
</tr>
</tbody>
</table>

 

**User-serviceable battery**

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>UUID</p></td>
<td><p>4c2067e3-887d-475c-9720-4af1d3ed602e</p></td>
<td><p>GUID that indicates extensions to Windows Control Method Battery driver support.</p></td>
</tr>
<tr class="even">
<td><p>Revision ID</p></td>
<td><p>0</p></td>
<td><p>First revision of this capability.</p></td>
</tr>
<tr class="odd">
<td><p>Function index</p></td>
<td><p>0x2</p></td>
<td><p>Indicates this _DSM is for OSPM to determine if the battery device is user-serviceable or not.</p></td>
</tr>
<tr class="even">
<td><p>Arguments</p></td>
<td><p>None</p></td>
<td><p>No arguments are required.</p></td>
</tr>
<tr class="odd">
<td><p>Return value(s)</p></td>
<td><p>Package containing a single integer.</p></td>
<td><p>0x0 if the battery is not user-serviceable and cannot be replaced by the end user, or can be replaced by the end user with additional tools.</p>
<p>0x1 if the battery can be replaced by the end-user without additional tools.</p></td>
</tr>
</tbody>
</table>

 

**Charging watchdog required**

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>UUID</p></td>
<td><p>4c2067e3-887d-475c-9720-4af1d3ed602e</p></td>
<td><p>GUID that indicates extensions to Windows Control Method Battery driver support.</p></td>
</tr>
<tr class="even">
<td><p>Revision ID</p></td>
<td><p>0</p></td>
<td><p>First revision of this capability.</p></td>
</tr>
<tr class="odd">
<td><p>Function index</p></td>
<td><p>0x3</p></td>
<td><p>Indicates this _DSM is for OSPM to determine if the Control Method Battery requires periodic watchdog resetting to maintain high current charging and the period at which the watchdog must be reset.</p></td>
</tr>
<tr class="even">
<td><p>Arguments</p></td>
<td><p>None</p></td>
<td><p>No arguments are required.</p></td>
</tr>
<tr class="odd">
<td><p>Return value(s)</p></td>
<td><p>Package containing a single integer.</p></td>
<td><p>0x0 if the battery does not require watchdog servicing.</p>
<p>Values inclusive of 0x0000001e and 0x12C indicate the maximum poling interval in seconds. All other values are ignored and are treated as 0x0 and watchdog resetting is not required. If a valid watchdog interval is specified, Windows will execute the _BST method at an interval no longer than the watchdog value specified when the value of BatteryState in the _BST method is set to charging.</p>
<p>Dynamic update of this value is not supported.</p></td>
</tr>
</tbody>
</table>

 

## Windows OS-specific battery control methods


Windows provides a detailed view of system batteries in the desktop tray application. Each battery, together with its current status, is listed in the UI. The following example UI shows two batteries.

The order in which Windows shows batteries can be specified by the firmware. This is achieved by using the Slot User Number (\_SUN) method as defined in section 6.1.11 of the [ACPI 5.0 specification](http://www.acpi.info/). The \_SUN method returns an integer that represents the unique ID of the battery. Windows lists each battery object in ascending order based on the value of the \_SUN method.

If any battery object includes a \_SUN method, then all battery objects must also provide a \_SUN method. Windows does not support the case where some batteries have a \_SUN method and other batteries do not. If no \_SUN objects are provided, Windows sorts the batteries based on their full device instance path; this configuration is supported, but not recommended.

 

 






