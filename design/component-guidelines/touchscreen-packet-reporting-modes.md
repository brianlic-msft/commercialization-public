---
title: Packet Reporting Modes
description: This topic provides information about the packet reporting modes for a Windows Touchscreen device in Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 48911417-9DFF-4697-AFF4-8E2526C29A06
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Packet Reporting Modes


This topic provides information about the packet reporting modes for a Windows Touchscreen device in Windows 10.

## Parallel mode


In Parallel mode, devices report all contact information in a single packet. Each physical contact is represented by a logical collection that is embedded in the top-level collection. This logical collection contains all the usages that the device supports for each contact. Each of the logical collections must be identical when you use Parallel mode. Because the device generally reports fewer contacts than the maximum, the number of contacts that are reported in a parallel packet should be communicated by using the Contact Count usage.

For example, consider a device that supports three contacts. If the user has only two fingers on the digitizer, then the parallel packet will consist of information about only those two contacts, in a report that can carry data for three contacts. In this case, the Contact Count should be set to two, so that the client application knows that any information about more than two contacts is not valid.

A disadvantage of reporting multiple contacts in one report is that space is wasted per report every time that there are fewer contacts than the maximum number of contacts possible. Devices can use the Hybrid mode to reduce this inefficiency.

## Hybrid mode


In Hybrid mode, the number of contacts that can be reported in one report is less than the maximum number of contacts that the device supports. For example, a device that supports a maximum of 4 concurrent physical contacts, can set up its top-level collection to deliver a maximum of two contacts in one report. If four contact points are present, the device can break these up into two serial reports that deliver two contacts each.

When a device delivers data in this manner, the Contact Count usage value in the first report should reflect the total number of contacts that are being delivered in the hybrid reports. The other serial reports should have a contact count of zero (0).

## Single finger hybrid reporting mode


The first input report for a given frame should indicate the total number of contacts that are to be reported by using the Contact Count usage. And all subsequent input reports for the same frame should have a value of zero (0) for the Contact Count usage, to indicate that they are part of the previously reported frame. The scan time for all reports of a given frame should be identical.

Here's a table showing the reporting sequence for a two-contact scenario, and using a single finger hybrid reporting mode.

| Report                | 1      | 2      | 3      | 4      | 5      | 6      |
|-----------------------|--------|--------|--------|--------|--------|--------|
| Contact Count         | 2      | 0      | 2      | 0      | 2      | 0      |
| Contact ID            | 1      | 2      | 1      | 2      | 1      | 2      |
| Contact 1: X, Y       | X₁, Y₁ | NR     | X₂, Y₂ | NR     | X₃, Y₃ | NR     |
| Contact 1: Tip switch | 1      | NR     | 1      | NR     | 1      | NR     |
| Contact 2: X, Y       | NR     | X₁, Y₁ | NR     | X₂, Y₂ | NR     | X₃, Y₃ |
| Contact 2: Tip switch | NR     | 1      | NR     | 1      | NR     | 1      |
| Scan Time             | T1     | T1     | T2     | T2     | T3     | T3     |

 

 

 






