---
title: DescriptionText1
description: DescriptionText1
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9e429cc1-3fa9-4bb3-beb7-2652411d904d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DescriptionText1


`DescriptionText1` specifies the first of two lines of a description of an online backup service in the Windows Server Backup menus.

Before an online backup service is installed, Windows displays a description of a recommended online backup service. This text is part of the description.

This description text is added to the resource DLL file that the [ResourceDll](microsoft-windows-blb-wsb-online-main-resourcedll.md) setting specifies, and may be localized for different regions. For information about how to create localized versions for these settings, see [Using the MUI with Applications](http://go.microsoft.com/fwlink/p/?linkid=247425).

The description text in the resource DLL file must be a text string. For example, the description may resemble the following:

`Learn how you can back up your important system files to our servers`.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ResourceID</em></p></td>
<td><p>Specifies the resource ID from the resource DLL file for the first of two lines of the description of the online backup service.</p>
<p><em>ResourceID</em> is an integer.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-BLB-WSB-Online-Main](microsoft-windows-blb-wsb-online-main.md) | **DescriptionText1**

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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DescriptionText1%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





