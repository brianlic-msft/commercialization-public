---
title: Power Management
description: This topic provides information about Touchscreen power management, and discusses power consumption requirements.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 384ED4E2-386E-4A1F-B54D-56D0D880EB9B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

#  Power Management


This topic provides information about Touchscreen power management, and discusses power consumption requirements.

## Power Consumption


Power consumption requirements for the various power modes of a Windows Touchscreen device are at the discretion of the OEM, or the system builder. However, Windows provides facilities to help balance power efficiency and response latency.

Windows Touchscreen devices that are connected via I²C can implement support for up to four distinct power states:

-   Active
-   Idle
-   Either Sleep, or Armed for Wake (both optional)
-   Off

The four power states are shown in the following diagram, along with the device activities that cause transitions from one state to another.

![diagram of the four power states for a windows touchscreen device connected via i2c. diagram also shows the device activities that cause transitions between states.](../images/pen-i2c-pwrstates.png)

**Active State**

The **Active** state is defined as the device operating mode in which one or more contacts are present, or there has been activity within the last 30 seconds. When power is applied to a Touchscreen device, then after device boot-up is completed, the device should be ready and in the **Active** power state.

A Touchscreen device should adhere to the *contact down latency* and *contact move latency* requirements for this mode, as this is where the bulk of the compatibility requirements will be tested, and where the majority of user interactions will occur.

**Idle State**

The **Idle** state is defined as the device operating mode in which no activity has occurred within the last 30 seconds.

A device can elect to reduce its scan rate in this mode, to reduce power consumption while still adhering to the contact down latency requirement for this mode. Once the device has detected activity, it should transition back to the **Active** state.

**Sleep (Armed for Wake) State**

The **Sleep** state is defined as the operating mode that the device enters, after the host sends a HID I²C "SET\_POWER SLEEP" command to the device.

A device can elect to reduce its scan rate significantly in this mode, to reduce power consumption while still being capable of asserting an interrupt to wake the system, in response to a qualified activity. A Windows Touchscreen device should ensure that interrupts are not asserted for spurious contacts, since such contacts would result in an unintended system wake. There are no contact down latency requirements for this mode.

The device should transition to the **Active** state after it receives a HID I²C "SET\_POWER ON" command from the host.

**Off State**

The **Off** state is defined as the operating mode in which the device has had its power completely removed. When power is applied to the device, then after device boot-up is completed, the device should be ready and in the **Active** power state. Device boot-up should complete before the computer display is initialized and enabled.

In the **Off** state a device should not consume any power.

## USB Devices


Windows Touchscreen devices that connect to the host via USB, can implement support for up to four distinct power states:

-   Active
-   Idle
-   Either Sleep, or Armed for Wake (both optional)
-   Off

The four power states are shown in the following diagram, along with the device activities that cause transitions from one state to another.

![diagram of the four power states for a windows touchscreen device connected via usb. diagram also shows the device activities that cause transitions between states.](../images/pen-usb-pwrstates.png)

**Active State**

The **Active** state is defined as the device operating mode in which the host has not suspended the device. When power is applied to a Touchscreen device, then after device boot-up is completed, the device should be ready, and in the **Active** power state.

A Touchscreen device should adhere to the contact down latency, and contact move latency requirements for this mode, as this is where the bulk of the compatibility requirements will be tested, and where the majority of user interactions will occur.

**Idle State**

The **Idle** state is defined as the device operating mode in which no contact activity has occurred within 30 seconds, and the device has therefore been suspended. This is referred to as "*USB selective suspend*."

All Windows Touchscreen devices that are connected to their host via USB, should support selective suspend. Such devices should report this capability via a [Microsoft OS descriptor](https://msdn.microsoft.com/library/windows/hardware/gg463179).

A Touchscreen device can elect to reduce its scan rate in this mode, to reduce power consumption, while still adhering to the down latency requirement for this mode.

Once the device has detected qualified activity, it should signal a remote wake. Starting from the time of detection of the activity, the device should buffer at least 100ms worth of contact reports, to ensure that little to no input is lost while the USB host controller is resuming.

**Sleep (Armed for Wake) State**

The **Sleep** state is defined as the device operating mode in which the host has transitioned to S3 or *Connected Standby*.

A device can elect to reduce its scan rate significantly in this mode, to reduce power consumption while still being capable of signaling a remote wake (in response to qualified activity) to wake the system. An Windows Touchscreen device should ensure that remote wake is not signaled in response to spurious contacts, which would result in an unintended system wake. There are no contact down latency requirements for this mode.

A contact occurrence that causes entry into the sleep state should not be reported to wake the system.

**Off State**

The **Off** state is defined as the device operating mode in which the device has had its power completely removed. When power is applied to the device, then after device boot-up is completed, the device should be ready and in the **Active** power state. Device boot-up should complete before the computer display is initialized and enabled.

In the **Off** state a Touchscreen device should not consume any power.

 

 






