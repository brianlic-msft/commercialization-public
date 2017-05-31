---
author: kpacquer
Description: WlanMTEQueryADC
ms.assetid: 59b02678-f928-4b9e-837b-9c148aaedcfc
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEQueryADC
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEQueryADC


Requests the value of the transmitted signal when performed over an open loop.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEQueryADC(
    __in    HANDLE      hAdapter,
    __in    DOT11_BAND  Band,
    __in    ULONG       uChannel,
    __out   LONG        *pADCPowerLevel
    );
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="Band"></span><span id="band"></span><span id="BAND"></span>*Band*  
\[in\] The band on which the signal is to be detected. The values of the *Dot11Band* parameter are defined by the DOT11\_BAND enum, shown below:

``` syntax
typedef enum DOT11_BAND {
        dot11_band_2p4g = 1,
        dot11_band_4p9g,
        dot11_band_5g
    } DOT11_BAND, * PDOT11_BAND;
```

<span id="uChannel"></span><span id="uchannel"></span><span id="UCHANNEL"></span>*uChannel*  
\[in\] The channel on which the signal is being transmitted. The channel range will depend on the band and supported PHY types.

<span id="pADCPowerLevel"></span><span id="padcpowerlevel"></span><span id="PADCPOWERLEVEL"></span>*pADCPowerLevel*  
\[out\] The current signal level detected at the antenna returned as a RAW value. The interpretation of this value will be implemented by the IHV. This parameter is valid only if the device supports open loop power and is currently transmitting a signal on the open loop.

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
<td align="left"><p>Returned if the <em>Dot11Band</em>, <em>uChannel</em>, or <em>pADCPowerLevel</em> parameter is NULL.</p></td>
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


If open loop power is not supported, the driver will return **ERROR\_NOT\_SUPPORTED**.

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
<td align="left"><p>Returned when the <em>uInBufLen</em> parameter is present but the <em>pucInBuffer</em> parameter is NULL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>The <em>hAdapter</em> handle is invalid.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ERROR_OUTOFMEMORY</p></td>
<td align="left"><p>There was insufficient memory to allocate to perform the function.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






