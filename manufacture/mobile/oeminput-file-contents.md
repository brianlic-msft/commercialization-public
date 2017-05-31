---
title: OEMInput file contents
description: An OEMInput.xml file contains the required and optional elements used to define a mobile image.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 945961d7-382e-4d66-9e00-bc01d3fbfa86
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OEMInput file contents


An OEMInput.xml file contains the required and optional elements used to define a mobile image. The OS uses this file to determine the applications processor, build type, UI languages, default region format, resolution, and other properties to include in the image that will be generated.

This topic provides a full listing of the XML schema for the file.

## Required elements in the OEMInput file


The following table describes the required elements in the OEMInput file.

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
<td><p><strong>OEMInput</strong></p></td>
<td><p>The root element for the OEMInput file.</p></td>
</tr>
<tr class="even">
<td><p><strong>Description</strong></p></td>
<td><p>A string that describes the image. OEMs should add a description that is particular to the device the image is built for.</p></td>
</tr>
<tr class="odd">
<td><p><strong>SOC</strong></p></td>
<td><p>A string that identifies the SoC used on the device. The following values are currently supported:</p>
<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Applications processor</th>
<th>Supported SOC values</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>QC8974</strong></p></td>
<td><ul>
<li><p><strong>QC8974</strong>: Creates an image without a crash dump partition. Use this value for Production images.</p></li>
<li><p><strong>QC8974_Test</strong>: Creates an image with a crash dump partition that is more than 2 GB in size. Use this value when generating Test images for devices with more than 4 GB of storage.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p><strong>QC8x26</strong></p></td>
<td><ul>
<li><p><strong>QC8x26</strong>: Creates an image without any crash dump partitions. Use this value for production images.</p></li>
<li><p><strong>QC8x26_Test</strong>: Creates an image with two dedicated crash dump partitions on eMMC. The combined size of the two partitions is 3.5 times the size of the total RAM memory on the phone. To create a test image that supports full dumps and offline dumps on a device with at least 8GB of eMMC, use this value and include the DEDICATEDUMPONEMMC feature.</p></li>
<li><p><strong>QC8x26_UseSD_Test</strong>: Creates an image without dedicated partitions for storing crash dumps on devices with less than 8 GB of eMMC. To create full, kernel, or offline crash dumps, an SD card must be present and the feature DEDICATEDUMPONSD feature must be specified to redirect dumps to the SD card. The recommended SD card size for offline dumps is 16 or 32 GB. For more information about specifying debug features, see <a href="optional-features-for-building-images.md">Optional features for building images</a>.</p></li>
</ul>
<p>To build a QC8x26 test image that supports full dumps and offline dumps on a device with less than 8GB of eMMC, use QC8x26_UseSD_Test. Include the DEDICATEDUMPONSD feature to redirect dumps to the SD card. The recommended SD card size for offline dumps is 16 or 32 GB.</p>
<p>To build a QC8x26 test image that supports full dumps and offline dumps on a device with at least 8GB of eMMC, use <strong>QC8x26_Test</strong> and include the DEDICATEDUMPONEMMC feature.</p>
<p>To build a QC8x26 retail or production image where full dumps and offline dumps are not enabled, use <strong>QC8x26</strong>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>QC8960</strong></p></td>
<td><ul>
<li><p><strong>QC8960</strong>: Creates an image without a crash dump partition. Use this value for Production images.</p></li>
<li><p><strong>QC8960_Test</strong>: Creates an image with a crash dump partition that is more than 2 GB in size. Use this value when generating Test images for phones with more than 4 GB of storage.</p></li>
<li><p><strong>QC8960_Test_4gb</strong>: Creates an image with a crash dump partition that is approximately 600 MB in size, large enough to store a single crash dump for a device with 512 MB of RAM. Use this value when generating Test images for phones with only 4 GB of storage.</p></li>
</ul>
<div class="alert">
<strong>Important</strong>  
<p>The 8960 SOC options must only be used for images that are used to create updates for Windows 10 Mobile. For more information see <a href="https://msdn.microsoft.com/windows/hardware/commercialize/service/mobile/index">Update</a>.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
<tr class="even">
<td><p><strong>Device</strong></p></td>
<td><p>A string that identifies the device model the image is being built for. Use this setting to include packages marked with the corresponding <strong>Device</strong> attribute of the <strong>DeviceSpecificPackages</strong> and the <strong>OEMDevicePlatformPackages</strong> elements in the feature manifest file.</p></td>
</tr>
<tr class="odd">
<td><p><strong>ReleaseType</strong></p></td>
<td><p>A string that indicates the release type of the image. Use this setting to include packages marked with the corresponding <strong>ReleaseType</strong> attribute value of a <strong>ReleasePackages</strong> element in the feature manifest file. The following values are supported:</p>
<ul>
<li><p><strong>Production</strong>: This value indicates that all packages in the image are production signed, and the image only includes production packages (that is, packages where the <strong>ReleaseType</strong> attribute in the package XML is set to <strong>Production</strong>). In addition, all Microsoft-owned packages must be signed with a certificate issued by Microsoft. This value should only be used when generating the final retail image.</p></li>
<li><p><strong>Test</strong>: This value indicates that the image can contain test-signed packages as well as production-signed packages, and the image contains a mixture of production and test packages (that is, packages where the <strong>ReleaseType</strong> attribute in the package XML is set to <strong>Test</strong> or <strong>Production</strong>). This value is used in production, test, health, and manufacturing images. For more information about the different image types, see <a href="building-a-phone-image-using-imggencmd.md">Building a phone image using ImgGen.cmd</a>.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p><strong>BuildType</strong></p></td>
<td><p>A string that specifies whether to use checked build or free packages when creating the image. To generate a checked build with debug code, specify <strong>chk</strong>. To generate a free build without debug code, specify <strong>fre</strong>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>SupportedLanguages</strong></p></td>
<td><p>Contains the following child elements that specify the language support in the generated image:</p>
<ul>
<li><p><strong>UserInterface</strong>: A string that contains the language codes for the display languages to include in the image. If multiple language codes are listed, they must each be included in their own <code>&lt;language&gt;</code> block.</p></li>
<li><p><strong>Keyboard</strong>: A string that contains the language codes for the keyboard languages to include in the image (that is, languages in which text correction and suggestions are supported). If multiple language codes are listed, they must each be included in their own <code>&lt;language&gt;</code> block.</p></li>
<li><p><strong>Speech</strong>: A string that contains the language codes for the speech languages to include in the image. If multiple language codes are listed, they must each be included in their own <code>&lt;language&gt;</code> block.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p><strong>BootUILanguage</strong></p></td>
<td><p>A string that specifies the language code for the default display language to include in the image.</p></td>
</tr>
<tr class="odd">
<td><p><strong>BootLocale</strong></p></td>
<td><p>A string that specifies the language code for the default region format for the image.</p></td>
</tr>
<tr class="even">
<td><p><strong>Resolutions</strong></p></td>
<td><p>Contains one <strong>Resolution</strong> element. The <strong>Resolution</strong> element contains a string that represents a display resolution supported by the image. The following values are supported: <strong>480x800</strong>, <strong>540x960</strong>, <strong>720x1280</strong>, <strong>768x1280</strong>, and <strong>1080x1920</strong>. The build will include the corresponding resolution packages in the image for the specified resolution.</p>
<p>Note that some resolutions are supported only with certain applications processors.</p></td>
</tr>
</tbody>
</table>

 

