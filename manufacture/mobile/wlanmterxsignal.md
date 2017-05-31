---
author: kpacquer
Description: WlanMTERxSignal
ms.assetid: eb475d1a-0692-44de-aada-1c8c85f2f500
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTERxSignal
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTERxSignal


Queries information about the received signal at a specific band and channel.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTERxSignal(
    __in    HANDLE      hAdapter,
    __out   BOOLEAN     *pbEnabled,
    __in    DOT11_BAND  Dot11Band,
    __in    ULONG       uChannel,
    __out   LONG        *pPowerLevel
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="pbEnabled"></span><span id="pbenabled"></span><span id="PBENABLED"></span>*pbEnabled*  
\[out\] **True** if the driver detected a signal at the specified band and channel. **False** if no signal was detected.

<span id="Dot11Band"></span><span id="dot11band"></span><span id="DOT11BAND"></span>*Dot11Band*  
\[in\] The band on which the signal is to be detected. The values of the *Dot11Band* parameter are defined by the DOT11\_BAND enum, shown below:

``` syntax
typedef enum DOT11_BAND {
        dot11_band_2p4g = 1,
        dot11_band_4p9g,
        dot11_band_5g
    } DOT11_BAND, * PDOT11_BAND;
```

<span id="uChannel"></span><span id="uchannel"></span><span id="UCHANNEL"></span>*uChannel*  
\[in\] The channel on which the signal is to be detected. The channel range dependa on the band and on the supported PHY types.

<span id="pPowerLevel"></span><span id="ppowerlevel"></span><span id="PPOWERLEVEL"></span>*pPowerLevel*  
\[out\] The power level of the received signal detected at the antenna, returned as RSSI measured in dBm. This is valid only if *bEnabled* is **True**.

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
<td align="left"><p>Returned if the <em>pbEnabled</em>, <em>Dot11Band</em>, <em>uChannel</em>, or <em>pPowerLevel</em> parameter is NULL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the adapter handle specified by the <em>hAdapter</em> parameter is invalid.</p></td>
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

 

 






