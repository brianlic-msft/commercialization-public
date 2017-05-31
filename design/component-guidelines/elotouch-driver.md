---
title: Elotouch Driver
description: Elotouch Driver
MS-HAID:
- 'TouchSamples\_edfbf5d6-5ea1-4ca1-a100-4568a97623f7.xml'
- 'p\_weg\_hardware.elotouch\_driver'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 44dfee14-dc92-47c7-8154-e491f78fd750
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Elotouch Driver


### Description

The Elotouch driver is a KMDF driver that can work as both a multi-touch driver and a mouse driver. Its architecture is very similar to the [WacomKMDF Driver](wacomkmdf-driver.md).

The sample drivers share code that is located in the following directories:

-   The src\\input\\hiddigi\\common directory contains code that is common to the KMDF sample drivers.

-   The src\\input\\hiddigii\\util directory contains utility functions that are common to all the HID input sample drivers.

### Building the Sample

Use the standard driver build tools in the Windows Driver Kit. In a driver directory, type **build**. The build script will generate the Elotouch.sys driver.

### Installation

**Driver Files**

-   EloMT.inf

-   Elotouch.sys

-   Hidkmdf.sys (build from the src\\hid\\hidusbfx2\\hidmapper directory)

-   WDF co-installer dll from &lt;WDK ROOT&gt;\\redist\\wdf\\&lt;platform&gt;\\

To install the drivers, copy the driver files (the .sys and .dll files) and the INF files to the same location. In Device Manager, complete the following steps.

On Windows XP (The driver works as a mouse on Windows XP and Windows Vista):

1.  Right-click the device, and click **Update Driver**.

2.  Select **Install from a list or specific location (Advanced)**, and then click **Next**..

3.  Select **Don't search. I will choose the driver to install**, and then click **Have Disk**..

4.  In the **Install From Disk** dialog box, type the path of the directory where you copied the driver and INF file, and then click **OK**..

5.  Click **Finish**.

On Windows Vista and Windows 7

1.  Right-click the device, and click **Update Driver**.

2.  Click the **Browse my computer for driver software** link.

3.  Click the **Let me pick from a list of device drivers on my computer** link.

4.  Click **Have Disk**.

5.  Navigate to the location of the driver file, and click the INF file.

6.  Click **OK**.

### Resources

For information about Microsoft Windows Vista and the Tablet PC, see http://www.microsoft.com/tabletpc.

### Code Tour

This section includes a file manifest of all the files in the src\\input\\hiddigi directory.

### File Manifest

src\\input\\hiddigi \\ wacompen

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>File</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Errcodes.mc</p></td>
<td><p>Contains event code and messages.</p></td>
</tr>
<tr class="even">
<td><p>Pch.h</p></td>
<td><p>Precompiled header file.</p></td>
</tr>
<tr class="odd">
<td><p>Sources</p></td>
<td><p>WDK sources file.</p></td>
</tr>
<tr class="even">
<td><p>Makefile</p></td>
<td><p>WDK build environment make file.</p></td>
</tr>
<tr class="odd">
<td><p>Elotouch.c</p></td>
<td><p>Contains the OEM specific code.</p></td>
</tr>
<tr class="even">
<td><p>Oempen.c</p></td>
<td><p>Contains the OEM specific code.</p></td>
</tr>
<tr class="odd">
<td><p>Elotouch.h</p></td>
<td><p>Contains the OEM specific definitions.</p></td>
</tr>
<tr class="even">
<td><p>Elotouch.rc</p></td>
<td><p>The resource file for the driver.</p></td>
</tr>
<tr class="odd">
<td><p>EloMT.inx</p></td>
<td><p>INX file that is used to generate the INF file</p></td>
</tr>
</tbody>
</table>

 

src\\input\\hiddigi\\common

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>File</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>hid.c</p></td>
<td><p>Handles all the internal HIDClass IOCTLs.</p></td>
</tr>
<tr class="even">
<td><p>naturalInput.h</p></td>
<td><p>Contains common definitions for UART digitizer drivers.</p></td>
</tr>
<tr class="odd">
<td><p>Pnp.c</p></td>
<td><p>Handles Plug and Play (PnP) and power management.</p></td>
</tr>
<tr class="even">
<td><p>Serial.c</p></td>
<td><p>Contains all functions that deal with the serial port.</p></td>
</tr>
<tr class="odd">
<td><p>Serial.h</p></td>
<td><p>Contains serial port definitions.</p></td>
</tr>
</tbody>
</table>

 

src\\input\\hiddigi\\util

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>File</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Errlog.c</p></td>
<td><p>Contains all the error logging functions.</p></td>
</tr>
<tr class="even">
<td><p>Errlog.h</p></td>
<td><p>Contains error logging definitions.</p></td>
</tr>
<tr class="odd">
<td><p>Wtrace.h</p></td>
<td><p>Definitions for trace macros. This should be edited to enable tracing if needed.</p></td>
</tr>
</tbody>
</table>

 

 

 






