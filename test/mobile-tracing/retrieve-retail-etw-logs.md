---
title: Retrieve retail ETW logs
description: Retrieve retail ETW logs
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a32d9f2b-1a4a-4d69-aae0-c5e80472a708
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Retrieve retail ETW logs


You can diagnose a variety of issues by looking at the retail logs. See [Capture event trace logs on Windows 10 Mobile](capture-event-trace-logs-on-windows-phone.md) to get more information about processing and viewing retail logs.

## Retrieving logs from a retail device


You need to boot the device in mass-storage mode to retrieve logs from an engineering or retail-unlocked device. The host PC can detect the device as a storage device when you boot in mass-storage mode. The procedure to do this depends on silicon vendor settings.

This is how to retrieve existing ETW logs from a retail device:

1.  Unlock the device.

2.  Press a specific key sequence on the device to start in mass storage mode. Usually this is done by holding just the camera button, or the camera and the volume down button, while powering up.

3.  The screen will remain blank for about five seconds, and then you’ll see new storage drives in Windows Explorer. Look for the drive where the EFIESP folder is located.

4.  In Windows Explorer, copy the files from these two directories.

    ``` syntax
    <mass storage drive letter>:\Data\SystemData\Telemetry
    <mass storage drive letter>:\Data\SystemData\ETW
    ```

    Depending on the amount of activity on the phone, ETL logs, system dumps in cab files, and other logs will be in this directory.

5.  After you have copied the logs from the device, close Windows Explorer, and then eject the device.

## Related topics


[Software tracing](index.md)

 

 







