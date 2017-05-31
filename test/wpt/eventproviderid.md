---
title: EventProviderId
description: EventProviderId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b97422a9-0fa1-484b-9b2e-8fd72dcbf494
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EventProviderId


Represents an event provider identifier for the profile.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviders](eventproviders.md)&gt;

                               &lt;**EventProviderId**&gt;

## Syntax


``` syntax
<EventProviderId Value = IdType>

  <!-- Child elements -->
  Keywords,
  CaptureStateOnStart,
  CaptureStateOnSave

</EventProviderId>
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
<td><p>Uniquely identifies the event provider.</p></td>
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
<td><p>[Keywords (in EventProvider)](keywords--in-eventprovider-.md)</p></td>
<td><p>Represents a collection of keywords.</p></td>
<td><p>Required, 1 or more. Use <code>0x0</code> as a keyword to include all events.</p></td>
</tr>
<tr class="even">
<td><p>[CaptureStateOnStart](capturestateonstart.md)</p></td>
<td><p>Represents a collection of keywords that describe events to be captured at the start of a recording.</p></td>
<td><p>Optional, zero or 1.</p></td>
</tr>
<tr class="odd">
<td><p>[CaptureStateOnSave](capturestateonsave.md)</p></td>
<td><p>Represents a collection of keywords that describe events to be captured when a recording is saved.</p></td>
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
<td><p>[EventProviders](eventproviders.md)</p></td>
<td><p>Represents a collection of event providers and event provider identifiers.</p></td>
</tr>
</tbody>
</table>

 

## Example


For managed scenarios, use the following event provider definition.

``` syntax
<EventCollectorId Value ="WPAEventCollector">
  <EventProviders>
    <EventProviderId Value="EventProvider_DotNetProvider" />
    <EventProvider Name="Microsoft-Windows-WPA" Id="Microsoft-Windows-WPA" Stack="true">
    </EventProvider>
  </EventProviders>
</EventCollectorId>
```

## Related topics


[Elements](elements.md)

 

 







