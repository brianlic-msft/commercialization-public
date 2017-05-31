---
title: AcceptEula
description: AcceptEula
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9818a53a-be85-416f-ba6d-8fd8841d770f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# AcceptEula


`AcceptEula` specifies whether to automatically accept the Microsoft Software License Terms.

**Note**  
This setting is required for all unattended installations. To prevent the Windows Setup user interface (UI) from displaying, you must configure this setting. For a complete list of required settings, see the [How to Automate Windows Setup](http://go.microsoft.com/fwlink/?LinkId=206673) topic in the Windows Assessment and Deployment Kit (Windows ADK) Technical Reference.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the license terms are automatically accepted without being displayed to the end user.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Prompts the end user to accept the license terms before proceeding with Windows Setup. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
The value for `AcceptEula` is ignored during upgrades.

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [UserData](microsoft-windows-setup-userdata.md) | **AcceptEula**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following sample XML output shows how to set user data.

``` syntax
<UserData>
   <AcceptEula>true</AcceptEula>
   <FullName>EndUserName</FullName>
   <Organization>Fabrikam</Organization>
   <ProductKey>
      <Key>12345-12345-12345-12345-12345</Key>
      <WillShowUI>Never</WillShowUI>
   </ProductKey>
</UserData>
```

## Related topics


[UserData](microsoft-windows-setup-userdata.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20AcceptEula%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





