---
title: DfdAlertTextOverride
description: DfdAlertTextOverride
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 552e4902-e69d-4d89-9464-b0e3f422dac2
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DfdAlertTextOverride


`DfdAlertTextOverride` specifies a customized error message to display when the Windows Disk Diagnostic warning dialog box appears. You can use this customized text to specify support information, a website location, or other information.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Custom_Message</em></p></td>
<td><p>Specifies a customized message to display in the Windows Disk Diagnostic warning dialog box.</p>
<p><em>Custom_Message</em> is a string with a maximum of 512 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Passes


offlineServicing

generalize

specialize

## Parent Hierarchy


[Microsoft-Windows-Disk-Failure-Diagnostic-Module](microsoft-windows-disk-failure-diagnostic-module.md) | **DfdAlertTextOverride**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Disk-Failure-Diagnostic-Module](microsoft-windows-disk-failure-diagnostic-module.md).

## XML Example


The following XML output shows how to configure Windows Disk Diagnostic.

``` syntax
<EnabledScenarioExecutionLevel>2</EnabledScenarioExecutionLevel>
<DfdAlertTextOverride>Custom alert text that describes additional support information</DfdAlertTextOverride>
```

## Related topics


[Microsoft-Windows-Disk-Failure-Diagnostic-Module](microsoft-windows-disk-failure-diagnostic-module.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DfdAlertTextOverride%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





