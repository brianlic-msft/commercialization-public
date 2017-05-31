---
title: Mouse Collection
description: This topic discusses the mouse collection of a Windows Precision Touchpad device, and explains how the collection provides HID-compliant mouse reporting to the Windows host.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: CFB6271F-4028-418D-BC84-D96A578D92C1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mouse Collection


This topic discusses the mouse collection of a Windows Precision Touchpad device, and explains how the collection provides HID-compliant mouse reporting to the Windows host.

A Windows Precision Touchpad device can provide a top-level collection that makes the touchpad appear as a generic desktop mouse (Page **0x01**, Usage **0x02**).

This is especially important for hosts that are not capable of consuming input via the Windows Precision Touchpad collection. Such hosts include, for example, down-level BIOS implementations, or operating systems prior to Windows 8.1. The mouse collection should support an input report that can, at a minimum, report relative positions (x, y), and left and right buttons. There are no mandatory feature reports associated with this collection. For an example of a mouse collection, see [Sample Report Descriptors](touchpad-sample-report-descriptors.md).

By default, Windows Precision Touchpad devices can report data via the mouse collection, as this is the most compatible reporting mode.

 

 






