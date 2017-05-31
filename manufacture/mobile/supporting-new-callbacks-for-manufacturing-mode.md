---
author: kpacquer
Description: Supporting new callbacks for manufacturing mode
ms.assetid: c94468fa-4581-4d51-9e48-e751d070db28
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Supporting new callbacks for manufacturing mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supporting new callbacks for manufacturing mode


When running in manufacturing mode, Wi-Fi miniport drivers must add support for the following new callback.

## <span id="NDIS_STATUS_DOT11_MANUFACTURING_CALLBACK"></span><span id="ndis_status_dot11_manufacturing_callback"></span>NDIS\_STATUS\_DOT11\_MANUFACTURING\_CALLBACK


The **NDIS\_STATUS\_DOT11\_MANUFACTURING\_CALLBACK** callback is used to indicate completion status for certain requests. The data structure used for this callback is defined here.

``` syntax
typedef enum _DOT11_MANUFACTURING_CALLBACK_TYPE {
    dot11_manufacturing_callback_unknown = 0,
    dot11_manufacturing_callback_self_test_complete = 1,
    dot11_manufacturing_callback_sleep_complete = 2,
    dot11_manufacturing_callback_IHV_start = 0x80000000,
    dot11_manufacturing_callback_IHV_end = 0xffffffff
} DOT11_MANUFACTURING_CALLBACK_TYPE, * PDOT11_MANUFACTURING_CALLBACK_TYPE;

typedef struct DOT11_MANUFACTURING_CALLBACK_PARAMETERS {
#define DOT11_MANUFACTURING_CALLBACK_REVISION_1  1
    NDIS_OBJECT_HEADER                Header;
    DOT11_MANUFACTURING_CALLBACK_TYPE dot11ManufacturingCallbackType;
    ULONG                             uStatus;
    PVOID                             pvContext;
} DOT11_MANUFACTURING_CALLBACK_PARAMETERS, * PDOT11_MANUFACTURING_CALLBACK_PARAMETERS;
```

<span id="dot11_manufacturing_callback_self_test_complete"></span><span id="DOT11_MANUFACTURING_CALLBACK_SELF_TEST_COMPLETE"></span>**dot11\_manufacturing\_callback\_self\_test\_complete**  
**dot11\_manufacturing\_callback\_self\_test\_complete** is called by the driver when a requested self-test is completed by the driver. This callback must return the context for self-test request as well as the self-test result. The driver then calls the **OID\_DOT11\_MANUFACTURING\_TEST** OID with the **dot11\_manufacturing\_test\_self\_query\_result** command to obtain the detailed result of the test.

<span id="dot11_manufacturing_callback_sleep_complete"></span><span id="DOT11_MANUFACTURING_CALLBACK_SLEEP_COMPLETE"></span>**dot11\_manufacturing\_callback\_sleep\_complete**  
**dot11\_manufacturing\_callback\_sleep\_complete** is called when a requested sleep command is executed by the driver. This callback must return the context for the sleep request as well as the status, whether success or failure. This callback is also called by the driver when the application sends a request to wake the driver from a sleep state.

## <span id="related_topics"></span>Related topics


[Adding Wi-Fi manufacturing test support to the OID interface](adding-wi-fi-manufacturing-test-support-to-the-oid-interface.md)

 

 






