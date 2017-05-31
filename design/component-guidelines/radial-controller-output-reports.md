---
title: Windows Radial controller Output Reports
author: windows-driver-content
description: TBD
ms.assetid:
keywords: radial dial, radial controller, dial
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows radial controller output reports

This topic details the HID output reports that are used for radial controller haptic feedback support in Windows 10, version 1607 and later operating systems.

## Haptic feedback collection (optional)

If a Windows radial controller device supports haptic feedback, it can allow the system and applications to take advantage of it by including a haptic feedback collection (Page **0x0E**, Usage **0x01**) within the Windows radial controller TLC. For more information on how the HID specification supports haptic feedback, please consult the new [Haptics page ](http://www.usb.org/developers/hidpage/HUTRR63b_-_Haptics_Page_Redline.pdf) ratification to the HID specification.

The host uses the following usages in an output report (through the haptic feedback collection) to allow the host to issue haptic feedback events to the Windows radial controller device. If a device chooses to expose a haptic feedback collection, some usages are mandatory to allow host-initiated haptic feedback to be supported.

| Member | Description | Page | ID | Mandatory/Optional |
| ---| --- | --- | --- | --- |
| Manual Trigger | Waveform to fire as explicit command from the host. | 0x0E | 0x21 | Mandatory |
| Intensity | Output – Intensity of Manual Trigger waveform as a percentage | 0x0E | 0x23 | Optional |
| Repeat Count | Output – Number of times to play Manual Trigger waveform after initial play | 0x0E | 0x24 | Optional |
| Retrigger Period | Output – Duration of time to wait before retriggering Manual Trigger when repeating | 0x0E | 0x25 | Optional |

### Manual trigger

The Manual Trigger usage represents a supported waveform usage from the [waveform list](radial-controller-feature-reports.md) which has been requested to be played by the host. When an output report containing a Manual Trigger other than WAVEFORM_NONE is sent to the device, it should immediately begin playing the specified waveform with the additional properties included in the output report (Intensity, Repeat Count, Retrigger Period). When an output report contains a Manual Trigger of WAVEFORM_STOP, any ongoing waveform playback should be stopped.

### Intensity

The Intensity usage represents the percentage of maximum intensity to apply to a waveform. This value should vary between 0 and 100 percent. 100 percent indicates waveforms will be triggered by the device at their maximum strength, and 0 percent indicates the haptic transducer is not enabled.

When set in an output report, this value will override the default Intensity for the Manual Trigger waveform defined in the same output report. This does not set a new default Intensity.

### Repeat count

The Repeat Count usage represents the number of times to repeat a waveform. A Repeat Count of zero indicates the Manual Trigger waveform should only be played a single time (no repeat). If the [waveform cutoff time]() has been exceeded, it is expected that any incomplete repeats will be ignored.

When set in an output report, this value overrides the default repeat count for the Manual Trigger waveform defined in the same output report. This does not set a new default Repeat Count.

### Retrigger Period

The Retrigger Period usage represents the amount of time for the device to wait before repeating a Manual Trigger waveform in an output report, per the value specified by Repeat Count. The units for this value are milliseconds. If the Retrigger Period is smaller than the duration of the waveform being played, the waveform should be stopped and restarted at the time period indicated by the retrigger period.

When set in an output report, it overrides the default retrigger period for the Manual Trigger waveform defined in the same output report. This does not set a new default Retrigger Period.
