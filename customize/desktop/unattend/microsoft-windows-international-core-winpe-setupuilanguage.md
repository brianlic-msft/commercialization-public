---
title: SetupUILanguage
description: SetupUILanguage
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d7108163-4dd2-49a0-bf93-68d3faf2e922
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SetupUILanguage


`SetupUILanguage` defines the language to use in Windows Setup and Windows Deployment Services.

For the list of supported languages, locales, and identifiers, see [Supported Language Packs and Default Settings](http://go.microsoft.com/fwlink/p/?linkid=200317).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[UILanguage](microsoft-windows-international-core-winpe-setupuilanguage-uilanguage.md)</p></td>
<td><p>Specifies the language of the user interface (UI) to use during Windows Setup or Windows Deployment Services.</p></td>
</tr>
<tr class="even">
<td><p>[WillShowUI](microsoft-windows-international-core-winpe-setupuilanguage-willshowui.md)</p></td>
<td><p>This setting is deprecated and should not be used.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md) | **SetupUILanguage**

## Valid Configuration Passes


windowsPE

## Applies To


For the list of the Windows editions and architectures that this component supports, see [microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md).

## XML Example


The following example shows how to configure the Windows Setup UI language to display French (France).

``` syntax
   <SetupUILanguage>
       <UILanguage>fr-FR</UILanguage>
   </SetupUILanguage>
```

## Related topics


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md)

[Microsoft-Windows-International-Core](microsoft-windows-international-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SetupUILanguage%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





