---
title: SystemProvider
description: SystemProvider
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 20262ec7-6b20-42cb-903f-1db57a9f1e58
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SystemProvider


Describes the configuration to enable the kernel-mode provider. The system provider definition specifies what system keywords, stacks, and pool tags to enable.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**SystemProvider**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                            &lt;**SystemProvider**&gt;

## Syntax


``` syntax
<SystemProvider Id   = IdType
                Base = string>

  <!-- Child elements -->
  Keywords,
  Stacks,
  PoolTags

</SystemProvider>
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
<td><p>Uniquely identifies the system provider.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base of the system provider. Derived providers have all the attributes of the base provider by default. These can be overridden by explicitly specifying them in the derived provider.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
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
<td><p>[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)</p></td>
<td><p>Represents a collection of keywords and custom keywords.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="even">
<td><p>[Stacks](stacks.md)</p></td>
<td><p>Represents a collection of stacks.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="odd">
<td><p>[PoolTags](pooltags.md)</p></td>
<td><p>Represents a collection of pool tags.</p></td>
<td><p>Required, exactly 1.</p></td>
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
<td><p>[Profiles](profiles.md)</p></td>
<td><p>Represents a collection of collectors, providers, and profiles.</p></td>
</tr>
<tr class="even">
<td><p>[SystemCollectorId](systemcollectorid.md)</p></td>
<td><p>Represents a system collector identifier.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


For information about how to define pool tags, see [PoolTag](pooltag.md).

## Example


``` syntax
<SystemProvider Id="system-provider">
  <Keywords>
    <Keyword Value="ProcessThread"/>
    <Keyword Value="Loader"/>
    <Keyword Value="CSwitch"/>
  </Keywords>
  <Stacks>
    <Stack Value="ThreadCreate"/>
    <Stack Value="ReadyThread"/>
    <Stack Value="CSwitch"/>
  </Stacks>
  <PoolTags>
    <PoolTag Value="a*"/>
    <PoolTag Value="b*"/> 
    <PoolTag Value="c*"/> 
    <PoolTag Value="d*"/> 
  </PoolTags>
</SystemProvider>
```

## Related topics


[Elements](elements.md)

 

 







