---
title: IOnOffTransitionManager
description: IOnOffTransitionManager
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9d719b05-f720-4464-be7a-c991a1d7639e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IOnOffTransitionManager


Enables the client to store the profiles in the [IProfileCollection](iprofilecollection.md) to the registry for boot tracing, but does not run the profiles. This behavior contrasts with that of[IControlManager](icontrolmanager.md), which runs the profile immediately. When the system boots, Event Tracing for Windows (ETW) reads the registry keys and enables providers for boot tracing accordingly. The library enables collection of PCW data by starting a task scheduler job configured to run on boot.

## Syntax


``` syntax
{
  [id(1), helpstring("EnableBootRecording")] HRESULT EnableBootRecording
    ([in] IProfileCollection* pProfileCollection);
  [id(2), helpstring("DisableBootRecording")] HRESULT DisableBootRecording
    ([in] IProfileCollection* pProfileCollection);
  [id(3), helpstring("StartShutdownRecording")] HRESULT StartShutdownRecording
    ([in] IProfileCollection* pProfileCollection);
  [id(4), helpstring("UpdateShutdownRecording")] HRESULT UpdateShutdownRecording
    ([in] IProfileCollection* pProfileCollection);
  [id(5), helpstring("MergeShutdownRecording")] HRESULT MergeShutdownRecording
    ([in] BSTR bstrFileName,
    [in] IProfileCollection* pProfileCollection,
    [in] ITraceMergeProperties* pTraceMergeProperties)
  ;
};
```

## Functions


This interface provides the functions described in the following table.

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
<td><p>[EnableBootRecording](enablebootrecording.md)</p></td>
<td><p>Enables boot recording for the specified profile collection.</p></td>
</tr>
<tr class="even">
<td><p>[DisableBootRecording](disablebootrecording.md)</p></td>
<td><p>Disables boot recording for the specified profile collection.</p></td>
</tr>
<tr class="odd">
<td><p>[StartShutdownRecording](startshutdownrecording.md)</p></td>
<td><p>Starts shutdown recording.</p></td>
</tr>
<tr class="even">
<td><p>[UpdateShutdownRecording](updateshutdownrecording.md)</p></td>
<td><p>Updates shutdown recording.</p></td>
</tr>
<tr class="odd">
<td><p>[MergeShutdownRecording](mergeshutdownrecording.md)</p></td>
<td><p>Merges shutdown recordings.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







