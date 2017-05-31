---
author: kpacquer
Description: Supporting new OID commands for manufacturing mode
ms.assetid: 0ebb9581-043e-47f8-84c9-6fa97c0900cc
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Supporting new OID commands for manufacturing mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supporting new OID commands for manufacturing mode


When running in manufacturing mode, Wi-Fi miniport drivers must add support for the following new OID commands. The driver should ensure that the device is currently in manufacturing mode prior to calling any of these commands. For more info, see [Determine if MMOS is running](determine-if-mmos-is-running.md). Some of the parameters specified in the API may be IHV-specific.

## <span id="OID_DOT11_MANUFACTURING_TEST"></span><span id="oid_dot11_manufacturing_test"></span>OID\_DOT11\_MANUFACTURING\_TEST


OID\_DOT11\_MANUFACTURING\_TEST is called as a method request in the driver to perform a specific test. This OID should never be used during normal operation.

``` syntax
typedef struct _DOT11_MANUFACTURING_TEST {
    DOT11_MANUFACTURING_TEST_TYPE dot11ManufacturingTestType;
    ULONG uBufferLength;
    UCHAR ucBuffer[1];
} DOT11_MANUFACTURING_TEST, * PDOT11_MANUFACTURING_TEST;
```

<span id="dot11ManufacturingTestType"></span><span id="dot11manufacturingtesttype"></span><span id="DOT11MANUFACTURINGTESTTYPE"></span>*dot11ManufacturingTestType*  
\[in\] Specifies the manufacturing test to be run. The data type for this member is one of the values of the **DOT11\_MANUFACTURING\_TEST\_TYPE** enumeration.

The DOT11 manufacturing test type enumeration is defined as follows:

``` syntax
typedef enum _DOT11_MANUFACTURING_TEST_TYPE {
    dot11_manufacturing_test_unknown = 0,
    dot11_manufacturing_test_self_start = 1,
    dot11_manufacturing_test_self_query_result = 2,
    dot11_manufacturing_test_rx = 3,
    dot11_manufacturing_test_tx = 4,
    dot11_manufacturing_test_set_data = 5,
    dot11_manufacturing_test_query_data = 6,
    dot11_manufacturing_test_sleep = 7,
    dot11_manufacturing_test_awake = 8,
    dot11_manufacturing_test_IHV_start = 0x80000000,
    dot11_manufacturing_test_IHV_end = 0xffffffff
} DOT11_MANUFACTURING_TEST_TYPE, * PDOT11_MANUFACTURING_TEST_TYPE;
```

<span id="uBufferLength"></span><span id="ubufferlength"></span><span id="UBUFFERLENGTH"></span>*uBufferLength*  
\[in\] The length, in bytes, of the **DOT11\_MANUFACTURING\_TEST** structure and any additional data specific to the test appended at the end.

<span id="ucBuffer"></span><span id="ucbuffer"></span><span id="UCBUFFER"></span>*ucBuffer*  
\[in\] The buffer containing optional data as specified by the **dot11DiagnosticsTestType** member.

## <span id="dot11_manufacturing_test_self_start"></span><span id="DOT11_MANUFACTURING_TEST_SELF_START"></span>dot11\_manufacturing\_test\_self\_start


The **dot11\_manufacturing\_test\_self\_start** command is called to request the driver to test WLAN IC connectivity, FEM IC connectivity, or the WLAN-BT coexistence interface.

**DOT11\_DIAGNOSTIC\_SELF\_TEST\_BT\_COEXISTENCE** is only applicable if the WLAN and Bluetooth chips are on separate ICs. If they are on the same module, this test is not supported and the miniport should return **NDIS\_STATUS\_NOT\_SUPPORTED**.

