---
title: Optimization
description: The optmization process for a Modern Standby system follows the same patterns used in optimizing a Windows 8.1 Connected Standby system. You can find detailed recommendations here on MSDN.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D1B34D5D-E122-4897-8DCD-2EB2F07481B9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Optimization


The optmization process for a Modern Standby system follows the same patterns used in optimizing a Windows 8.1 Connected Standby system. You can find detailed recommendations here on [MSDN](http://msdn.microsoft.com/library/windows/hardware/dn495353.aspx).

## Adaptive idle usage


The new adaptive idle timeout algorithm, introduced in Windows 10, balances power consumption with device reliability from a host-perspective. It applies only to storage devices reporting a seek penalty and will only be active if the respective miniport driver opts in to this capability. StorAHCI.sys (inbox driver) automatically enables this.

Since rotating media can only withstand a finite number of load/unload cycles – which are caused by power state transitions from D0 to D3 and back – the host will attempt to average no more than one power state transition per 5-minute interval, by default.

This means, if a device has been powered off (D3) for a long period of time (for example 30 minutes), then you could expect the next power state transition from D0 to D3 to be very fast, since the host built up "credit" and the average would still be well below one transition per 5 minutes.

On the other hand, if the device has been power cycled more frequently than once per 5 minutes, the host will delay the next transition from D0 to D3 by as much as 5 minutes in an attempt to return to the target average over time.

A miniport driver can opt-in to this behavior:

-   Register a [**STOR\_POFX\_DEVICE\_V3**](https://msdn.microsoft.com/library/windows/hardware/dn931828) with [**StorPortInitializePoFxPower**](https://msdn.microsoft.com/library/windows/hardware/hh920421) in the ScsiUnitPoFxPowerInfo unit control callback.

-   Set the STOR\_POFX\_DEVICE\_FLAG\_ADAPTIVE\_D3\_IDLE\_TIMEOUT flag in the **Flags** member of the [**STOR\_POFX\_DEVICE\_V3**](https://msdn.microsoft.com/library/windows/hardware/dn931828) structure.

-   Set the **MinimumPowerCyclePeriodInMS** member in the [**STOR\_POFX\_DEVICE\_V3**](https://msdn.microsoft.com/library/windows/hardware/dn931828) structure to the value that indicates, in the worst case, how often the device can be power cycled. Units are in milliseconds. We recommend this be at least 5 minutes (i.e. the device should not be power cycled more than once every 5 minutes).

 

 






