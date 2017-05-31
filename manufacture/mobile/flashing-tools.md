---
author: kpacquer
Description: Flashing tools
ms.assetid: ac04af30-84ef-4d09-9c6f-5b9c01f9a2a0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Flashing tools
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Flashing tools


Each manufacturer has different techniques and tooling that they will use to manufacture and service a Windows 10 Mobile device. The best technical expertise regarding manufacturing resides within those who built the OEM manufacturing line. This means that the OEM will need to determine which flashing and manufacturing process will work best for them. OEM service centers may have unique needs that will also influence the selection of flashing tools. The OEM will need to determine how to test and validate that the selected tools and processes meets their cost, quality, and other unique manufacturing objectives.

The OEM uses the Microsoft supplied imaging tools to create the FFU OS images that are flashed to the device.

## <span id="Flashing_tools_comparison"></span><span id="flashing_tools_comparison"></span><span id="FLASHING_TOOLS_COMPARISON"></span>Flashing tools comparison


The OEM may need to develop a custom flashing tool to address the life cycle needs of the device. Other flashing options have limitations that the OEM should understand before deciding to use them.

The following table summarizes the flashing tool options.

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
<th align="left">Scenario</th>
<th align="left">Microsoft FFU Engineering Tool</th>
<th align="left">OEM Custom FFU Tool</th>
<th align="left">SoC Provided Manufacturing Flashing tool</th>
<th align="left">Gang Programmer</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Engineering and Development</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>N/A</p></td>
</tr>
<tr class="even">
<td align="left"><p>Manufacturing</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Service Center</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>N/A</p></td>
</tr>
</tbody>
</table>

 

## <span id="OEM_custom_flashing_tool"></span><span id="oem_custom_flashing_tool"></span><span id="OEM_CUSTOM_FLASHING_TOOL"></span>OEM custom flashing tool


To create a flashing tool for manufacturing, the OEM must develop their own tools customized to their manufacturing environment and equipment.

Depending on the OEMs requirements, the flashing tools may also need to address a number of scenarios described in [Field service scenarios](field-service-scenarios.md).

For more info, see [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md).

## <span id="SoC_provided_manufacturing_flashing_tool"></span><span id="soc_provided_manufacturing_flashing_tool"></span><span id="SOC_PROVIDED_MANUFACTURING_FLASHING_TOOL"></span>SoC provided manufacturing flashing tool


For information on the SoC provided manufacturing flashing tools, contact the SoC provider.

## <span id="Gang_programmer"></span><span id="gang_programmer"></span><span id="GANG_PROGRAMMER"></span>Gang programmer


There are a number of options available to the OEM to flash binary images. The OEM can use their unique flashing tools as well as gang programmer technologies to manufacture the device if they find that those options are more suitable to their environment.

If the OEM uses a gang programmer they will need to develop a custom tool to convert the FFU image to a raw binary image. The conversion tool will need to:

1.  Open a raw binary file in the format expected by the gang programmer.

2.  Read in the FFU file and parse the file data as specified in [FFU image format](ffu-image-format.md).

3.  Write out the data referenced in the FFU BLOCK\_DATA\_ENTRY elements to the raw file.

4.  When there are no more entries, write out any metadata or padding needed for the raw format and then close the raw binary file.

## <span id="FFUTool_support_limitations"></span><span id="ffutool_support_limitations"></span><span id="FFUTOOL_SUPPORT_LIMITATIONS"></span>FFUTool support limitations


The Microsoft provided FFUTool full flash update (FFU) technology is designed for engineering development, and testing purposes; it is not supported for use in manufacturing. Each OEM must determine if the FFUTool is suitable for use in their service center environments.

## <span id="FFUTool_known_issues"></span><span id="ffutool_known_issues"></span><span id="FFUTOOL_KNOWN_ISSUES"></span>FFUTool known issues


Using the FFUTool has a number of significant limitations that are summarized here.

### <span id="USB_hub_activity_may_cause_flashing_failures"></span><span id="usb_hub_activity_may_cause_flashing_failures"></span><span id="USB_HUB_ACTIVITY_MAY_CAUSE_FLASHING_FAILURES"></span>USB hub activity may cause flashing failures

Some USB hubs have been known to cause reliability issues even when flashing devices in serial due to hardware interference to the streaming FFU data.

Multiple devices that share a single USB hub cannot be connected and disconnected while other connected device are flashing. This uncovers a known hardware issue with some USB controllers. For more info, see [KB908673](http://support.microsoft.com/kb/908673). You should not unplug USB devices when device flashing is underway.

### <span id="USB_cable_length_is_limited_to_3_feet"></span><span id="usb_cable_length_is_limited_to_3_feet"></span><span id="USB_CABLE_LENGTH_IS_LIMITED_TO_3_FEET"></span>USB cable length is limited to 3 feet

Flashing may be less reliable when using USB cables longer than 3 feet (.91 meters), or if your flashing setup contains consecutive cables that total to more than 3 feet. This is due to hardware limitations of data transfer in longer cables.

### <span id="Flashing_time_per_phone"></span><span id="flashing_time_per_phone"></span><span id="FLASHING_TIME_PER_PHONE"></span>Flashing time per phone

You will need to evaluate whether the flashing time per device meets their objectives for your manufacturing line.

 

 





