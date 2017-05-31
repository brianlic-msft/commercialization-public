---
title: EventProvider
description: EventProvider
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bf7e4e86-e837-41f8-847f-42fc12c5a98c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EventProvider


Configures the Event Tracing for Windows (ETW) user-mode provider.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**EventProvider**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;[EventProviders](eventproviders.md)&gt;

                              &lt;**EventProvider**&gt;

## Syntax


``` syntax
<EventProvider Id               = IdType
               Name             = string
               Base             = string
               NonPageMemory    = boolean
               Stack            = boolean
               SID              = boolean
               TSID             = boolean
               Level            = unsigendByte
               CaptureStateOnly = boolean>

  <!-- Child elements -->
  Keywords,
  CaptureStateOnStart,
  CaptureStateOnSave

</EventProvider>
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
<td><p>Uniquely identifies the event provider.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of the event provider.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>A registered Crimson provider, for example, &quot;Microsoft-Windows-Search-Core&quot;.</p></li>
<li><p>A provider GUID, for example &quot;49c2c27c-fe2d-40bf-8c4e-c3fb518037e7&quot;.</p></li>
<li><p>The name of a legacy provider, for example &quot;IE6&quot;.</p></li>
<li><p>A special-case name, such as &quot;PerfTrack&quot; or &quot;DotNetProvider&quot;.</p></li>
</ul></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>ProcessExeFilter</strong></p></td>
<td><p>Filters an event based on the process .exe name specified.</p></td>
<td><p>This is an optional attribute you add to the <strong>EventProvider ID</strong> in the WPR profile. For example:</p>
<ul>
<li><p>&quot;ProcessExeFilter=&quot;wpa.exe&quot;</p></li>
</ul>
<div class="alert">
<strong>Note</strong>  
<p>WPR essentially passes on the .exe name into the [EVENT_FILTER_DESCRIPTOR](https://msdn.microsoft.com/library/windows/desktop/aa363758.aspx) structure.</p>
</div>
<div>
 
</div></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base for the provider.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>NonPagedMemory</strong></p></td>
<td><p>Indicates whether non-paged memory is to be used.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p><strong>Stack</strong></p></td>
<td><p>Indicates whether the provider should capture stacks.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="odd">
<td><p><strong>SID</strong></p></td>
<td><p>Indicates whether to include the security identifier (SID) of the user to the extended data of logged events.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p><strong>TSID</strong></p></td>
<td><p>Indicates whether the terminal session identifier is included in the extended data of logged events.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="odd">
<td><p><strong>Level</strong></p></td>
<td><p>Indicates the level value.</p></td>
<td><p>unsignedByte</p></td>
<td><p>No</p></td>
<td><p>Zero, which ETW treats as 0xFFFFFFFFFFFFFFFF.</p></td>
</tr>
<tr class="even">
<td><p><strong>CaptureStateOnly</strong></p></td>
<td><p>Indicates whether a provider is enabled only at start or save of a tracing session.</p></td>
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
<td><p>[Keywords (in EventProvider)](keywords--in-eventprovider-.md)</p></td>
<td><p>Represents a collection of [Keyword (in EventProvider)](keyword--in-eventprovider-.md) elements.</p></td>
<td><p>Required, 1 or more.</p></td>
</tr>
<tr class="even">
<td><p>[CaptureStateOnStart](capturestateonstart.md)</p></td>
<td><p>Represents a collection of [Keyword (in EventProvider)](keyword--in-eventprovider-.md) elements for events to be captured at the start of a trace.</p></td>
<td><p>Optional, zero or 1.</p></td>
</tr>
<tr class="odd">
<td><p>[CaptureStateOnSave](capturestateonsave.md)</p></td>
<td><p>Represents a collection of [Keyword (in EventProvider)](keyword--in-eventprovider-.md) elements for events to be captured when a trace is saved.</p></td>
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
<td><p>Represents a collection of <strong>EventProvider</strong> elements.</p></td>
</tr>
<tr class="even">
<td><p>[Profiles](profiles.md)</p></td>
<td><p>Represents a collection of collectors, providers, and profiles.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Provider definition order is important. Definitions must appear in the following order in the .wprp file:

1.  Collectors

2.  System provider

3.  Event provider(s)

Optional inner XML tags specify what keywords to enable. Unlike for system providers, there are no textual constants defined for event providers, so hexadecimal-style strings must be used. However, the syntax is the same as for system provider. If no keywords are specified, the default value of zero is used (which is treated by ETW as the string 0xFFFFFFFFFFFFFFFF).

Derived event providers have all the attributes of the base provider by default. They can be overridden by explicitly specifying them in the derived provider. For more information, see [Inheritance](inheritance.md).

## Example


The following example defines two event providers.

``` syntax
<EventProvider
  Id="Win32K-provider"
  Name="Microsoft-Windows-Win32K"
  NonPagedMemory="true"
  Stack="true"> 
  <Keywords>
    <Keyword
      Value="0x240000"/>
  </Keywords>
</EventProvider>

<EventProvider
  Id="Search-Core-provider"
  Name="Microsoft-Windows-Search-Core"/>
```

The following code examples define capture-state providers.

``` syntax
<EventProvider Id="sample-provider" Name="SampleProvider" NonPagedMemory="true" Level="5">
  <Keywords>
    <Keyword Value="0x98"/> <!-- Provider is enabled with these keywords throughout the tracing session. -->
  </Keywords>
  <CaptureStateOnStart>
    <Keyword Value="0xff4"/> <!-- Provider is enabled with these keywords when tracing is started. -->
  </CaptureStateOnStart>
  <CaptureStateOnSave>
    <Keyword Value="0x118"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>

<EventProvider Id="EventProvider_DWMWin32k_CaptureState" Name="e7ef96be-969f-414f-97d7-3ddb7b558ccc" NonPagedMemory="true" CaptureStateOnly="true" > 
  <!-- CaptureStateOnly="true" means that provider is not enabled throughout the tracing session. -->
  <CaptureStateOnSave>
    <Keyword Value="0x80000"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>
```

For managed scenarios, use the following event provider definition:

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

 

 







