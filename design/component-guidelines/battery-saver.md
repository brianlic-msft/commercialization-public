---
title: Battery Saver
description: The battery saver feature helps conserve power when a system is running on battery. When battery saver is on, some Windows features are disabled or behave differently.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: FA82ED38-9645-45F0-98A0-B59BEE81B2A2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Battery Saver


The battery saver feature helps conserve power when a system is running on battery. When battery saver is on, some Windows features are disabled or behave differently.

Users can choose to enable battery saver when the battery level reaches a certain percentage.

-   On Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), battery saver will turn on automatically when your battery falls below 20%.

-   On Windows 10 MobileMobile, users must enable battery saver to turn on when the battery falls below 20%.

When battery saver is on, several Windows features behave differently:

-   Windows Store Mail, People, and Calendar apps do not sync.

-   Apps running in the background are blocked. Users can allow specific individual apps to run while in battery saver mode. Certain categories of apps continue to run. For example, VOIP apps are not blocked.

-   Windows Push Notification Services (WNS) is affected when battery saver is on.

    -   WNS is blocked by default on Windows 10 Mobile. Users can chose individual apps to always be allowed to run while battery saver is on. There is no setting to allow WNS across all apps. This is the same behavior as Windows Phone 8.1.

    -   WNS is allowed for all apps by default on Windows 10 for desktop editions. Users can change this to the Windows 10 Mobile model, where only always allowed apps run.

-   Non-critical Windows update downloads are blocked. However, Windows update scans still occur.

-   Display brightness is reduced by 30% for both Windows 10 for desktop editions and Windows 10 Mobile. Users can enable or disable this setting for Windows 10 for desktop editions only.

-   OEMs can enable configure the display brightness value on Windows 10 for desktop editions. However, for Windows 10 Mobile, configuration is disabled. This value is controlled in the ESBRIGHTNESS SUB\_ENERGYSAVER Powercfg setting.

-   The majority of telemetry is blocked.

    -   Only critical telemetry is uploaded

    -   Census data, and similar telemetry is critical and will be uploaded

<!-- -->

-   Windows task scheduler tasks trigger only if the task is:

    -   Not set to **Start the task only if the computer is idle...** (task doesn't use [**IdleSettings**](https://msdn.microsoft.com/library/windows/hardware/aa381852))

    -   Not set to run during automatic maintenance (task doesn't use [**MaintenanceSettings**](https://msdn.microsoft.com/library/windows/hardware/hh974642))

    -   Is set to **Run only when user is logged on** (task [**LogonType**](https://msdn.microsoft.com/library/windows/hardware/aa380746) is **TASK\_LOGON\_INTERACTIVE\_TOKEN** or **TASK\_LOGON\_GROUP**)

    All other triggers are delayed until the system exits battery saver mode.

For more information about accessing battery saver status in your application, see [SYSTEM\_POWER\_STATUS](https://msdn.microsoft.com/library/windows/hardware/aa373232).

 

 






