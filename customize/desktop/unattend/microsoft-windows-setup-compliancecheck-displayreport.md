---
title: DisplayReport
description: DisplayReport
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d01d4ae2-1d9a-46ab-a72e-aa2360da90c6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DisplayReport


`DisplayReport` specifies in what circumstances the user interface (UI) is displayed for this item.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>OnError</strong></p></td>
<td><p>Specifies that the UI is displayed on error. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>Never</strong></p></td>
<td><p>Specifies that the UI is never displayed, even for serious errors. An error is logged, and installation terminates.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ComplianceCheck](microsoft-windows-setup-compliancecheck.md) | **DisplayReport**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output specifies that the installation is to run in guaranteed quiet mode without displaying to the UI.

``` syntax
<ComplianceCheck>
   <DisplayReport>Never</DisplayReport>
</ComplianceCheck>
```

## Related topics


[ComplianceCheck](microsoft-windows-setup-compliancecheck.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DisplayReport%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





