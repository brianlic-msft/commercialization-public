---
title: PostBootDelay
description: PostBootDelay
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fef41639-e619-456f-95a6-776aa0b0036a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PostBootDelay


Indicates the length of the delay, in seconds, after booting for an [OnOffTransitionConfiguration](onofftransitionconfiguration.md) element.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[OnOffTransitionConfigurations](onofftransitionconfigurations.md)&gt;

          &lt;[OnOffTransitionConfiguration](onofftransitionconfiguration.md)&gt;

               &lt;**PostBootDelay**&gt;

## Syntax


``` syntax
<PostBootDelay Value = SimpleDelayValueType>
</PostBootDelay>
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
<td><p>Describes the length of the delay, in seconds.</p></td>
<td><p>Integer in the range from 1 through 3600.</p></td>
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


The following example shows how to configure this element.

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

[WakeupDelay](wakeupdelay.md)

 

 







