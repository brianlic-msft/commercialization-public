---
title: CaptureStateOnSave
description: CaptureStateOnSave
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d672f309-e038-4c69-9288-fbf8e251dfc5
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CaptureStateOnSave


Represents a collection of keywords that describe events to be captured when a trace is saved. The library requests the provider to log its state information when the collector is saved. If the **Operation** attribute is specified, the **Keyword** elements can be set or added to the collection.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[EventProvider](eventprovider.md)&gt;

               &lt;**CaptureStateOnSave**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviderId](eventproviderid.md)&gt;

                              &lt;**CaptureStateOnSave**&gt;

                         &lt;[EventProvider](eventprovider.md)&gt;

                              &lt;**CaptureStateOnSave**&gt;

## Syntax


``` syntax
<CaptureStateOnSave Operation = "Set" | "Add"> | “Remove”

  <!-- Child elements -->
  Keyword

</CaptureStateOnSave>
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
<EventProvider Id="EventProvider_DWMWin32k_CaptureState" Name="e7ef96be-969f-414f-97d7-3ddb7b558ccc" NonPagedMemory="true" CaptureStateOnly="true" > 
  <!-- CaptureStateOnly="true" means provider is not enabled throughout the tracing session. -->
  <CaptureStateOnSave>
    <Keyword Value="0x80000"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>
```

## Related topics


[Elements](elements.md)

[CustomKeyword](customkeyword.md)

[CaptureStateOnStart](capturestateonstart.md)

 

 







