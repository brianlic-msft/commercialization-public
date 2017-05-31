---
author: kpacquer
Description: 'If you want to test Manufacturing Mode, you can enable it by using ffutool.exe or by using a BCD setting.'
ms.assetid: a5506896-0692-4256-a307-075da141ad44
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Enable or Disable Manufacturing Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable or Disable Manufacturing Mode


If you want to test Manufacturing Mode, you can enable it by using ffutool.exe or by using a BCD setting.

**Note**  The recommended way to support manufacturing mode on shipping devices is to have the firmware support the Boot mode management UEFI protocol. For more info on this protocol, see [Boot mode management UEFI protocol](boot-mode-management-uefi-protocol.md).

 

## <span id="enable_or_disable_manufacturing_mode_with_ffutool.exe"></span><span id="ENABLE_OR_DISABLE_MANUFACTURING_MODE_WITH_FFUTOOL.EXE"></span>Enable or disable Manufacturing Mode with ffutool.exe


If the device supports the boot mode UEFI protocol, you can enable or disable Manufacturing Mode with ffutool.exe by using the **setBootMode** parameter. The syntax is as follows:

``` syntax
ffutool.exe -setBootMode <boot mode> <profile name>
```

-   *boot mode* -- an integer that corresponds to the boot mode documented in [EFI\_BOOT\_MODE\_INFO enumeration](efi-boot-mode-info-enumeration.md).
-   *profile name* -- the name of the manufacturing profile to enable. This is required when the boot mode is set to 1 and is ignored when the boot mode is set to 0.

The following example enables Manufacturing Mode and uses a manufacturing profile named CustomProfile:

``` syntax
ffutool.exe -setBootMode 1 CustomProfile
```

The following example disables Manufacturing Mode, allowing the operating system to boot normally:

``` syntax
ffutool.exe -setBootMode 0
```

## <span id="Enable_Manufacturing_Mode_with_a_BCD_setting"></span><span id="enable_manufacturing_mode_with_a_bcd_setting"></span><span id="ENABLE_MANUFACTURING_MODE_WITH_A_BCD_SETTING"></span>Enable Manufacturing Mode with a BCD setting


You can use the MfgMode BCD setting to test Manufacturing Mode with your custom manufacturing profiles. MfgMode is a string value that is set to the name of your custom manufacturing profile.

For example, you can start the device in Manufacturing Mode using the default manufacturing profile by running the following command on the device:

``` syntax
bcdedit.exe /set {default} mfgmode "default"
```

Or, you could start the device in Manufacturing Mode using a custom manufacturing profile named, CustomProfile, by doing the following:

``` syntax
bcdedit.exe /set {default} mfgmode "CustomProfile"
```

You can also enable it on an offline device that is plugged in and is in USB mass storage mode. For example:

``` syntax
bcdedit.exe /store "D:\EFIESP\efi\Microsoft\Boot\BCD" /set {default} mfgmode "default"
```

**Note**  If you're using an older version of bcdedit.exe, you might have to use **custom:22000140** instead of **mfgmode** as the BCD setting name.

 

## <span id="Create_a_Manufacturing_Mode_BCD_package"></span><span id="create_a_manufacturing_mode_bcd_package"></span><span id="CREATE_A_MANUFACTURING_MODE_BCD_PACKAGE"></span>Create a Manufacturing Mode BCD package


You can create a package that creates the MfgMode BCD entry and sets it to your custom manufacturing profile. To do this, you must first create an XML file that references the BCD entry:

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<BootConfigurationDatabase xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/phone/2011/10/BootConfiguration">
  <Objects>

    <!-- Global Settings Group -->
    <Object SaveKeyToRegistry="false">
      <FriendlyName>Windows Loader</FriendlyName>
      <Elements>

        <Element>
          <DataType>
            <WellKnownType>Manufacturing Mode</WellKnownType>
          </DataType>
          <ValueType>
            <StringValue>Default</StringValue>
          </ValueType>
        </Element>

      </Elements>
    </Object>

  </Objects>
</BootConfigurationDatabase>
```

After that is created, you can reference it in a package XML file:

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
        Owner="Contoso"
        Component="MfgMode"
        SubComponent="ManufacturingModeBcd"
        ReleaseType="Production"
        Partition="EFIESP"
        OwnerType="OEM">

    <Components>
        <BCDStore Source=".\exampleBcd.bcd.xml"/>
    </Components>
</Package>
```

**Note**  There is a Partition attribute defining that these BCD entries need to apply to the EFIESP partition. This should be updated to be the partition where the BCD store for your device resides. If this is different from the partition where the main operating system resides, other operations such as adding files and registry keys to the main operating system partition cannot be done from the same package.

 

To create the package, you can use pkggen.exe (included with the Windows Driver Kit):

``` syntax
pkggen.exe exampleBcd.pkg.xml /config:pkggen.cfg.xml
```

 

 





