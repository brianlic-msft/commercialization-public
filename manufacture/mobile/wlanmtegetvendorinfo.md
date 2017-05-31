---
author: kpacquer
Description: WlanMTEGetVendorInfo
ms.assetid: a36c1d73-252b-453e-a231-b26087d2e740
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEGetVendorInfo
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEGetVendorInfo


Requests vendor-specific information, such as the vendor ID and vendor description.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEGetVendorInfo(
    __in                        HANDLE  hAdapter,
    __out                       ULONG   *puVendorId,
    __in                        ULONG   uOutBufLen,
    __out_bcount(uOutBufLen)    PUCHAR  pucOutBuffer
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="puVendorId"></span><span id="puvendorid"></span><span id="PUVENDORID"></span>*puVendorId*  
\[out\] The vendor ID.

<span id="uOutBufLen"></span><span id="uoutbuflen"></span><span id="UOUTBUFLEN"></span>*uOutBufLen*  
\[in\] The length of the buffer for retrieving the vendor description.

<span id="pucOutBuffer"></span><span id="pucoutbuffer"></span><span id="PUCOUTBUFFER"></span>*pucOutBuffer*  
\[out\] The buffer that will contain the vendor description string.

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
<td align="left"><p>Returned if the <em>puVendorID</em>, <em>uOutBufLen</em>, or <em>pucOutBuffer</em> parameter is NULL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the adapter handle specified by the <em>hAdapter</em> parameter is invalid.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






