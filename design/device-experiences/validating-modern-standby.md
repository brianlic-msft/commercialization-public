---
title: Validating modern standby
description: This section describes test and validation best practices for system designers and integrators who are building modern standby PCs.
MS-HAID:
- 'cstandby.validating\_connected\_standby'
- 'p\_weg\_hardware.validating\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C1433DBB-1A0A-4391-ADAF-A592E9262418
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Validating modern standby


Enabling the low power consumption and constant connectivity of modern standby is a test and validation challenge for the system integrator. All components in the system—hardware and software—must work together to quickly turn power on and off while maintaining connection to the Internet.

This section describes test and validation best practices for system designers and integrators who are building modern standby PCs. It explains what platform components you should have functionally working before you begin testing power management during modern standby. Also included in this section is information about the built-in power management diagnostics in Windows 8.1, and a description of how to use [Windows Performance Analyzer (WPA)](https://msdn.microsoft.com/windows/hardware/commercialize/test/wpt/windows-performance-analyzer) to observe specific operations during modern standby. This information applies to Windows 8 and Windows 8.1.

## About modern standby validation


Starting with Windows 8, the modern standby power model enables applications to stay fresh, up-to-date, and reachable whenever a suitable network is available. For more information, see [Modern Standby](modern-standby.md).

Windows supports modern standby only on low-power PC platforms that include low-power hardware and meet Windows Certification requirements. Systems that are not specifically designed for modern standby continue to use the traditional PC power model, which is fully supported in Windows 8 and Windows 8.1. This section pertains only to PCs that implement the modern standby power model. It does not provide test guidance for PCs that implement the traditional ACPI Sleep (S3) and Hibernate (S4) system power states.

 

 






