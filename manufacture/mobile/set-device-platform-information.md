---
title: Set device platform information
description: Learn about the prerequisites for building an image that can be flashed to a mobile device, including additional device platform information such as partner names, version numbers, and device names, before the image is finalized for retail devices.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3bf177d9-fd4a-4221-958b-ed98e5bd4e70
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Set device platform information


To prepare for building an image, OEMs must perform the following tasks to specify required information for the targeted device platform:

-   Set several device platform values in the SMBIOS system information structure on the devices.

-   Build a *device platform* package.

The engineering flashing tool set provided by Microsoft compares the values in the SMBIOS system information structure with corresponding values in the device platform package before flashing an image. This check helps to ensure that an image can be flashed to a particular device only if it was built for the corresponding device platform. It is recommended that the flashing tools that OEMs create for their manufacturing environments do the same verification. For more information, see [Validating the device platform information before flashing an image to a device](#validating) in this topic.

**Note**  
This topic describes prerequisites for building an image that can be flashed to a device. OEMs must set additional device platform information including partner names, version numbers, and device names before an image is finalized for retail devices.

 

## <a href="" id="setting-smbios-system-information-values-"></a>Setting SMBIOS system information values


On each device platform, OEMs must ensure that the following values in the SMBIOS system information structure are set:

-   PhoneManufacturer

-   Family

-   Product Name

-   Version

These values may be set to defaults by the SoC vendor; OEMs must replace these with values for their device platform. OEMs may also need to set other SMBIOS values as specified by the SoC vendor. For more information about how to set or read these values, refer to documentation provided by the SoC vendor.

For more information about the expected sizes and data types for these values, refer to section 7.2 in the [System Management BIOS (SMBIOS) Reference Specification](http://go.microsoft.com/fwlink/?LinkId=267529) (PDF).

**Important**  
The PhoneManufacturer setting must contain a code specified by Microsoft that corresponds to the OEM. This setting is used for targeting device updates, for connecting to the store-within-a-store in the Windows Store, and for Watson reports. The value must be a valid OEM ID. To get the valid OEM ID that applies to you, contact your Microsoft representative.

 

## Creating the device platform package


The device platform package contains just one file: an XML file named **OEMDevicePlatform.xml** that includes information specific to the device platform for which the image is being built. Every image must include a device platform package. OEMs must specify the device platform package by using the OEMDevicePlatformPackages element in a FM file that is included in the image.

To create the device platform package, first create an OEMDevicePlatform.xml file that contains the device platform information in the required schema format. Then, create a package that includes this XML file.

### Creating the XML file

The OEMDevicePlatform.xml file contains a single **OEMDevicePlatform** element with the following child elements.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>MinSectorCount</strong></p></td>
<td><p>This value specifies the minimum sectors that are expected on a device store. The imaging tool uses this value to ensure that the content will fit on the device. The actual sector count may be more than this minimum. The sector size is 512 bytes, as defined in the device layout package provided by Microsoft.</p></td>
</tr>
<tr class="even">
<td><p><strong>DevicePlatformID</strong></p></td>
<td><p>This is one of the following strings that consists of values from the SMBIOS system information structure concatenated together, with each value separated by a period (.):</p>
<ul>
<li><p><em>PhoneManufacturer</em>.<em>Family</em>.<em>Product Name</em></p></li>
<li><p><em>PhoneManufacturer</em>.<em>Family</em>.<em>Product Name</em>.<em>Version</em></p></li>
</ul>
<p>OEMs can choose whether or not to include the <em>Version</em> value in this string.</p>
<p>When device platform validation is enabled in the Microsoft flashing application, the values specified in this string will be compared with the corresponding values in the SMBIOS system information structure. For more information, see [Use the flashing tools provided by Microsoft](use-the-flashing-tools-provided-by-microsoft.md).</p>
<p>The device platform XML file can have only a <strong>DevicePlatformID</strong> or <strong>DevicePlatformIDs</strong> element, but not both.</p></td>
</tr>
<tr class="odd">
<td><p><strong>DevicePlatformIDs</strong></p></td>
<td><p>OEMs can set multiple device platform IDs using the following XML syntax, where each string has the same format as described for the <strong>DevicePlatformID</strong> element.</p>
<pre class="syntax" space="preserve"><code>&lt;DevicePlatformIDs&gt;
   &lt;ID&gt;Contoso.ContosoPhoneFamily.Z101._012&lt;/ID&gt;
   &lt;ID&gt;Contoso.ContosoPhoneFamily.Z101._013&lt;/ID&gt;
   &lt;ID&gt;Contoso.ContosoPhoneFamily.Z102&lt;/ID&gt;
&lt;/DevicePlatformIDs&gt;</code></pre>
<p>Device platform validation will succeed if any of the IDs match either the PhoneManufacturer.Family.Product.Version or the PhoneManufacturer.Family.Product specified.</p>
<p>The device platform XML file can have only a <strong>DevicePlatformID</strong> or <strong>DevicePlatformIDs</strong> element, but not both.</p></td>
</tr>
<tr class="even">
<td><p><strong>AdditionalMainOSFreeSectorsRequest</strong></p></td>
<td><p>Optional. This value specifies the number of sectors to add to the pool of storage reserved by the OS for future updates. There is no guarantee that the sectors specified by using the <strong>AdditionalMainOSFreeSectorsRequest</strong> element will always be available for OEM-specific updates; the sectors are instead added to a single pool of storage that is reserved for all updates from Microsoft and OEMs.</p></td>
</tr>
<tr class="odd">
<td><p><strong>MainOSRTCDataReservedSectors</strong></p></td>
<td><p>Optional. This value specifies the number of sectors to add to the pool of storage reserved by the OS for use by runtime configuration data during backup and restore operations. Up to 100 MB can be reserved.</p>
<p>This following example demonstrates how to reserve 50 MB.</p>
<pre class="syntax" space="preserve"><code>&lt;MainOSRTCDataReservedSectors&gt;102400&lt;/MainOSRTCDataReservedSectors&gt;</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>CompressedPartitions</strong></p></td>
<td><p>Optional. Use this element to enable CompactOS in your mobile image.</p>
<p>This element contains one or more child <strong>Name</strong> elements that specify which partitions to compress. Currently, the only supported partition is the Main OS partition, and the only supported value under this element is <strong>MainOS</strong>, as shown in the example below.</p>
<pre class="syntax" space="preserve"><code>&lt;CompressedPartitions&gt;
  &lt;Name&gt;MainOS&lt;/Name&gt;
&lt;/CompressedPartitions&gt;</code></pre>
<div class="alert">
<strong>Important</strong>  The host computer where the image is created must be running Windows 10. You can also create the image on a host computer running Windows 8.1 or Windows Server 2012 R2 with [KB3066427](https://support.microsoft.com/kb/3066427) installed.
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

The following example demonstrates an OEMDevicePlatform.xml file.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<OEMDevicePlatform xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
   xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">
   <MinSectorCount>20971520</MinSectorCount>
   <DevicePlatformID>Contoso.ContosoFamily.ContosoDevice.v1</DevicePlatformID>
   <AdditionalMainOSFreeSectorsRequest>204800</AdditionalMainOSFreeSectorsRequest>
</OEMDevicePlatform>
```

### Creating the package

To create a package that includes the OEMDevicePlatform.xml file, follow the guidance in [Creating packages](creating-mobile-packages.md). The following example demonstrates a device platform XML file that specifies a single device platform ID.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
   Owner="OEMName" OwnerType="OEM" Component="OEMDevicePlatform" 
   ReleaseType="Production" Platform="DeviceName">
   <Components>
      <OSComponent>
         <Files>
            <File Source="OEMDevicePlatform.xml" DestinationDir="$(runtime.windows)\ImageUpdate" 
                  Name="OEMDevicePlatform.xml"/>
         </Files>
      </OSComponent>
   </Components>
</Package>
```

Note the following details concerning this example:

-   Be sure to replace the "*OEMName*" and "*DeviceName*" entries with appropriate values.

-   The `$(runtime.windows)` string in the path for the **DestinationDir** attribute is a globally defined macro. The **DestinationDir** path must start with a globally defined macro for a directory. For more information about the **DestinationDir** attribute, see [Specifying files and registry entries in a package project file](https://msdn.microsoft.com/windows/hardware/dn789219). For more information about macros, see [Primary elements and attributes of a package project file](https://msdn.microsoft.com/library/windows/hardware/dn756796).

**Including the device platform package in the image**

After the device platform package is created, it must be specified using the OEMDevicePlatformPackages element in a feature manifest file. For more information, see [Feature manifest file contents](feature-manifest-file-contents.md).

## <a href="" id="validating"></a>Validating the device platform information before flashing an image to a device


To help ensure that an image about to be flashed to a device was actually designed for that device, the flashing tool set created by OEMs should check the *Manufacturer*, *Family*, and *Product Name* SMBIOS system information structure values on the device and compare these values against the *Manufacturer*.*Family*.*Product Name* portion of the **DevicePlatformID** string in the device platform package. The flashing tool should proceed with the flashing process only if these values match. The flashing tool can optionally verify that the *Version* value also matches, but this is not required. For more information, see [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md).

By default, the device-side UEFI flashing application provided by Microsoft validates that the device platform information in SMBIOS matches the device platform information in the image. For more information, see [Use the flashing tools provided by Microsoft](use-the-flashing-tools-provided-by-microsoft.md).

When it is necessary to migrate a phone to a new set of device platform values, Microsoft recommends the following process:

-   Build a transition image that contains the new SMBIOS values but still references the old **DevicePlatformID** string in the device platform package.

-   Flash this image to the phone. This process overwrites the SMBIOS values on the phone with the new SMBIOS values.

-   In the image definition, update the **DevicePlatformID** string in the device platform package to match the new SMBIOS values. This enables the image to be flashed to the phone.

## Related topics


[Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md)

[Use the flashing tools provided by Microsoft](use-the-flashing-tools-provided-by-microsoft.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Set%20device%20platform%20information%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





