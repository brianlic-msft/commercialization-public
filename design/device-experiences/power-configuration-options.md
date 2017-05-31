---
title: Power configuration options
description: The configuration options described in this topic are available on all Modern Standby systems (both connected and disconnected). These options were previously unavailable on Windows 8.1 Connected Standby systems.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 05413261-B2B5-4987-81C2-A853C61BBA92
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Power configuration options


The configuration options described in this topic are available on all Modern Standby systems (both connected and disconnected). These options were previously unavailable on Windows 8.1 Connected Standby systems.

**Note**  S3 Sleep and Hibernate are not available on Windows 10 Mobile.

 

## Hibernate


The ability to trigger a system to doze to hibernate from Modern Standby is exposed in Windows 10. By default, this behavior is off, but can be set through the advanced control panel, similarly to setting this behavior on a legacy S3 system. Care should be taken when using this functionality. In particular, the following factors need to be considered:

-   If the storage size on the system is extremely small, care should be taken to ensure the user experience is acceptable with hibernate enabled. Hibernate requires the creation of a hiberfile. In current builds, the default hiberfile size is 80% of the system memory size. We are investigating creating a default hiberfile size that is smaller for systems with a primary drive under 128 GB.
-   Once the system dozes to hibernate, background activity, and “always on”-related functionality stops. The doze timer should be set high enough to ensure that a user would find it acceptable that they would not have such functionality.

## S3 Object presence in ACPI firmware


From a user experience perspective, the S3 and Modern Standby experiences were mutually exclusive on the same hardware. When the user selects Sleep in the OS, only one or the other could happen.

It is expected that a system could be configured to have both an S3 object and a populated FADT table (ACPI S0 Low Power Idle flag, same for Windows 8.1 Connected Standby and Modern Standby), making it possible for enterprise users to change to Windows 7 without requiring any BIOS changes.

 

 






