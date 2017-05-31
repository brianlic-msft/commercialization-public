---
title: ProductKey
description: ProductKey
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e2270219-f566-4116-bd76-f7342cf493d6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ProductKey


`ProductKey` contains settings that specify which edition of Windows to install. The product key that you purchase determines which edition you can install.

**Note**  
For more information about product keys, see the topic [Work with Product Keys and Activation](http://go.microsoft.com/fwlink/p/?linkid=208192) in the Windows Assessment and Deployment Kit (Windows ADK).

 

## Comparison of Product Key Settings


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>microsoft-windows-setup-\UserData\ProductKey\[Key](microsoft-windows-setup-userdata-productkey-key.md)</p></td>
<td><p>Specifies the Windows image to install during Windows Setup.</p></td>
</tr>
<tr class="even">
<td><p>Microsoft-Windows-Shell-Setup\[ProductKey](microsoft-windows-shell-setup-productkey.md)</p></td>
<td><p>Specifies a product key to activate Windows with. This setting can be used with microsoft-windows-setup-\UserData\ProductKey\Key, and the two product keys can be different.</p>
<p>If you are using a Volume License Multiple Activation Key (MAK), you must specify the MAK by using this setting.</p></td>
</tr>
</tbody>
</table>

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Key](microsoft-windows-setup-userdata-productkey-key.md)</p></td>
<td><p>Specifies the product key.</p></td>
</tr>
<tr class="even">
<td><p>[WillShowUI](microsoft-windows-setup-userdata-productkey-willshowui.md)</p></td>
<td><p>Specifies the circumstances in which the user interface (UI) for the product key will be displayed.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [UserData](microsoft-windows-setup-userdata.md) | **ProductKey**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set user data.

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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ProductKey%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





