---
title: Feature manifest file contents
description: Feature manifest (FM) files are used to define specific types of image builds that contain different sets of optional packages. This topic describes the required and optional elements in a FM file.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ffed39b7-4dd0-48f6-b284-ddaf897beade
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Feature manifest file contents


*Feature manifest (FM) files* are used to define specific types of image builds that contain different sets of optional packages. This topic describes the required and optional elements in a FM file. For more information about how FM files are used while generating images, see [Building a phone image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).

**Note**  
Most of the elements in a FM file include a path to a package. If the package is under the root directory for Microsoft packages (%WPDKCONTENTROOT%\\MSPackages), this path can use the $(mspackageroot) macro in the path name. If the package is in some other location, you can use an environment variable, such as %oempackageroot%, and set this environment variable in the command-line window.

 

## Example FM file


The following example shows a sample OEM FM file.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<FeatureManifest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
  xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">
  <BasePackages>
    <PackageFile Path="%oempackageroot%\common\" 
      Name="Contoso.Phone.Test.BaseOs.EnvPath.spkg" />
  </BasePackages>
  <Features>
    <OEM>
     <PackageFile Path="%oempackageroot%\test\" 
      Name="Contoso.Test.MinTE.spkg">
        <FeatureIDs>
          <FeatureID>TEST_FEATURE1</FeatureID>
        </FeatureIDs>
      </PackageFile>
   </OEM>
</Features>
  <ReleasePackages> 
    <PackageFile FeatureIdentifierPackage="true" Name="Contoso.BaseOS.BootApplications_Test.spkg" 
Path="%oempackageroot%\test" ReleaseType="Test"/> 
  </ReleasePackages> 
  <PrereleasePackages>
    <PackageFile ID="Contoso.MainOS.Protected_Replacement_Production" FeatureIdentifierPackage="true" 
Name="Contoso.MainOS.Protected_Replacement_Production.spkg" Path="%oempackageroot%\Merged\" Resolution="*" Type="replacement" Language="*"/>
  </PrereleasePackages>
<OEMDevicePlatformPackages>
    <PackageFile Name="SoCVendor.DCD6000.OEMDevicePlatform.spkg" Path="%oempackageroot%\DCD6000\" Device="DCD6000"/>  
