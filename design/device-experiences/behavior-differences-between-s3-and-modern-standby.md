---
title: Behavior differences between S3 and Modern Standby
description: Describes the differences between S3 and Modern Standby, including technical differences, AC power over battery power, wake patterns, and wake events.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A6AD6549-2C26-491A-93A9-977028B1F8C4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Behavior differences between S3 and Modern Standby


## Technical differences


Connected and disconnected Modern Standby states transitions follow a very similar code flow. The biggest difference is maintaining network connection. When a system goes into disconnected Standby state, it enters DRIPS, just like with the connected state. The primary difference is that it stops Wi-Fi traffic if a rotational HDD or NIC that is not capable of offload support is detected.

When in the lowest power state, systems may look very similar to systems in the S3 state—processors are powered off, memory is in self-refresh. The difference is in the path of how it enters and exits low power state. For S3 systems, the system is either active or in S3. For Modern Standby, the transition from the active to the low power state is a series of steps to lower power consumption. Components are powered [down](device-specific-power-management-for-modern-standby.md) when they are not in use. So, the transition into and out of a lower power state is much quicker on a Modern Standby system than on an S3 system. This design also helps with the speed of entry and exit from Standby as it doesn’t require firmware interactions.

## AC power vs. battery power


Modern Standby systems are capable to go into maintenance [mode](http://msdn.microsoft.com/library/windows/desktop/jj835985.aspx) while on AC power. If a maintenance task occurs while on AC power, networks would connect, allowing for updates and other activities to occur.

## Wake patterns while in DRIPS


Windows 8.1 Connected Standby systems wake up at least once every 30 seconds from DRIPS to process work.

Windows 10 is optimized to deliver longer battery life by postponing non-critical work and removing unnecessary wakeups during Modern Standby, particularly when the system is operating on battery power. Device interrupts continue to operate as normal to allow incoming instant messages, notifications, phone calls, etc. Some timers are postponed indefinitely until the system is awake or plugged into AC power to reduce the amount of power consumed by processing non-critical work when the system is “asleep”.

## Wake events


Modern Standby systems have the same wake capabilities as Windows 8.1 Connected Standby systems based on events. Wake capabilities make it easier to support a wider range of wake scenarios such as wake-on-Bluetooth device events.

The use of legacy wake events are possible, however it would require the ability to arm a device for wake when going into a D3 state. For example, a wake on LAN would be expected to work the same way on a Connected Standby, Modern Standby and S3 system.

For more information on wake support, see [Modern standby wake sources](modern-standby-wake-sources.md).

 

 






