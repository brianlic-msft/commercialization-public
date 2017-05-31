---
author: Justinha
Description: ResetConfig XML reference
ms.assetid: dc9f16c9-d094-49d6-9aaf-3a02c381ccc0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: ResetConfig XML reference
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ResetConfig XML reference


This reference describes all XML elements that are used to author the ResetConfig.xml file, used to configure Windows Recovery Environment push-button reset features.

## <span id="Reset"></span><span id="reset"></span><span id="RESET"></span>Reset


The `Reset` XML element can contain the elements: `Run` and `SystemDisk`.

## <span id="ResetConfigRun"></span><span id="resetconfigrun"></span><span id="RESETCONFIGRUN"></span>Run


The `Run` XML element is used to add custom scripts to push-button reset features.

You can specify up to four `Run` elements in a single ResetConfig.xml file. Each `Run` element must contain a different *\[ExtPoint\]* value for the `Phase` attribute.

The following table describes the valid elements that can be added to the `Run` element:

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
<td align="left"><p><code>Run Phase=&quot;[ExtPoint]&quot;&quot;</code></p></td>
<td align="left"><p>Each <code>Run</code> element defines the extensibility point to be used, the script that is executed at that extensibility point, and estimated time duration in minutes.</p>
<p>The <code>Phase</code> attribute is required. It accepts only the following values for <em>[ExtPoint]</em>:</p>
<ul>
<li><p><code>BasicReset_BeforeImageApply</code>. Runs the specified program at extensibility point A.</p></li>
<li><p><code>BasicReset_AfterImageApply</code>. Runs the specified program at extensibility point B</p></li>
<li><p><code>FactoryReset_AfterDiskFormat</code>. Runs the specified program at extensibility point C</p></li>
<li><p><code>FactoryReset_AfterImageApply</code>. Runs the specified program at extensibility point D</p></li>
</ul>
<p>You can specify up to four <code>Run</code> sections in a single ResetConfig.xml file. However, each <code>Run</code> section must contain a different value for the phase attribute.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>Path</code></p></td>
<td align="left"><p>Specifies the location of the script for a particular <code>Run</code> section.</p>
<p>The path must be the relative path of the script from the folder which contains ResetConfig.xml (usually this is C:\Recovery\OEM).</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>Duration</code></p></td>
<td align="left"><p>Specifies the estimated time, in minutes, that you expect the custom script to run. This estimate is used to display progress information in the GUI.</p>
<p>The duration must be an integer and must be between 1 and 5.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>Param</code></p></td>
<td align="left"><p>Specifies the command-line parameters to use when you run the custom script or executable file. The value is treated as a string, and can contain multiple parameters.</p>
<p><code>Param</code> does not support empty elements. If your script does not require parameters, then do not include this element. For examples, see [Using ResetConfig.xml](#usingresetconfig-xml) later in this topic.</p></td>
</tr>
</tbody>
</table>

 

## <span id="resetconfig.xml_sysdisk_options"></span><span id="RESETCONFIG.XML_SYSDISK_OPTIONS"></span>SystemDisk


The `SystemDisk` element customizes bare metal recovery functionality. For more information, see [Create Media to Run Push-Button Reset Features](create-media-to-run-push-button-reset-features-s14.md).

You can specify one `SystemDisk` section. Here's the required and optional elements:

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
<td align="left"><code>MinSize</code>
<p></p></td>
<td align="left"><p>Required. Specifies the minimum required size for the primary hard drive, in megabytes.</p>
<p>Bare metal recovery won't proceed if the system disk doesn't meet this size requirement.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>DiskpartScriptPath</code></p></td>
<td align="left"><p>Required. Path to Diskpart script relative to C:\Recovery\OEM. The script should assume that all existing partitions have been deleted, and the system disk has focus in Diskpart.</p>
<p>For example, if the recovery scripts are located at <code>C:\Recovery\OEM\Scripts\RecreatePartitions.dps</code>, use the value <code>\Scripts\RecreatePartitions.dps</code>.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>OSPartition</code></p></td>
<td align="left"><p>Required. The partition to which the OS should be restored. The ESP or active partition must be on the same disk as the OS.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>RestoreFromIndex</code></p></td>
<td align="left"><p>Optional. The index of the image within install.wim to be applied during bare metal recovery. This element is optional and is only needed on manufacturer-created recovery media</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>WindowsREPartition</code></p></td>
<td align="left"><p>Optional. Specifies the partition where the Windows RE boot image is installed.</p>
<p>The <code>WindowsREPartition</code> and <code>WindowsREPath</code> elements are optional, but they must be used together. If only one of these elements is present, your user won't be able to repartition the hard drive.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>WindowsREPath</code></p></td>
<td align="left"><p>Optional. Specifies the folder path where the Winre.wim boot image is copied and staged, relative to the root of the partition specified in the <code>WindowsREPartition</code> element.</p>
<p>The <code>WindowsREPartition</code> and <code>WindowsREPath</code> elements are optional, but they must be used together. If only one of these elements is present, your user won't be able to repartition the hard drive.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>Compact</code></p></td>
<td align="left"><p>Optional. Specifies whether the recovery image should be applied with per-file compression enabled. This element is optional and is only needed on manufacturer-created recovery media.</p>
<p><code>Compact</code> accepts the following values:</p>
<ul>
<li><code>True</code>: Files applied from the image are compressed individually.</li>
<li><code>False</code> (default value): Compression is not used.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><p><code>RecoveryImagePartition</code></p></td>
<td align="left"><p>This setting is deprecated in Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>RecoveryImagePath</code></p></td>
<td align="left"><p>This setting is deprecated in Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>RecoveryImageIndex</code></p></td>
<td align="left"><p>This setting is deprecated in Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>WIMBoot</code></p></td>
<td align="left"><p>This setting is deprecated in Windows 10.</p></td>
</tr>
</tbody>
</table>

 

## <span id="usingresetconfig-xml"></span><span id="USINGRESETCONFIG-XML"></span>Using ResetConfig.xml


If you use a text editor to author your .xml files, you must save the document with an .xml file name extension, and use UTF-8 encoding. You must not use ANSI coding.

These files should be placed in the folder C:\\Recovery\\OEM, and will automatically be detected by Push-button reset features.

## <span id="Example"></span><span id="example"></span><span id="EXAMPLE"></span>Example


This is a code example for the ResetConfig.xml file.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Reset>
 <Run Phase="BasicReset_BeforeImageApply">
   <Path>Fabrikam\CopyFiles.cmd</Path>
   <Duration>2</Duration>
 </Run>
 <Run Phase="BasicReset_AfterImageApply">
   <Path>Fabrikam\InstallDrivers.cmd</Path>
   <Param>/allDrivers</Param>
   <Duration>2</Duration>
 </Run>
 <Run Phase="FactoryReset_AfterDiskFormat">
   <Path>Fabrikam\FixPartitions.exe</Path>
   <Duration>2</Duration>
 </Run>
 <Run Phase="FactoryReset_AfterImageApply">
   <Path>Fabrikam\InstallDrivers.cmd</Path>
   <Param>/allDrivers</Param>
   <Duration>2</Duration>
 </Run>
 <SystemDisk>
   <MinSize>75000</MinSize>
   <DiskpartScriptPath>Fabrikam\CreatePartition.txt </DiskpartScriptPath>
   <OSPartition>4</OSPartition>
   <RestoreFromIndex>2</RestoreFromIndex>
   <WindowsREPartition>1</WindowsREPartition>
   <WindowsREPath>Recovery\WindowsRE</WindowsREPath>
   <Compact>False</Compact>
 </SystemDisk>
</Reset>
```

## <span id="related_topics"></span>Related topics


[Push-Button Reset Overview](push-button-reset-overview.md)

[Create Media to Run Push-Button Reset Features](create-media-to-run-push-button-reset-features-s14.md)

 

 






