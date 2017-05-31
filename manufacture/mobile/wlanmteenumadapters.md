---
author: kpacquer
Description: WlanMTEEnumAdapters
ms.assetid: f89ddb61-0c2d-446b-9f81-3e2c88311d61
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEEnumAdapters
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEEnumAdapters


Returns the list of adapters that are recognized by the Wi-Fi stack.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEEnumAdapters(
    __out_opt   WLAN_MTE_ADAPTER_LIST  **ppWlanAdapterList
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="ppWlanAdapterList"></span><span id="ppwlanadapterlist"></span><span id="PPWLANADAPTERLIST"></span>*ppWlanAdapterList*  
\[out\] A list of detected Wi-Fi adapters.

## <span id="Return_Value"></span><span id="return_value"></span><span id="RETURN_VALUE"></span>Return Value


If the function succeeds, the return value is ERROR\_SUCCESS. Otherwise, the function returns a system error code.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






