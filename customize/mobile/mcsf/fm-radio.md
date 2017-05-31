---
title: FM radio
description: .
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FM Radio

The BSP provided by the SoC vendor includes support for the FM radio.

Alternative FM radio components that meet the requirements described in the section <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/dn756593">2.7: Wireless communications</a> of the Chassis Requirements Specification can be used. If alternative components are used, the FM miniport driver can be replaced.

**Note**  If the phone includes an FM radio, it must run the Microsoft-supplied software driver stack, including the port driver.

There are two customizations associated with the FM radio.
* <a href = "https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/mobile/mcsf/showing-the-fm-radio">Showing the FM radio</a>. Use this customization to show the FM radio app to users, so they can take advantage of this feature.
* <a href="https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/mobile/mcsf/fm-radio-frequency-band">FM radio frequency band</a>. Use this customization to configure the FM radio frequency for specific regions.

Application programming interfaces are not provided for the FM radio.
