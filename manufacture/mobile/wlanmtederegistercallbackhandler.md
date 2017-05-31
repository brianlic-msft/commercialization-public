---
author: kpacquer
Description: WlanMTEDeRegisterCallbackHandler
ms.assetid: 0c787146-75f6-4dbe-8e7e-b4c7834142a1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEDeRegisterCallbackHandler
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEDeRegisterCallbackHandler


Unregisters a callback handler so that it will no longer be called when a manufacturing-related functionality event occurs.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEDeRegisterCallbackHandler(
    __in    HANDLE                          hAdapter
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The calling application must have previously registered a callback by calling [WlanMTERegisterCallbackHandler](wlanmteregistercallbackhandler.md)

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

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






