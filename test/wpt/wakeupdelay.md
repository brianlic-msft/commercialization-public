---
title: WakeupDelay
description: WakeupDelay
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d93d6b02-b07b-4732-9f69-61685748ea6b
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WakeupDelay


Indicates the delay, in seconds, when emerging from a sleep state for an [OnOffTransitionConfiguration](onofftransitionconfiguration.md) element.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[OnOffTransitionConfigurations](onofftransitionconfigurations.md)&gt;

          &lt;[OnOffTransitionConfiguration](onofftransitionconfiguration.md)&gt;

               &lt;**WakeupDelay**&gt;

## Syntax


``` syntax
<WakeupDelay Value = SimpleDelayValueType>
</WakeupDelay>
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
<th>Data Type</th>
<th>Required</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p>Describes the length of the delay, in seconds. Possible values are 1 through 3600, inclusive.</p></td>
<td><p>Integer</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

### Child Elements

None.

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
<td><p>[OnOffTransitionConfiguration](onofftransitionconfiguration.md)</p></td>
<td><p>Represents an on/off transition configuration.</p></td>
</tr>
</tbody>
</table>

 

## Example


The following code example shows the configuration of this element.

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

 

 







