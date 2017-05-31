---
title: UseConfigurationSet
description: UseConfigurationSet
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 680ae979-d918-4112-b277-7e5233a0266a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UseConfigurationSet


`UseConfigurationSet` specifies whether to use a configuration set for Windows Setup.

A configuration set is a folder that contains additional device drivers, applications, or other binaries that you want to add to Windows during installation. You can create a configuration set in Windows System Image Manager (Windows SIM). Configuration sets are useful when a network share is not available. Configuration sets can be stored on removable media and used to install Windows in the field. Creating a configuration set in Windows SIM exports binaries referenced in the unattended installation answer file and puts them together into a self-contained file set. Windows SIM automatically appends the paths to the configuration set when it validates and saves the answer file.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that a configuration set is used.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that a configuration set is not used. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **UseConfigurationSet**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output specifies that a configuration set is used.

``` syntax
<UseConfigurationSet>true</UseConfigurationSet>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UseConfigurationSet%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





