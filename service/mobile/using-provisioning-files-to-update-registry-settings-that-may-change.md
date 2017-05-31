---
author: kpacquer
Description: Using provisioning files to update registry settings that may change
ms.assetid: 77262c4c-69e2-456e-909b-27bd4e0d21f1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Using provisioning files to update registry settings that may change
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Using provisioning files to update registry settings that may change


Standard package updates are not applied to registry data that have been changed—for example, by a user who alters a menu setting that is stored in the registry. To update the values of this category of registry data, provisioning XML (provxml) must be used. If provxml is not used to update the registry data that has been changed since the device was flashed in the factory, the update will report success to the user, but the registry changes in a standard update will not be applied.

**Important**  
Registry updates for entries that will not be changed can be handled by using standard updates. Only use provxml files in updates when there is an unavoidable need to update registry entries that may change.

 

## <span id="AvoidingTheNeed"></span><span id="avoidingtheneed"></span><span id="AVOIDINGTHENEED"></span>Registry update strategies


To avoid the need to update existing registry data, your code could be updated to read the existing registry data and migrate it to a new key, so that any existing user settings are preserved. Alternatively, approaches such as adding a version number check when the application starts (to determine which registry values to use) may be appropriate. If none of these approaches are possible, provxml can be used to overwrite the existing registry settings.

## <span id="Updating_registry_settings_with_provxml"></span><span id="updating_registry_settings_with_provxml"></span><span id="UPDATING_REGISTRY_SETTINGS_WITH_PROVXML"></span>Updating registry settings with provxml


Most updates can be created without the need for provisioning XML (provxml). But there are certain situations where the use of provxml may be required. If a registry value can be modified by a user setting or code that executes on the phone at any time before the update is applied, standard package updates respect those changes and do not overwrite the existing registry data. In this situation, the provxml described here must be used.

You can use OMA CP provisioning using provxml.

This sample provxml sets the value of a single registry entry.

``` syntax
<wap-provisioningdoc>
  <characteristic type="Registry">
    <characteristic type="HKLM\Software\ExampleRegistryKey>
      <parm name="ExampleSettingName" value="0" datatype="integer"/>
    </characteristic>
  </characteristic>
</wap-provisioningdoc>
```

Use the following syntax for the provxml file naming:

``` syntax
mxipupdate_PackageName_n.provxml
```

For the value of *n* for the first update, start with 001 and increment the value for each subsequent update. All provxml updates are applied in the order specified by *n*.

``` syntax
mxipupdate_updateExample_001.provxml
```

## <span id="Creating_a_package_for_the_provxml"></span><span id="creating_a_package_for_the_provxml"></span><span id="CREATING_A_PACKAGE_FOR_THE_PROVXML"></span>Creating a package for the provxml


Create a package file that places these files in the proper update directory as shown. Provide an appropriate Owner value. For more info, see [Primary elements and attributes of a package project file](https://msdn.microsoft.com/library/dn756796).

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
    Owner="Contoso"
    OwnerType="OEM"
    Platform="" 
    Component="Update"
    SubComponent="PROVXML"
    ReleaseType="Production"
>
  <Components>
    <OSComponent>
      <Files>
        <File Source="mxipupdate_updateExample_001.provxml" 
          DestinationDir="$(runtime.updateProvxmlOEM)" />
      </Files>
    </OSComponent>
  </Components>
</Package>
```

Generate the package, and then include the provisioning package in the OS image that will be used to submit updates to Microsoft. For more information, see [Creating packages](https://msdn.microsoft.com/library/dn756642) and [Submit an update](submit-an-update.md).

## <span id="Resetting_the_phone_and_provxml_registry_updates"></span><span id="resetting_the_phone_and_provxml_registry_updates"></span><span id="RESETTING_THE_PHONE_AND_PROVXML_REGISTRY_UPDATES"></span>Resetting the phone and provxml registry updates


Update provxml files are processed after an update has been applied to the device. When the update is applied, the registry changes are stored in both the base OS image and the current, active registry. This means that when the device is reset, the registry changes that were delivered in an update are present, but updates to associated store apps that use those registry settings may not be present on the device. As OEMs prepare updates, they must identify possible usage scenarios, such as the phone being reset, and test those to create the desired user experience.

## <span id="Testing_provisioning_file_in_updates"></span><span id="testing_provisioning_file_in_updates"></span><span id="TESTING_PROVISIONING_FILE_IN_UPDATES"></span>Testing provisioning file in updates


Two scenarios must be tested to validate an update provisioning file:

-   Update—Using a base image, apply the update. Verify that the changes in the provxml were applied.

-   Reset—To test this after the phone has been updated, use **Settings** &gt; **System** &gt; **About** &gt; **Reset your phone**. Verify that the update changes in the provxml were applied.

It is important to verify that the update will work properly if the user has altered settings that the update targets. In addition, the standard guidance for update testing should be followed. For more info, see [Test an update](test-an-update.md).

## <span id="Provxml_update_error_handling"></span><span id="provxml_update_error_handling"></span><span id="PROVXML_UPDATE_ERROR_HANDLING"></span>Provxml update error handling


During an update, provxml files are processed on a best-effort basis. If a provxml file cannot be processed due to formatting errors or permissions issues, the file is skipped, and processing of subsequent provxmls continues. In development of the prvoxml, you can check the status that is stored in the registry at **HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\DataMigrationFramework\\ProvisioningStatus\\Microsoft**. A registry entry is created for each provxml file that is processed, and the HRESULT from processing the file is stored as the entry value.

 

 





