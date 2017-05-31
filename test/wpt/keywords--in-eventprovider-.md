---
title: Keywords (in EventProvider)
description: Keywords (in EventProvider)
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9ecdbe0a-7635-416a-a690-cf18c63d429f
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Keywords (in EventProvider)


Represents a collection of event keywords.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[EventProvider](eventprovider.md)&gt;

               &lt;**Keywords (in EventProvider)**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviders](eventproviders.md)&gt;

                              &lt;[EventProviderId](eventproviderid.md)&gt;

                                   &lt;**Keywords (in EventProvider)**&gt;****

                              &lt;[EventProvider](eventprovider.md)&gt;

                                   &lt;**Keywords (in EventProvider)**&gt;

## Syntax


``` syntax
<Keywords Operation = "Set" | "Add" | “Remove” >

  <!-- Child elements -->
  Keyword

</Keywords>
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
<td><p>Required, 1 or more.</p></td>
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

 

## Related topics


[Elements](elements.md)

 

 







