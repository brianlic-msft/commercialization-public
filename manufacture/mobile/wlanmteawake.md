---
author: kpacquer
Description: WlanMTEAwake
ms.assetid: a4e8a5af-5008-4643-afc0-036f59806528
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEAwake
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEAwake


Requests that the driver wake up from its current sleep state.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEAwake(
    __in                    HANDLE  hAdapter
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

## <span id="Return_Value"></span><span id="return_value"></span><span id="RETURN_VALUE"></span>Return Value


If the function succeeds, the return value is ERROR\_SUCCESS.

If the function fails, the return value is one of the system error codes. The following table lists the error codes that may be returned.

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
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the <em>hAdapter</em> handle is invalid.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_OUTOFMEMORY</p></td>
<td align="left"><p>Returned when sufficient memory to perform the operation cannot be allocated.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The driver must have been put into the sleep state using the [WlanMTESleep](wlanmtesleep.md) function before this function is called. If the driver is not in a sleep state when this function is called, it returns **STATUS\_INVALID\_PARAMETER**.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