When called, the driver should run the requested tests as defined in the **DOT11\_MANUFACTURING\_SELF\_TEST\_SET\_PARAMS** structure and return success when the tests have been started. On completion, whether the tests have succeeded or failed, the driver should indicate the test status by using the **NDIS\_STATUS\_DOT11\_MANUFACTURING\_CALLBACK** callback handler, with the *dot11ManufacturingCallbackType* set to **dot11\_manufacturing\_callback\_self\_test\_complete** and the status describing the result of the test. The driver will then call the **OID\_DOT11\_MANUFACTURING\_TEST** oid with the **dot11\_manufacturing\_test\_self\_query\_result** command to query the detailed result of the test.

``` syntax
typedef struct _DOT11_MANUFACTURING_SELF_TEST_SET_PARAMS {
    DOT11_MANUFACTURING_SELF_TEST_TYPE SelfTestType;
    ULONG uTestID;
    ULONG uPinBitMask;
    PVOID pvContext;
    ULONG uBufferLength;
    UCHAR ucBufferIn[1];
} DOT11_MANUFACTURING_SELF_TEST_SET_PARAMS, *PDOT11_MANUFACTURING_SELF_TEST_SET_PARAMS;
```

<span id="SelfTestType"></span><span id="selftesttype"></span><span id="SELFTESTTYPE"></span>*SelfTestType*  
\[in\] Specifies the type of self-test to be run by the driver. The data type for this member is the **DOT11\_MANUFACTURING\_SELF\_TEST\_TYPE** enumeration with one of the following values:

<span id="DOT11_MANUFACTURING_SELF_TEST_INTERFACE"></span><span id="dot11_manufacturing_self_test_interface"></span>**DOT11\_MANUFACTURING\_SELF\_TEST\_INTERFACE**  
-   Control and data interface to WLAN

-   Clock request

-   Sleep clock

-   Interrupt and power supply lines

-   All related connections

<span id="DOT11_MANUFACTURING_SELF_TEST_RF_INTERFACE"></span><span id="dot11_manufacturing_self_test_rf_interface"></span>**DOT11\_MANUFACTURING\_SELF\_TEST\_RF\_INTERFACE**  
-   Control and RF interface to FEM IC

-   FEM power supply

-   Transmit signal on loopback path from TX interface to RX interface and validate.

<span id="DOT11_MANUFACTURING_SELF_TEST_BT_COEXISTENCE"></span><span id="dot11_manufacturing_self_test_bt_coexistence"></span>**DOT11\_MANUFACTURING\_SELF\_TEST\_BT\_COEXISTENCE**  
-   Set line states from Bluetooth side and read line states from WLAN side

-   Verify each pin’s state

<span id="uTestID"></span><span id="utestid"></span><span id="UTESTID"></span>*uTestID*  
\[in\] ID of the test to be run.

<span id="uPinBitMask"></span><span id="upinbitmask"></span><span id="UPINBITMASK"></span>*uPinBitMask*  
\[in\] Bit mask of pins to be tested.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in\] The context value to be returned to the application by using **dot11\_manufacturing\_callback\_self\_test\_complete callback** when the driver has completed the tests.

<span id="uBufferLength"></span><span id="ubufferlength"></span><span id="UBUFFERLENGTH"></span>*uBufferLength*  
\[in, optional\] The length of the buffer containing additional input for the self-test.

<span id="ucBufferIn"></span><span id="ucbufferin"></span><span id="UCBUFFERIN"></span>*ucBufferIn*  
\[in, optional\] The buffer that contains additional input for the self-test.

## <span id="dot11_manufacturing_test_self_query_result"></span><span id="DOT11_MANUFACTURING_TEST_SELF_QUERY_RESULT"></span>dot11\_manufacturing\_test\_self\_query\_result


This command gets the results of a previously requested self-test. It should only be called when the driver has indicated that the self-test is complete by using the **NDIS\_STATUS\_DOT11\_MANUFACTURING\_CALLBACK** with the *dot11ManufacturingCallbackType* set to **dot11\_manufacturing\_callback\_self\_test\_complete** and the status describing the result of the test.

