---
title: Supported hardware power configuration
description: Windows supports a single hardware power management configuration for camera devices in modern standby platforms.
MS-HAID:
- 'cstandby.supported\_hardware\_power\_configuration'
- 'p\_weg\_hardware.supported\_hardware\_power\_configuration'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B206C068-3C5B-406A-8FC7-353933FA32B5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supported hardware power configuration


Windows supports a single hardware power management configuration for camera devices in modern standby platforms. In short, each camera sensor must be connected to the System on a Chip (SoC) via a MIPI-CSI link, and can optionally be connected to an I2C bus and to one or more GPIO pins. The camera sensor device, its optional flash, and any other off-SoC camera components must be placed on a power rail that can be switched on and off by ACPI firmware.

If, in addition to a MIPI-CSI link, the camera device has I2C or GPIO pins to control the camera sensor or flash device, these pins must be routed to the corresponding pins of the I2C controller or GPIO controller on the SoC. The system integrator must enumerate the I2C and GPIO resources for both the camera sensor and the flash device in a \_CRS object under the camera device in the ACPI namespace.

**Note**  The system integrator should work with the camera subsystem driver developer to determine how the camera drivers expect GPIO and I2C resources to be ordered. For example, a driver that receives two I2C resources distinguishes between them based on the order in which they appear in the resource list. Similarly, a driver that receives three GPIO resources expects these resources to be listed in a particular order. The system integrator must enumerate the I2C and GPIO resources in the same order in the \_CRS object.

 

The camera sensor and the flash device must be placed on a power rail that can be turned on and off by ACPI control methods. We recommend using a GPIO pin from the SoC to control the power-switch hardware. The GPIO should be enumerated in a GPIO operation region so that its state can be changed by ACPI control methods. The system integrator must describe the power resource for a camera device (sensor, flash, or any other camera component) in the ACPI namespace. This resource must include an \_ON method and an \_OFF method to change the state of the GPIO signal routed to the power-switch hardware. Under the camera device in the ACPI namespace, the system integrator must provide a \_PR0 object and a \_PR3 object that refer to the power resource.

When the camera controller driver detects that all streaming pins have entered the KSSTATE\_STOP state, it uses a private interface to tell the drivers that control the off-SoC camera components that capture is no longer required. In turn, these drivers call the IWDFDevice2::ResumeIdle method to tell the driver framework that their hardware is idle. In response, the driver framework initiates a transition to D3, which causes a D3 IRP to flow through the camera device driver stack. (A D3 IRP is an IRP\_MJ\_POWER IRP that specifies a DEVICE\_POWER\_STATE enumeration value of PowerDeviceD3.) The Windows ACPI driver, Acpi.sys, will observe the D3 IRP and execute the \_OFF method of the power resource that is identified by the \_PR3 object under the camera device in the ACPI namespace.

The last sentence in the preceding paragraph assumes that the power resource does not provide power to any devices other than the one camera device. If other devices have references to this power resource, Acpi.sys will run the \_OFF method only after all other devices that reference the power resource have transitioned to D3. For more information, see Enabling Transitions to D3cold.

Returning the camera hardware to the active power state is a similar process. When the camera controller driver detects the first stream capture pin to enter the KSSTATE\_ACQUIRE state, the camera controller driver communicates with the drivers for the other on-SoC and off-SoC components that comprise the camera subsystem. In response, the driver that controls the on-SoC image processing unit calls the IWDFDevice2::StopIdle method, which informs the PEP that the image processing unit hardware should be powered on. The camera controller driver tells the drivers that control the off-SoC camera components that they should return to the active state. In turn, these drivers call StopIdle to inform the driver framework that the hardware is no longer idle, which causes a D0 IRP to flow through the camera device driver stack. (A D0 IRP is an IRP\_MJ\_POWER IRP that specifies a DEVICE\_POWER\_STATE enumeration value of PowerDeviceD0.) Acpi.sys responds to the D0 IRP by executing the \_ON method of the power resource that is identified by the \_PR0 object under the camera device in the ACPI namespace.

If the platform has multiple camera devices, each camera device should have its own independently switchable power rail and power resource described in the ACPI namespace. For each camera device in the ACPI namespace, the system integrator must provide a \_PLD object that indicates whether the camera device is on the front or the back of the computer. If a camera device is built into the lid of a clamshell-form-factor computer and faces the user when the lid is open, this device's \_PLD object should indicate that the camera is on the front of the platform. If a camera device is built into the lid of a clamshell-form-factor computer and faces away from the user when the lid is open, this device's \_PLD object should indicate that the camera is on the back of the system.

## Wake concerns


Camera device hardware must not support wake. Windows does not expect camera devices to be able to wake the SoC from its lowest power state during modern standby. Many cellular phones enable the SoC to wake from sleep when the user presses the camera button. The camera button is treated by Windows as a user input device whose operation is separate from and independent of the sytem integration or power management of the camera device, its sensor, and optional flash.

 

 






