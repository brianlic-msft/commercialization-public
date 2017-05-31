---
title: Profile
description: Profile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 92a5d494-cd6f-4a9b-942b-f1318ab48b00
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Profile


Represents a collection of problem categories and collectors elements.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**Profile**&gt;

## Syntax


``` syntax
<Profile Id          = IdType
         Name        = string
         Description = string
         Base        = string
         LoggingMode = "File" | "Memory"
         DetailLevel = "Verbose" | "Light"
         Strict      = boolean
         Internal    = boolean
         Default     = boolean>

  <!-- Child elements -->
  ProblemCategories,
  Collectors

</Profile>
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
<td><p><strong>Id</strong></p></td>
<td><p>Uniquely identifies the profile.</p></td>
<td><p>String that must have at least one character and cannot contain colons or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of the profile.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Description</strong></p></td>
<td><p>Indicates the description of the profile.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base of the profile.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>LoggingMode</strong></p></td>
<td><p>Indicates whether WPR writes to memory or to a sequential file.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>File</p></li>
<li><p>Memory</p></li>
</ul></td>
<td><p>Yes</p></td>
<td><p>File</p></td>
</tr>
<tr class="even">
<td><p><strong>DetailLevel</strong></p></td>
<td><p>Specifies whether a profile definition is used for timing tracing (&quot;Light&quot;) or analysis tracing (&quot;Verbose&quot;).</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>Verbose</p></li>
<li><p>Light</p></li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Verbose</p></td>
</tr>
<tr class="odd">
<td><p><strong>Strict</strong></p></td>
<td><p>Indicates whether the failure of a provider or collector causes the start operation fail. If this attribute is set to &quot;false&quot;, the start operation succeeds even if some collectors or providers fail. At least one collector and one provider must succeed for the operation to continue. If this attribute is set to &quot;true&quot;, information about providers or collectors that failed to start is provided as warnings, instead of errors.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p><strong>Internal</strong></p></td>
<td><p>Indicates whether the profile is internal.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="odd">
<td><p><strong>Default</strong></p></td>
<td><p>Indicates whether the profile is a default profile.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
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
<td><p>[ProblemCategories](problemcategories.md)</p></td>
<td><p>Represents a collection of problem categories.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="even">
<td><p>[Collectors](collectors.md)</p></td>
<td><p>Represents a collection of collectors for the profile.</p></td>
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
<td><p>[Profiles](profiles.md)</p></td>
<td><p>Represents a collection of collectors, providers and profiles.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Each .wprp file typically contains at least two profile definitions: one for each logging mode. The exception is that on/off transition profiles can be logged only to file, so the .wprp file for those profiles can contain only one profile definition. Each .wprp file can contain at most four profiles: one for each combination of logging mode and detail level. All profiles in a single .wprp file must have the same value for the **Name** attribute.

Construct the **Id** attribute value by combining the values of the **Name**, **DetailLevel**, and **LoggingMode** attributes, separated by periods, as shown in the following example.

Derived profiles have all the attributes of the base profile by default. These can be overridden by explicitly specifying them in the derived profile. For more information, see [Inheritance](inheritance.md).

## Example


The following code example shows a profile definition.

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
    <EventCollectorId
      Value="WPREventCollector">
      <EventProviders>
        <EventProviderId
          Value="Win32K-provider"/>
        <EventProviderId
          Value="Search-Core-provider"/>
      </EventProviders>
    </EventCollectorId>
  </Collectors>
</Profile>
```

Collectors and providers can also be defined in place, inside the profile definition.

## Related topics


[Elements](elements.md)

 

 







