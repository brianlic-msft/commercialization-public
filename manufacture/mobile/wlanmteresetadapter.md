---
author: kpacquer
Description: WlanMTEResetAdapter
ms.assetid: bb87f719-3277-4fcc-aa9f-94ff1dac34f1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEResetAdapter
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEResetAdapter


Resets the Wi-Fi adapter. The application can specify an optional callback and context handle to be invoked when the operation is complete.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEResetAdapter(
    __in        HANDLE                  hAdapter,
    __in        DOT11_RESET_REQUEST     *pDot11ResetRequest,
    __in        WLAN_MTE_RESET_CALLBACK ResetCallback,
    __in        PVOID                   pvContext
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="pDot11ResetRequest"></span><span id="pdot11resetrequest"></span><span id="PDOT11RESETREQUEST"></span>*pDot11ResetRequest*  
\[in\] Information about the reset request. If the application requires the reset in order to update the MAC address, it should specify either **dot11\_reset\_type\_mac** or **dot11\_reset\_type\_phy\_and\_mac** in order for the updated MAC address to be written to the DPP. Note that the MAC address change will only be valid when the device has booted in manufacturing mode.

<span id="ResetCallback"></span><span id="resetcallback"></span><span id="RESETCALLBACK"></span>*ResetCallback*  
\[in, optional\] The callback handler to be invoked on reset completion.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in, optional\] If the callback is specified, this context value is provided when the handler is called.

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The callback function for Wi-Fi reset adapter notifications has the following prototype:

``` syntax
typedef VOID (WINAPI *WLAN_MTE_RESET_CALLBACK)(
    __in    DWORD   dwError,
    __in    PVOID   pvContext
    );
```

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
<td align="left"><p>Returned when the <em>pDot11ResetRequest</em> parameter is NULL or the <em>pDot11ResetRequest</em> type is invalid.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the <em>hAdapter</em> handle is invalid.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






