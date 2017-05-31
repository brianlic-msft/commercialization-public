---
title: ResourceDll
description: ResourceDll
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 136a4f0a-4058-4a26-afba-bae38063f781
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ResourceDll


`ResourceDll` specifies the resource DLL file that is used for multiple settings that describe an online backup service in the Windows Server Backup menus. These settings include Microsoft-Windows-BLB-WSB-Online-Main\\[DescriptionText1](microsoft-windows-blb-wsb-online-main-descriptiontext1.md), [DescriptionText2](microsoft-windows-blb-wsb-online-main-descriptiontext2.md), [Icon](microsoft-windows-blb-wsb-online-main-icon.md), [Link1](microsoft-windows-blb-wsb-online-main-link1.md), [Link1Text](microsoft-windows-blb-wsb-online-main-link1text.md), [Link2](microsoft-windows-blb-wsb-online-main-link2.md), [Link2Text](microsoft-windows-blb-wsb-online-main-link2text.md), and [ProviderName](microsoft-windows-blb-wsb-online-main-providername.md).

For information about how to create localized versions for these settings, see the topic [Using the MUI with Applications](http://go.microsoft.com/fwlink/?LinkId=140252).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path</em></p></td>
<td><p>Specifies the path and file name of a resource DLL file.</p>
<p><em>Path</em> is a string that has a maximum length of 259 characters.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-BLB-WSB-Online-Main](microsoft-windows-blb-wsb-online-main.md) | **ResourceDll**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-BLB-WSB-Online-Main](microsoft-windows-blb-wsb-online-main.md).

## XML Example


The following XML output shows how to describe a recommended online backup service. This includes provider information, descriptions, links, and an icon.

``` syntax
<EnableOnlineBackup>true</EnableOnlineBackup>
<ResourceDll>%ProgramFiles%\Microsoft Shared\Resource.dll</ResourceDll>
<ProviderName>100</ProviderName>
<Icon>101</Icon>
<Link1>200</Link1>
<Link1Text>201<Link1Text>
<DescriptionText1>202</DescriptionText1>
<Link2>300</Link2>
<Link2Text>301<Link2Text>
<DescriptionText2>302</DescriptionText2>
```

## Related topics


[Microsoft-Windows-BLB-WSB-Online-Main](microsoft-windows-blb-wsb-online-main.md)

[DescriptionText1](microsoft-windows-blb-wsb-online-main-descriptiontext1.md)

[DescriptionText2](microsoft-windows-blb-wsb-online-main-descriptiontext2.md)

[Icon](microsoft-windows-blb-wsb-online-main-icon.md)

[Link1](microsoft-windows-blb-wsb-online-main-link1.md)

[Link1Text](microsoft-windows-blb-wsb-online-main-link1text.md)

[Link2](microsoft-windows-blb-wsb-online-main-link2.md)

[Link2Text](microsoft-windows-blb-wsb-online-main-link2text.md)

[ProviderName](microsoft-windows-blb-wsb-online-main-providername.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ResourceDll%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





