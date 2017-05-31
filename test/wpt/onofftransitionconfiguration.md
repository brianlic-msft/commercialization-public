---
title: OnOffTransitionConfiguration
description: OnOffTransitionConfiguration
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c9b194b8-c179-49da-ac8d-aae373c9d706
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OnOffTransitionConfiguration


Represents an on/off transition configuration.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[OnOffTransitionConfigurations](onofftransitionconfigurations.md)&gt;

          &lt;**OnOffTransitionConfiguration**&gt;

## Syntax


``` syntax
<OnOffTransitionConfiguration Id = IdType
                              Name = string
                              Type = "On/Off - Boot" | "On/Off - HybridBoot" | "On/Off - Shutdown" | ...>

  <!-- Child elements -->
  PrepareSystem,
  NumberOfRuns,
  PostBootDelay,
  WakeupDelay,
  TransitionTag

</OnOffTransitionConfiguration>
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
<td><p>Uniquely identifies the on/off transition configuration.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of the configuration.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p>Indicates the type of on/off transition.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>On/Off - Boot</p></li>
<li><p>On/Off - HybridBoot</p></li>
<li><p>On/Off - Shutdown</p></li>
<li><p>On/Off - RebootCycle</p></li>
<li><p>On/Off - Standby/Resume</p></li>
<li><p>On/Off - Hibernate/Resume</p></li>
</ul></td>
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
<td><p>[PrepareSystem](preparesystem.md)</p></td>
<td><p>Indicates whether to prepare the system for an on/off transition.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="even">
<td><p>[NumberOfRuns](numberofruns.md)</p></td>
<td><p>Indicates the number of runs in the on/off transition.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="odd">
<td><p>[PostBootDelay](postbootdelay.md)</p></td>
<td><p>Indicates the delay after booting.</p></td>
<td><p>Optional, zero or 1.</p></td>
</tr>
<tr class="even">
<td><p>[WakeupDelay](wakeupdelay.md)</p></td>
<td><p>Indicates the delay when emerging from a sleep state.</p></td>
<td><p>Optional, zero or 1.</p></td>
</tr>
<tr class="odd">
<td><p>[TransitionTag](transitiontag.md)</p></td>
<td><p>Indicates the transition tag.</p></td>
<td><p>Optional, zero or 1.</p></td>
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
<td><p>[OnOffTransitionConfigurations](onofftransitionconfigurations.md)</p></td>
<td><p>Represents a collection of on/off transition.</p></td>
</tr>
</tbody>
</table>

 

## Example


The following code example shows how to configure this element.

``` syntax
<OnOffTransitionConfiguration
  Id="OnOffTransitionConfiguration_Default_Boot"
  Name="OnOffTransitionConfiguration_Default_Boot"
  Type="On/Off - Boot">
  <PrepareSystem Value="true"/>
  <NumberOfRuns Value="3"/>
  <PostBootDelay Value="120"/>
  <WakeupDelay Value="60"/>
  <TransitionTag Value="Boot"/>
</OnOffTransitionConfiguration>
```

## Related topics


[Elements](elements.md)

 

 







