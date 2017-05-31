---
title: Implementing Top-Level Collections in Multi-touch Devices
description: Implementing Top-Level Collections in Multi-touch Devices
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: DE4C02D5-7129-4919-B652-B020CFFD17F8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Implementing Top-Level Collections in Multi-touch Devices


The report descriptor for a multiple input device must include at least one top-level collection for the primary device and a separate top-level collection for the mouse.

Report descriptors for touch devices should use Finger (0x22) CL (Collection Logical) to group the data and control usages in the top-level collections, whereas the Stylus (0x20) CL should be used to group pen-related control and data usages.

The following report descriptor samples demonstrate the collection and usage settings for device type and mode.

-   [Mouse Collection Report Descriptor](mouse-collection-report-descriptor.md)
-   [Two Finger Parallel/Hybrid Mode Report Descriptor](two-finger-parallel-hybrid-mode-report-descriptor.md)
-   [Single Finger Hybrid Mode Report Descriptor](single-finger-hybrid-mode-report-descriptor.md)

 

 






