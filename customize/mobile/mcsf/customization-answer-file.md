---
title: Customization answer file
description: A customization answer file is an XML file that you write based on the MCSF schema.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5fefc2e1-918d-422b-a992-b4c0575efdcb
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customization answer file


A **customization answer file** is an XML file that you write based on the MCSF schema. OEMs can use the MCSF customization answer file to specify the settings and variants for a custom mobile OS image. The customization answer file allows for a broader integration across the OS by providing OEMs with a single place to define nearly all mobile OS settings.

When creating or working with customization answer files, keep the following design requirements and considerations in mind:

-   If you are using ImgGen.cmd to generate a mobile OS image, you can only specify one customization answer file. For more information, see [Building a mobile image using ImgGen.cmd](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd). However, you can import additional answer filesto form a single set of customizations and variants that can be applied to the OS image. For more information, see the [Importing other customization answer files] section in this topic.

-   Depending on what you want to do, you can use the customization answer file to create a package containing your customization(s) or use the answer file as one of the inputs to create an OS image.

    -   To use the customization answer file to generate a package without building an OS image, see [Generating customization packages without creating an image](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd).

    -   To build an image as an .ffu file using the customization answer file as one of the inputs, see [Using ImgGen.cmd to generate the image](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd.md#usingimggen).

-   The values used in the root customization answer file (or the one you specify as the input customization answer file during ImgGen.cmd or CustomizationGen.cmd in Step 6) is used to determine the package owner so it is important to provide values for the following attributes:

    -   **Name**

    -   **Description**

    -   **Owner**

    -   **OwnerType** (in the customization samples this is typically already set to 'OEM').

    -   Any files, assets, or other settings specific to the customization

-   Absolute or full paths to file sources, such as imports, assets and data files, are required. This means that whenever you specify the **Source** attribute value for a file **Import**, **Asset**, or **DataAsset**, the path must be absolute.

-   File source paths may contain **$(environment\_variables)**. Note that you can only use environment variables when referencing files. This will not work when configuring **Setting** values.

-   Using %this\_format% in customization answer files is not allowed and results in an error.

-   The source path for **Import** files may contain the macro, **$(CurrentFileDir)**.

-   **Import** source files can use environment variables in the file name. However, other source file names cannot use environment variables.

## <a href="" id="customizationanswerfilesamples"></a>Sample customization answer files


You can use as reference the sample OEM customization answer file located in the %WPDKCONTENTROOT%\\Samples\\Customization directory. This answer file shows several configured customizations and it imports two answer files that contain real connection settings data for AT&T and T-Mobile.

### Sample 1

The following sample customization answer file shows how to:

-   Specify other customization answer files to import from the root answer file.

-   Define **Targets** or conditions for when a variant can be applied.

-   Define **Static** settings and data, which are installed for all images, regardless of the variant.

-   Define settings for a **Variant**, which are applied if the associated target's conditions are met.

``` syntax
<?xml version="1.0" encoding="utf-8" ?>  
<!--  Copyright (c) Microsoft Corporation.  All rights reserved.  -->  

<ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                     Name="Sample Root Customization File"  
                     Description="Sample customization XML. This XML contains all the valid settings that should be correctly parsed and applied to image."  
                     Owner="ContosoOEM"  
                     OwnerType="OEM">  

 
 <!-- This root customization answer file imports two other customization answer files. -->
  <Imports>
    <Import Source="C:\Customization\AnswerFiles\SampleCustomizationImport1.xml" />
    <Import Source="C:\Customization\AnswerFiles\SampleCustomizationImport2.xml" />
  </Imports>

  <!-- Targets define the conditions for when a variant can be applied. One target ID must be
       referenced for each variant. -->

  <!-- These examples show the definition for three sample operators. -->
  <!-- In the example below, targets are set up for the variant to use in the root file. -->
  <Targets>  
   <Target Id="SIM_TinyMO">  
      <TargetState>  
        <Condition Name="MNC" Value="26" />  
        <Condition Name="MCC" Value="310" />  
      </TargetState>  
    </Target>  
    <Target Id="SIM_BigMO">  
      <TargetState>  
        <Condition Name="MNC" Value="15" />  
        <Condition Name="MCC" Value="310" />  
      </TargetState>  
    </Target>  
    <Target Id="Known_BigMO">  
      <TargetState>  
        <Condition Name="MNC" Value="55" />  
        <Condition Name="MCC" Value="310" />  
      </TargetState>  
    </Target>  
  </Targets>  
  

  <!-- These static settings and data will be installed for all images, regardless of the variant. -->
  <Static>
    <DataAssets Type="MapData">
      <DataAsset Source="C:\Customization\TestData\maps\OEMMap_USA.map" />
      <DataAsset Source="C:\Customization\TestData\maps\OEMMap_Canada.map" />
    </DataAssets>

    <Applications>
      <Application Source="C:\Customization\TestData\apps\OEMMOApp.xap"
                   License="C:\Customization\TestData\apps\OEMMOApp_License.xml"
                   ProvXML="C:\Customization\TestData\apps\MPAP_OEMMOApp_01.provxml" />
    </Applications>

    <Settings Path="TestSettingGroup">
      <Setting Name="Level1/MySetting" Value="Blue" />
      <Setting Name="MySettingAsset" Value="Alpha.jpg" />
      <Asset Name="Asset" Source="C:\Customization\MySettingAssets\Alpha.jpg" />
      <Asset Name="Asset" Source="C:\Customization\MySettingAssets\Beta.jpg" />
      <Asset Name="Asset" Source="C:\Customization\MySettingAssets\Delta.jpg" />
    </Settings>

    <Settings Path="TestSettingsGroup2">
      <Setting Name="OEMStaticSetting" Value="OEM Static Setting" />
    </Settings>
  </Static>


  <!-- These settings in the Variant groups will only be applied if the associated target's conditions are met. -->

  <!-- The settings shown here will only be applied for the Known Big MO Variant. -->
  <Variant Name="Known Big MO Variant">  
    <!-- Only one TargetRef can be used for each variant -->
    <TargetRefs>  
      <TargetRef Id="Known_BigMO" />  
    </TargetRefs>  

    <Settings Path="EventSounds">  
      <Asset Name="Ringtones" Source="C:\Resources\Ringtones\KnownBigMO.wma" TargetFileName="BigMO.wma" DisplayName="BigSound" Type="MobileOperator" />
      <Setting Name="DefaultRingtone" Value="BigMO.wma" />  
    </Settings>  

    <Settings Path="LockScreen">  
      <Asset Name="Wallpapers" Source="C:\Resources\Wallpapers\KnownBigMO.jpg" TargetFileName="BigMO.jpg" DisplayName="BigMO" Type="MobileOperator" />
      <Setting Name="DefaultWallpaper" Value="BigMO.jpg" />  
    </Settings>  
  </Variant>  

  <!-- The settings shown here will only be applied for the Tiny MO Variant. -->
  <Variant Name="Tiny MO Variant">  
    <TargetRefs>  
      <TargetRef Id="SIM_TinyMO" />  
    </TargetRefs>  

    <Settings Path="TestSettingsGroup1">  
      <Setting Name="Setting1" Value="Tiny MO Setting 1" />
      <Setting Name="Setting3" Value="Tiny MO Setting 3" />
    </Settings>  

    <Settings Path="EventSounds">  
      <Asset Name="Ringtones" Source="C:\Resources\Ringtones\TinyMO.wma" TargetFileName="TinyMO.wma" DisplayName="TinySound" Type="MobileOperator" />
      <Setting Name="DefaultRingtone" Value="TinyMO.wma" />  
    </Settings>  
  </Variant>  

  <!-- The settings shown here will only be applied for the Big MO Variant. -->
  <Variant Name="Big MO Variant">  
    <TargetRefs>  
      <TargetRef Id="SIM_BigMO" />  
    </TargetRefs>  

    <Settings Path="TestSettingsGroup1">  
      <Setting Name="Setting1" Value="Big MO Setting 1" />
    </Settings>  
  </Variant>  

</ImageCustomizations>
```

### Sample 2

The following sample customization answer file snippet shows how to:

-   Define a **Static** variant

-   Specify the customizations for a specific mobile operator in a **Variant** section.

``` syntax
<!-- Variant Section -->

  <!-- Example of a static variant. There are no TargetRefs. -->

  <Static>
    <!-- Asset data to be copied to the device. A small set of approved destinations are allowed.
         Only allowed in the static settings -->
    <DataAssets>
      <DataAsset Source="C:\Customization\Assets\OEMMap_USA.map" Type="MapData" />
    </DataAssets>
  </Static>

  <!-- Simple example of some things to do on a hypothetical TinyMO. Setting the Boot Screen 
       on FirstSIM, and the MMS Gateway whenever the SIM is detected as "Newly Inserted". Ringtones and
       wallpapers are also added. -->

  <Variant Name="TinyMO Settings">
    <TargetRefs>
      <TargetRef Id="SIM_TinyMO" />
    </TargetRefs>

    <Settings Path="Connectivity">
      <Setting Name="MMSGateway" Value="123.tinymo.com" />
    </Settings>

    <Settings Path="EventSounds">
      <Asset Name="Ringtones" Source="C:\Assets\Ringtones\Ringtone1.wma" />
      <Asset Name="Ringtones" Source="C:\Assets\Ringtones\Ringtone2.wma" />
      <Asset Name="Ringtones" Source="C:\Assets\Ringtones\Ringtone3.wma" />
      <Setting Name="DefaultRingtone" Value="Ringtone1.wma" />
    </Settings>

    <Settings Path="LockScreen">
      <Asset Name="Wallpapers" Source="C:\Assets\Wallpapers\Lockscreen1.jpg" />
      <Asset Name="Wallpapers" Source="C:\Assets\Wallpapers\Lockscreen2.png" />
      <Asset Name="Wallpapers" Source="C:\Assets\Wallpapers\Lockscreen3.jpeg" />
      <Setting Name="DefaultWallpaper" Value="Lockscreen2.png" />
    </Settings>

  </Variant>
```

## Customization XML elements


The following table defines all the elements in a customization answer file.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Parent</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Imports</strong></p></td>
<td><p>-</p></td>
<td><p>Contains the description for other customization answer files to import.</p></td>
</tr>
<tr class="even">
<td><p><strong>Import</strong></p></td>
<td><p><strong>Imports</strong></p></td>
<td><p>Specifies the file to import and merge with the customizations in the root file.</p>
<p>If the same setting is set in the imported file, that setting will be overridden by the value specified by the same in the root file.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Targets</strong></p></td>
<td><p>-</p></td>
<td><p>Defines the conditions for when a variant can be applied.</p></td>
</tr>
<tr class="even">
<td><p><strong>Target</strong></p></td>
<td><p><strong>Targets</strong></p></td>
<td><p>One <strong>Target Id</strong> must be specified for each variant. This can contain multiple sets of <strong>TargetState</strong> that can cause the target to fire.</p>
<p>A single <strong>Condition</strong> is defined by a single name/value pair. The name is a runtime configuration condition name such as MNC or an OEM condition that can be defined in <strong>CustomTargetState</strong>. Multiple <strong>Condition</strong> can be contained within the <strong>TargetState</strong>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Static</strong></p></td>
<td><p>-</p></td>
<td><p>Contains the description for the static variation.</p>
<p>The settings that are registry based will override values that are set in packages.</p></td>
</tr>
<tr class="even">
<td><p><strong>DataAssets</strong></p></td>
<td><p><strong>Static</strong></p></td>
<td><p>Enables the ability to put data files directly onto the data partition without a package. OEMs specify the type of data from an approved list and the image customization process determines the destination for the data based on the type.</p>
<p>In Windows Phone 8.1, the following types of data are supported:</p>
<ul>
<li><p><strong>MapData</strong> – Use to specify map data</p></li>
<li><p><strong>RetailDemo_Microsoft</strong> – Use to add custom demo content to the Microsoft retail mode provisioning app. This data asset is reserved for Microsoft use and the data assets are provided by Microsoft Marketing. Partners should contact Microsoft to reach your Microsoft marketing contact.</p></li>
<li><p><strong>RetailDemo_OEM</strong> – Use to add custom demo content to the OEM retail mode provisioning app.</p></li>
<li><p><strong>RetailDemo_MO</strong> – Use to add custom demo content to the mobile operator retail mode provisioning app.</p></li>
<li><p><strong>RetailDemo_Apps</strong> – Use to add free or trial apps and games to be included in demo phones.</p></li>
</ul>
<p>Note that when specifying any retail demo data asset in the customization answer file, the retail mode data asset must point to a directory structure where nested files are placed in a very particular format. For more information, see the Retail Demo Mode Programmers Guide, which will be available in a future documentation release.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Variant</strong></p></td>
<td><p>-</p></td>
<td><p>These settings in the Variant groups will only be applied if the associated target's conditions are met.</p></td>
</tr>
<tr class="even">
<td><p><strong>TargetRefs</strong></p></td>
<td><p><strong>Variant</strong></p></td>
<td><p>A collection of targets that causes the variant to be provisioned.</p>
<p>Currently, only one <strong>TargetRef</strong> is supported.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Applications</strong></p></td>
<td><p><strong>Static</strong>, <strong>Variant</strong></p></td>
<td><p>A collection of applications to be applied statically to the phone, or when a variant is provisioned.</p>
<p>For a static variant, the app is installed into the system partition. For non-static variants, the .xap file of the app is always included in the data partition.</p>
<p>For more information, see [Apps: Preloading and storage location](#appspreloadingstoragelocation).</p></td>
</tr>
<tr class="even">
<td><p><strong>Settings</strong></p></td>
<td><p><strong>Static</strong>, <strong>Variant</strong></p></td>
<td><p>A settings group that is determined by a provided path.</p>
<p>For more information about the settings group, setting elements, and associated attributes, see [Managed Centralized Settings Framework (MCSF)](managed-centralized-settings-framework-mcsf.md).</p></td>
</tr>
<tr class="odd">
<td><p><strong>Setting</strong></p></td>
<td><p><strong>Settings</strong></p></td>
<td><p>A single setting and value that is determined by a name. A <strong>Setting</strong> can contain assets or data files associated with the setting.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the policy for a specified setting is not included in a package in the image, the setting will not be included in the image and a warning will be displayed.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p><strong>Asset</strong></p></td>
<td><p><strong>Settings</strong></p></td>
<td><p>Indicates a file that needs to be included in the phone image and associated with the <strong>Settings</strong> to which it belongs.</p>
<p>When specifying an asset, OEMs must provide the <strong>Name</strong> and <strong>Source</strong> attributes. The <strong>Name</strong> determines where the asset is stored on the phones. OEMs can specify multiple files using the same asset name, such as for multiple lock screen backgrounds, ringtones, and so on. The <strong>Source</strong> must be set to the location of the asset on your machine.</p>
<p>OEMs can use the following optional attributes:</p>
<p><strong>TargetFileName</strong> can be used to set the name of the file on the device. If there is no <strong>TargetFileName</strong> specified, the source name is used.</p>
<p><strong>DisplayName</strong> can be used by some settings to display a name such as the ringtone’s display name. The setting determines exactly how this property is used and is a passthrough to a registry value.</p>
<p><strong>Type</strong> is a flag that indicates the type of asset, as required by some settings. In Windows Phone 8.1, <strong>MO</strong> and <strong>OEM</strong> are supported. If no value is specified, the default value is OEM.</p></td>
</tr>
</tbody>
</table>

 

## Specifying data values in customization answer files


When creating your customization answer file, certain values must be specified in a specific format. These are as follows:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Type value</th>
<th>Value attribute</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>REG_DWORD</p></td>
<td><p>Decimal: 1</p>
<p>- or -</p>
<p>Hexadecimal: 0x1</p></td>
<td><p>32-bit number presented in either decimal or hexadecimal format.</p>
<p>All hexadecimal values in the customization answer file must be prefixed with <strong>0x</strong>. For example, if the hexadecimal value that you need to specify is 1, you must set the <strong>Value</strong> in the customization answer file to <strong>0x1</strong>. These values are in little-endian format where the multibyte value is stored in memory from lowest byte (the &quot;little end&quot;) to the highest byte. For example, 0x12345678 is stored as (0x78 0x56 0x34 0x12) in little-endian format.</p></td>
</tr>
<tr class="even">
<td><p>Options defined in the policy settings files. For example:</p>
<p>&lt;Validate&gt;</p>
<p>   &lt;Option Value=&quot;0&quot; FriendlyName=&quot;Red&quot; /&gt;</p>
<p>   &lt;Option Value=&quot;1&quot; FriendlyName=&quot;Green&quot; /&gt;</p>
<p>   &lt;Option Value=&quot;2&quot; FriendlyName=&quot;Blue&quot; /&gt;</p>
<p>&lt;/Validate&gt;</p></td>
<td><p>0 or Red</p>
<p>1 or Green</p>
<p>2 or Blue</p></td>
<td><p>Use the enumerated value. For example, either the enumerated value 0 or its equivalent friendly name &quot;Red&quot; can be specified.</p></td>
</tr>
<tr class="odd">
<td><p>REG_MULTI_SZ</p></td>
<td><p>Red.png;Green.png;Blue.png</p></td>
<td><p>Multiple text strings separated by a semicolon '<strong>;</strong>'.</p>
<p>A '<strong>;</strong>' is used as the delimeter for REG_MULTI_SZ so this character cannot be used inside the string because it will be parsed as the separator of two strings.</p></td>
</tr>
<tr class="even">
<td><p>REG_BINARY</p></td>
<td><p>E8,03</p>
<p>(which corresponds to 0x03E8 hexadecimal)</p></td>
<td><p>Byte array in hexadecimal format, separated by a comma '<strong>,</strong>'.</p>
<p>Do not add the 0x prefix when specifying this type of registry value in the customization answer file.</p></td>
</tr>
</tbody>
</table>

 

## Targets


When creating a customization answer file, OEMs can define **Targets** to describe keying for a variant. Targets for variants must be described or pre-declared before being referenced by the variant. OEMs can use the same target in multiple variants to enable reuse. Within a target, if the device meets any of the target states, the settings will be applied (the states are **OR**'ed together). The conditions within the states are **AND**'ed together and all of the conditions must be met in order for a state to be true.

In the previous XML sample, a SIM target is defined through MNC/MCC pairs. The following example shows how the SIM targets may be defined:

``` syntax
<Targets>
    <Target Id="SIM_TinyMO">
        <TargetState>
            <Condition Name="MNC" Value="123" />
            <Condition Name="MCC" Value="456" />
        </TargetState>
        <TargetState>
            <Condition Name="MNC" Value="456" />
            <Condition Name="MCC" Value="123" />
        </TargetState>
    </Target>
</Targets>
```

### <a href="" id="extensionprovisioningkeys"></a>Extension provisioning keys

OEMs can use custom CSPs as conditions by listing the name/path in the **Name** attribute and the desired value to pass to the CSP to check against. 

## <a href="" id="importingothercustomizationanswerfiles"></a>Importing other customization answer files


A customization answer file can be used to import other customization answer files that, when merged, form a single set of customizations and variants to be applied to the OS image.

### Priority order for imported customization answer files

When importing customization answer files, if there are any settings that are defined twice, the custom image will not build unless a priority within the imported answer files are specified to determine the overwrite order. To specify the overwrite order, the header for customization answer files contain an optional **Priority** attribute, which determines the order that settings will be overwritten if imported files contain a setting defined more than once. Generally, the highest priority will have its value used for customization package creation. If files have the same priority and define the same setting, the image fails to build.

To add the priority order for the imported answer file, set the **Priority** attribute within the **ImageCustomizations** block of the customization answer file to be imported. The following example shows how to do this:

``` syntax
<ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"
                  Name="Settings Input"
                  Description="Settings for image build"
                  Owner="Contoso"
                  OwnerType="OEM"
                  Priority="2">
```

**Note**  
When setting **Priority**, 1 is the highest, and zero (0) and negative numbers are not allowed.

 

### Specifying files to be imported

The following code example shows how you can specify other customization answer files to be imported. The **Imports** element must be specified in the root customization answer file.

``` syntax
  <Imports>
    <Import Source="C:\Customization\SampleOperators.xml" />
    <Import Source="C:\Customization\SampleBrandCommon.xml" />
  </Imports>
```

## <a href="" id="appspreloadingstoragelocation"></a>Apps: Preloading and storage location


OEMs can preload apps using the following customization answer file code snippet:

``` syntax
    <Applications>
      <Application Source="C:\Customization\TestData\apps\OEMMOApp.xap"
                   License="C:\Customization\TestData\apps\OEMMOApp_License.xml"
                   ProvXML="C:\Customization\TestData\apps\MPAP_OEMMOApp_01.provxml" />
    </Applications>
```

**Note**  
The AppPreInstaller is specifically looking for provXML files with the filename pattern **MPAP\_\*\_\*.provxml** so make sure your file names are correctly formatted.

 

The following table describes where preloaded apps are stored on the device:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>First option</th>
<th>Alternative option</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Default</p></td>
<td><p>Main OS</p></td>
<td><p>Data</p></td>
</tr>
<tr class="even">
<td><p>Variant</p></td>
<td><p>Data</p></td>
<td><p>Main OS</p></td>
</tr>
</tbody>
</table>

 

All applications can be uninstalled by the user. When applications are uninstalled, the application files remain on the device, but these are not shown in the application list. During a cold boot, or when the user selects **Reset my phone**, apps in the Data partition will be removed while apps in the MainOS partition will be reinstalled. Users can also install apps to the SD card. When the phone boots with an SD card, the user is given an option to select the install location.

## <a href="" id="collisionsoverrides"></a>Collisions and overrides


If there are collisions or overrides, **Settings** groups are treated as a Condition-Setting Path pair. This means that two settings using the same path but different conditions are considered unique, as are two settings with the same condition but different paths.

When two different files set the same unique **Settings** group, the following rules are used by the image customization process to resolve collisions or overrides:

-   A file may overwrite a unique item that is defined by any file it imports. For example, the imports sample in the previous section, SampleDevice.customizations.xml, can be used to override the theme color set in SampleBrandCommon.xml.

-   Two files imported by the same file cannot set the same unique item. For example, if SampleOperators.xml and SampleBrandCommon.xml both set the same theme color using the same condition, an error will occur and a message will be displayed to indicate that the value cannot be imported because both files define the same value.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customization%20answer%20file%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




