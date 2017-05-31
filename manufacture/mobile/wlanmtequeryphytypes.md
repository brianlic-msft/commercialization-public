---
author: kpacquer
Description: WlanMTEQueryPhyTypes
ms.assetid: ea480a18-0f0c-489a-9f94-b032d0f0a9be
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEQueryPhyTypes
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEQueryPhyTypes


Returns the list of 802.11 PHY types configured on the adapter.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEQueryPhyTypes(
    __in    HANDLE              hAdapter,
    __out   PWLAN_MTE_PHY_LIST *ppPhyList
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="ppPhyList"></span><span id="ppphylist"></span><span id="PPPHYLIST"></span>*ppPhyList*  
\[out\] The list of available PHY types as described in [DOT11\_PHY\_TYPE enumeration](http://msdn.microsoft.com/library/ff548741.aspx).

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
<td align="left"><p>Returned if the <em>ppPhyList</em> parameter is NULL.</p></td>
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

 

 






