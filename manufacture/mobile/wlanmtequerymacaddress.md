---
author: kpacquer
Description: WlanMTEQueryMacAddress
ms.assetid: 62953a75-4956-494f-983f-ca6475db2b43
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEQueryMacAddress
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEQueryMacAddress


Returns the MAC address of the Wi-Fi adapter.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEQueryMacAddress(
    __in    HANDLE              hAdapter,
    __out   DOT11_MAC_ADDRESS   *pDot11MacAddress
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="pDot11MacAddress"></span><span id="pdot11macaddress"></span><span id="PDOT11MACADDRESS"></span>*pDot11MacAddress*  
\[out\] The current MAC address of the Wi-Fi adapter.

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
<td align="left"><p>Returned when the <em>pDot11MacAddress</em> parameter is NULL.</p></td>
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

 

 






