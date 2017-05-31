---
title: DomainSecretKeyPersisted
description: Specifies whether to persist the domain secret key on a device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B95C42F5-CF42-4E60-A18A-5D556DD2D5B2
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DomainSecretKeyPersisted


Specifies whether to persist the domain secret key on a device.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>False</p></td>
<td><p>Do no persist the domain secret key on the device.</p></td>
</tr>
<tr class="even">
<td><p>True</p></td>
<td><p>Persist the domain secret key on the device.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Embedded-UnifiedWriteFilter](microsoft-windows-embedded-unifiedwritefilter.md) | **DomainSecretKeyPersisted**

## Valid Configuration Passes


specialize

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Embedded-UnifiedWriteFilter](microsoft-windows-embedded-unifiedwritefilter.md).

## XML example


``` syntax
<settings pass="specialize">
    <component name="Microsoft-Windows-Embedded-UnifiedWriteFilter" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="NonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <DomainSecretKeyPersisted>False</DomainSecretKeyPersisted>
    </component>
</settings>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DomainSecretKeyPersisted%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




