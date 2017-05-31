---
title: IControlManager
description: IControlManager
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4c6d4a0b-5a66-4fcc-ad8a-69c68a7e7fcc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IControlManager


Represents the Windows Performance Recorder manager, which controls Event Tracing for Windows (ETW) sessions. The client passes a collection of profiles using the [IProfileCollection](iprofilecollection.md) interface, and the manager can start, update, cancel, save, stop, or query the ETW session or providers that each profile describes. The client can pass in a pointer to the [IControlProgressHandler](icontrolprogresshandler.md) handler to receive updates about the operation that the manager performs.

## Syntax


``` syntax
{
  [propget, id(1), helpstring("property ControlProgressHandler")] HRESULT ControlProgressHandler
    ([out, retval] IControlProgressHandler** ppControlProgressHandler);
  [propput, id(1), helpstring("property ControlProgressHandler")] HRESULT ControlProgressHandler
    ([in] IControlProgressHandler* pControlProgressHandler);
  [id(2), helpstring("Start")] HRESULT Start
    ([in] IProfileCollection* pProfileCollection);
  [id(3), helpstring("Update")] HRESULT Update
    ([in] IProfileCollection* pProfileCollection);
  [id(4), helpstring("Cancel")] HRESULT Cancel
    ([in] IProfileCollection* pProfileCollection);
  [id(5), helpstring("Save")] HRESULT Save
    ([in] BSTR bstrFileName,
    [in] IProfileCollection* pProfileCollection,
    [in] ITraceMergeProperties* pTraceMergeProperties);
  [id(6), helpstring("Stop")] HRESULT Stop
    ([in] BSTR bstrFileName,
    [in] IProfileCollection* pProfileCollection,
    [in] ITraceMergeProperties* pTraceMergeProperties);
  [id(7), helpstring("QueryXML")] HRESULT QueryXML
    ([out] BSTR* pbstrResults,
    [in] VARIANT_BOOL fValidateRuntimeState);
  [id(8), helpstring("Query")] HRESULT Query
    ([out] IProfileCollection** ppProfileCollection,
    [in] VARIANT_BOOL fValidateRuntimeState);
  [propget, id(9), helpstring("property TraceMergeTextHandler")] HRESULT TraceMergeTextHandler
    ([out, retval] ITraceMergeTextHandler** ppTraceMergeTextHandler);
  [propput, id(9), helpstring("property TraceMergeTextHandler")] HRESULT TraceMergeTextHandler
    ([in] ITraceMergeTextHandler* pTraceMergeTextHandler);
  [propget, id(10), helpstring("property TemporaryTraceDirectory")] HRESULT TemporaryTraceDirectory
    ([out, retval] BSTR* pbstrTemporaryTraceDirectory);
  [propput, id(10), helpstring("property TemporaryTraceDirectory")] HRESULT TemporaryTraceDirectory
    ([in] BSTR bstrTemporaryTraceDirectory);
  [id(11), helpstring("GetProviderNameFromGuid")] HRESULT GetProviderNameFromGuid
    ([out] BSTR* bstrProviderIdStr,
    [in] REFGUID ProviderId);
  [id(12), helpstring("GetProviderGuidFromName")] HRESULT GetProviderGuidFromName
    ([out] GUID* ProviderId,
    [in] BSTR bstrProViderName);
};
```

## Functions


The following table describes the functions that this interface provides.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Start](start-icontrolmanager.md)</p></td>
<td><p>Starts a recording.</p></td>
</tr>
<tr class="even">
<td><p>[Update](update-icontrolmanager.md)</p></td>
<td><p>Updates a profile collection.</p></td>
</tr>
<tr class="odd">
<td><p>[Cancel](cancel.md)</p></td>
<td><p>Stops a recording without saving any data.</p></td>
</tr>
<tr class="even">
<td><p>[Save](save-icontrolmanager.md)</p></td>
<td><p>Saves a recording that is logged to circular buffers in memory to the specified event trace log (ETL) file.</p></td>
</tr>
<tr class="odd">
<td><p>[Stop](stop-icontrolmanager.md)</p></td>
<td><p>Stops a recording and saves it to the specified event trace log (ETL) file.</p></td>
</tr>
<tr class="even">
<td><p>[QueryXML](queryxml.md)</p></td>
<td><p>Indicates the XML format of the currently running profile and whether the profile is running properly.</p></td>
</tr>
<tr class="odd">
<td><p>[Query](query-icontrolmanager.md)</p></td>
<td><p>Queries the properties of session and providers in all profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>propget</strong></p></td>
<td><p>Gets the specified property.</p></td>
</tr>
<tr class="odd">
<td><p><strong>propput</strong></p></td>
<td><p>Sets the specified property.</p></td>
</tr>
<tr class="even">
<td><p>[GetProviderNameFromGuid](getprovidernamefromguid.md)</p></td>
<td><p>Gets the provider name of the specified GUID.</p></td>
</tr>
<tr class="odd">
<td><p>[GetProviderGuidFromName](getproviderguidfromname.md)</p></td>
<td><p>Gets the provider GUID of the specified name.</p></td>
</tr>
</tbody>
</table>

 

## Properties


The following table describes the parameters of properties that this interface can get or set.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Parameters</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>ControlProgressHandler</strong></p></td>
<td><p><em>ppControlProgressHandler</em> [out]</p></td>
<td><p>Pointer to the client-side implementation of the [IControlProgressHandler](icontrolprogresshandler.md) interface.</p></td>
</tr>
<tr class="even">
<td><p><strong>ControlProgressHandler</strong></p></td>
<td><p><em>pControlProgressHandler</em> [in]</p></td>
<td><p>Pointer to the client-side implementation of the <strong>IControlProgressHandler</strong> interface. E_POINTER indicates an invalid pointer.</p></td>
</tr>
<tr class="odd">
<td><p><strong>TraceMergeTextHandler</strong></p></td>
<td><p><em>ppTraceMergeTextHandler</em> [out]</p></td>
<td><p>Pointer to the text and some other merge time information in the trace injected by the [ITraceMergeTextHandler](itracemergetexthandler.md) interface.</p></td>
</tr>
<tr class="even">
<td><p><strong>TraceMergeTextHandler</strong></p></td>
<td><p><em>pTraceMergeTextHandler</em> [in]</p></td>
<td><p>Pointer to the text and some other merge time information in the trace injected by the <strong>ITraceMergeTextHandler</strong> interface. E_POINTER indicates an invalid pointer.</p></td>
</tr>
<tr class="odd">
<td><p><strong>TemporaryTraceDirectory</strong></p></td>
<td><p><em>pbstrTemporaryTraceDirectory</em> [out]</p></td>
<td><p>Pointer to the path of the directory where the pre-merged trace files are logged. The default is the %temp% folder.</p></td>
</tr>
<tr class="even">
<td><p><strong>TemporaryTraceDirectory</strong> [in]</p></td>
<td><p><em>bstrTemporaryTraceDirectory</em></p></td>
<td><p>Path of the directory where the pre-merged trace files are logged.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







