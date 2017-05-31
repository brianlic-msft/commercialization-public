---
title: TransitionTag
description: TransitionTag
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ead6001f-02f3-4a85-a207-7af8e558a8f2
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TransitionTag


Represents the transition tag for an [OnOffTransitionConfiguration](onofftransitionconfiguration.md) element.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[OnOffTransitionConfigurations](onofftransitionconfigurations.md)&gt;

          &lt;[OnOffTransitionConfiguration](onofftransitionconfiguration.md)&gt;

               &lt;**TransitionTag**&gt;

## Syntax


``` syntax
<TransitionTag Value = TransitionTagType>
</TransitionTag>
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
<td><p>String that is inserted in the file name.</p></td>
<td><p>String that does not contain any of the following characters:</p>
<ul>
<li><p>Forward slash (/)</p></li>
<li><p>Backslash ()</p></li>
<li><p>Colon (:)</p></li>
<li><p>Asterisk (*)</p></li>
<li><p>Question mark (?)</p></li>
<li><p>Pipe symbol (|)</p></li>
<li><p>Right angle bracket (&gt;)</p></li>
<li><p>Double quote (&quot;)</p></li>
</ul></td>
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

 

 