</OEMDevicePlatformPackages>
</FeatureManifest>
```

You may wish to examine MSOptionalFeaturesFM.xml that is included with the mobileOS packagesunder %WPDKCONTENTROOT%\\FMFiles to see additional FM XML files.

## Elements in a FM file


The following sections describe the supported elements in a FM file.

### FeatureManifest

The **FeatureManifest** element is the root XML element in the FM file. This element is the base container element for all other elements in the file. It must occur only once.

### BasePackages

The **BasePackages** element specifies packages that are always included in the image if the FM file is referenced in the **AdditionalFMs** element of the OEMInput XML file. The **BasePackages** element has no supported attributes.

The following table describes the child elements of the **BasePackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package that will be included in the image. This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except or those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### Features

There are both **Microsoft** and **OEM** elements, each of which can contain **Features**. The OEM should only add their features to the **&lt;OEM&gt;** element. This provides multiple benefits, including the easier integration of newer versions of the OEMInput.xml files into the OEM’s build system.

The **Features** element defines one or more optional features that can be referenced in the **Features** element in the OEMInput file to include optional packages in the image. The **Features** element has no supported attributes.

The following table describes the child elements of the **Features** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package that will be included in the image if the OEMInput file references this feature.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that that package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that that package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>This element supports the following child elements:</p>
<ul>
<li><p><strong>FeatureIDs</strong> – Required. Contains one or more <strong>FeatureID</strong> elements. Each <strong>FeatureID</strong> element contains a string value that specifies the name of a feature that will be associated with the package specified by the parent <strong>PackageFile</strong> element.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>CPUType</strong> – Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### Feature groupings and constraints

Feature groupings and constraints can be used to manage features. For more information, see [Feature groupings and constraints](feature-groupings-and-constraints.md) .

### ReleasePackages

The **ReleasePackages** element specifies packages that are included in images of a specific release type, as specified by the **ReleaseType** element in the OEMInput file. The **ReleasePackages** element have no supported attributes.

The following table describes the child elements of the **ReleasePackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>ReleaseType</strong> – Required. The type of release supported by the package, either <strong>Production</strong> or <strong>Test</strong>. The package will only be included in images of the specified release type.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### PrereleasePackages

Describes packages that can be excluded using the **ExcludePrereleaseFeatures** element in the OEMInput file. For more information, see [OEMInput file contents](oeminput-file-contents.md).

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a prelease package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Type</strong> – Required. Can be either <strong>protected</strong> or <strong>replacement</strong>.</p>
<p>The <strong>protected</strong> packages are excluded when <code>ExcludePrereleaseFeatures</code> is set to <strong>Yes</strong> and the replacement packages will instead be included. For example a replacement feature can be created by the OEM to enable scenarios such as mobile operator testing, while not distributing builds with sensitive functionality. This approach is one of many, and is not required, but is one option to consider, to help manage feature disclosure. For more information see <a href="oeminput-file-contents.md">OEMInput file contents</a>.</p>
<div class="alert">
<strong>Important</strong>  
<p>No replacement packages should be included in a retail image.</p>
</div>
<div>
 
</div></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### SOCPackages

The **SOCPackages** element specifies packages that are included in images that are generated for a specific SoC, as specified by the **SOC** element in the OEMInput file. The **SOCPackages** element has no supported attributes.

The following table describes the child elements of the **SOCPackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>SOC</strong> – Required. The type of SoC supported by the package. For a list of the supported values, see the description of the <strong>SOC</strong> element in [OEMInput file contents](oeminput-file-contents.md). The package will only be included in images generated for the specified SoC.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>CPUType</strong>– Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs. This attribute should not be used by OEMs.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### SVPackages

The **SVPackages** element specifies packages that are included in images that are generated for a specific SoC manufacturer, as specified by the **SV** element in the OEMInput file. The **SVPackages** element has no supported attributes.

The following table describes the child elements of the **SVPackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>SV</strong> – Required. The vendor for the SoC that is supported by the package. The package will only be included in images generated for the specified SoC vendor.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Optional.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>CPUType</strong>– Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs. This attribute should not be used by OEMs.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### OEMDevicePlatformPackages

The **OEMDevicePlatformPackages** element specifies the device platform package to include in an image for a specific device type. OEMs must specify the device platform package by using this element in a FM file. For more information about device platform packages, see [Set device platform information](set-device-platform-information.md). The **OEMDevicePlatformPackages** element has no supported attributes.

The following table describes the child elements of the **OEMDevicePlatformPackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a device platform package to include in the image for a specific device type.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Device</strong> – Required. The device type that is supported by the device platform package. The package will only be included in images generated for the specified device type.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>CPUType</strong>– Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### DeviceSpecificPackages

The **DeviceSpecificPackages** element specifies packages to include in images that are generated for a specific device type, as specified by the **Device** element in the OEMInput file. The **DeviceSpecificPackages** element has no supported attributes.

The following table describes the child elements of the **DeviceSpecificPackages** element.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package to include in the image for a specific device type.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Device</strong> – Required. The device type that is supported by the device platform package. The package will only be included in images generated for the specified device type.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul>
<p>These elements are for Microsoft internal use only.</p>
<ul>
<li><p><strong>CPUType</strong>– Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

## Microsoft internal use only


The following components are reserved for Microsoft internal use only, but are documented here for completeness.

### CPUPackages

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>CPUType</strong> – Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>ID</strong>– Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Resolution</strong> – Optional. A string that contains the display resolutions supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every resolution.</p></li>
<li><p>&quot;(720x1280;768x1280)&quot;: This syntax indicates the set of resolutions that the package supports. The package is included only in images that are built for one of the resolutions in this list.</p></li>
<li><p>&quot;!(720x1280;768x1280)&quot;: A '!' in front of the resolution list specifies that the package supports all resolutions except for those in the list. The package is included only in images that are not built for one of the resolutions in this list.</p></li>
</ul></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that that package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### BootUILanguagePackageFile

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>BootUILanguagePackageFile</strong></p></td>
<td><p>Optional. This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### BootLocalePackageFile

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>BootLocalePackageFile</strong></p></td>
<td><p>Optional. This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>ID</strong> – Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### DeviceLayoutPackages

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>SOC</strong> – Required.</p></li>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
<li><p><strong>ID</strong>– Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>CPUType</strong>– Required. String value. Sets the CPU type. Can be set to either <em>x86</em> or <em>arm</em>. This attribute should not be used by OEMs. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### KeyboardPackages

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>ID</strong>– Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

### SpeechPackages

Reserved for internal Microsoft use. This element should not be used by OEMs.

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
<td><p><strong>PackageFile</strong></p></td>
<td><p>Optional. This element describes a package.</p>
<p>This element supports the following attributes:</p>
<ul>
<li><p><strong>Path</strong> – Required. The path to the package.</p></li>
<li><p><strong>Name</strong> – Required. The file name of the package.</p></li>
<li><p><strong>ID</strong>– Optional. String value. The ID is the package name. This attribute should not be used by OEMs.</p></li>
<li><p><strong>NoBasePackage</strong> – Optional. Boolean value. Set to true for Language and\or Resolution packages that do not contain base packages. This attribute should not be used by OEMs.</p></li>
<li><p><strong>FeatureIdentifierPackage</strong> – Optional. Boolean value. This attribute should not be used by OEMs.</p></li>
<li><p><strong>Language</strong> – Optional. A string that contains the display language codes supported by the package. This attribute can be specified with the following values:</p>
<ul>
<li><p>&quot;*&quot;: The &quot;*&quot; character means that the package supports every language.</p></li>
<li><p>&quot;(en-US;zh-CN)&quot;: This syntax indicates the set of languages that the package supports. The package is included only in images that contain one of the display languages in this list.</p></li>
<li><p>&quot;!(en-US;zh-CN)&quot;: A '!' in front of the language list specifies that the package supports all languages except for those in the list. The package is included only in images that do not contain one of the display languages in this list.</p></li>
</ul></li>
<li><p><strong>Partition</strong> – Optional. A string that specifies the target partition for the package. By default, packages are installed to the MainOS partition unless another is explicitly specified.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

## Related topics


[Building a phone image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Feature%20manifest%20file%20contents%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





