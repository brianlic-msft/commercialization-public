---
title: Feature groupings and constraints
description: Feature groups and feature constraints allow additional logic to be added to the build system to support intelligent processing of the OEMInput XML.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b2079741-e3a8-44ab-b76f-75b287d0cd66
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Feature groupings and constraints


Feature groups and feature constraints allow additional logic to be added to the build system to support intelligent processing of the OEMInput XML.

## Feature groupings


Feature groupings allow for better management of optional features and allow the organization of packages for easier management. Feature grouping is used to implement feature constraints by Microsoft and optionally, by the OEM.

## Feature constraints


Feature constraints can be specified to avoid illogical or inappropriate build configurations.

Some settings are mutually exclusive and only one setting should be specified at a time. For example, consider the features, RELEASE\_PRODUCTION and RELEASE\_TEST. These features are mutually exclusive. This means that if RELEASE\_TEST is set, RELEASE\_PRODUCTION must not be set.

Constraints are grouped at the Microsoft and OEM level of features. OEMs cannot override Microsoft constraints. The following constraints are supported:

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
<th>At least one feature is required</th>
<th>Features are mutually exclusive</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>OneOrMore</p></td>
<td><p>One or more features must be specified.</p></td>
<td><p>true</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p>ZeroOrOne</p></td>
<td><p>Either one feature or no features can be specified.</p></td>
<td><p>false</p></td>
<td><p>true</p></td>
</tr>
<tr class="odd">
<td><p>OneAndOnlyOne</p></td>
<td><p>One feature is required and only one feature can be specified.</p></td>
<td><p>true</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>ZeroOrMore</p></td>
<td><p>This is the default and indicates that there are no constraints. This option is only used to group features for publishing purposes and will be ignored during imaging.</p></td>
<td><p>false</p></td>
<td><p>false</p></td>
</tr>
</tbody>
</table>

 

The following XML sample illustrates the use of constraints to appropriately restrain the fake modem feature.

``` syntax
<Features>
  <Microsoft>
    <FeatureGroup Constraint="OneAndOnlyOne">
           <FeatureIDs>
           <FeatureID>MS_IMGFAKEMODEM</FeatureID>
           <FeatureID>MS_IMGNOFAKEMODEM</FeatureID> 
          </FeatureIDs>
    </FeatureGroups >
  </Microsoft>
</Features>
```

The constraints in the sample specify that either IMGFAKEMODEM or IMGNOFAKEMODEM must be selected. Both values cannot be set at the same time. One and only one value must be set at a time. This constraint is required because the fake modem test feature must either be enabled or disabled.

The following XML sample illustrates the use of constraints to appropriately restrain the production build settings. This sample shows how multiple constraints can be associated with a single feature.

``` syntax
<Features>
  <Microsoft>
    <FeatureGroups>
        <FeatureGroup Constraint="ZeroOrOne">
         <FeatureIDs>
          <FeatureID>RELEASE_PRODUCTION</FeatureID> 
          <FeatureID>MS_CODEINTEGRITY_PROD</FeatureID> 
        </FeatureIDs>
    </FeatureGroup>
         <FeatureGroup Constraint="ZeroOrOne">
           <FeatureIDs>
            <FeatureID>RELEASE_PRODUCTION</FeatureID>
            <FeatureID>MS_DISABLETESTSIGNING</FeatureID> 
         </FeatureIDs>
    </FeatureGroup>
  </Microsoft>
</Features>
```

When &lt;ReleaseType&gt;Production&lt;/ReleaseType&gt; is set in the OEMInput file, this maps to RELEASE\_PRODUCTION. For more information about release type, see [OEMInput file contents](oeminput-file-contents.md).

The constraints in the sample specify that:

-   Either RELEASE\_PRODUCTION or MS\_CODEINTEGRITY\_PROD can be selected, but they both may not be selected at the same time. This is because production code integrity is automatically enabled when RELEASE\_PRODUCTION is selected and therefore can’t be manually enabled.

-   Either RELEASE\_PRODUCTION or MS\_DISABLETESTSIGNING can be selected, but they both may not be selected at the same time. This is because test signing is automatically disabled when RELEASE\_PRODUCTION is selected and therefore can’t be manually disabled.

The build options are more complex and are expressed in the following XML.

``` syntax
FeatureGroup Constraint="OneAndOnlyOne">
  <FeatureIDs>
    <FeatureID>RELEASE_PRODUCTION</FeatureID> 
      <FeatureID>MS_TEST</FeatureID> 
      <FeatureID>MS_HEALTH</FeatureID> 
      <FeatureID>MS_PRODUCTION</FeatureID> 
      <FeatureID>MS_SELFHOST</FeatureID> 
    </FeatureIDs>
  </FeatureGroup>
<FeatureGroup Constraint="OneAndOnlyOne">
  <FeatureIDs>
    <FeatureID>RELEASE_PRODUCTION</FeatureID> 
    <FeatureID>MS_PRODUCTION_CORE</FeatureID> 
    <FeatureID>MS_TEST</FeatureID> 
  </FeatureIDs>
</FeatureGroup>
```

These settings in the sample specify that PRODUCTION\_CORE is mutually exclusive with RELEASE\_PRODUCTION and TEST, but is not mutually exclusive with HEALTH, PRODUCTION, or SELFHOST.

For additional information about the build features, see [Optional features for building images](optional-features-for-building-images.md).

## Implicit feature IDs


Implicit feature IDs are generated based on the XML input that is used to define features in feature manifest files. Feature constraints must use the implicit feature IDs. This section provides the mapping between the XML input values and the generated implicit feature IDs.

**Pre-defined release type implicit feature IDs**

There are two pre-defined implicit feature IDs that can be used for feature constraints.

-   RELEASE\_TEST

-   RELEASE\_PRODUCTION

For more information on release types, see [Optional features for building images](optional-features-for-building-images.md).

**OEM and Microsoft implicit feature IDs**

For each OEM and Microsoft feature, implicit feature IDs are automatically created. This is done my pre-appending either *MS\_* for Microsoft or *OEM\_* for OEM defined features.

For example if an OEM creates a feature called TEST\_FEATURE1 using the XML shown below, the implicit Feature ID will be *OEM\_TEST\_FEATURE1*.

``` syntax
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
```

To create a feature constraint to make sure this test feature is only shipped with test release types, use the following XML.

``` syntax
<FeatureGroup Constraint="ZeroOrOne">
   <FeatureIDs>
      <FeatureID>RELEASE_PRODUCTION</FeatureID>
      <FeatureID>OEM_TEST_FEATURE1</FeatureID> 
   </FeatureIDs>
</FeatureGroup>
```

**SOC implicit feature IDs**

SOC features are pre-appended with SOC\_. For example if *DCD6000* is specified in the feature manifest XML, the implicit feature ID would be *SOC\_DCD6000*.

**SV implicit feature IDs**

SV features are pre-appended with SV\_. For example if *CONTOSO* is specified in the feature manifest XML, the implicit feature ID would be *SV\_CONTOSO*.

**DEVICE implicit feature IDs**

Device features are pre-appended with Device\_. For example if *BETA* is specified in the feature manifest XML, the implicit feature ID would be *DEVICE\_BETA*.

For more information about working with the SOC, SV and DEVICE attributes, see [Feature manifest file contents](feature-manifest-file-contents.md).

## Related topics


[Optional features for building images](optional-features-for-building-images.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Feature%20groupings%20and%20constraints%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





