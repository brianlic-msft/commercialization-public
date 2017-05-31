---
author: kpacquer
Description: WlanMTEStartSelfTest
ms.assetid: 6c583601-3d26-4a4a-b225-11c2b54ea59b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEStartSelfTest
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEStartSelfTest


Starts a preconfigured set of self-tests.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEStartSelfTest(
    __in                        HANDLE                              hAdapter,
    __in                        DOT11_MANUFACTURING_SELF_TEST_TYPE  eTestType,
    __in                        ULONG                               uTestID,
    __in                        PVOID                               pvContext,
    __in                        ULONG                               uPinBitMask,
    __in                        ULONG                               uInBufLen,
    __in_bcount_opt(uInBufLen)  PUCHAR                              pucInBuffer
);
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


<span id="hAdapter"></span><span id="hadapter"></span><span id="HADAPTER"></span>*hAdapter*  
\[in\] The handle to the Wi-Fi adapter, obtained by calling [WlanMTEOpenHandle](wlanmteopenhandle.md).

<span id="eTestType"></span><span id="etesttype"></span><span id="ETESTTYPE"></span>*eTestType*  
\[in\] The type of self-test requested. The values of *eTestType* are defined by the DOT11\_MANUFACTURING\_SELF\_TEST\_TYPE enumeration, shown below:

``` syntax
typedef enum DOT11_MANUFACTURING_SELF_TEST_TYPE {
        DOT11_MANUFACTURING_SELF_TEST_TYPE_INTERFACE = 1,
        DOT11_MANUFACTURING_SELF_TEST_TYPE_RF_INTERFACE,
        DOT11_MANUFACTURING_SELF_TEST_TYPE_BT_COEXISTENCE
    } DOT11_MANUFACTURING_SELF_TEST_TYPE, * PDOT11_MANUFACTURING_SELF_TEST_TYPE;
```

<span id="uTestID"></span><span id="utestid"></span><span id="UTESTID"></span>*uTestID*  
\[in\] The ID for the self-test requested.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in\] The context that uniquely identifies this request in the callback and in the subsequent results query.

<span id="uPinBitMask"></span><span id="upinbitmask"></span><span id="UPINBITMASK"></span>*uPinBitMask*  
\[in\] The bit mask for adapter pins to be tested.

<span id="uInBufLen"></span><span id="uinbuflen"></span><span id="UINBUFLEN"></span>*uInBufLen*  
\[in\] The length of the buffer for passing in any additional information about the self-test.

<span id="pucInBuffer"></span><span id="pucinbuffer"></span><span id="PUCINBUFFER"></span>*pucInBuffer*  
\[in\] The buffer that will contain additional information about the self-test.

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


On completion of the self-test, the application’s callback handler is called, if one was registered, with the **dot11ManufacturingCallbackType** set to **dot11\_manufacturing\_callback\_self\_test\_complete**, and the result of the self-test is included.

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
<td align="left"><p>Returned when the <em>uInBufLen</em> parameter is present but the <em>pucInBuffer</em> parameter is NULL.</p></td>
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

 

 






