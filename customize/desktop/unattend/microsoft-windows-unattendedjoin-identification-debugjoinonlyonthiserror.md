---
title: DebugJoinOnlyOnThisError
description: DebugJoinOnlyOnThisError
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 931796e5-7baa-4d02-889f-e0d6b7e74ca5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DebugJoinOnlyOnThisError


`DebugJoinOnlyOnThisError` specifies a particular error code that causes `DebugJoin` to trigger if encountered during Windows Setup.

This setting modifies the behavior of [DebugJoin](microsoft-windows-unattendedjoin-identification-debugjoin.md). If specified, this setting causes the DebugJoin behavior only when the domain join operation fails with the error specified by this setting.

`DebugJoinOnlyOnThisError` only functions if [DebugJoin](microsoft-windows-unattendedjoin-identification-debugjoin.md) is set to **true**.

**Important**  
This is an advanced setting designed to be used by product development and Microsoft Product Support Services. Leave this setting unmodified when you configure the unattended answer file.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Error_code</em></p></td>
<td><p>Specifies an error code. The value is the decimal error code to filter. <em>Error_code</em> is a string. The default value is <strong>0</strong>, meaning any error triggers the debug routine.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **DebugJoinOnlyOnThisError**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to set debug joins.

``` syntax
<DebugJoin>true</DebugJoin>
<DebugJoinOnlyOnThisError>1355</DebugJoinOnlyOnThisError>
```

## Related topics


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DebugJoinOnlyOnThisError%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





