---
title: Troubleshooting Unified Write Filter (UWF)
description: Troubleshooting Unified Write Filter (UWF)
MS-HAID:
- 'p\_embedded.troubleshooting\_unified\_write\_filter\_\_uwf\_\_blue'
- 'p\_enterprise\_customizations.troubleshooting\_unified\_write\_filter\_uwf'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d9f0f26f-3545-46c3-887e-be21895bff66
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Troubleshooting Unified Write Filter (UWF)


Review the log files and error message information locations for Unified Write Filter (UWF) on your Windows 10 Enterprise device.

If you are having difficulties configuring Unified Write Filter (UWF) on your device, see the following information about how to find event log and error message information for troubleshooting problems with UWF.

## Event logs


UWF uses Windows Event Log to log events, errors and messages.

-   Events related to overlay consumption are sent by UWF kernel mode components and are logged in the **Windows Logs\\System** event log.

-   Event related to configuration changes and servicing logs are sent by UWF user mode components:

    -   Error messages are logged in the **Applications and Services Logs\\Microsoft\\Windows\\UnifiedWriteFilter\\Admin** event log.

    -   Informational messages are logged in the **Applications and Services Logs\\Microsoft\\Windows\\UnifiedWriteFilter\\Operational** event log.

## Related topics


[Unified Write Filter](unified-write-filter.md)

[Common write filter exclusions](uwfexclusions.md)

[Service UWF-protected devices](service-uwf-protected-devices.md)

[Unified Write Filter WMI provider reference](uwf-wmi-provider-reference.md)

[uwfmgr.exe](uwfmgrexe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Troubleshooting%20Unified%20Write%20Filter%20%28UWF%29%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





