---
author: kpacquer
Description: WlanMTEQuerySelfTestResult
ms.assetid: 7c728c46-7adb-4b1c-8b0e-85eb58ddd026
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: WlanMTEQuerySelfTestResult
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WlanMTEQuerySelfTestResult


Queries the driver for the results of a previously requested self-test.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
DWORD WlanMTEQuerySelfTestResult(
    __in                            HANDLE                              hAdapter,
    __in                            DOT11_MANUFACTURING_SELF_TEST_TYPE  eTestType,
    __in                            ULONG                               uTestID,
    __in                            PVOID                               pvContext,
    __out                           BOOLEAN                             *pbResult,
    __out                           ULONG                               *puPinFailedBitMask,
    __out                           ULONG                               *puBytesWrittenOut,
    __in                            ULONG                               uOutBufLen,
    __out_bcount_opt(uOutBufLen)    PUCHAR                              pucOutBuffer
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
\[in\] The context that was specified in the original self-test request.

<span id="pbResult"></span><span id="pbresult"></span><span id="PBRESULT"></span>*pbResult*  
\[out\] The final result of the self-test. **True** if passed, **False** if failed.

<span id="puPinFailedBitMask"></span><span id="pupinfailedbitmask"></span><span id="PUPINFAILEDBITMASK"></span>*puPinFailedBitMask*  
\[out\] The bit mask for adapter pins that failed the test.

<span id="puBytesWrittenOut"></span><span id="pubyteswrittenout"></span><span id="PUBYTESWRITTENOUT"></span>*puBytesWrittenOut*  
\[out\] The number of bytes of optional data returned from the self-test results.

<span id="uOutBufLen"></span><span id="uoutbuflen"></span><span id="UOUTBUFLEN"></span>*uOutBufLen*  
\[in\] The length of the buffer for returning any additional information about the self-test.

<span id="pucOutBuffer"></span><span id="pucoutbuffer"></span><span id="PUCOUTBUFFER"></span>*pucOutBuffer*  
\[out\] The buffer of length *\*puBytesWrittenOut* that provides additional information about the self-test. The value of *\*puBytesWrittenOut* must be less than or equal to the value of *uOutBufLen*.

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


The application must have received a **dot11\_manufacturing\_callback\_self\_test\_complete** callback prior to calling this command. It should also provide the same context value that was used in the original self-test request in order to the get the results for the appropriate self-test request.

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
<td align="left"><p>Returned if the <em>pbResult</em>, <em>puPinFailedBitMask</em>, or <em>puBytesWrittenOut</em> parameter is NULL, or if the test type specified by the <em>eTestType</em> parameter is invalid.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ERROR_INVALID_HANDLE</p></td>
<td align="left"><p>Returned if the <em>hAdapter</em> handle is invalid.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ERROR_OUTOFMEMORY</p></td>
<td align="left"><p>Returned if sufficient memory to perform the operation could not be allocated.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** wifimte.w

## <span id="related_topics"></span>Related topics


[Wi-Fi manufacturing API](wi-fi-manufacturing-api.md)

 

 






