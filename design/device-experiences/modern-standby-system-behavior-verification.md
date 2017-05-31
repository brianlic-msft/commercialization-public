---
title: Modern Standby system behavior verification
description: Identifying whether a system is connected or disconnected while in standby is very simple. If the system’s NIC is not offload-capable, but reports in the FADT table that it supports S0 low power idle, it is using disconnected Modern Standby.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 257CF09C-191E-4086-B96D-8EE7BD34682A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern Standby system behavior verification


Identifying whether a system is connected or disconnected while in standby is very simple. If the system’s NIC is not offload-capable, but reports in the FADT table that it supports S0 low power idle, it is using disconnected Modern Standby.

You can use the `powercfg /a` command to identify if a system supports Modern Standby. It will also identify whether the system is connected or not while in the standby mode. The command produces the following output when the system is in connected state in Standby.

`The following sleep states are available on this system:     Standby (S0 Low Power Idle) Network Connected A disconnected Standby state will produce the following output.`

`TThe following sleep states are available on this system:     Standby (S0 Low Power Idle) Network Disconnected`

[Modern standby SleepStudy report](modern-standby-sleepstudy-report.md)s also note whether a standby session was connected or not.

 

 






