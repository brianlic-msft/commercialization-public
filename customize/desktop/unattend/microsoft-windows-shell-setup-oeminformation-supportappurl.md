---
title: SupportAppURL
description: SupportAppURL specifies the OEM-built support app that will be launched instead of the web URL.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: DB690B4B-4FCC-4074-97D7-C339BB8C24D3
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SupportAppURL


`SupportAppURL` specifies the OEM-built support app that will be launched instead of the web URL.

## Values


Set the value to your app's protocol handler, which is the value that's registered in your app's manifest file.

For example, in the following app manifest file snippet, the **Protocol Name** is **contoso-contact-support** so this will be the value that will be used for `SupportAppURL`:

``` syntax
      <Extensions>
        <uap:Extension Category="windows.protocol">
          <uap:Protocol Name="contoso-contact-support">
            <uap:DisplayName>contoso-resource:appDisplayName</uap:DisplayName>
          </uap:Protocol>
        </uap:Extension>
      </Extensions>
```

## Valid Passes


auditUser

generalize

offlineServicing

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OEMInformation](microsoft-windows-shell-setup-oeminformation.md) | **SupportAppURL**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set OEM information.

``` syntax
<OEMInformation>
   <HelpCustomized>true</HelpCustomized>
   <Manufacturer>OEM name</Manufacturer>
   <Model>model name</Model>
   <Logo>C:\Windows\OEM\Logo.bmp</Logo>
   <SupportAppURL>contoso-contact-support</SupportAppURL>
   <SupportHours>Monday to Friday, 9:00 A.M. to 5:00 P.M. Pacific Standard Time</SupportHours>
   <SupportPhone>425-555-0190</SupportPhone>
   <SupportURL>http://www.contoso.com</SupportURL>
</OEMInformation>
```

## Related topics


[OEMInformation](microsoft-windows-shell-setup-oeminformation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SupportAppURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





