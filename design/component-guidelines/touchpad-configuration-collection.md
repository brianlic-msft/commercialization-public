---
title: Configuration Collection
description: This topic discusses the role played by the configuration collection of a Windows Precision Touchpad device, in Windows 10 and later operating systems.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 442EE1DB-E9B1-4587-B33A-0187C0B3991D
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuration Collection


This topic discusses the role played by the configuration collection of a Windows Precision Touchpad device, in Windows 10 and later operating systems.

A Windows Precision Touchpad should provide a top-level collection that makes the device appear as a digitizer with configuration options (Page **0x0D**, Usage **0x0E**).

The configuration collection of a Windows Precision Touchpad device allows the host to configure two different aspects of the devices, so the collection should support two feature reports: one that allows the host to select an input mode, and the other to allow the host to be selective in what is reported. There are no mandatory input reports associated with this collection.

## Input Mode Feature Report


The input mode feature report is communicated by the host to the Windows Precision Touchpad device, to indicate which top-level collection should be used for input reporting. There are two collections which may be used for input reporting, the mouse collection and the Windows Precision Touchpad collection.

By default, Windows Precision Touchpad devices can choose to report input via the mouse collection. A Windows Precision Touchpad should only report data via one given collection at any time. The device should only report from a different collection, once the corresponding feature report has been received from the host indicating the desired input mode.

The value specified by the host for input mode (Usage **0x52**) determines the collection that should be used to report input. The following table provides more information.

| Input mode value | Input reporting collection            |
|------------------|---------------------------------------|
| 0                | Mouse Collection                      |
| 3                | Windows Precision Touchpad Collection |

 

The host can issue the input mode feature report to a Windows Precision Touchpad device at any time after reading the report descriptor. This includes time during which data is potentially being reported through the currently active collection. In the event that a mode switch occurs while data is being reported, all contacts and the button states should be reported as up, and all reporting should cease via that collection.

Reporting via the newly specified collection can occur after all contacts are physically up. The input mode should not be persisted by a Windows Precision Touchpad device across power cycles. However the input mode should be persisted across any bus-specific resets that do not involve power to the device. For example, it is acceptable for the input mode to persist a USB, HID or I²C reset.

**Note**  It is possible for a non-touchpad capable host to send a value other than those listed in the preceding table. In this case, the device should interpret the value as zero (0), and switch to mouse mode, since only a touchpad capable operating system will issue mode 3.

 

## Selective Reporting Feature Report


The input mode feature report is communicated by the host to the Windows Precision Touchpad device, to indicate which types of input should be reported. There are two types of input which may be reported; surface contacts and button state.

By default, meaning upon cold-boot or after a power reset, Windows Precision Touchpad devices should report both surface contacts and button state. A Windows Precision Touchpad device should only report input that has been previously selected by the host, per the corresponding feature report.

The values specified by the host for a surface switch (Usage **0x57**) and a button switch (Usage **0x58**) determines the types of input that should be reported. The following table provides more information.

| Surface switch | BUtton switch | Input to be reported                                       |
|----------------|---------------|------------------------------------------------------------|
| 0              | 0             | No input is to be reported.                                |
| 0              | 1             | Only button state is to be reported.                       |
| 1              | 0             | Only surface contacts are to be reported.                  |
| 1              | 1             | Both surface contacts and button state are to be reported. |

 

The host can issue the selective reporting feature report to a Windows Precision Touchpad device at any time after reading the report descriptor. The selective reporting state should not be persisted by a Windows Precision Touchpad across power reset events.

When a USB-connected Windows Precision Touchpad device is suspended, it should only signal a remote wake based on the input that the host has selected via this feature report.

An I²C-connected Windows Precision Touchpad device should only generate interrupts based on the input that the host has selected via this feature report.

## Related topics


[Sample Report Descriptors](touchpad-sample-report-descriptors.md)

 

 







