---
title: DefaultConsent
description: DefaultConsent
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 767801d1-ca20-40ab-9129-d1436ac305eb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DefaultConsent


`DefaultConsent` specifies in what circumstances the user is asked whether to send an error report. For more information about error reporting privacy concerns, see [this Microsoft website](http://go.microsoft.com/fwlink/?linkid=50163).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong> or <strong>1</strong></p></td>
<td><p>Always ask the user whether to send an error report. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Ask the user for everything except for basic parameters such as application name, version, and module name that are sent automatically.</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Ask the user for everything except for basic parameters that are likely to be safe, such as application name, version, and module name, and data. Send these items automatically.</p></td>
</tr>
<tr class="even">
<td><p><strong>4</strong></p></td>
<td><p>Do not ask the user; send all error reports automatically.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-ErrorReportingCore](microsoft-windows-errorreportingcore.md) | **DefaultConsent**

## Valid Configuration Passes


specialize

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-ErrorReportingCore](microsoft-windows-errorreportingcore.md).

## XML Example


The following XML output specifies that all data is sent automatically.

``` syntax
<DefaultConsent>4</DefaultConsent>
```

## Related topics


[Microsoft-Windows-ErrorReportingCore](microsoft-windows-errorreportingcore.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DefaultConsent%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





