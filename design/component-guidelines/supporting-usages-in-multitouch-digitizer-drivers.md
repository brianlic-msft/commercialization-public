---
title: Supporting Usages in Multi-touch Digitizer Drivers (Windows 7)
description: Supporting Usages in Multi-touch Digitizer Drivers (Windows 7)
MS-HAID:
- 'touch\_28bbf9c8-5926-4a2f-b3f3-ba3bdb4f9178.xml'
- 'p\_weg\_hardware.supporting\_usages\_in\_multitouch\_digitizer\_drivers'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b744cf65-38c2-4296-a443-8797dbc62a09
keywords: Windows Touch WDK, multitouch digitizer drivers, HID usages, Windows Touch WDK, HID additions, multitouch digitizer drivers WDK
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supporting Usages in Multi-touch Digitizer Drivers (Windows 7)


In the context of Windows Touch, *multi-touch* refers to support of a two or more trackable contact points. This topic outlines required and optional usages for a multi-touch digitizer driver. If your digitizer device supports only a single contact point, see [Supporting Usages in Touch Digitizer Drivers](supporting-usages-in-touch-digitizer-drivers.md).

Usage identifier values are defined in the [Device Class Definition for HID 1.11](http://go.microsoft.com/fwlink/p/?linkid=155094).

### <a href="" id="required-and-optional-hid-usages"></a> Required and Optional HID Usages

The report descriptor for a multi-touch digitizer must specify that the device is a HID touch screen (page 0x0D, usage 0x04).

In addition to the existing HID touch usages, multi-touch digitizer drivers must implement the following usages:

-   X (page 0x01, usage 0x30) and Y (page 0x01, usage 0x31)

-   Contact identifier (page 0x0D, usage 0x51)

-   Tip switch (page 0x0D, usage 0x42)

-   In-range (page 0x0D, usage 0x32)

-   Contact count maximum (page 0x0D, usage 0x55)

The following usages are optional, but multi-touch digitizer drivers should implement them if the digitizer hardware supports them. These usages were ratified in the Windows Vista timeframe:

-   Confidence (page 0x0D, usage 0x47)

-   Width and height (page 0x0D, usages 0x48 and 0x49)

-   Pressure (page 0x0D, usage 0x30)

### <a href="" id="hid-additions-to-support-multitouch"></a> HID Additions to Support Multi-touch

The HID Usage Tables define the following usages for multi-touch input from digitizers. Windows 7 supports these multi-touch usages, and vendors should implement them in devices and drivers.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Name</th>
<th>Description</th>
<th>Page</th>
<th>Type</th>
<th>ID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Contact identifier</p></td>
<td><p>Contact identifier</p></td>
<td><p>Digitizer</p></td>
<td><p>Dynamic Value (DV)</p></td>
<td><p>0x51</p></td>
</tr>
<tr class="even">
<td><p>Configuration</p></td>
<td><p>Configuration</p></td>
<td><p>Digitizer</p></td>
<td><p>Collection Application (CA)</p></td>
<td><p>0x0E</p></td>
</tr>
<tr class="odd">
<td><p>Device mode</p></td>
<td><p>Input mode</p></td>
<td><p>Digitizer</p></td>
<td><p>DV</p></td>
<td><p>0x52</p></td>
</tr>
<tr class="even">
<td><p>Device settings</p></td>
<td><p>Device settings</p></td>
<td><p>Digitizer</p></td>
<td><p>Collection Logical (CL)</p></td>
<td><p>0x23</p></td>
</tr>
<tr class="odd">
<td><p>Device Identifier</p></td>
<td><p>Device index</p></td>
<td><p>Digitizer</p></td>
<td><p>SV/DV</p></td>
<td><p>0x53</p></td>
</tr>
<tr class="even">
<td><p>Contact count</p></td>
<td><p>Actual contact count</p></td>
<td><p>Digitizer</p></td>
<td><p>DV</p></td>
<td><p>0x54</p></td>
</tr>
<tr class="odd">
<td><p>Contact count maximum</p></td>
<td><p>Maximum number of contacts supported</p></td>
<td><p>Digitizer</p></td>
<td><p>DV</p></td>
<td><p>0x55</p></td>
</tr>
</tbody>
</table>

 

-   Contact identifier

    Specifies the identifier of the current contact. An identifier must remain constant while the contact is detected by the device. Each separate concurrent contact must have a unique identifier. Identifiers can be reused if a contact is no longer detected. If the device supports "in-air" packets (the contact is hovering above the surface), the identifier must persist from the time that the contact is detected until the time that it goes out of range. In the report descriptor in the EloMT sample, the comment for this usage is "Temp Identifier."

-   Configuration

    The Collection Application for the top-level collection that contains the feature report.

-   Device Mode

    A read/write value feature to get and set the current input configuration of a device. In the EloMT sample, the comment for this usage is "Input Mode."

-   Device settings

    The logical collection that contains the device configuration usages (Device Identifier and Device Mode).

-   Device Identifier

    The top-level collection for which the configuration is intended. Use Device Identifier if the report descriptor contains more than one multiple input top-level collection. For more information that is specific to this scenario, see [Using Report Descriptors to Support Capability Discovery](using-report-descriptors-to-support-capability-discovery.md).

-   Contact count

    Specifies the number of valid contacts in the current packet. Drivers that use [parallel or hybrid mode](selecting-packet-reporting-modes-in-multitouch-drivers.md) should include this usage. A device that cannot provide this value must use **NULL** for all values in the first position that do not contain valid contact information.

-   Contact count maximum

    Specifies the total number of contacts that a multi-touch device supports. This usage must be included in the multi-touch top-level collection and not in any child collection.

    The vendor-supplied driver may be queried dynamically for this value.

You can see examples of the previous usages in the [EloMT](elotouch-driver.md) sample in the WDK.

 

 






