---
title: Integrating apps with modern standby
description: Most apps that are built for Windows do not need any additional support to run in a modern standby system.
MS-HAID:
- 'cstandby.integrating\_apps\_with\_connected\_standby'
- 'p\_weg\_hardware.integrating\_apps\_with\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 99AA1390-C29C-4683-961F-6F3C0AA6496A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Integrating apps with modern standby


Most apps that are built for Windows do not need any additional support to run in a modern standby system. Windows Store apps are already designed to separate background activity from the interactive pieces of the app by using background tasks. Many Windows Store apps use background tasks to update their live tile, generate toast or notifications, and sync data with the cloud. These same background tasks run during modern standby.

Desktop applications are automatically paused by the Desktop Activity Monitor (DAM) after the system enters standby. The DAM suppresses desktop application execution in much the same way as the Sleep (S3) system power state in systems that support the traditional ACPI S3 and S4 states. Any differences between modern standby and S3 are largely transparent to desktop applications. These applications require no modification or update to ensure that they keep running after the system exits standby.

The following sections describe the effect of modern standby on the execution of Windows Store apps, desktop applications, and system services.

## Windows Store apps


Windows Store apps can create background tasks by using a specific set of WinRT APIs that allow the task to execute on a regular schedule or in response to an incoming network event. (WinRT is the Windows Runtime API surface and is distinct from Windows RT, which is the version of Windows that runs on the ARM processor architecture.) The WinRT APIs for background tasks allow the app's runtime to be carefully managed by Windows to prevent excessive battery drain.

A common use of background tasks is to update the content of tiles on the Start page in response to network events. In a modern standby system, the user sees the updated tile as soon as the system turns on; that's because the background task ran during modern standby.

Apps can also use timer-triggered background tasks to periodically check for new app-specific content during modern standby. The execution times of an app that uses a periodic timer during modern standby are automatically coalesced with the execution times of other apps. The expiration of the timer is limited to be no more frequent than once every 15 minutes, and the app has a very limited amount of CPU time available for the update.

For more information about background tasks, including how to create and register them, see [Support your app with background tasks](http://go.microsoft.com/fwlink/p/?LinkId=733720).

## Desktop applications and system services


Desktop applications typically require no extra work to integrate with modern standby.

The Desktop Activity Moderator (DAM) is the Windows component that pauses all desktop applications and throttles the runtime of third-party system services during modern standby. The purpose of the DAM is to maintain basic software compatibility with existing applications and services, but mitigate their impact on battery life during sleep.

Windows prevents desktop applications from running during any part of modern standby after the DAM phase completes. Windows allows third-party system services to execute in a throttled mode after completing the DAM phase.

## Additional resources


For more information about the effect of modern standby on app execution, see the following topics:

-   [Modern Standby](modern-standby.md)
-   [Prepare software for modern standby](prepare-software-for-modern-standby.md)
-   [**PowerSetRequest**](https://msdn.microsoft.com/library/windows/hardware/dd405534)
-   [**PowerClearRequest**](https://msdn.microsoft.com/library/windows/hardware/dd405532)

 

 






