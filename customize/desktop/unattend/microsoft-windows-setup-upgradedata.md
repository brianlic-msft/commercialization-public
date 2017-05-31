---
title: UpgradeData
description: UpgradeData
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9dd51e38-f4dd-4ce4-ad6c-fb89604e778a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UpgradeData


`UpgradeData` specifies whether the installation type is an upgrade of an existing operating system. This setting also specifies in what circumstances the user interface (UI) is displayed.

Windows Setup does not support using any other unattended Setup settings during upgrades. When you upgrade from an earlier version of Windows, you must create an answer file that includes only the Windows-Setup\\`UpgradeData` settings. Then, you must use either the Windows product DVD or the System Preparation (Sysprep) tool to upgrade Windows.

For a sample answer file, see the [XML Example](#xmlexample) section.

**Caution**  
If you use an installation image that was originally installed by using an Unattend.xml file, and you execute the **Repair in-place upgrade (overwrite installation)** option, the upgrade installation may quit. You may not be able to restart the installation. For more information, see [Knowledge Base Article ID 2425962](http://go.microsoft.com/fwlink/?LinkId=209802).

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Upgrade](microsoft-windows-setup-upgradedata-upgrade.md)</p></td>
<td><p>Specifies whether the installation is an upgrade of an existing operating system.</p></td>
</tr>
<tr class="even">
<td><p>[WillShowUI](microsoft-windows-setup-upgradedata-willshowui.md)WillShowUI</p></td>
<td><p>Specifies in what circumstances the UI is displayed.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **UpgradeData**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## <a href="" id="xmlexample"></a>XML Example


The following XML output shows how to set an upgrade installation to run in guaranteed quiet mode.

``` syntax
<UpgradeData>
   <Upgrade>true</Upgrade>
   <WillShowUI>Never</WillShowUI>
</UpgradeData>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UpgradeData%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





