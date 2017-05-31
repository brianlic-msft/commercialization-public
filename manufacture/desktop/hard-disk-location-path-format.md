---
author: Justinha
Description: Hard Disk Location Path Format
ms.assetid: 9f9d96ae-4fec-487d-95d2-ffd09b7d9fd1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Hard Disk Location Path Format
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hard Disk Location Path Format


This topic describes the hard disk location-path format. This format is used to identify each disk in the DiskPart tool by using the location path. The location-path format is based on the physical connection to the computer.

For instructions that describe how to configure Windows® to identify a drive based on the location-path format, see [Configure Multiple Hard Drives](configure-multiple-hard-drives.md).

## <span id="LocationPathFormat"></span><span id="locationpathformat"></span><span id="LOCATIONPATHFORMAT"></span>Location-Path Format


The basic syntax for the location path for disks that have a Small Computer System Interface (SCSI), Serial Attached SCSI (SAS), or Redundant Array of Independent Disks (RAID) bus type is as follows:

&lt;*PnP location path of the adapter*&gt;**\#**&lt;*Bus Type*&gt;(**P**&lt;*Path ID*&gt;**T**&lt;*Target ID*&gt;**L**&lt;*LUN ID*&gt;)

The basic syntax for the location path for disks that have an Advanced Technology Attachment (ATA) or Serial ATA (SATA) bus type is as follows:

&lt;*PnP location path of the adapter*&gt;**\#**&lt;*Bus Type*&gt;(**C**&lt;*Channel ID*&gt;**T**&lt;*Target ID*&gt;**L**&lt;*LUN ID*&gt;)

The following table defines the elements in the location path.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Element</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>&lt;<em>PnP location path of the adapter</em>&gt;</p></td>
<td align="left"><p>Path of the adapter. Retrieve the path by calling the SetupDiGetDeviceProperty with the DEVPKEY_Device_LocationPaths property.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>#</strong>&lt;<em>Bus Type</em>&gt;</p></td>
<td align="left"><p>One of the following types: ATA, SCSI, SAS, or RAID.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>P</strong>&lt;<em>Path ID</em>&gt;</p></td>
<td align="left"><p>PathId field of SCSI_ADDRESS. Retrieve the PathID by calling IOCTL_SCSI_GET_ADDRESS.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>C</strong>&lt;<em>Channel ID</em>&gt;</p></td>
<td align="left"><p>PathId field of SCSI_ADDRESS. Retrieve the PathID by calling IOCTL_SCSI_GET_ADDRESS.</p>
<div class="alert">
<strong>Note</strong>  
<p>For disks that use the ATA/SATA bus type, the Channel ID refers to the same field as PathID. The prefix C is still used.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>T</strong>&lt;<em>Target ID</em>&gt;</p></td>
<td align="left"><p>TargetId field of SCSI_ADDRESS. Retrieve the TargetId by calling IOCTL_SCSI_GET_ADDRESS.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>L</strong>&lt;<em>LUN ID</em>&gt;</p></td>
<td align="left"><p>Logical Unit Number (LUN) field of SCSI_ADDRESS. Retrieve the LUN by calling IOCTL_SCSI_GET_ADDRESS.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Examples"></span><span id="examples"></span><span id="EXAMPLES"></span>Examples


The following table gives an example of a location path for each bus or disk type:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Bus or disk type</th>
<th align="left">Location path</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Integrated Development Environment (IDE), ATA, Parallel ATA (PATA), or SATA</p></td>
<td align="left"><p>PCIROOT(0)#PCI(0100)#ATA(C01T03L00)</p></td>
</tr>
<tr class="even">
<td align="left"><p>SCSI</p></td>
<td align="left"><p>PCIROOT(0)#PCI(1C00)#PCI(0000)#SCSI(P00T01L01)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>SAS</p></td>
<td align="left"><p>PCIROOT(1)#PCI(0300)#SAS(P00T03L00)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Peripheral Component Interconnect (PCI) RAID</p></td>
<td align="left"><p>PCIROOT(0)#PCI(0200)#PCI(0003)#PCI(0100)#RAID(P02T00L00)</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Configure Multiple Hard Drives](configure-multiple-hard-drives.md)

[DiskPart Command-Line Syntax](http://go.microsoft.com/fwlink/?LinkId=128458)

 

 






