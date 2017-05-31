---
title: Ethernet
description: Ethernet
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 736BECD8-6CD6-4156-933A-33FF49E00575
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Ethernet


## Hardware


This topic covers recommendations for Ethernet in Windows 10. Due to potential mechanical design limitations, an Ethernet is considered optional on a tablet form factor. However, if implemented, the platform must provide a power gating option to reduce the power consumption of the integrated Ethernet chip.

## Wake-On-Lan (WOL)


The default shutdown behavior puts the system into [Hybrid Shutdown (S4)](http://msdn.microsoft.com/library/windows/desktop/aa373229.aspx) and all devices into the lowest power state [(D3)](http://msdn.microsoft.com/library/aa932261.aspx). In Hybrid Shutdown, user sessions are shut down while the contents of the kernel sessions are written to the disk, enabling faster startup.

WOL wakes the PC from a low power state when a network adapter detects a WOL event (typically, a specially constructed Ethernet packet). Remote wake from Hybrid Shutdown (S4) or Classic Shutdown (S5) is unsupported because Network Interface Cards (NICs) are explicitly not armed for wake in both the Classic (S5) and Hybrid Shutdown (S4) cases. Users expect zero power consumption and battery drain in both Shutdown states. This behavior removes the possibility of spurious wakes when explicit shutdown was requested.

In summary:

-   Wake-On-LAN is only supported from Sleep (S3) or Hibernate (S4) states.
-   Wake-On-LAN is not supported from Classic Shutdown (S5) or Hybrid Shutdown (S4) states.

## Related topics


[System Power Actions](http://msdn.microsoft.com/library/windows/hardware/ff564553)

[USB Remote NDIS Devices and Windows](http://msdn.microsoft.com/windows/hardware/gg463298.aspx)

 

 







