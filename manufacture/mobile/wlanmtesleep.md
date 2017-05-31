---
author: kpacquer
Description: WlanMTESleep
ms.assetid: 36b6f1e4-15a3-4e2c-8afb-a455d945aede
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTESleep
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTESleep


Requests that the driver to go to sleep either for a specified time interval, or indefinitely until an awake request is sent.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTESleep(
    __in                    HANDLE  hAdapter,
    __in                    ULONG   uSleepTime,
    __in                    PVOID   pvContext
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="uSleepTime"></span><span id="usleeptime"></span><span id="USLEEPTIME"></span>*uSleepTime*  
\[in\] The time in milliseconds for the adapter to remain in sleep mode. If a value of −1 is specified, the adapter sleeps until a [WlanMTEAwake](wlanmteawake.md) request is sent.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in\] The context that uniquely identifies this request in the callback.

## <span id="Return_Value"></span><span id="return_value"></span><span id="RETURN_VALUE"></span>Return Value


If the function succeeds, the return value is ERROR\_SUCCESS.

If the function fails, the return value is one of the system error codes. The following table lists one of the error codes that may be returned.

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
<td align="left"><p>Returned if the <em>uSleepTime</em> parameter is NULL.</p></td>
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

 

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


During sleep mode, all radios are turned off and the Wi-Fi chip is powered off. When the adapter reawakens, the application’s callback handler, if one was registered with [WlanMTERegisterCallbackHandler](wlanmteregistercallbackhandler.md), is called with the **dot11ManufacturingCallbackType** set to **dot11\_manufacturing\_callback\_sleep\_complete** and the result of the sleep operation is included.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[WlanMTEAwake](wlanmteawake.md)

[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






