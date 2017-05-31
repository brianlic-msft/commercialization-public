---
title: Text correction and suggestions
description: Partners must enable text correction and text suggestions for at least one input language, and can optionally include more.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 226de68c-c10a-4c3e-a2c8-2ab345c50dc3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Text correction and suggestions


Partners must enable text correction and text suggestions for at least one input language, and can optionally include more.

By default, the keyboard language files used for text correction and suggestions while typing are not included on the device.

Text correction and suggestions are supported for the following input languages: Arabic, Catalan, Croatian, Czech, Danish, Dutch (Belgium), Dutch (Netherlands), English (India), English (UK), English (US), Finnish, French (Canada), French (Switzerland), French (France), German, Greek, Hebrew, Hinglish, Hungarian, Indonesian, Italian, Japanese, Korean, Malay, Norwegian (Bokmål), Persian, Polish, Portuguese (Brazil), Portuguese (Portugal), Romanian, Russian, Serbian (Latin), Serbian (Cyrillic), Simplified Chinese, Slovak, Spanish (Mexico), Spanish (Spain), Swedish, Traditional Chinese (Hong Kong SAR), Traditional Chinese (Taiwan), Turkish, Ukrainian, and Vietnamese.

<a href="" id="instructions-"></a>**Instructions:**  
For more information about language customizations, see the overview [Set languages and locales](set-languages-and-locales.md).

To modify the list of speech languages, the OEM must edit the **Keyboard** section of the OEMInput.xml file before building the device image. The following input languages are supported.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Input Language</strong></p></td>
<td><p><strong>Value to use in the OEMInput.xml file</strong></p></td>
</tr>
<tr class="even">
<td><p>Arabic</p></td>
<td><p>ar-SA</p></td>
</tr>
<tr class="odd">
<td><p>Catalan</p></td>
<td><p>ca-ES</p></td>
</tr>
<tr class="even">
<td><p>Croatian</p></td>
<td><p>hr-HR</p></td>
</tr>
<tr class="odd">
<td><p>Czech</p></td>
<td><p>cs-CZ</p></td>
</tr>
<tr class="even">
<td><p>Danish</p></td>
<td><p>da-DK</p></td>
</tr>
<tr class="odd">
<td><p>Dutch (Belgium)</p></td>
<td><p>nl-BE</p></td>
</tr>
<tr class="even">
<td><p>Dutch (Netherlands)</p></td>
<td><p>nl-NL</p></td>
</tr>
<tr class="odd">
<td><p>English (India)</p></td>
<td><p>en-IN</p></td>
</tr>
<tr class="even">
<td><p>English (UK)</p></td>
<td><p>en-GB</p></td>
</tr>
<tr class="odd">
<td><p>English (US)</p></td>
<td><p>en-US</p></td>
</tr>
<tr class="even">
<td><p>Finnish</p></td>
<td><p>fi-FI</p></td>
</tr>
<tr class="odd">
<td><p>French (Canada)</p></td>
<td><p>fr-CA</p></td>
</tr>
<tr class="even">
<td><p>French (Switzerland)</p></td>
<td><p>fr-CH</p></td>
</tr>
<tr class="odd">
<td><p>French (France)</p></td>
<td><p>fr-FR</p></td>
</tr>
<tr class="even">
<td><p>German</p></td>
<td><p>de-DE</p></td>
</tr>
<tr class="odd">
<td><p>Greek</p></td>
<td><p>el-GR</p></td>
</tr>
<tr class="even">
<td><p>Hebrew</p></td>
<td><p>he-IL</p></td>
</tr>
<tr class="odd">
<td><p>Hindi</p></td>
<td><p>hi-IN</p></td>
</tr>
<tr class="even">
<td><p>Hinglish</p></td>
<td><p>hi-Latn</p></td>
</tr>
<tr class="odd">
<td><p>Hungarian</p></td>
<td><p>hu-HU</p></td>
</tr>
<tr class="even">
<td><p>Indonesian</p></td>
<td><p>id-ID</p></td>
</tr>
<tr class="odd">
<td><p>Italian</p></td>
<td><p>it-IT</p></td>
</tr>
<tr class="even">
<td><p>Japanese</p></td>
<td><p>ja-JP</p></td>
</tr>
<tr class="odd">
<td><p>Korean</p></td>
<td><p>ko-KR</p></td>
</tr>
<tr class="even">
<td><p>Malay</p></td>
<td><p>ms-MY</p></td>
</tr>
<tr class="odd">
<td><p>Norwegian (Bokmål)</p></td>
<td><p>nb-NO</p></td>
</tr>
<tr class="even">
<td><p>Persian</p></td>
<td><p>fa-IR</p></td>
</tr>
<tr class="odd">
<td><p>Polish</p></td>
<td><p>pl-PL</p></td>
</tr>
<tr class="even">
<td><p>Portuguese (Brazil)</p></td>
<td><p>pt-BR</p></td>
</tr>
<tr class="odd">
<td><p>Portuguese (Portugal)</p></td>
<td><p>pt-PT</p></td>
</tr>
<tr class="even">
<td><p>Romanian</p></td>
<td><p>ro-RO</p></td>
</tr>
<tr class="odd">
<td><p>Russian</p></td>
<td><p>ru-RU</p></td>
</tr>
<tr class="even">
<td><p>Serbian (Latin)</p></td>
<td><p>sr-Latn-RS</p></td>
</tr>
<tr class="odd">
<td><p>Serbian (Cyrillic)</p></td>
<td><p>sr-Cyrl-RS</p></td>
</tr>
<tr class="even">
<td><p>Simplified Chinese</p></td>
<td><p>zh-CN</p></td>
</tr>
<tr class="odd">
<td><p>Slovak</p></td>
<td><p>sk-SK</p></td>
</tr>
<tr class="even">
<td><p>Spanish (Mexico)</p></td>
<td><p>es-MX</p></td>
</tr>
<tr class="odd">
<td><p>Spanish (Spain)</p></td>
<td><p>es-ES</p></td>
</tr>
<tr class="even">
<td><p>Swedish</p></td>
<td><p>sv-SE</p></td>
</tr>
<tr class="odd">
<td><p>Traditional Chinese (Hong Kong SAR)</p></td>
<td><p>zh-HK</p></td>
</tr>
<tr class="even">
<td><p>Traditional Chinese (Taiwan)</p></td>
<td><p>zh-TW</p></td>
</tr>
<tr class="odd">
<td><p>Turkish</p></td>
<td><p>tr-TR</p></td>
</tr>
<tr class="even">
<td><p>Ukrainian</p></td>
<td><p>uk-UA</p></td>
</tr>
<tr class="odd">
<td><p>Vietnamese</p></td>
<td><p>vi-VN</p></td>
</tr>
</tbody>
</table>

 

OEMs must include at least one keyboard language. To include multiple languages, add additional **Language** entries to the **Keyboard** section of the OEMInput.xml file, as shown in the following sample.

``` syntax
  <SupportedLanguages>
    <UserInterface>
      <Language>en-US</Language>
    </UserInterface>
    <Keyboard>
      <Language>en-US</Language>
      <Language>vi-VN</Language>
      <Language>de-DE</Language>
    </Keyboard>
    <Speech>
      <Language>en-US</Language>
    </Speech>
  </SupportedLanguages>
```

<a href="" id="testing-steps-"></a>**Testing Steps:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **keyboard** screen in **Settings**.

3.  Verify that the list of keyboard languages installed on the device is correct.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Text%20correction%20and%20suggestions%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




