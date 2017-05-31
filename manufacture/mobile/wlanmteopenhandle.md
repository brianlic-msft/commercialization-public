---
author: kpacquer
Description: WlanMTEOpenHandle
ms.assetid: 82017f67-a089-4c99-af7e-f10735db60c3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEOpenHandle
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEOpenHandle


Opens a handle on the driver based on the interface GUID specified and returns the handle to the caller.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEOpenHandle(
    __in    GUID    *pAdapterGuid,
    __out   HANDLE  *phAdapter
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="pAdapterGuid"></span><span id="padapterguid"></span><span id="PADAPTERGUID"></span>*pAdapterGuid*  
\[in\] A pointer to the GUID identifying the Wi-Fi adapter on which the handle is to be opened.

<span id="phAdapter"></span><span id="phadapter"></span><span id="PHADAPTER"></span>*phAdapter*  
\[out\] A pointer to the Wi-Fi handle, if it was opened successfully.

## <span id="Return_Value"></span><span id="return_value"></span><span id="RETURN_VALUE"></span>Return Value


If the function succeeds, the return value is ERROR\_SUCCESS.

If the function fails one of the system error codes is returned. The following table lists the error codes that may be returned.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Error code</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ERROR_INVALID_PARAMETER</p></td>
<td align="left"><p>Returned if the <em>pAdapterGuid</em> or <em>phAdapter</em> parameters are NULL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_STATE</p></td>
<td align="left"><p>Returned if the current DOT11 operation mode cannot be retrieved.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The list of Wi-Fi interface GUIDs can be obtained by calling [WlanMTEEnumAdapters](wlanmteenumadapters.md).

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






