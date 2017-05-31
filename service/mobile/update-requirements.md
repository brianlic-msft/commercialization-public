---
author: kpacquer
Description: Update requirements
ms.assetid: 3f2c96f5-cc52-44a2-b61d-279b649995fc
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Update requirements
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update requirements


This section contains the requirements for any updates that will be installed on retail devices.

## <span id="General_update_requirements"></span><span id="general_update_requirements"></span><span id="GENERAL_UPDATE_REQUIREMENTS"></span>General update requirements


An OEM update package must conform to the following requirements.

-   Preloaded apps must be updated by using the store.

-   Update targeting information must be set in the image and the Mobile Operator ID and Device ID must be submitted by OEM partners with every update request. For more info about setting the Mobile Operator ID and Device ID when creating an update request, see [New-RequestForUpdate cmdlet](new-requestforupdate-cmdlet.md).

-   For all packages, OEMs must set the required attribute values. For more info, see the “Package attributes” section in [Primary elements and attributes of a package project file](https://msdn.microsoft.com/library/dn756796).

## <span id="Windows_Standard_Package_Configuration__WSPC__compliance"></span><span id="windows_standard_package_configuration__wspc__compliance"></span><span id="WINDOWS_STANDARD_PACKAGE_CONFIGURATION__WSPC__COMPLIANCE"></span>Windows Standard Package Configuration (WSPC) compliance


Retail packages must comply to the [Windows Standard Packaging Configuration (WSPC) requirements for retail images](https://msdn.microsoft.com/library/dn756781).

When you submit firmware updates, image validation is run twice:

-   When you run [Initialize-FirmwareSubmission cmdlet](initialize-firmwaresubmission-cmdlet.md) without the -NonWspcCompliant parameter, the ingestion client validates the submission. If the image validation fails, the image submission fails to initialize.

-   After you submit the changes, the Microsoft Update systems perform image validation a second time before processing it for code signing. If the image validation fails this check, the submission will not continue to be processed for code signing.

## <span id="Firmware_versioning_requirements"></span><span id="firmware_versioning_requirements"></span><span id="FIRMWARE_VERSIONING_REQUIREMENTS"></span>Firmware versioning requirements


**Versioning scheme**

Create a versioning scheme that includes a four-part version number.

Packages are only updated when the new package number is greater than the old package number. The package numbers must use a hierarchical scheme from left to right, such that version 2.0.0.0 is greater than version 1.9.9.9.

We recommend using the silicon vendor (SV) version number, followed by the OEM version number. Example: *SV-Major.SV-Minor.OEM-Major.OEM-Minor*. For consistency, consider using build environment variables such as the date when creating your versioning scheme.

With each new update, create a new version number. Provide both the old and new version number when submitting the update. For example:

1.  0001.0001.0001.20140801 -&gt; 0001.0040.0055.20140808

2.  0001.0040.0055.20140808 -&gt; 0001.0040.0077.20140815

3.  0001.0040.0077.20140815 -&gt; 0002.0000.0077.20140822

Failure to meet this requirement leads to either ignored packages during update generation (for the packages where the version does not increase) or a complete failure in the update generation processes.

**To prevent versioning errors:**

-   Keep track of the version numbers in a separate spreadsheet.

-   Don't send two versions of the same package with the same previous version number - each update must be chained together to the previous version. The device update publishing service reserves the right to reject requests for updates (RFUs) that do not include the target version of the previous update as the source version of the new update.

**Versioning FAQ**

*What happens if I don't change my version number and the contents of my package changes?*

The package will be considered to be the same as the existing version, and it will not be downloaded and installed when users update their device

*Should I use the same version numbers across all my packages?*

Some versions may be different if they accurately indicate a previous package version will be used. You should be consistent with the versioning scheme that is used, for example in how versions numbers are incremented and what each element in the four part version number represents.

*Should all of the drivers' versions match the packages' versions for each update?*

It is recommended to have the drivers' package version numbers follow a similar versioning scheme as much as possible, but it is not a requirement that all versions of all of the packages be identical. Any package to be updated must have an incremented version number.

## <span id="Update_partition_requirements"></span><span id="update_partition_requirements"></span><span id="UPDATE_PARTITION_REQUIREMENTS"></span>Update partition requirements


**Warning**  
All user data and settings are preserved when updates are installed to the device. You are required to ensure that user settings are preserved when devices are updated.

 

The majority of updates are made to the main OS. There may be a need to update other partitions in the device. This section provides information about which partitions can be updated.

For info about the SV partitions, contact the SoC vendor.

**Important**  
Partition layout changes are not supported on the device.  If you submit binary partition packages that depend on a new partition layout, undefined results may occur when they are applied to the device

 

The following partitions can be updated:

-   EFIESP – Boot manager, boot configuration database, UEFI apps

-   UEFI

-   SBL1, SBL2, SBL3 – Secure boot loaders

-   RPM

-   TZ

-   PLAT – ACPI table

-   WINSECAPP

-   Main OS

OEMs must not update the following partitions.

-   DPP

-   Data – the user data partition

-   SD Card

-   Update OS

## <span id="ACPI_table_versioning_during_BSP_updates"></span><span id="acpi_table_versioning_during_bsp_updates"></span><span id="ACPI_TABLE_VERSIONING_DURING_BSP_UPDATES"></span>ACPI table versioning during BSP updates


Every time you change an ACPI table in a BSP update, you should increment the **OEMRevision** field in the **DefinitionBlock** object for the table. Doing this helps to ensure that the OS uses the latest ACPI configuration data.

## <span id="related_topics"></span>Related topics


[New-RequestForMicrosoftUpdate cmdlet](new-requestformicrosoftupdate-cmdlet.md)

[New-RequestForUpdate cmdlet](new-requestforupdate-cmdlet.md)

 

 






