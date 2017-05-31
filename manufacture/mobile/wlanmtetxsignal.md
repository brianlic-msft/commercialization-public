---
author: kpacquer
Description: WlanMTETxSignal
ms.assetid: 02a91cb8-de7b-4b96-aa41-7dab33a8d02e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTETxSignal
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTETxSignal


Requests the driver to transmit a signal at the specified band and channel.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTETxSignal(
    __in    HANDLE      hAdapter,
    __in    BOOLEAN     bEnable,
    __in    BOOLEAN     bOpenLoop,
    __in    DOT11_BAND  Dot11Band,
    __in    ULONG       uChannel,
    __in    LONG        SetPowerLevel,
    __out   LONG        *pADCPowerLevel
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="bEnable"></span><span id="benable"></span><span id="BENABLE"></span>*bEnable*  
\[in\] If a value is set, the transmission is enabled. Otherwise, transmission at the specified band and channel is disabled.

<span id="bOpenLoop"></span><span id="bopenloop"></span><span id="BOPENLOOP"></span>*bOpenLoop*  
\[in\] When set to **True**, the driver must use an open loop power control and return the signal value in the *pADCPowerLevel* parameter. If this parameter is set and the hardware does not support open loop power control, an **ERROR\_NOT\_SUPPORTED** exception is returned.

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
\[in\] The channel on which the signal is to be transmitted. The channel range depends on the band and supported PHY types.

<span id="SetPowerLevel"></span><span id="setpowerlevel"></span><span id="SETPOWERLEVEL"></span>*SetPowerLevel*  
\[in\] The power level of the transmitted signal, in dBm.

<span id="pADCPowerLevel"></span><span id="padcpowerlevel"></span><span id="PADCPOWERLEVEL"></span>*pADCPowerLevel*  
\[out, optional\] The current signal level detected at the antenna, returned as a RAW value. The interpretation of this value is implemented by the IHV. This return parameter is valid if *bOpenLoop* is **True** and the hardware supports it.

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
<td align="left"><p>Returned when the <em>Dot11Band</em> or <em>uChannel</em> parameter is NULL, or if <em>bOpenLoop</em> is present but <em>pADCPowerLevel</em> is NULL.</p></td>
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

 

 






