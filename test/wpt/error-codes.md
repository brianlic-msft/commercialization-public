---
title: Error Codes
description: Error Codes
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 08f519ec-ef59-4bbd-9155-dcbb9b803fca
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Error Codes


The following table describes WPRControl error codes.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Error Code</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>E_WPRC_DUPLICATE_INSTANCE_RUNNING</p></td>
<td><p>The library detected that another instance of the library is already running.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_ADD_PROFILE</p></td>
<td><p>The library failed to add a profile to the collection.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_CANCEL_PROFILE</p></td>
<td><p>The library failed to cancel a profile in the profile collection.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_CLEAR_PROFILE_COLLECTION</p></td>
<td><p>The library failed to remove all profiles from the collection.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_DISABLE_DEBUG_LOGGING</p></td>
<td><p>The library failed to disable debug logging.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_DISABLE_PROFILES_FOR_BOOT_TRACING</p></td>
<td><p>The library failed to remove the profiles so that they do not start during boot.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_ENABLE_DEBUG_LOGGING</p></td>
<td><p>The library failed to enable debug logging.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_ENABLE_PROFILES_FOR_BOOT_TRACING</p></td>
<td><p>The library failed to save the profiles to start during boot.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_QUERY_BUILTIN_PROFILES</p></td>
<td><p>The library failed to query the built-in profiles.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_QUERY_PROFILES</p></td>
<td><p>The library failed to query the properties of the session and providers in all the profiles.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_REMOVE_PROFILE</p></td>
<td><p>The library failed to remove a profile from the collection.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_SAVE_PROFILE</p></td>
<td><p>The library failed to save a profile in the profile collection.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_START_PROFILE</p></td>
<td><p>The library failed to start a profile in the profile collection.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_STOP_PROFILE</p></td>
<td><p>The library failed to stop a profile in the profile collection.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_UPDATE_PROFILE</p></td>
<td><p>The library failed to update a profile in the profile collection.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_VALIDATE_PROFILE</p></td>
<td><p>The library failed to validate the profile.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_VALIDATE_TRACEMERGE_PROPERTIES</p></td>
<td><p>The library failed to validate the trace merge properties.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_INVALID_PROFILES_RUNTIME_STATE</p></td>
<td><p>The profiles running on the system are different from those used to start the recording.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_TRACE_MERGE_LOST_EVENTS</p></td>
<td><p>The Event Tracing for Windows (ETW) session lost events, and merging the event trace log (ETL) files from the session may create an incomplete ETL file.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_WOW64_NOT_SUPPORTED</p></td>
<td><p>The profile library does not support Windows 32-bit On Windows 64-bit.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[WPRControl API Reference](wprcontrol-api-reference.md)

 

 







