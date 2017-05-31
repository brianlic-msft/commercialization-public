---
author: kpacquer
Description: WlanMTEQueryData
ms.assetid: 3def2451-5c4e-490b-ad6c-dbd703d7574a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEQueryData
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEQueryData


Queries the driver for data stored at a specific location defined by a key and offset value.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEQueryData(
    __in                        HANDLE  hAdapter,
    __in                        ULONG   uKey,
    __in                        ULONG   uOffset,
    __out                       ULONG   *puBytesWrittenOut,
    __in                        ULONG   uOutBufLen,
    __out_bcount(uOutBufLen)    PUCHAR  pucOutBuffer
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="uKey"></span><span id="ukey"></span><span id="UKEY"></span>*uKey*  
\[in\] The key for the query request.

<span id="uOffset"></span><span id="uoffset"></span><span id="UOFFSET"></span>*uOffset*  
\[in\] The offset for the query request.

<span id="puBytesWrittenOut"></span><span id="pubyteswrittenout"></span><span id="PUBYTESWRITTENOUT"></span>*puBytesWrittenOut*  
\[out\] The number of bytes of data returned from the query request.

<span id="uOutBufLen"></span><span id="uoutbuflen"></span><span id="UOUTBUFLEN"></span>*uOutBufLen*  
\[in\] The length of the buffer for returning the information requested.

<span id="pucOutBuffer"></span><span id="pucoutbuffer"></span><span id="PUCOUTBUFFER"></span>*pucOutBuffer*  
\[out\] The buffer that will contain the data returned per the query request.

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
<td align="left"><p>Returned if the <em>puBytesWrittenOut</em>, <em>uOutBufLen</em>, or <em>pucOutBuffer</em> parameter is NULL.</p></td>
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

 

 






