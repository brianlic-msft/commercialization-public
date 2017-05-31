---
author: kpacquer
Description: WlanMTESetData
ms.assetid: cf0cf3b4-a4e0-4818-bc78-8b5547903f4b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTESetData
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTESetData


Requests that the driver write data to a specific location defined by a key and offset value.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTESetData(
    __in                    HANDLE  hAdapter,
    __in                    ULONG   uKey,
    __in                    ULONG   uOffset,
    __in                    ULONG   uInBufLen,
    __in_bcount(uInBufLen)  PUCHAR  pucInBuffer
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="uKey"></span><span id="ukey"></span><span id="UKEY"></span>*uKey*  
\[in\] The key for the write request.

<span id="uOffset"></span><span id="uoffset"></span><span id="UOFFSET"></span>*uOffset*  
\[in\] The offset for the write request.

<span id="uInBufLen"></span><span id="uinbuflen"></span><span id="UINBUFLEN"></span>*uInBufLen*  
\[in\] The length of the buffer containing the data to be written.

<span id="pucInBuffer"></span><span id="pucinbuffer"></span><span id="PUCINBUFFER"></span>*pucInBuffer*  
\[in\] The buffer containing the data to be written.

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
<td align="left"><p>ERROR_INVALID_PARAMETER</p></td>
<td align="left"><p>Returned when the <em>uInBufLen</em> parameter is present but the <em>pucInBuffer</em> parameter is NULL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the <em>hAdapter</em> handle is invalid.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ERROR_OUTOFMEMORY</p></td>
<td align="left"><p>Returned when sufficient memory to perform the operation cannot be allocated.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






