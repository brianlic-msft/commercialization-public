---
title: Basic functionality and reliability testing
description: Describes the basic functionality and reliability testing that you can perform on a Modern Standby system.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A0F97D32-19B0-49EF-9234-8A13C5778BD7
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Basic functionality and reliability testing


The recommended test scenarios for Windows 8.1 Connected Standby that are also valid on Modern Standby are available on [MSDN](modern-standby-basic-test-scenarios.md).

## Expected network behavior


When a system enters disconnected standby, no patterns are configured for wake across LAN, WiFi, or Mobile broadband. A media disconnect is sent to WiFi and Mobile Broadband parts.

## Storage reliability


In order to test for the impact of Modern Standby on rotational device reliability, you can following these general guidance:

1.  Query the current count of Load/Unload Cycles on the rotational device.
    1.  You can do this through PowerShell and the `Get-StorageReliabilityCounter` cmdlet, which has a field called: `LoadUnloadCycleCount`
    2.  `Get-PhysicalDisk | Get-StorageReliabilityCounter | fl`

2.  Execute a connected or disconnected Standby workload typical for your target customer or audience.
3.  After the system exits Modern Standby, requery the Load/Unload cycle count.

By dividing the change in Load/Unload cycles by the time spent in Modern Standby, you can compute a ratio of Load/Unload cycles per time period. As an example, for a device spec’ed with a maximum of 600,000 Load/Unload cycles to reach a 5 year warranty, no more than 120,000 cycles can be incurred per year. This comes to a ratio of ~0.23 Load/Unload cycles per minute that the system should not exceed.

**Note**  Different systems are targeted for many different audiences and usage patterns. Therefore, it is the OEM’s responsibility to ensure the connected or disconnected Modern Standby system (they build) can handle the expected usage patterns.

 

When a system enters disconnected standby, no patterns are configured for wake across LAN, WiFi, or Mobile broadband. A media disconnect is sent to WiFi and Mobile Broadband parts.

 

 






