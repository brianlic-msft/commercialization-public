---
author: kpacquer
Description: 'You can add manufacturing profiles to your device by using a package.'
ms.assetid: 9925eedf-a49e-4545-b071-72d10925f080
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create a custom manufacturing profile package
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a custom manufacturing profile package


You can add manufacturing profiles to your device by using a package. For more info on creating packages, see [Creating packages](https://msdn.microsoft.com/library/dn756642) . In some cases, you may need to create a custom profile. For example, perhaps you want to fine tune what Microsoft services are running for performance or functionality reasons or perhaps you want to have more than one manufacturing profile. When creating new custom profiles, you should start by copying the provided default profile and customizing it to suit your needs.

For example, if you wanted to create a new custom profile for factory testing that is a copy of the default profile but also starts your factory test service, it may look like this:

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
        Owner="Contoso"
        Component="MfgMode"
        SubComponent="ManufacturingModeServices"
        ReleaseType="Production"
        OwnerType="OEM">

    <Macros>
      <Macro Id="MfgMode" Value="$(hklm.control)\ManufacturingMode" />
      <Macro Id="CustomProfileServices" Value="$(MfgMode)\CustomProfile\Services" />
    </Macros>

    <Components>
        <OSComponent>
         <!-- Overrides copied from default profile -->
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\*">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000003" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\AccountProvSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>              
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\adss">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\AudioSrv">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\BFE">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\BrokerInfrastructure">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\cellusermodeinterconnect">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\DcomLaunch">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\DHCP">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\Fusion">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\KeepWifiOnSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000003" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\LaunchAppSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\MPSSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\NETACT">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\nsi">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\Power">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\ProfSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\RpcEptMapper">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\RpcSs">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\SamSs">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\SecMgr">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\SirepSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000004" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\SystemEventsBroker">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\TestSirepSvc">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
         <!-- Custom overrides for OEM services -->
          <RegKeys>
            <RegKey KeyName="$(CustomProfileServices)\OEMFactoryTestService">
              <RegValue Name="Start" Type="REG_DWORD" Value="00000002" />
            </RegKey>
          </RegKeys>
        </OSComponent>
    </Components>
</Package>
```

You can then create the package by using pkggen.exe (included with the Windows Driver Kit):

``` syntax
pkggen.exe example.pkg.xml /config:pkggen.cfg.xml
```

 

 





