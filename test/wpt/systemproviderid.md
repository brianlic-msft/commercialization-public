---
title: SystemProviderId
description: SystemProviderId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f5ac9900-e43b-480b-9be7-5f5f726b1635
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SystemProviderId


Uniquely identifies the system provider.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;**SystemProviderId**&gt;

## Syntax


``` syntax
<SystemProviderId Value = IdType>

  <!-- Child elements -->
  Keywords,
  Stacks,
  PoolTags

</SystemProviderId>
```

## Attributes and Elements


### Attributes

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
<th>Attribute</th>
<th>Description</th>
<th>Data type</th>
<th>Required</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p>Uniquely identifies the system provider.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

### Child Elements

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
<th>Requirement</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)</p></td>
<td><p>Represents a collection of system provider keywords.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="even">
<td><p>[Stacks](stacks.md)</p></td>
<td><p>Represents a collection of stacks.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="odd">
<td><p>[PoolTags](pooltags.md)</p></td>
<td><p>Represents a collection of pool tags.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
</tbody>
</table>

 

### Parent Elements

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
<td><p>[Collectors](collectors.md)</p></td>
<td><p>Represents a collection of system collector identifiers, event collector identifiers, and optionally heap event collector identifiers.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


For more information about authoring system provider definitions, see [2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md) and [3. Profile Definitions](3-profile-definitions.md).

## Example


The following code example shows the section of a profile definition that contains this element.

``` syntax
<Profile
  Id="Example.Light.File"
  Name="Example"
  DetailLevel="Light"
  LoggingMode="File"
  Description="Example profile">
  <ProblemCategories> 
    <ProblemCategory
      Value="First Level Triage"/>
  </ProblemCategories> 
  <Collectors>
    <SystemCollectorId
      Value="WPRSystemCollector">
      <SystemProviderId
        Value="system-provider"/>
    </SystemCollectorId>
…
  </Collectors>
</Profile>
```

## Related topics


[Elements](elements.md)

 

 







