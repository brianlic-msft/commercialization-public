---
title: UILanguageFallback
description: UILanguageFallback
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: efb13ece-45bd-4e45-a88d-5ecdaebb3feb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UILanguageFallback


`UILanguageFallback` specifies the language to use for resources that are not localized for the default system user interface (UI) ([UILanguage](microsoft-windows-international-core-winpe-uilanguage.md) setting).

This setting is used by Windows Setup and Windows Deployment Services.

A fallback language is used when resources are not localized for a partially localized language. For example, Arabic is a partially localized language. Only 80 percent of the Windows resources are localized into Arabic. The possible fallback languages for the Arabic language pack are its base languages, English and French. See the “Language pack type” column in [Available Language Packs](http://go.microsoft.com/fwlink/p/?linkid=200318) for details.

You must specify this setting only if the language that [UILanguage](microsoft-windows-international-core-winpe-uilanguage.md) specifies is not fully localized and has more than one fallback language. In all other cases, this setting will be ignored.

For the list of supported languages, locales, and identifiers, see [Supported Language Packs and Default Settings](http://go.microsoft.com/fwlink/p/?linkid=200317).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Language_fallback</em></p></td>
<td><p>Indicates the language of the UI for resources that have not been localized into the system-preferred language.</p>
<p>The <em>Language_fallback</em> string is based on the language-tagging conventions of RFC 3066. The pattern <em>language</em>-<em>region</em> is used, where <em>language</em> is a language code and <em>region</em> is a country or region identifier (for example, <strong>en-US</strong>, <strong>fr-FR</strong>, or <strong>es-ES</strong>).</p>
<p>This value is not case-sensitive.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Parent Hierarchy


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md) | **UILanguageFallback**

## Valid Configuration Passes


windowsPE

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md).

## XML Example


The following example shows how to change the fallback language to English (United States) from Arabic (Saudi Arabia).

``` syntax
<InputLocale>0401:00000401</InputLocale> 
<SystemLocale>ar-sa</SystemLocale> 
<UILanguage>ar-sa</UILanguage> 
<UILanguageFallback>en-us</UILanguageFallback> 
<UserLocale>ar-sa</UserLocale>
```

## Related topics


[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md)

[Microsoft-Windows-International-Core](microsoft-windows-international-core.md)

[UILanguage](microsoft-windows-international-core-winpe-uilanguage.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UILanguageFallback%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





