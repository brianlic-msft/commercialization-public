---
author: kpacquer
Description: Reporting operating mode capabilities
ms.assetid: 1beda5a7-63d7-4519-955c-cc240733fc49
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Reporting operating mode capabilities
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Reporting operating mode capabilities


If a Wi-Fi driver supports running in manufacturing mode, it should add manufacturing mode to its list of supported capabilities. You can query the supported operation mode capabilities by using the **OID\_DOT11\_OPERATION\_MODE\_CAPABILITY** command, which will return information on the operation modes supported by the driver. For more info about **OID\_DOT11\_OPERATION\_MODE\_CAPABILITY**, see [Supporting updated OID behavior in manufacturing mode](supporting-updated-oid-behavior-in-manufacturing-mode.md).

To switch the driver’s operation mode to manufacturing mode, use the **OID\_DOT11\_CURRENT\_OPERATION\_MODE** command to ensure that manufacturing testing will not conflict with the driver’s behavior in any of its other modes. For more info about **OID\_DOT11\_CURRENT\_OPERATION\_MODE**, see [Supporting updated OID behavior in manufacturing mode](supporting-updated-oid-behavior-in-manufacturing-mode.md).

## <span id="related_topics"></span>Related topics


[Adding Wi-Fi manufacturing test support to the OID interface](adding-wi-fi-manufacturing-test-support-to-the-oid-interface.md)

 

 






