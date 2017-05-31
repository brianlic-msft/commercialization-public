---
title: SystemLocale
description: SystemLocale
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 75191b23-5ced-468f-8427-97ef93828d59
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SystemLocale


`SystemLocale` specifies the default language to use for non-Unicode programs.

This setting is used by both Windows Setup and Windows Deployment Services.

The system locale specifies the bitmap fonts and code pages (ANSI or DOS) that are used on the system by default. The system locale setting affects only ANSI (non-Unicode) applications. The language for non-Unicode programs is a per-system setting.

Users can change the system locale by using the **Administrative** tab in the **Region and Language** item in Control Panel.

For the list of supported languages, locales, and identifiers, see [Supported Language Packs and Default Settings](http://go.microsoft.com/fwlink/?LinkId=206620).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>System_locale</em></p></td>
<td><p>Specifies the locale of the system.</p>
<p>The <em>System_locale</em> string is based on the language-tagging conventions of RFC 3066. The pattern <em>language</em>-<em>region</em> is used, where <em>language</em> is a language code and <em>region</em> is a country or region identifier (for example, <strong>en-US</strong>, <strong>fr-FR</strong>, or <strong>es-ES</strong>).</p>
<p>This value is not case-sensitive.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Parent Hierarchy


[Microsoft-Windows-International-Core](microsoft-windows-international-core.md) | **SystemLocale**

## Valid Configuration Passes


oobeSystem

specialize

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-International-Core](microsoft-windows-international-core.md).

## XML Example


The following example shows how to set the system locale to English (United States).

``` syntax
<InputLocale>0409:00000409</InputLocale>
<SystemLocale>en-US</SystemLocale>
<UILanguage>en-US</UILanguage>
<UserLocale>en-US</UserLocale>
```

## Related topics


[Microsoft-Windows-International-Core](microsoft-windows-international-core.md)

[microsoft-windows-international-core-winpe--](microsoft-windows-international-core-winpe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SystemLocale%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





