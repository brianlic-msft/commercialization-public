---
title: Windows Radial controller Feature Reports
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

# Windows radial controller feature reports

This topic details the HID feature reports that are used for radial controller haptic feedback support in Windows 10, version 1607 and later operating systems.

## Haptic feedback collection (optional)
If a Windows radial controller device supports haptic feedback, it can allow the system and applications to take advantage of it by including a haptic feedback collection (Page **0x0E**, usage **0x01**) within the Windows radial controller TLC. For more information on how the HID specification supports haptic feedback, please consult the new [haptics page](http://www.usb.org/developers/hidpage/HUTRR63b_-_Haptics_Page_Redline.pdf) ratification to the HID specification.

The host uses the following usages (through the haptic feedback collection) to communicate the haptic feedback waveform support and allow the host to configure the haptic feedback on the Windows radial controller device. If a device chooses to expose a haptic feedback collection, some usages are mandatory to allow automatic haptic feedback configuration to be supported.

| Member | Description | Page | ID | Mandatory/Optional |
| ---| --- | --- | --- | --- |
| Waveform List | Ordered list of haptic waveforms supported by the device | 0x0E | 0x10 | Mandatory |
| Duration List | Ordered list of durations for waveforms in the Waveform List | 0x0E | 0x11 | Mandatory |
| Auto Trigger | Waveform to fire automatically at device’s discretion | 0x0E | 0x20 | Mandatory |
| Auto Trigger Associated Control | HID usage of the control associated with haptic feedback | 0x0E | 0x22 | Mandatory |
| Intensity | Output – Intensity of Manual Trigger waveform as a percentage | 0x0E | 0x23 | Optional |
| Repeat Count | Output – Number of times to play Manual Trigger waveform after initial play | 0x0E | 0x24 | Optional |
| Retrigger Period | Output – Duration of time to wait before retriggering Manual Trigger when repeating | 0x0E | 0x25 | Optional |
| Waveform Cutoff Time | Max time a Manual Trigger waveform can play before being cut off | 0x0E | 0x28 | Optional |

### Waveform List

Waveform List usage represents a collection of the HID usages of supported waveforms, ordered using ordinals. The pre-defined haptics waveforms are defined in the HID specification. Windows supports implementing the following waveforms for a haptic feedback enabled device:

| Waveform | Description | Page | ID | Mandatory/Optional |
| ---| --- | --- | --- | --- |
| WAVEFORM_NONE| No-op. Should not impact the play state of ongoing waveforms. | 0x0E | 0x1001 | Mandatory |
| WAVEFORM_STOP| Stops the playback of ongoing waveforms. | 0x0E | 0x1002 | Mandatory |
| WAVEFORM_CLICK| Creates a short “click” feedback | 0x0E | 0x1003 | Mandatory |
| WAVEFORM_BUZZ_CONTINUOUS| Buzzes the device for an extended duration of time | 0x0E | 0x1004 | Optional |

Both WAVEFORM_NONE and WAVEFORM_STOP are required for all HID-compliant haptics devices. Ordinals 1 and 2 are implicitly set to WAVEFORM_NONE and WAVEFORM_STOP. They do not need to be declared in the Waveform List or Duration List. The Waveform List declares supported waveforms by the physical minimum and maximum of each ordinal in the list.

### Duration List

Duration List usage represents a collection of the durations for the supported waveforms in the Waveform list, ordered using ordinals. The unit for waveform duration is milliseconds, and duration must be a positive non-zero value for any non-continuous waveform. If a waveform is continuous (will play until stopped by the host or the Waveform Cutoff Time is exceeded), then its duration is defined as zero.

WAVEFORM_NONE and WAVEFORM_STOP are assumed to have a duration of zero. They do not need to be declared in the Duration List.

### Auto Trigger

The Auto Trigger usage represents a supported waveform usage from the Waveform List which will be triggered automatically by the device as needed based on user interactions. This allows lower-latency response to common user interactions like rotation and clicking. This may need to be modified or disabled by the host, and can be set via a feature report. The Auto Trigger waveform can be disabled by being set to zero by the host.

### Auto Trigger Associated Control

The Auto Trigger Associated Control specifies the extended HID usage of the physical control associated with automatic haptic feedback on the device. For a radial controller device, this control should be defined as the Dial usage specified within the same top level collection.

### Intensity

The Intensity usage represents the percentage of maximum intensity to apply to a waveform. This value should vary between 0 and 100 percent. 100 percent indicates waveforms will be triggered by the device at their maximum strength, and 0 percent indicates the haptic transducer is not enabled.

If defined in a feature report, it sets the default intensity for all Auto Trigger and Manual Trigger waveforms for the device.

### Repeat Count
The Repeat Count usage represents the number of times to repeat a waveform. A Repeat Count of zero indicates the Manual Trigger waveform should only be played a single time (no repeat). If the Waveform Cutoff Time has been exceeded, it is expected that any incomplete repeats will be ignored.

If defined in a feature report, it sets the default repeat count for all Auto Trigger and Manual Trigger waveforms for the device.

### Retrigger Period
The Retrigger Period usage represents the amount of time for the device to wait before repeating a Manual Trigger waveform in an output report, per the value specified by Repeat Count. The units for this value are milliseconds. If the Retrigger Period is smaller than the duration of the waveform being played, the waveform should be stopped and restarted at the time period indicated by the retrigger period.

If defined in a feature report, it sets the default retrigger period for all Auto Trigger and Manual Trigger waveforms for the device.

### Waveform Cutoff Time
The Waveform Cutoff Time usage represents the maximum amount of time the device will allow a Manual Trigger waveform to be repeated before ending playback. This is a constant value for the device and includes both continuous waveforms without set durations, and waveforms with discrete durations which are set to repeat many times. The units for this value are milliseconds.
