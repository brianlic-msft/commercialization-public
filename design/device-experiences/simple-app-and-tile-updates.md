---
title: Simple app and tile updates
description: Modern standby enables the system to stay fresh and up-to-date by maintaining constant connectivity and by carefully controlling the execution of app background tasks.
MS-HAID:
- 'cstandby.lock\_screen\_apps\_and\_push\_notifications'
- 'p\_weg\_hardware.simple\_app\_and\_tile\_updates'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: EC75F98B-845F-420E-9D38-759CACA5C9BF
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Simple app and tile updates


Modern standby enables the system to stay fresh and up-to-date by maintaining constant connectivity and by carefully controlling the execution of app background tasks.

An app can create a background task by using a specific set of WinRT APIs to enable the task to run on a regular schedule or in response to an incoming network event. WinRT is the Windows Runtime API surface and is distinct from Windows RT, which is the version of Windows that runs on the ARM processor architecture. The WinRT APIs for background tasks allow the app's runtime to be carefully managed by Windows to prevent excessive battery drain.

One common use of background tasks is to update the content of tiles on the Start screen. The content that an app displays in its tile can change in response to notifications. With modern standby, the user will see the updated tile as soon as the system turns on—that's because the app's background task ran during modern standby.

Apps can also use background tasks to check for new app-specific content during modern standby using a periodic timer. Timer expirations for an app that uses a periodic timer during modern standby are automatically coalesced with timer expirations for other apps. Timer expirations are limited to be no more frequent than once every 15 minutes, and when an app's background task runs, it has a very limited amount of CPU time available to do the update.

For more information about background tasks, see [Launching, resuming, and background tasks](https://msdn.microsoft.com/windows/uwp/launch-resume/index).

**Note**  During modern standby, desktop applications cannot run and cannot access the network. System services have limited runtime, but no network access.

 

 

 






