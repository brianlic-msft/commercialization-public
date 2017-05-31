---
title: DynamicUpdate
description: DynamicUpdate
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 25dd9e6b-db95-46a6-bac2-62b2efdcfcf4
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DynamicUpdate


`DynamicUpdate` specifies whether to enable Dynamic Updates during Windows Setup. Dynamic Updates search for new Windows Setup files, including drivers and other files, to be used to install the Windows operating system.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Enable](microsoft-windows-setup-dynamicupdate-enable.md)</p></td>
<td><p>Specifies whether to enable dynamic updates for installation.</p></td>
</tr>
<tr class="even">
<td><p>[WillShowUI](microsoft-windows-setup-dynamicupdate-willshowui.md)</p></td>
<td><p>Specifies in what circumstances to show the user interface (UI) for dynamic updates.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **DynamicUpdate**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows the value for the `DynamicUpdate` setting.

``` syntax
<DynamicUpdate>
   <Enable>true</Enable>
   <WillShowUI>Never</WillShowUI>
</DynamicUpdate>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

[Dynamic Update and Resulting Internet Communication in Windows 7 and Windows Server 2008 R2](http://go.microsoft.com/fwlink/?LinkId=189355)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DynamicUpdate%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





