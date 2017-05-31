---
title: Interfaces
description: Interfaces
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d986953c-cadf-4c6e-a204-12a29e0b672e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Interfaces


This section documents the interfaces that the WPRControl API provides.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[IControlErrorInfo](icontrolerrorinfo.md)</p></td>
<td><p>Provides functions that obtain information about errors that occur when the control manager performs an operation.</p></td>
</tr>
<tr class="even">
<td><p>[IControlManager](icontrolmanager.md)</p></td>
<td><p>Represents the Windows Performance Recorder (WPR) manager, which controls ETW sessions.</p></td>
</tr>
<tr class="odd">
<td><p>[IControlProgressHandler](icontrolprogresshandler.md)</p></td>
<td><p>Represents a client-side handler that receives updates when the library performs an operation.</p></td>
</tr>
<tr class="even">
<td><p>[IEnumControlWarningInfo](ienumcontrolwarninginfo.md)</p></td>
<td><p>Provides a standard COM enumeration method for enumerating a collection of [IControlErrorInfo](icontrolerrorinfo.md) interfaces.</p></td>
</tr>
<tr class="odd">
<td><p>[IEnumProfile](ienumprofile.md)</p></td>
<td><p>Provides a standard COM enumeration method for enumerating a collection of [IProfile](iprofile.md) interfaces.</p></td>
</tr>
<tr class="even">
<td><p>[IOnOffTransitionManager](ionofftransitionmanager.md)</p></td>
<td><p>Enables the client to store the profiles of the [IProfileCollection](iprofilecollection.md) to the registry for boot tracing.</p></td>
</tr>
<tr class="odd">
<td><p>[IParsingErrorInfo](iparsingerrorinfo.md)</p></td>
<td><p>Provides functions that get information about XML validation failures.</p></td>
</tr>
<tr class="even">
<td><p>[IProfile](iprofile.md)</p></td>
<td><p>Represents an individual profile that the client controls.</p></td>
</tr>
<tr class="odd">
<td><p>[IProfileCollection](iprofilecollection.md)</p></td>
<td><p>Represents a collection of profiles that the library runs as a unit.</p></td>
</tr>
<tr class="even">
<td><p>[ITraceMergeProperties](itracemergeproperties.md)</p></td>
<td><p>Enables the client to specify policies for merging multiple event trace log (ETL) files using XML.</p></td>
</tr>
<tr class="odd">
<td><p>[ITraceMergeTextHandler](itracemergetexthandler.md)</p></td>
<td><p>Obtains the text and other metadata that was added by the user.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[WPRControl API Reference](wprcontrol-api-reference.md)

 

 