## Optional elements in the OEMInput file


The following table describes the optional elements that OEMs can include in the OEMInput file.

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
<td><p><strong>SV</strong></p></td>
<td><p>A string that identifies the manufacturer of the SoC used on the device. Use this setting to include packages marked with the corresponding <strong>SVPackages</strong> element in the feature manifest file.</p></td>
</tr>
<tr class="even">
<td><p><strong>Product</strong></p></td>
<td><p>A string that specifies what OS variant to build. Specify the value <strong>Manufacturing OS</strong> to build an MMOS (Microsoft Manufacturing OS) image, which includes the minimal set of OS packages required by MMOS. To build a full OS image, omit this element.</p>
<p>For more information about building an MMOS image, see <a href="mmos-image-definition.md">MMOS image definition</a>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>FormatDPP</strong></p></td>
<td><p>A string that indicates whether to include an empty formatted device provisioning partition (DPP) in the image. Specify the value <strong>true</strong> to generate an image that includes an empty formatted DPP. Specify the value <strong>false</strong> or omit this element to prevent the DPP from being overwritten.</p></td>
</tr>
<tr class="even">
<td><p><strong>ExcludePrereleaseFeatures</strong></p></td>
<td><p>A string that indicates if features considered to be prerelease are excluded from the build. Specify the value <strong>true</strong> to generate an image that excludes the prerelease features, specify <strong>false</strong> to include them. Builds that are created with ExcludePrereleaseFeatures set to <strong>true</strong>, may be referred to as &quot;limited&quot; builds. If this entry is not included in the OEMInput file, the prerelease features will be included in the image.</p>
<p>When this option is set to <strong>true</strong> some replacement features may be present in the image. If there are no replacement features configured, then they will not be present in the build.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Features</strong></p></td>
<td><p>Contains one or more child elements that specify the names of optional features to reference when building the image. Each feature corresponds to one or more packages that will be included in the image. In order to use a feature, the feature must be defined in a feature manifest that is listed under the <strong>AdditionalFMs</strong> element. For more information about features and feature manifests, see <a href="building-a-phone-image-using-imggencmd.md">Building a phone image using ImgGen.cmd</a> and <a href="feature-manifest-file-contents.md">Feature manifest file contents</a>.</p>
<p>The <strong>Features</strong> element contains one or more of the following child elements:</p>
<ul>
<li><p><strong>Microsoft</strong> Contains one or more <strong>Feature</strong> elements that specify the names of optional Microsoft features to include in the image. For more info about Microsoft features, see <a href="optional-features-for-building-images.md">Optional features for building images</a>.</p></li>
<li><p><strong>OEM</strong> Contains one or more <strong>Feature</strong> elements that specify the names of optional OEM features to include in the image. For more information about adding OEM features, see <a href="feature-manifest-file-contents.md">Feature manifest file contents</a>.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p><strong>AdditionalFMs</strong></p></td>
<td><p>Contains one or more <strong>AdditionalFM</strong> elements. Each <strong>AdditionalFM</strong> element contains a string value that specifies the full path of a feature manifest file to reference when building the image.</p>
<p>Feature manifests define the set of packages that are automatically included in certain types of images, and they also define feature names that can be referenced under the <strong>Features</strong> element to include additional packages in the image. For more information about feature manifest files, see <a href="feature-manifest-file-contents.md">Feature manifest file contents</a>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>PackageFiles</strong></p></td>
<td><p>Contains a set of <strong>PackageFile</strong> elements that specify additional packages to include in the image.</p>
<div class="alert">
<strong>Important</strong>  
<p>The <strong>PackageFiles</strong> element can only be used in pre-retail images such as Test and Health images. It is only intended to be used in scenarios you need to quickly add an ad-hoc package to a pre-retail image. In retail images, all packages must be referenced using a feature that is listed under the <strong>Features</strong> element or listed in a feature manifest that is referenced under the <strong>AdditionalFMs</strong> element. For more information about features and feature manifests, see <a href="building-a-phone-image-using-imggencmd.md">Building a phone image using ImgGen.cmd</a> and <a href="feature-manifest-file-contents.md">Feature manifest file contents</a>.</p>
</div>
<div>
 
