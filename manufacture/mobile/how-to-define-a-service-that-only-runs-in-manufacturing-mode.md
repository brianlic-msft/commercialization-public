---
author: kpacquer
Description: 'There may be cases where you want a service to be normally disabled but automatically run when the device is in Manufacturing Mode.'
ms.assetid: 5504bade-5342-4006-9631-7321acd983ac
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Define a service that only runs in Manufacturing Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Define a service that only runs in Manufacturing Mode


There may be cases where you want a service to be normally disabled but automatically run when the device is in Manufacturing Mode. For example, your factory test suite would probably run in this configuration. You would set your service start type to Disabled and then add a manufacturing profile override that makes your service auto-start when using the appropriate manufacturing mode profile.

Here's an example manufacturing profile:

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
        Owner="Contoso"
        Component="MfgMode"
        SubComponent="FactoryTest"
        ReleaseType="Production"
        OwnerType="OEM">

    <Macros>
      <Macro Id="MfgMode" Value="$(hklm.control)\ManufacturingMode" />
      <Macro Id="CustomProfileServices" Value="$(MfgMode)\CustomProfile\Services" />
    </Macros>

    <Components>
      <!-- Definition for the service -->
      <Service
        Name="FactoryService"
        Start="Disabled"
        Type="Win32OwnProcess"
        ErrorControl="Ignore"
        DisplayName="OEMFactoryTestService"
        Description="A Sample OEM Factory Test Service">

        <Executable Source="$(BINARY_ROOT)\bin\factory\oem_factory_test_service.exe" />

        <!-- Failure actions should reset once per day, for security reasons -->
        <FailureActions ResetPeriod="86400">
          <Action Type="RestartService" Delay="1000"/>
          <Action Type="RestartService" Delay="1000"/>
          <Action Type="RestartService" Delay="1000"/>
          <!-- if it fails to start three times, services should just stop -->
          <Action Type="None" Delay="0"/>
        </FailureActions>

        <RequiredCapabilities>
          <!-- Needed to access and create RPC endpoints -->
          <RequiredCapability CapId="ID_CAP_INTEROPSERVICES" />
        </RequiredCapabilities>

      </Service>

      <OSComponent>
        <!-- Set the factory test service to auto-start when the device is in Manufacturing Mode -->
        <RegKeys>
          <RegKey KeyName="$(CustomProfileServices)\OEMFactoryTestService">
            <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
          </RegKey>
        </RegKeys>
      </OSComponent>

    </Components>
</Package>
```

 

 





