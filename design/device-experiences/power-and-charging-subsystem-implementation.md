---
title: Power and charging subsystem implementation
description: Describes how to implement the battery power and charging subsystem on a Windows platform.
MS-HAID:
- 'cstandby.power\_and\_charging\_subsystem\_implementation'
- 'p\_weg\_hardware.power\_and\_charging\_subsystem\_implementation'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 84913F47-2EA6-4E67-A969-B66FB8EA125E
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Power and charging subsystem implementation


The battery power and charging subsystem in a Windows platform should implement the ACPI Control Method Battery interface. Windows uses this interface to get status information from the battery subsystem and to receive notifications of battery events.

## Windows battery and power subsystem driver model


Windows features a robust battery and power subsystem device driver model. Power management information is conveyed to the Windows power manager through a battery device driver. This information is then aggregated and exposed to the Windows user interface through battery device IRPs and a set of power management software APIs.

The battery driver model for Windows is a port/miniport model; that is, the battery model and interfaces are defined so that new battery types can be exposed through a miniport driver, as shown in the following block diagram. However, in practice, only the ACPI Control Method Battery interface is used. A Human Interface Device (HID) battery miniport driver for USB-attached Uninterruptible Power Supply (UPS) devices is supported, but this driver is not used for system batteries.

All Windows platforms are expected to expose their batteries and charging subsystem through the ACPI Control Method Battery interface. The battery miniport interface should not be used for platform-specific battery charging subsystems. The ACPI 5.0 specification defines control methods to enable Windows to obtain battery information and current status. In addition, the ACPI interface provides events to enable the hardware platform to notify Windows of battery and power source changes, such as a transition from AC to battery power.

## Obtaining battery status


The Windows power manager periodically requests status information from the battery, including the remaining charge capacity and the current rate of drain. This request originates in the power manager itself, a higher-level user interface component, or in an application. The power manager turns the request into an I/O request packet (IRP) to the battery device, which is then turned into the appropriate control method by the Windows control-method battery driver, Cmbatt.sys. The method executes and the result is returned up the driver stack.

In the case of status information, the battery status (\_BST) method is the appropriate control method. The \_BST method requires the ACPI firmware to obtain current information from the power subsystem. The result of the \_BST method is a buffer that contains the required information, which is returned to the control-method battery driver. The control-method battery driver converts the buffer contents to the format required by the battery driver and Windows power manager.

## State change notifications


The power and battery subsystem generate several notifications to the operating system for state changes, including changes in the level of charge, transitions from AC to battery power, and so on. It is undesirable to continuously poll for these state changes because doing so requires a high polling frequency. Therefore, the hardware platform must implement an event-driven model to notify Windows of changes in the power and battery subsystem.

When battery status (including remaining capacity or charging status) changes, the ACPI firmware must issue a Notify(0x80) command on the Control Method Battery device. In response, the Control Method Battery driver in Windows evaluates the \_BST method and returns the updated information to the power manager.

When battery static data changes (including last full charge capacity, design capacity, and cycle count), the ACPI firmware is required to issue a Notify(0x81) command on the Control Method Battery device. In response, the Control Method Battery driver in Windows evaluates the \_BIX method and returns the updated information to the power manager.

ACPI Notify events are signaled through either the System Control Interrupt (SCI), in the case of embedded controller-equipped platforms, or through general-purpose I/O (GPIO), in the case of platforms that have battery subsystem hardware directly connected to the core silicon.

 

 