``` syntax
typedef struct _DOT11_MANUFACTURING_SELF_TEST_QUERY_RESULTS {
    DOT11_MANUFACTURING_SELF_TEST_TYPE SelfTestType;
    ULONG uTestID;
    BOOLEAN bResult;                    // PASS/FAIL
    ULONG uPinFailedBitMask;            // Detected PIN faults
    PVOID pvContext;
    ULONG uBytesWrittenOut;
    UCHAR ucBufferOut[1];               // Additional output from self-test (optional)
} DOT11_MANUFACTURING_SELF_TEST_QUERY_RESULTS, *PDOT11_MANUFACTURING_SELF_TEST_QUERY_RESULTS;
```

<span id="SelfTestType"></span><span id="selftesttype"></span><span id="SELFTESTTYPE"></span>*SelfTestType*  
\[in\] Specifies the type of self-test whose result is being queried. The data type for this member is the **DOT11\_MANUFACTURING\_SELF\_TEST\_TYPE** enumeration.

<span id="uTestID"></span><span id="utestid"></span><span id="UTESTID"></span>*uTestID*  
\[in\] ID of the test to be run.

<span id="bResult"></span><span id="bresult"></span><span id="BRESULT"></span>*bResult*  
\[out\] The result of the test. **True** if the test passed, **False** if it failed.

<span id="uPinFailedBitMask"></span><span id="upinfailedbitmask"></span><span id="UPINFAILEDBITMASK"></span>*uPinFailedBitMask*  
\[out\] The bit mask of any detected PIN faults.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in\] The context used when the driver indicated that the tests were complete.

<span id="uBytesWrittenOut"></span><span id="ubyteswrittenout"></span><span id="UBYTESWRITTENOUT"></span>*uBytesWrittenOut*  
\[out\] The length of the buffer that contains any additional returned output from the self-test.

<span id="ucBufferOut"></span><span id="ucbufferout"></span><span id="UCBUFFEROUT"></span>*ucBufferOut*  
\[in, out, optional\] The buffer of length *uBytesWrittenOut* that contains additional output from the self-test.

## <span id="dot11_manufacturing_test_rx"></span><span id="DOT11_MANUFACTURING_TEST_RX"></span>dot11\_manufacturing\_test\_rx


The **dot11\_manufacturing\_test\_rx** read-only command tests and verifies that there is connectivity between the antenna port and WLAN IC.

To test this connectivity, a signal generator generates a non-modulated carrier wave (CW) at a certain frequency and power that will be measured and returned by the device under test (DUT). If the band and/or channel setting are inconsistent, then the driver returns **STATUS\_INVALID\_PARAMETER**.

``` syntax
typedef struct _DOT11_MANUFACTURING_FUNCTIONAL_TEST_RX {
    BOOLEAN bEnabled;
    DOT11_BAND Dot11Band;
    ULONG uChannel;
    LONG  PowerLevel;
} DOT11_MANUFACTURING_FUNCTIONAL_TEST_RX, * PDOT11_MANUFACTURING_FUNCTIONAL_TEST_RX;
```

<span id="bEnabled"></span><span id="benabled"></span><span id="BENABLED"></span>*bEnabled*  
\[out\] **True** if the driver detected a signal at the specified band and channel. **False** if no signal was detected.

<span id="Dot11Band"></span><span id="dot11band"></span><span id="DOT11BAND"></span>*Dot11Band*  
\[in\] The band on which the signal is to be detected.

<span id="uChannel"></span><span id="uchannel"></span><span id="UCHANNEL"></span>*uChannel*  
\[in\] The channel on which the signal is to be detected. The channel range depends on the band and supported PHYs.

<span id="PowerLevel"></span><span id="powerlevel"></span><span id="POWERLEVEL"></span>*PowerLevel*  
\[out\] The power level of the received signal detected at the antenna, returned as the RSSI measured in dBm. This is valid only if *bEnabled* is **True**.

## <span id="dot11_manufacturing_test_tx"></span><span id="DOT11_MANUFACTURING_TEST_TX"></span>dot11\_manufacturing\_test\_tx


The **dot11\_manufacturing\_test\_tx** set-only command validates the connection from the chipset to the FEM output.

