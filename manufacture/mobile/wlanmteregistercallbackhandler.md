---
author: kpacquer
Description: WlanMTERegisterCallbackHandler
ms.assetid: 7a61e9e2-fa0c-4c01-96c2-f3720aab7cde
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTERegisterCallbackHandler
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTERegisterCallbackHandler


Registers a handler that will be called whenever the driver invokes a callback for a manufacturing functionality event.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTERegisterCallbackHandler(
    __in    HANDLE                          hAdapter,
    __in    WLAN_MTE_NOTIFICATION_CALLBACK Callback
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="Callback"></span><span id="callback"></span><span id="CALLBACK"></span>*Callback*  
\[in\] The handler function being registered by the application for manufacturing callbacks.

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
<td align="left"><p>Returned if the adapter handle specified by the <em>hAdapter</em> parameter is invalid or NULL.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The callback function has the following prototype:

``` syntax
typedef VOID (WINAPI *WLAN_MTE_NOTIFICATION_CALLBACK)(
    __in    PDOT11_MANUFACTURING_CALLBACK_PARAMETERS    pMTECallback,
    __in    PVOID                                       pvReserved
    );
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






