---
author: kpacquer
Description: Supporting updated OID behavior in manufacturing mode
ms.assetid: 1ae614a7-fbf9-4c3b-834e-d62d7f7ab352
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Supporting updated OID behavior in manufacturing mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supporting updated OID behavior in manufacturing mode


When running in manufacturing mode, Wi-Fi miniport drivers must add support for the following updated OIDs.

## <span id="OID_DOT11_OPERATION_MODE_CAPABILITY"></span><span id="oid_dot11_operation_mode_capability"></span>OID\_DOT11\_OPERATION\_MODE\_CAPABILITY


The **OID\_DOT11\_OPERATION\_MODE\_CAPABILITY** command is called in query mode to return the list of operation modes supported by the driver. This command functions as previously documented, but drivers are now required to support a new operation mode, **DOT11\_OPERATION\_MODE\_MANUFACTURING**, which is the context in which manufacturing operations are performed. For complete documentation of this OID, see [OID\_DOT11\_OPERATION\_MODE\_CAPABILITY](http://msdn.microsoft.com/library/ff569396.aspx) on MSDN.

``` syntax
#define DOT11_OPERATION_MODE_UNKNOWN            0x00000000
#define DOT11_OPERATION_MODE_STATION            0x00000001
#define DOT11_OPERATION_MODE_AP                 0x00000002
#define DOT11_OPERATION_MODE_EXTENSIBLE_STATION 0x00000004
#define DOT11_OPERATION_MODE_EXTENSIBLE_AP      0x00000008
#define DOT11_OPERATION_MODE_WFD_DEVICE         0x00000010
#define DOT11_OPERATION_MODE_WFD_GROUP_OWNER    0x00000020
#define DOT11_OPERATION_MODE_WFD_CLIENT         0x00000040
#define DOT11_OPERATION_MODE_MANUFACTURING      0x40000000
#define DOT11_OPERATION_MODE_NETWORK_MONITOR    0x80000000

typedef struct _DOT11_OPERATION_MODE_CAPABILITY {
    ULONG uReserved;
    ULONG uMajorVersion;
    ULONG uMinorVersion;
    ULONG uNumOfTXBuffers;
    ULONG uNumOfRXBuffers;
    ULONG uOpModeCapability;
} DOT11_OPERATION_MODE_CAPABILITY, * PDOT11_OPERATION_MODE_CAPABILITY;
```

## <span id="OID_DOT11_CURRENT_OPERATION_MODE"></span><span id="oid_dot11_current_operation_mode"></span>OID\_DOT11\_CURRENT\_OPERATION\_MODE


The **OID\_DOT11\_CURRENT\_OPERATION\_MODE** command can be called in either set or query mode to configure or return the driver’s current operation mode.

This command functions as previously documented, but the driver is now required to support the **DOT11\_OPERATION\_MODE\_MANUFACTURING** operation mode. For complete documentation of this OID, see [OID\_DOT11\_CURRENT\_OPERATION\_MODE](https://msdn.microsoft.com/library/windows/hardware/ff569132) on MSDN.

``` syntax
typedef struct _DOT11_CURRENT_OPERATION_MODE {
    ULONG uReserved;
    ULONG uCurrentOpMode;
} DOT11_CURRENT_OPERATION_MODE, * PDOT11_CURRENT_OPERATION_MODE; 
```

<span id="uCurrentOpMode"></span><span id="ucurrentopmode"></span><span id="UCURRENTOPMODE"></span>*uCurrentOpMode*  
\[in\] Specifies the driver operation mode to be set. This parameter also functions as a placeholder for the driver to return the operation mode when called in query mode. If the driver does not support the requested operation mode, it should return **NDIS\_STATUS\_BAD\_VERSION**.

## <span id="related_topics"></span>Related topics


[Adding Wi-Fi manufacturing test support to the OID interface](adding-wi-fi-manufacturing-test-support-to-the-oid-interface.md)

 

 






