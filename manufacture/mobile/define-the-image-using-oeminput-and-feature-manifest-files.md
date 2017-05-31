---
title: Define the image using OEMInput and feature manifest files
description: Learn how to create an OEMInput and feature manifest files to fully define the contents of your mobile image.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A3E05C3B-450D-4AFD-8368-241EAB7F8036
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Define the image using OEMInput and feature manifest files


Learn how to create an OEMInput and feature manifest files to fully define the contents of your mobile image.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="oeminput-file-contents.md">OEMInput file contents</a></p></td>
<td><p>An OEMInput.xml file contains the required and optional elements used to define a mobile image. The OS uses this file to determine the applications processor, build type, UI languages, default region format, resolution, and other properties to include in the image that will be generated.</p>
<p>This topic provides a full listing of the XML schema for the file.</p></td>
</tr>
<tr class="even">
<td><p><a href="optional-features-for-building-images.md">Optional features for building mobile images</a></p></td>
<td><p>You can add optional features to images by including them under the <strong>Features</strong> element in the OEMInput XML file.</p></td>
</tr>
<tr class="odd">
<td><p><a href="feature-manifest-file-contents.md">Feature manifest file contents</a></p></td>
<td><p><em>Feature manifest (FM) files</em> are used to define specific types of image builds that contain different sets of optional packages. This topic describes the required and optional elements in a FM file.</p></td>
</tr>
<tr class="even">
<td><p><a href="create-a-feature-and-include-it-in-an-image.md">Create a feature and include it in an image</a></p></td>
<td><p>This topic shows you how to create a feature and add it to an image.</p></td>
</tr>
<tr class="odd">
<td><p><a href="adding-a-driver-to-a-test-image.md">Adding a driver to a test image</a></p></td>
<td><p>This topic shows you how to create a feature and add it to a test image.</p></td>
</tr>
<tr class="even">
<td><p><a href="feature-groupings-and-constraints.md">Feature groupings and constraints</a></p></td>
<td><p>Feature groups and feature constraints allow additional logic to be added to the build system to support intelligent processing of the OEMInput XML.</p></td>
</tr>
<tr class="odd">
<td><p><a href="set-device-platform-information.md">Set device platform information</a></p></td>
<td><p>Learn about the prerequisites for building an image that can be flashed to a mobile device, including additional device platform information such as partner names, version numbers, and device names, before the image is finalized for retail devices.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Building and flashing mobile images](building-and-flashing-images.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Define%20the%20image%20using%20OEMInput%20and%20feature%20manifest%20files%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