To perform this test, a signal analyzer is physically connected to the antenna port and the DUT is requested to transmit a CW with specific band, channel, and power level settings. The driver also measures its own ADC reading for the transmitted signal and returns it to the application.

``` syntax
typedef struct _DOT11_MANUFACTURING_FUNCTIONAL_TEST_TX {
    BOOLEAN bEnable;
    BOOLEAN bOpenLoop;
    DOT11_BAND Dot11Band;
    ULONG uChannel;
    ULONG uSetPowerLevel;
    LONG  ADCPowerLevel;
} DOT11_MANUFACTURING_FUNCTIONAL_TEST_TX, * PDOT11_MANUFACTURING_FUNCTIONAL_TEST_TX;
```

<span id="bEnable"></span><span id="benable"></span><span id="BENABLE"></span>*bEnable*  
\[in\] If set, this command enables transmission. If not set, transmission at the specified band and channel are disabled.

<span id="bOpenLoop"></span><span id="bopenloop"></span><span id="BOPENLOOP"></span>*bOpenLoop*  
\[in\] If set to **true**, this parameter indicates that the driver is requested to use an open loop power control and return the read signal value in *ADCPowerLevel*. If set to **false**, the driver will not use an open loop power control.

If this value is set and the hardware does not support open loop power control, the driver returns **NDIS\_STATUS\_NOT\_SUPPORTED**.

<span id="Dot11Band"></span><span id="dot11band"></span><span id="DOT11BAND"></span>*Dot11Band*  
\[in\] The band on which the signal is to be transmitted.

<span id="uChannel"></span><span id="uchannel"></span><span id="UCHANNEL"></span>*uChannel*  
\[in\] The channel on which the signal is to be transmitted. The channel range depends on the band and supported PHYs.

<span id="uSetPowerLevel"></span><span id="usetpowerlevel"></span><span id="USETPOWERLEVEL"></span>*uSetPowerLevel*  
\[in\] The power level of the transmitted signal. This is returned as a percentage of the maximum possible power level.

<span id="ADCPowerLevel"></span><span id="adcpowerlevel"></span><span id="ADCPOWERLEVEL"></span>*ADCPowerLevel*  
\[out, optional\] The current signal level detected at the antenna, returned as a RAW value. The interpretation of this value is specified by the IHV.

This must be set if *bOpenLoop* is **True** and the hardware supports it.

## <span id="dot11_manufacturing_test_set_data"></span><span id="DOT11_MANUFACTURING_TEST_SET_DATA"></span>dot11\_manufacturing\_test\_set\_data


The **dot11\_manufacturing\_test\_set\_data** set-only command enables the application to write data at a specific location.

``` syntax
typedef struct _DOT11_MANUFACTURING_TEST_SET_DATA {
    ULONG uKey;
    ULONG uOffset;
    ULONG uBufferLength;
    UCHAR ucBufferIn[1];
} DOT11_MANUFACTURING_TEST_SET_DATA, * PDOT11_MANUFACTURING_TEST_SET_DATA;
```

<span id="uKey"></span><span id="ukey"></span><span id="UKEY"></span>*uKey*  
\[in\] The key is IHV specific and can be either a reference to a specific register or an entry from a named table.

<span id="uOffset"></span><span id="uoffset"></span><span id="UOFFSET"></span>*uOffset*  
\[in\] The offset within the data.

<span id="uBufferLength"></span><span id="ubufferlength"></span><span id="UBUFFERLENGTH"></span>*uBufferLength*  
\[in\] The number of data bytes to be contained in the buffer of additional test data.

<span id="ucBufferIn"></span><span id="ucbufferin"></span><span id="UCBUFFERIN"></span>ucBufferIn  
\[in\] The buffer containing the additional test data of length *uBufferLength*.

## <span id="dot11_manufacturing_test_query_data"></span><span id="DOT11_MANUFACTURING_TEST_QUERY_DATA"></span>dot11\_manufacturing\_test\_query\_data


