---
author: kpacquer
Description: 'When you boot into Manufacturing Mode, can you skip OOBE and preinstall apps to run your manufacturing tests.'
ms.assetid: e448479f-6831-40b5-bb19-7ad4c22cdf6a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create a full operating system manufacturing profile
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a full operating system manufacturing profile


When you boot into Manufacturing Mode, can you skip OOBE and preinstall apps to run your manufacturing tests. Skipping OOBE can speed up manufacturing time.

To set this up, you add the apps that should be installed with the manufacturing profile. For more info about manufacturing profiles, see [Manufacturing Mode](manufacturing-mode.md).

## <span id="Add_apps_to_a_custom_manufacturing_profile"></span><span id="add_apps_to_a_custom_manufacturing_profile"></span><span id="ADD_APPS_TO_A_CUSTOM_MANUFACTURING_PROFILE"></span>Add apps to a custom manufacturing profile


In a manufacturing mode profile, you must create a new registry key that lists the apps that should be installed with the manufacturing profile:

``` syntax
HKEY_LOCAL_MACHINE\System\ControlSet001\Control\ManufacturingMode\<Profile Name>\Apps\OobeInstall
```

Under the OOBEInstall registry key, you must create registry key (with REG\_DWORD type) for each app. The name of the registry key must match the filename of the app package.

For example, to add the Settings app to the manufacturing profile, you would add a registry key named **systemsettings**.

Here are some things to consider when adding apps to a manufacturing profile:

-   The manufacturing profile must not disable any Windows services.
-   The value of the registry key is reserved. Only the registry key name is used.
-   The app can be a first or second party app, but the app package must be a part of the image.
-   The \* wildcard can be used in the name of the app.
-   If you want the normal OOBE experience (with all apps installed), create a single registry key with the name of **\***.

### <span id="Find_the_name_of_the_app"></span><span id="find_the_name_of_the_app"></span><span id="FIND_THE_NAME_OF_THE_APP"></span>Find the name of the app

The name of the registry key must match the filename of the app package. You can get a list of the apps that are on the device by running the following command on the device's drive root:

``` syntax
dir /S MPAP_*.provxml
```

This command returns a list of files, similar to the following:

``` syntax
MPAP_systemsettings_001.provxml
```

The part of the filename after **MPAP\_** and before **\_0xx.provxml** is what you should use for the registry key name.

## <span id="Add_the_registry_keys_to_your_custom_manufacturing_profile_package"></span><span id="add_the_registry_keys_to_your_custom_manufacturing_profile_package"></span><span id="ADD_THE_REGISTRY_KEYS_TO_YOUR_CUSTOM_MANUFACTURING_PROFILE_PACKAGE"></span>Add the registry keys to your custom manufacturing profile package


You add the registry keys to your custom manufacturing profile package like you would with any other package. For more info about packaging, see [Creating Phone Packages](https://msdn.microsoft.com/library/dn756642).

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
        Owner="Contoso"
        Component="MfgMode"
        SubComponent="Manufacturing.FactoryTestSample"
        ReleaseType="Production"
        OwnerType="OEM">

    <Macros>
      <Macro Id="MfgMode" Value="$(hklm.control)\ManufacturingMode" />
      <Macro Id="CustomProfile" Value="$(MfgMode)\CustomProfile" />
    </Macros>

    <Components>
        <OSComponent>
          <RegKeys>
            <RegKey KeyName="$(CustomProfile)\"/>
            <RegKey KeyName="$(CustomProfile)\Services"/>
            <RegKey KeyName="$(CustomProfile)\Apps"/>
            <RegKey KeyName="$(CustomProfile)\Apps\OobeInstall">
                <RegValue Name="FactoryTestOEMSample" Value="0" Type="REG_DWORD"/>
                <RegValue Name="systemsettings" Value="0" Type="REG_DWORD"/>
             </RegKey>
          </RegKeys>
        </OSComponent>
    </Components>
</Package>
```

 

 





