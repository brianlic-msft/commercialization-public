---
author: kpacquer
Description: Disabling the initial setup process
ms.assetid: e0aa36a7-5524-42de-855d-1a9b7e03e250
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Disabling the initial setup process
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disabling the initial setup process


To disable the device's initial setup process (also sometimes called the *out-of-box experience* or *OOBE*) in a Test, Health, or Production image that is used during manufacturing, include the SKIPOOBE imaging feature in the OEMnput.xml file that is used to build the image.

The SKIPOOBE feature sets the **OobeHeadless** registry value (a REG\_DWORD value under the HKEY\_LOCAL\_MACHINE\\Software\\Microsoft\\Shell\\OOBE entry) to 1. Alternatively, you can configure this registry value directly in one of your own packages. The following example demonstrates a package XML file that sets this registry value.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  Owner="Contoso"
  Component="Shell"
  SubComponent="DisableOOBE"
  OwnerType="OEM"
  ReleaseType="Production" xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00">

  <Macros>
    <Macro Id="hklm.shell" Value="$(hklm.microsoft)\Shell"/>
  </Macros>

  <Components>
    <OSComponent>
      <RegKeys>
        <RegKey KeyName="$(hklm.shell)\OOBE">
          <RegValue Name="OobeHeadless" Type="REG_DWORD" Value="00000001" />
        </RegKey>
      </RegKeys>
    </OSComponent>
  </Components>
</Package>
```

## <span id="related_topics"></span>Related topics


[Specifying files and registry entries in a package project file](https://msdn.microsoft.com/library/dn789219)

 

 






