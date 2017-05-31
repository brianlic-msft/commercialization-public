---
title: ProductKey
description: ProductKey
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9c0b8b7c-382a-48d9-ad3c-4d23d0dae2db
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


`ProductKey` specifies the product key to use for Windows activation.

**Important**  
Entering an invalid product key in the answer file will cause Windows Setup to fail.

 

If you are using a Volume License Multiple Activation Key (MAK), you must specify it in the `ProductKey` setting. If you preinstall Windows under a volume license agreement, consult your specific license agreement to determine the number of installations permitted per product key. For more information about product keys, see [Work with Product Keys and Activation](http://go.microsoft.com/fwlink/?LinkId=206615) in the Windows Assessment and Deployment Kit (Windows ADK) Technical Reference.

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
<td><p>Microsoft-Windows-Shell-Setup\<code>ProductKey</code></p></td>
<td><p>Specifies a Product Key to activate Windows. This setting can be used with microsoft-windows-setup-\UserData\ProductKey\<code>Key</code>. The two product keys can be different.</p></td>
</tr>
</tbody>
</table>

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Product_key</em></p></td>
<td><p>Specifies the key used to install and to activate Windows. <em>Product_key</em> is a 29-character string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **ProductKey**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set the product key.

``` syntax
<ProductKey>AAAAA-BBBBB-CCCCC-DDDDD-EEEEE</ProductKey>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ProductKey%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