The **dot11\_manufacturing\_test\_query\_data** command enables the application to read data at a specific location.

``` syntax
typedef struct _DOT11_MANUFACTURING_TEST_QUERY_DATA {
    ULONG uKey;
    ULONG uOffset;
    ULONG uBufferLength;
    ULONG uBytesRead;
    UCHAR ucBufferOut[1];
} DOT11_MANUFACTURING_TEST_QUERY_DATA, * PDOT11_MANUFACTURING_TEST_QUERY_DATA;
```

<span id="uKey"></span><span id="ukey"></span><span id="UKEY"></span>*uKey*  
\[in\] The key is IHV specific and can be either a reference to a specific register or an entry from a named table.

<span id="uOffset"></span><span id="uoffset"></span><span id="UOFFSET"></span>*uOffset*  
\[in\] The offset within the data.

<span id="uBufferLength"></span><span id="ubufferlength"></span><span id="UBUFFERLENGTH"></span>*uBufferLength*  
\[in\] The number of data bytes to be read in the buffer.

<span id="uBytesRead"></span><span id="ubytesread"></span><span id="UBYTESREAD"></span>uBytesRead  
\[out\] The actual number of data bytes read by the driver.

<span id="ucBufferOut"></span><span id="ucbufferout"></span><span id="UCBUFFEROUT"></span>ucBufferOut  
\[out\] Contains the data read by the driver.

## <span id="dot11_manufacturing_test_sleep"></span><span id="DOT11_MANUFACTURING_TEST_SLEEP"></span>dot11\_manufacturing\_test\_sleep


The **dot11\_manufacturing\_test\_sleep** command instructs the Wi-Fi chipset to go into its lowest power state, for either a specified time or indefinitely.

For this test, all radios should be turned off and the Wi-Fi chipset should be powered off. The test verifies that Wi-Fi can enter the sleep state, that the current consumption is within the specified limits, and that there is no current drawn when Wi-Fi is switched off.

The driver can be awakened from the sleep state at any time by using the **dot11\_manufacturing\_test\_awake** command. If the sleep time-out is set to −1, the driver should sleep indefinitely unless asked to wake up by using **dot11\_manufacturing\_test\_awake**. When the driver wakes up, either due to the time-out expiring or as a result of the awake command, it should indicate its awake status by using the **NDIS\_STATUS\_DOT11\_MANUFACTURING\_CALLBACK** callback handler with the *dot11ManufacturingCallbackType* set to **dot11\_manufacturing\_callback\_sleep\_complete**.

``` syntax
typedef struct _DOT11_MANUFACTURING_TEST_SLEEP {
    ULONG uSleepTime;
    PVOID pvContext;
} DOT11_MANUFACTURING_TEST_SLEEP, * PDOT11_MANUFACTURING_TEST_SLEEP;
```

<span id="uSleepTime"></span><span id="usleeptime"></span><span id="USLEEPTIME"></span>*uSleepTime*  
\[in\] The amount of time for the driver to sleep, in milliseconds. If set to −1, the driver enters sleep state until awakened by using the **dot11\_manufacturing\_test\_awake** command.

<span id="pvContext"></span><span id="pvcontext"></span><span id="PVCONTEXT"></span>*pvContext*  
\[in\] The context used when the driver returns the test completion state to the application by using **dot11\_manufacturing\_callback\_sleep\_complete**.

## <span id="dot11_manufacturing_test_awake"></span><span id="DOT11_MANUFACTURING_TEST_AWAKE"></span>dot11\_manufacturing\_test\_awake


The **dot11\_manufacturing\_test\_awake** command causes the Wi-Fi chipset to wake up from its lowest-power sleep state. The driver returns **STATUS\_INVALID\_PARAMETER** if this command is sent when the chipset is already awake.

## <span id="related_topics"></span>Related topics


[Adding Wi-Fi manufacturing test support to the OID interface](adding-wi-fi-manufacturing-test-support-to-the-oid-interface.md)

 

 






