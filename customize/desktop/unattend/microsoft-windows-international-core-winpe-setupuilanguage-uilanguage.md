---
title: UILanguage
description: UILanguage
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 37505afa-e9e9-4c0a-9dc7-d0e4f90e2bb8
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UILanguage


`UILanguage` specifies the language that is used to display menu items in Windows Setup and Windows Deployment Services.

In addition to this `UILanguage` setting, a [UILanguage](microsoft-windows-international-core-winpe-uilanguage.md) setting is used to specify the default user interface (UI) language of the Windows installation.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>UI_language</em></p></td>
<td><p>Indicates the language of the user interface to use during Windows Setup or Windows Deployment Services.</p>
<p>The <em>UI_language</em> string is based on the language-tagging conventions of RFC 3066. The pattern <em>language</em>-<em>region</em> is used, where <em>language</em> is a language code and <em>region</em> is a country or region identifier (for example, <strong>en-US</strong>, <strong>fr-FR</strong>, or <strong>es-ES</strong>).</p>
<p>This value is not case-sensitive.</p>
<p>For a list of supported languages, locales, and identifiers, see [Available Language Packs](http://go.microsoft.com/fwlink/p/?linkid=200318).</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Parent Hierarchy


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md) | [SetupUILanguage](microsoft-windows-international-core-winpe-setupuilanguage.md) | **UILanguage**

## Valid Configuration Passes


windowsPE

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md).

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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UILanguage%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





