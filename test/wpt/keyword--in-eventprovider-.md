---
title: Keyword (in EventProvider)
description: Keyword (in EventProvider)
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f5b18ec2-8b85-40d6-ac69-91ccd7e7fad9
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Keyword (in EventProvider)


Describes the Event Tracing for Windows (ETW) keyword for a user-mode provider.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[EventProvider](eventprovider.md)&gt;

               &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                    &lt;**Keyword (in EventProvider)**&gt;

               &lt;[CaptureStateOnStart](capturestateonstart.md)&gt;

                    &lt;**Keyword (in EventProvider)**&gt;

               &lt;[CaptureStateOnSave](capturestateonsave.md)&gt;

                    &lt;**Keyword (in EventProvider)**&gt;

          &lt;[HeapEventProvider](heapeventprovider.md)&gt;

               &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                    &lt;**Keyword (in EventProvider)**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviders](eventproviders.md)&gt;

                              &lt;[EventProviderId](eventproviderid.md)&gt;

                                   &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

                              &lt;[EventProvider](eventprovider.md)&gt;

                                   &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

                                   &lt;[CaptureStateOnStart](capturestateonstart.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

                                   &lt;[CaptureStateOnSave](capturestateonsave.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;[HeapEventProviders](heapeventproviders.md)&gt;

                              &lt;[HeapEventProviderId](heapeventproviderid.md)&gt;

                                   &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

                              &lt;[HeapEventProvider](heapeventprovider.md)&gt;

                                   &lt;[Keywords (in EventProvider)](keywords--in-eventprovider-.md)&gt;

                                        &lt;**Keyword (in EventProvider)**&gt;

## Syntax


``` syntax
<Keyword Value string
</Keyword>
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
<td><p>String that is the name of the ETW event.</p></td>
<td><p>string</p></td>
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
<td><p>[Keywords (in EventProvider)](keywords--in-eventprovider-.md)</p></td>
<td><p>Represents a collection of event provider keywords.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







