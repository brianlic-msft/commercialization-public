---
title: TabProcessGrowth
description: TabProcessGrowth
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c80d9bdb-a943-407e-9f39-e742c7091377
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TabProcessGrowth


`TabProcessGrowth` sets the rate at which Internet Explorer creates new tab processes.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>High</p></td>
<td><p>Internet Explorer allows the tab process to grow very quickly, and is intended only for computers with ample physical memory.</p></td>
</tr>
<tr class="even">
<td><p>Medium</p></td>
<td><p>Internet Explorer allows a medium number of tab processes to start.</p>
<p>This is the default setting.</p></td>
</tr>
<tr class="odd">
<td><p>Low</p></td>
<td><p>Internet Explorer creates very few tab processes.</p></td>
</tr>
</tbody>
</table>

 

If no value is entered, then the default setting is to create the optimal number of tab processes based on the operating system and amount of physical memory. We recommend the default setting.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | **TabProcessGrowth**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to configure Internet Explorer to allow tab processes to grow quickly.

``` syntax
<TabProcessGrowth>Large</TabProcessGrowth>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TabProcessGrowth%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