</div>
<p>Each <strong>PackageFile</strong> element contains a text value that specifies the path and name of a single package. If no additional packages are being added to the image, the <strong>PackageFiles</strong> element must be omitted from the file. The packages can be in any location on the development computer. An environment variable can be used in the path to each package in the <strong>PackageFile</strong> element.</p>
<p></p></td>
</tr>
</tbody>
</table>

 

## XML schema for the OEMInput file


The OEMInput file is validated against the following XML schema. You can use this schema to validate the OEMInput XML files that you create. To do this in Visual Studio, first save this in a file with an XSD extension. In Visual Studio select **XML** &gt; **Schemas** and select the file that you created. Any deviations in your XML from the schema will be highlighted. Hover over the highlighted items to see additional information.

``` syntax
<?xml version="1.0" encoding="utf-8"?>  
<xs:schema targetNamespace="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate" 
      elementFormDefault="qualified" 
      xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate" 
      xmlns:mstns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate" 
      xmlns:xs="http://www.w3.org/2001/XMLSchema">  
   <xs:element name="OEMInput">  
      <xs:complexType>  
         <xs:all>  
            <xs:element name="Product" type="xs:string" minOccurs="0" maxOccurs="1"/>  
            <xs:element name="Description" type="xs:string" minOccurs="0" maxOccurs="1" />  
            <xs:element name="SV" type="xs:string" minOccurs="0" maxOccurs="1"/>  
            <xs:element name="SOC" type="xs:string" minOccurs="1" maxOccurs="1"/>  
            <xs:element name="Device" type="xs:string" minOccurs="1" maxOccurs="1"/>  
  
            <xs:element name="ReleaseType" minOccurs="1" maxOccurs="1">  
               <xs:simpleType>  
                  <xs:restriction base="xs:string">  
                     <xs:enumeration value="Test"/>  
                     <xs:enumeration value="Production"/>  
                  </xs:restriction>  
               </xs:simpleType>  
            </xs:element>  
              
            <xs:element name="BuildType" minOccurs="1" maxOccurs="1">  
               <xs:simpleType>  
                  <xs:restriction base="xs:string">  
                     <xs:enumeration value="fre"/>  
                     <xs:enumeration value="chk"/>  
                     <xs:enumeration value="%BUILDTYPE%"/> 
                  </xs:restriction>  
               </xs:simpleType>  
            </xs:element>  
  
            <xs:element name="FormatDPP" minOccurs="0" maxOccurs="1">  
               <xs:simpleType>  
                  <xs:restriction base="xs:string">  
                     <xs:enumeration value="true"/>  
                     <xs:enumeration value="false"/>  
                  </xs:restriction>  
               </xs:simpleType>  
            </xs:element>  
  
            <xs:element name="ExcludePrereleaseFeatures" minOccurs="0" maxOccurs="1">  
               <xs:simpleType>  
                  <xs:restriction base="xs:string">  
                     <xs:enumeration value="true"/>  
                     <xs:enumeration value="false"/>  
                  </xs:restriction>  
               </xs:simpleType>  
            </xs:element>  
  
            <xs:element name="OEMDevicePlatform" type="xs:string" minOccurs="0" maxOccurs="1"/>  
              
            <xs:element name="SupportedLanguages" minOccurs="1" maxOccurs="1">  
               <xs:complexType>  
                  <xs:all>  
                     <xs:element name="UserInterface" minOccurs="1" maxOccurs="1">  
                        <xs:complexType>  
                        <xs:sequence>  
                           <xs:element name="Language" type="xs:string" 
                              minOccurs="1" maxOccurs="unbounded" />  
                        </xs:sequence>  
                     </xs:complexType>  
                     </xs:element>  
                     <xs:element name="Keyboard" minOccurs="0" maxOccurs="1">  
                        <xs:complexType>  
                           <xs:sequence>  
                              <xs:element name="Language" type="xs:string" 
                                 minOccurs="1" maxOccurs="unbounded"/>  
                           </xs:sequence>  
                        </xs:complexType>  
                     </xs:element>  
                     <xs:element name="Speech" minOccurs="0" maxOccurs="1">  
                        <xs:complexType>  
                           <xs:sequence>  
                              <xs:element name="Language" type="xs:string" 
                                 minOccurs="1" maxOccurs="unbounded"/>  
                           </xs:sequence>  
                        </xs:complexType>  
                     </xs:element>  
                  </xs:all>  
               </xs:complexType>  
            </xs:element>  

            <xs:element name="BootUILanguage" type="xs:string" minOccurs="1" maxOccurs="1"/>  
              
            <xs:element name="BootLocale" type="xs:string" minOccurs="1" maxOccurs="1"/>  
              
            <xs:element name="Resolutions" minOccurs="0" maxOccurs="1">  
               <xs:complexType>  
                  <xs:sequence>  
                     <xs:element name="Resolution" type="xs:string" minOccurs="1" 
                        maxOccurs="unbounded"/>  
                  </xs:sequence>  
               </xs:complexType>  
            </xs:element>  
  
            <xs:element name="Features" minOccurs="0" maxOccurs="1">  
               <xs:complexType>  
                  <xs:sequence>  
                     <xs:element name="Microsoft" minOccurs="0" maxOccurs="1">  
                        <xs:complexType>  
                           <xs:sequence>  
                              <xs:element name="Feature" type="xs:string" 
                                 minOccurs="1" maxOccurs="unbounded"/>  
                           </xs:sequence>  
                        </xs:complexType>  
                     </xs:element>  
                     <xs:element name="OEM" minOccurs="0" maxOccurs="1">  
                        <xs:complexType>  
                           <xs:sequence>  
                              <xs:element name="Feature" type="xs:string" 
                                 minOccurs="1" maxOccurs="unbounded"/>  
                           </xs:sequence>  
                        </xs:complexType>  
                     </xs:element>  
                  </xs:sequence>  
               </xs:complexType>  
            </xs:element>  
  
            <xs:element name="AdditionalFMs" minOccurs="0" maxOccurs="1">  
               <xs:complexType>  
                  <xs:sequence>  
                     <xs:element name="AdditionalFM" type="xs:string" 
                        minOccurs="1" maxOccurs="unbounded"/>  
                  </xs:sequence>  
               </xs:complexType>  
            </xs:element>  
            <!-This element is only for use with Windows 8 Phone device update images -->       
            <xs:element name="UserStoreMapData" minOccurs="0" maxOccurs="1">  
               <xs:complexType>  
                  <xs:attribute name="SourceDir" type="xs:string" />  
                  <xs:attribute name="UserStoreDir" type="xs:string" />  
               </xs:complexType>  
            </xs:element>  
  
            <xs:element name="PackageFiles" minOccurs="0" maxOccurs="1">  
               <xs:complexType>  
                  <xs:sequence>  
                     <xs:element name="PackageFile" type="xs:string" 
                        minOccurs="1" maxOccurs="unbounded"/>  
                  </xs:sequence>  
               </xs:complexType>  
            </xs:element>  
         </xs:all>  
      </xs:complexType>  
   </xs:element>  
</xs:schema>
```

## Related topics


[Building an image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20OEMInput%20file%20contents%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





