---
author: kpacquer
Description: Supporting existing OID commands in manufacturing mode
ms.assetid: 8b26ab8e-00b8-4f4c-a7c5-8fca4c5b1e3f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Supporting existing OID commands in manufacturing mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supporting existing OID commands in manufacturing mode


When running in manufacturing mode, Wi-Fi miniport drivers must add support for the following existing OIDs.

## <span id="OID_GEN_SUPPORTED_GUIDS"></span><span id="oid_gen_supported_guids"></span>OID\_GEN\_SUPPORTED\_GUIDS


The **OID\_GEN\_SUPPORTED\_GUIDS** command is called in query mode to return the set of supported GUIDS. For complete documentation, see [OID\_GEN\_SUPPORTED\_GUIDS](http://msdn.microsoft.com/library/ff569641.aspx) on MSDN.

**Note**  
This OID is typically called for compatibility purposes. The driver can choose to ignore it, if desired, and return **NDIS\_STATUS\_NOT\_SUPPORTED** instead.

 

## <span id="OID_GEN_VENDOR_ID"></span><span id="oid_gen_vendor_id"></span>OID\_GEN\_VENDOR\_ID


The **OID\_GEN\_VENDOR\_ID** command is called in query mode to return the 3-byte IEEE-registered vendor code followed by a single byte assigned by the vendor that identifies a particular NIC. For complete documentation, see [OID\_GEN\_VENDOR\_ID](http://msdn.microsoft.com/library/ff569651.aspx) on MSDN.

## <span id="OID_GEN_VENDOR_DESCRIPTION"></span><span id="oid_gen_vendor_description"></span>OID\_GEN\_VENDOR\_DESCRIPTION


The **OID\_GEN\_VENDOR\_DESCRIPTION** command is called in query mode to return a NULL-terminated string that describes the NIC in ANSI format. For complete documentation, see [OID\_GEN\_VENDOR\_DESCRIPTION](http://msdn.microsoft.com/library/ff569649.aspx) on MSDN.

## <span id="OID_GEN_CURRENT_LOOKAHEAD"></span><span id="oid_gen_current_lookahead"></span>OID\_GEN\_CURRENT\_LOOKAHEAD


The **OID\_GEN\_CURRENT\_LOOKAHEAD** command is called in set mode to specify the number of bytes of received packet data to be sent to the protocol driver. For complete documentation, see [OID\_GEN\_CURRENT\_LOOKAHEAD](http://msdn.microsoft.com/library/ff569574.aspx) on MSDN.

**Note**  
This OID is typically called for compatibility purposes. The driver can choose to ignore it, if desired, and return **NDIS\_STATUS\_NOT\_SUPPORTED** instead.

 

## <span id="OID_PM_ADD_WOL_PATTERN"></span><span id="oid_pm_add_wol_pattern"></span>OID\_PM\_ADD\_WOL\_PATTERN


The **OID\_PM\_ADD\_WOL\_PATTERN** command is called in set mode to specify the WOL pattern. For complete documentation, see [OID\_PM\_ADD\_WOL\_PATTERN](http://msdn.microsoft.com/library/ff569764.aspx) on MSDN.

**Note**  
This OID is typically called for compatibility purposes. The driver can choose to ignore it, if desired, and return **NDIS\_STATUS\_NOT\_SUPPORTED** instead.

 

## <span id="OID_DOT11_RESET_REQUEST"></span><span id="oid_dot11_reset_request"></span>OID\_DOT11\_RESET\_REQUEST


The **OID\_DOT11\_RESET\_REQUEST** command is called in query mode to return the IEEE MAC address used by the driver. For complete documentation, see [OID\_DOT11\_RESET\_REQUEST](http://msdn.microsoft.com/library/ff569409.aspx) on MSDN.

## <span id="OID_DOT11_CURRENT_ADDRESS"></span><span id="oid_dot11_current_address"></span>OID\_DOT11\_CURRENT\_ADDRESS


The **OID\_DOT11\_CURRENT\_ADDRESS** command is called in query mode to return the IEEE MAC address used by the driver. For complete documentation, see [OID\_DOT11\_CURRENT\_ADDRESS](http://msdn.microsoft.com/library/ff569125.aspx) on MSDN.

## <span id="OID_DOT11_SUPPORTED_PHY_TYPES"></span><span id="oid_dot11_supported_phy_types"></span>OID\_DOT11\_SUPPORTED\_PHY\_TYPES


The **OID\_DOT11\_SUPPORTED\_PHY\_TYPES** command is called in query mode to request the list of PHY types supported by the 802.11 station. For complete documentation, see [OID\_DOT11\_SUPPORTED\_PHY\_TYPES](http://msdn.microsoft.com/library/ff569426.aspx) on MSDN.

## <span id="OID_DOT11_CURRENT_PHY_ID"></span><span id="oid_dot11_current_phy_id"></span>OID\_DOT11\_CURRENT\_PHY\_ID


The **OID\_DOT11\_CURRENT\_PHY\_ID** command is called in set mode to set the current PHY ID. For complete documentation, see [OID\_DOT11\_CURRENT\_PHY\_ID](http://msdn.microsoft.com/library/ff569135.aspx) on MSDN.

## <span id="OID_DOT11_HARDWARE_PHY_STATE"></span><span id="oid_dot11_hardware_phy_state"></span>OID\_DOT11\_HARDWARE\_PHY\_STATE


The **OID\_DOT11\_HARDWARE\_PHY\_STATE** command is called in query mode to return the PHY power state. For complete documentation, see [OID\_DOT11\_HARDWARE\_PHY\_STATE](http://msdn.microsoft.com/library/ff569370.aspx) on MSDN.

## <span id="OID_DOT11_NIC_POWER_STATE"></span><span id="oid_dot11_nic_power_state"></span>OID\_DOT11\_NIC\_POWER\_STATE


The **OID\_DOT11\_NIC\_POWER\_STATE** command is called in query mode to return the NIC power state. For complete documentation, see [OID\_DOT11\_NIC\_POWER\_STATE](http://msdn.microsoft.com/library/ff569392.aspx) on MSDN.

## <span id="related_topics"></span>Related topics


[Adding Wi-Fi manufacturing test support to the OID interface](adding-wi-fi-manufacturing-test-support-to-the-oid-interface.md)

 

 






