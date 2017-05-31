---
title: VMModeOptimizations
description: VMModeOptimizations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 90E1B5C4-9234-4FB7-A7FD-0BB9AE3783C4
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# VMModeOptimizations


`VMModeOptimizations` specifies settings you can use to customize the user experience when in VM mode.

## Child elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[SkipAdministratorProfileRemoval](microsoft-windows-shell-setup-oobe-vmmodeoptimizations-skipadministratorprofileremoval.md)</p></td>
<td><p>Use <code>SkipAdministratorProfileRemoval</code> to skip removal of the administrator profile when in VM mode.</p></td>
</tr>
<tr class="even">
<td><p>[SkipNotifyUILanguageChange](microsoft-windows-shell-setup-oobe-vmmodeoptimizations-skipnotifyuilanguagechange.md)</p></td>
<td><p>Use <code>SkipNotifyUILanguageChange</code> in VM mode if the language will not change during setup.</p></td>
</tr>
<tr class="odd">
<td><p>[SkipWinREInitialization](microsoft-windows-shell-setup-oobe-vmmodeoptimizations-skipwinreinitialization.md)</p></td>
<td><p>Use <code>SkipWinREInitialization</code> in VM mode, particularly in a container scenario where recovery is not important, to skip initialization of the Windows Recovery Environment (Windows RE) image.</p></td>
</tr>
</tbody>
</table>

 

## Valid configuration passes


oobeSystem

## Parent hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OOBE](microsoft-windows-shell-setup-oobe.md) | **VMModeOptimizations**

## Applies to


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML example


The following example shows how to set the VM mode optimization settings in the OOBE node of your Unattend.xml file.

``` syntax
            <OOBE>
                <VMModeOptimizations>
                    <SkipAdministratorProfileRemoval>true</SkipAdministratorProfileRemoval>
                    <SkipNotifyUILanguageChange>true</SkipNotifyUILanguageChange>
                    <SkipWinREInitialization>true</SkipWinREInitialization>  
                </VMModeOptimizations>
            </OOBE>
```

**Note**  You must specify /mode:vm during sysprep to fully enable this setting.

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20VMModeOptimizations%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




