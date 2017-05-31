---
title: ItemName
description: ItemName
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 720b5106-47e7-4de3-8038-5211b8f48989
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ItemName


`ItemName` is the display name of [CustomPowerApplication3](microsoft-windows-stobject-custompowerapplication3.md)

To use a different `ItemName` for each language, create a resource file, and refer to it using the format: "filename.dll,-referenceid". For information on creating localized text versions for this setting, see the topic [Using the MUI with Applications](http://go.microsoft.com/fwlink/?LinkId=140252).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Name</em></p></td>
<td><p>Specifies the display name to use for [CustomPowerApplication3](microsoft-windows-stobject-custompowerapplication3.md).</p>
<p><code>ItemName</code> is represented as @<em>dllname,-resourceid</em>, where <em>dllname</em> is the full path to the resource DLL, including environment variables. For example,</p>
<pre class="syntax" space="preserve"><code>@%ProgramFiles%\Microsoft Shared\Resource.dll,-100</code></pre>
<p><em>Name</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


generalize

specialize

## Parent Hierarchy


[Microsoft-Windows-stobject](microsoft-windows-stobject.md) | [CustomPowerApplication3](microsoft-windows-stobject-custompowerapplication3.md) | **ItemName**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-stobject](microsoft-windows-stobject.md).

## XML Example


The following XML output shows `CustomPowerApplication3` Application.exe with `parameter -param`. `IconID` and `ItemName` included in the Resource.dll file.

``` syntax
<CustomPowerApplication3>
   <Application>C:\Program Files\CustomPower\Application.exe</Application>
   <IconID>@%ProgramFiles%\Microsoft Shared\Resource.dll,-200</IconID>
   <ItemName>%ProgramFiles%\Microsoft Shared\Resource.dll,-100</ItemName>
   <Parameters>-param</Parameters>
</CustomPowerApplication3>
```

## Related topics


[CustomPowerApplication3](microsoft-windows-stobject-custompowerapplication3.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ItemName%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





