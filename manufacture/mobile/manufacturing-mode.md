---
author: kpacquer
Description: 'Introduced in Windows 10 Mobile, manufacturing mode is a mode of the full operating system that can be used for manufacturing-related tasks, such as component and support testing.'
ms.assetid: 9c5831f5-a200-436c-97cc-8bd92b30cb3e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Manufacturing Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Manufacturing Mode


Introduced in Windows 10 Mobile, manufacturing mode is a mode of the full operating system that can be used for manufacturing-related tasks, such as component and support testing.

In Windows Phone 8.1, you had to flash the Microsoft Manufacturing Operating System (MMOS) to do manufacturing tests and processes, such as test hardware, blow fuses, and provision security keys. Once the tests were completed, you had to flash the full operating system. This added extra time on the manufacturing floor.

This new feature allows you to boot into a manufacturing mode of the full operating system (and do those manufacturing steps) without having to flash an MMOS image.

## <span id="Manufacturing_profiles"></span><span id="manufacturing_profiles"></span><span id="MANUFACTURING_PROFILES"></span>Manufacturing profiles


A manufacturing profile defines settings that should be used when the operating system boots in manufacturing mode. The device can have more than one manufacturing profile. A profile named Default is included with Windows 10 Mobile. The default profile contains the settings for Microsoft components that let the device boot into a minimal environment for Manufacturing Mode.

Manufacturing profiles are stored in the registry on the device in the following location:

**HKEY\_LOCAL\_MACHINE\\System\\CurrentControlSet\\Control\\ManufacturingMode**
You must create a subkey for each manufacturing profile. Under the profile key, you can change the settings for some select operating system components for when the system is booting in manufacturing mode. For example, you can alter which services are started when this manufacturing profile is enabled. You can add your own services in the Services subkey, as shown below. If you want to set all services to the same start type, you can use an \* for the service name. If the \* wildcard is not used, all Win32 services that are not included in the manufacturing profile will use their default start type.

**Note**  The \* wildcard only applies to Win32 services, excluding kernel-mode drivers.

 

The following example creates a manufacturing profile named CustomProfile, causes the service named OEMFactoryTestService to automatically start, and all other Win32 services to demand start:

``` syntax
[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ManufacturingMode\CustomProfile]

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ManufacturingMode\CustomProfile\Services]

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ManufacturingMode\CustomProfile\Services\OEMFactoryTestService]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ManufacturingMode\CustomProfile\Services\*]
"Start"=dword:00000003
```

The manufacturing profile name must be less than 64 characters.

You cannot use **Current** for the name of your manufacturing profile. This name is reserved for the currently active manufacturing profile.

 

 





