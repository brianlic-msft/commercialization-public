---
title: PreventDeviceEncryption
description: PreventDeviceEncryption
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 263bc799-4ea2-49db-86f3-547d20fc1618
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PreventDeviceEncryption


`PreventDeviceEncryption` prevents encrypting the operating system drive and any fixed data drive using Windows BitLocker Drive Encryption. Device encryption is a feature available on Windows 8.1 PCs that supports InstantGo. When a user boots the PC for the first time and goes through the out-of-the-box experience, device encryption, on initialization, will automatically encrypt the operating system drive and any fixed data drive using BitLocker.

Use this setting to prevent device encryption from automatically encrypting the operating system drive and any fixed data drive using BitLocker.

**Note**  
These settings only apply to Windows 8.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>false</strong></p></td>
<td><p>Automatically encrypt the operating system drive and any fixed data drive using BitLocker.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>true</strong></p></td>
<td><p>Do not automatically encrypt the operating system and any fixed data drive using BitLocker.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


offlineServicing

specialize

auditSystem

oobeSystem

## Parent Hierarchy


[microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md) | **PreventDeviceEncryption**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md).

## XML Example


The following example configures Windows 8.1 to not automatically encrypt the operating system drive and any fixed data drive using BitLocker when the PC first boots.

``` syntax
<component name="microsoft-windows-securestartup-filterdriver-" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <PreventDeviceEncryption>true</PreventDeviceEncryption>
</component
```

## Related topics


[microsoft-windows-securestartup-filterdriver-](microsoft-windows-securestartup-filterdriver.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PreventDeviceEncryption%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





