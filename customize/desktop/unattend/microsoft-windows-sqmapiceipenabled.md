---
title: CEIPEnabled
description: CEIPEnabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4f57233c-4856-473f-ab6e-7a6506b6a59b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CEIPEnabled


`CEIPEnabled` indicates whether the Windows Customer Experience Improvement Program (CEIP) is enabled.

If the Microsoft-Windows-SQMAPI component is enabled, it collects and sends data to Microsoft about Windows usage. Participation in this program is voluntary, and the results are recorded to implement improvements for future releases.

This setting has no effect on Server Core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong></p></td>
<td><p>Specifies that Windows CEIP is chosen during OOBE. If the user decides to skip OOBE during installation, CEIP will be opted out. The user receives no further notifications.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>1</strong></p></td>
<td><p>Specifies that Windows CEIP collects and sends anonymous data to Microsoft to help improve Windows.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-SQMAPI](microsoft-windows-sqmapi.md) | **CEIPEnabled**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-SQMAPI](microsoft-windows-sqmapi.md).

## XML Example


The following XML output disables Windows CEIP.

``` syntax
<CEIPEnabled>0</CEIPEnabled>
```

## Related topics


[Microsoft-Windows-SQMAPI](microsoft-windows-sqmapi.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CEIPEnabled%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





