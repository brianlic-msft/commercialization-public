---
title: CaptureStateOnStart
description: CaptureStateOnStart
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c29100b6-2eba-4100-8d15-a80a6766beed
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CaptureStateOnStart


Represents a collection of keywords that describe events to be captured at the start of a recording. The library requests the provider to log its state information when the provider is enabled. If the **Operation** attribute is specified, the **Keyword** elements can be set or added to the collection.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[EventProvider](eventprovider.md)&gt;

               &lt;**CaptureStateOnStart**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviderId](eventproviderid.md)&gt;

                              &lt;**CaptureStartOnStart**&gt;

                         &lt;[EventProvider](eventprovider.md)&gt;

                              &lt;**CaptureStateOnStart**&gt;

## Syntax


``` syntax
<CaptureStateOnStart Operation = "Set" | "Add"> | “Remove”

  <!-- Child elements -->
  Keyword

</CaptureStateOnStart>
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
<td><p><strong>Operation</strong></p></td>
<td><p>Indicates whether keywords should be set or added.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>Set</p></li>
<li><p>Add</p></li>
<li><p>Remove</p></li>
</ul></td>
<td><p>No</p></td>
<td><p>Set</p></td>
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
<td><p>[Keyword (in EventProvider)](keyword--in-eventprovider-.md)</p></td>
<td><p>Describes the Event Tracing for Windows (ETW) keyword for a user-mode provider.</p></td>
<td><p>Required, one or more.</p></td>
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
<td><p>[EventProvider](eventprovider.md)</p></td>
<td><p>Represents an event provider for the profile.</p></td>
</tr>
<tr class="even">
<td><p>[EventProviderId](eventproviderid.md)</p></td>
<td><p>Represents an event provider identifier.</p></td>
</tr>
</tbody>
</table>

 

## Example


The following code example shows how this element is used.

``` syntax
<EventProvider Id="sample-provider" Name="SampleProvider" NonPagedMemory="true" Level="5">
  <Keywords>
    <Keyword Value="0x98"/> <!-- Provider is enabled with these keywords throughout tracing session -->
  </Keywords>
  <CaptureStateOnStart>
    <Keyword Value="0xff4"/> <!-- Provider is  enabled with these keywords when tracing is started. -->
  </CaptureStateOnStart>
  <CaptureStateOnSave>
    <Keyword Value="0x118"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>
```

## Related topics


[Elements](elements.md)

[CustomKeyword](customkeyword.md)

[CaptureStateOnSave](capturestateonsave.md)

 

 







