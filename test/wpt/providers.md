---
title: Providers
description: Providers
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2da92ebb-055a-45ff-8da6-7a06f78a8d9e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Providers


Providers are Event Tracing for Windows (ETW) components that expose events to Windows Performance Recorder (WPR). You can use a single system provider and multiple event providers in a profile, including a heap event provider.

## System Providers


A system provider provides kernel events. System providers are defined by using the following:

-   Keywords for the events to be collected.

-   Stacks from which to collect events.

-   Pool tags to indicate the component that made the allocation or the allocation type.

For a description of supported system keywords, see [Keyword (in SystemProvider)](keyword--in-systemprovider-.md).

## Event Providers


You can configure event providers to provide certain types of events (among those that are supported by the provider) by specifying a hexadecimal bitmask keyword. Because providers support different events, there are no string constants for these keywords. Therefore, they must be hexadecimal-style strings.

## Related topics


[WPR Features](wpr-features.md)

[2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md)

 

 







