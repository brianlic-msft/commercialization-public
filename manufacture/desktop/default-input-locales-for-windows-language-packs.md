---
author: themar
Description: 'Input profiles (or input locales) describe the language of the input entered, and the keyboard on which it is being entered. When the first user logs into Windows and identifies their region, Windows sets the input profiles.'
ms.assetid: 0bae00b5-dfcb-472e-a271-07ef62ad5fc5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Default Input Profiles (Input Locales) in Windows'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Default Input Profiles (Input Locales) in Windows


Input profiles (or input locales) describe the language of the input entered, and the keyboard on which it is being entered. When the first user logs into Windows and identifies their region, Windows sets the input profiles.

The input profiles are made up of a [language identifier](http://go.microsoft.com/fwlink/?LinkId=63026) and a [keyboard identifier](windows-language-pack-default-values.md). For example, the Arabic (Algerian) input profile is 1401:00020401, where 1401 is the hexadecimal identifier of the language: Arabic (Algeria) and 00020401 is the hexadecimal identifier of the keyboard: Arabic 101.

When the user first identifies the time and date format (User Locale) as Algeria, Windows sets up both the primary input profile, and a secondary input profile: French (France) with French keyboard. The secondary input profile can help the user by providing a keyboard with a Latin character set for tasks that require it, such as filling out email addresses. Some character sets (like CHS IME) have a Latin character set built in.

Windows uses the language component of the input profile for tasks like spelling, hyphenation, and text prediction of the intended key press when using the touch-screen keyboard.

When setting up new devices for your users, you can use the DISM commands: /Set-InputLocale or /Set-AllIntl to identify a default input profile. You can either select the input profile by its language and keyboard pair (1401:00020401) or you can use a language\\region tag to receive the default settings for that language/region.

Examples:

``` syntax
Dism /image:C:\test\offline /Set-InputLocale:042d:0000040a
Dism /image:C:\test\offline /Set-InputLocale:0411:{03B5835F-F03C-411B-9CE2-AA23E1171E36}{A76C93D9-5523-4E90-AAFA-4DB112F9AC76}
Dism /image:C:\test\offline /Set-InputLocale:id-ID
Dism /image:C:\test\offline /Set-AllIntl:fr-FR
```

For a list of language/culture names, see [Available Language Packs for Windows](available-language-packs-for-windows.md).

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Language/Region</th>
<th align="left">Primary input profile (language and keyboard pair)</th>
<th align="left">Secondary input profile</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Afrikaans - South Africa</p></td>
<td align="left"><p>af-ZA: United States - English (0436:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Albanian - Albania</p></td>
<td align="left"><p>sq-AL: Albanian (041c:0000041c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Alsatian - France</p></td>
<td align="left"><p>gsw-FR: French (0484:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Amharic - Ethiopia</p></td>
<td align="left"><p>am-ET: Amharic Input Method (045e:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{8F96574E-C86C-4bd6-9666-3F7327D4CBE8})</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Algeria</p></td>
<td align="left"><p>ar-DZ: Arabic (102) AZERTY (1401:00020401)</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Bahrain</p></td>
<td align="left"><p>ar-BH: Arabic (101) (3c01:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Egypt</p></td>
<td align="left"><p>ar-EG: Arabic (101) (0c01:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Iraq</p></td>
<td align="left"><p>ar-IQ: Arabic (101) (0801:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Jordan</p></td>
<td align="left"><p>ar-JO: Arabic (101) (2c01:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Kuwait</p></td>
<td align="left"><p>ar-KW: Arabic (101) (3401:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Lebanon</p></td>
<td align="left"><p>ar-LB: Arabic (101) (3001:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Libya</p></td>
<td align="left"><p>ar-LY: Arabic (101) (1001:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Morocco</p></td>
<td align="left"><p>ar-MA: Arabic (102) AZERTY (1801:00020401)</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Oman</p></td>
<td align="left"><p>ar-OM: Arabic (101) (2001:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Qatar</p></td>
<td align="left"><p>ar-QA: Arabic (101) (4001:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Saudi Arabia</p></td>
<td align="left"><p>ar-SA: Arabic (101) (0401:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - Syria</p></td>
<td align="left"><p>ar-SY: Arabic (101) (2801:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Tunisia</p></td>
<td align="left"><p>ar-TN: Arabic (102) AZERTY (1c01:00020401)</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic - U.A.E.</p></td>
<td align="left"><p>ar-AE: Arabic (101) (3801:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic - Yemen</p></td>
<td align="left"><p>ar-YE: Arabic (101) (2401:00000401)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Armenian - Armenia</p></td>
<td align="left"><p>hy-AM: Armenian Phonetic (042b:0002042b)</p></td>
<td align="left"><p>hy-AM: Armenian Typewriter (042b:0003042b)</p>
<p>ru-RU: Russian (0419:00000419)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Assamese - India</p></td>
<td align="left"><p>as-IN: Assamese - Inscript (044d:0000044d)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Azerbaijani - Azerbaijan (Cyrillic)</p></td>
<td align="left"><p>az-Cyrl-AZ: Azerbaijani Cyrillic (082c:0000082c)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p>
<p>az-Latn-AZ: Azeri Latin (042c:0000042c)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Azerbaijani - Azerbaijan (Latin)</p></td>
<td align="left"><p>az-Latn-AZ: Azerbaijani Latin (042c:0000042c)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p>
<p>az-Cyrl-AZ: Azeri Cyrillic (082c:0000082c)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bangla (Bangladesh)</p></td>
<td align="left"><p>bn-BD: Bangla - Bangladesh (0845:00000445)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bangla - India (Bengali Script)</p></td>
<td align="left"><p>bn-IN: Bangla India-INSCRIPT (0445:00020445)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bashkir - Russia</p></td>
<td align="left"><p>ba-RU: Bashkir (046d:0000046d)</p></td>
<td align="left"><p>ru-RU Russian (0419:00000419)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Basque - Basque</p></td>
<td align="left"><p>eu-ES: Spanish (042d:0000040a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Belarusian - Belarus</p></td>
<td align="left"><p>be-BY: Belarusian (0423:00000423)</p></td>
<td align="left"><p>ru-RU: Russian (0419:00000419)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bosnian - Bosnia and Herzegovina (Cyrillic)</p></td>
<td align="left"><p>bs-Cyrl-BA: Bosnian (Cyrillic) (201a:0000201a)</p></td>
<td align="left"><p>bs-Latn-BA: Croatian (141a:0000041a)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bosnian - Bosnia and Herzegovina (Latin)</p></td>
<td align="left"><p>bs-Latn-BA: Croatian (141a:0000041a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Breton - France</p></td>
<td align="left"><p>br-FR: French (047e:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bulgarian - Bulgaria</p></td>
<td align="left"><p>bg-BG: Bulgarian (0402:00030402)</p></td>
<td align="left"><p>en-US: United States - International (0409:00020409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Burmese - Myanmar</p></td>
<td align="left"><p>my-MM: Myanmar (0455:00010c00)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Catalan - Catalan</p></td>
<td align="left"><p>ca-ES: Spanish (0403:0000040a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Central Atlas Tamazight (Latin) - Algeria</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Central Atlas Tamazight (Latin) - Algeria</p></td>
<td align="left"><p>tzm-Latn-DZ: Central Atlas Tamazight (085f:0000085f)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Central Atlas Tamazight (Tifinagh) - Morocco</p></td>
<td align="left"><p>tzm-Tfng-MA: (105f:0000105f)</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Central Kurdish (Iraq)</p></td>
<td align="left"><p>ku-Arab-IQ: (0492:00000492)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Cherokee (Cherokee, United States)</p></td>
<td align="left"><p>chr-Cher-US: Cherokee Nation (045c:0000045c)</p></td>
<td align="left"><p>Cherokee Nation Phonetic (045c:0001045c)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Chinese - PRC</p></td>
<td align="left"><p>zh-CN: Microsoft Pinyin - Simple Fast (0804:{81D4E9C9-1D3B-41BC-9E6C-4B40BF79E35E}{FA550B04-5AD7-411f-A5AC-CA038EC515D7})</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Chinese - Taiwan</p></td>
<td align="left"><p>zh-TW: Chinese (Traditional) - New Phonetic (0404:{B115690A-EA02-48D5-A231-E3578D2FDF80}{B2F9C502-1742-11D4-9790-0080C882687E})</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Corsican - France</p></td>
<td align="left"><p>co-FR: French (0483:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Croatian - Bosnia and Herzegovina</p></td>
<td align="left"><p>hr-BA: Croatian (101a:0000041a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Croatian - Croatia</p></td>
<td align="left"><p>hr-HR: Croatian (041a:0000041a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Czech - Czech Republic</p></td>
<td align="left"><p>cs-CZ: Czech (0405:00000405)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Danish - Denmark</p></td>
<td align="left"><p>da-DK: Danish (0406:00000406)</p></td>
<td align="left"><p>en-US: Danish (0409:00000406)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dari - Afghanistan</p></td>
<td align="left"><p>prs-AF: Persian (Standard) (048c:00050429)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Divehi - Maldives</p></td>
<td align="left"><p>dv-MV: Divehi Phonetic (0465:00000465)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dutch - Belgium</p></td>
<td align="left"><p>nl-BE: Belgian (Period) (0813:00000813)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dutch - Netherlands</p></td>
<td align="left"><p>nl-NL: United States - International (0413:00020409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Dzongkha</p></td>
<td align="left"><p>dz-BT: 0C51:00000C51;0409:00000409</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - Australia</p></td>
<td align="left"><p>en-AU: United States - English (0c09:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Belize</p></td>
<td align="left"><p>en-BZ: United States - English (2809:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - Canada</p></td>
<td align="left"><p>en-CA: United States - English (1009:00000409)</p></td>
<td align="left"><p>en-CA: Canadian Multilingual Standard (1009:00011009)</p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Caribbean</p></td>
<td align="left"><p>en-029: United States - English (2409:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - India</p></td>
<td align="left"><p>en-IN: India (4009:00004009)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Ireland</p></td>
<td align="left"><p>en-IE: Irish (1809:00001809)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - Jamaica</p></td>
<td align="left"><p>en-JM: United States - English (2009:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Malaysia</p></td>
<td align="left"><p>en-MY: United States - English (4409:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - New Zealand</p></td>
<td align="left"><p>en-NZ: United States - English (1409:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Philippines</p></td>
<td align="left"><p>en-PH: United States - English (3409:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - Singapore</p></td>
<td align="left"><p>en-SG: United States - English (4809:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - South Africa</p></td>
<td align="left"><p>en-ZA: United States - English (1c09:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - Trinidad</p></td>
<td align="left"><p>en-TT: United States - English (2c09:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Great Britain</p></td>
<td align="left"><p>en-GB: Great Britain (0809:00000809)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>English - United States</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>English - Zimbabwe</p></td>
<td align="left"><p>en-ZW: United States - English (3009:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Estonian - Estonia</p></td>
<td align="left"><p>et-EE: Estonian (0425:00000425)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Faroese - Faroe Islands</p></td>
<td align="left"><p>fo-FO: Danish (0438:00000406)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Filipino - Philippines</p></td>
<td align="left"><p>fil-PH: United States - English (0464:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Finnish - Finland</p></td>
<td align="left"><p>fi-FI: Finnish (040b:0000040b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>French - Belgium</p></td>
<td align="left"><p>fr-BE: Belgian French (080c:0000080c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>French - Canada</p></td>
<td align="left"><p>fr-CA: Canadian Multilingual Standard (0c0c:00011009)</p></td>
<td align="left"><p>en-CA: Canadian Multilingual Standard (1009:00011009)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>French - France</p></td>
<td align="left"><p>fr-FR: French (040c:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>French - Luxembourg</p></td>
<td align="left"><p>fr-LU: Swiss French (140c:0000100C)</p></td>
<td align="left"><p>fr-LU: French (140c:0000040c)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>French - Monaco</p></td>
<td align="left"><p>fr-MC: French (180c:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>French - Switzerland</p></td>
<td align="left"><p>fr-CH: Swiss French (100c:0000100c)</p></td>
<td align="left"><p>de-CH: Swiss German (0807:00000807)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Frisian - Netherlands</p></td>
<td align="left"><p>fy-NL: United States - International (0462:00020409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Fulah (Latin, Senegal)</p></td>
<td align="left"><p>ff-Latn-SN: Wolof (0867:00000488)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Galician - Galician</p></td>
<td align="left"><p>gl-ES: Spanish (0456:0000040a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Georgian - Georgia</p></td>
<td align="left"><p>ka-GE: Georgian (QWERTY) (0437:00010437)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>German - Austria</p></td>
<td align="left"><p>de-AT: German (0c07:00000407)</p></td>
<td align="left"><p>de-AT: German ()</p></td>
</tr>
<tr class="even">
<td align="left"><p>German - Germany</p></td>
<td align="left"><p>de-DE: German (0407:00000407)</p></td>
<td align="left"><p>de-DE: German ()</p></td>
</tr>
<tr class="odd">
<td align="left"><p>German - Liechtenstein</p></td>
<td align="left"><p>de-LI: Swiss German (1407:00000807)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>German - Luxembourg</p></td>
<td align="left"><p>de-LU: German (1007:00000407)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>German - Switzerland</p></td>
<td align="left"><p>de-CH: Swiss German (0807:00000807)</p></td>
<td align="left"><p>fr-CH: Swiss French (100C:0000100C)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Greek - Greece</p></td>
<td align="left"><p>el-GR: Greek (0408:00000408)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greenlandic - Greenland</p></td>
<td align="left"><p>kl-GL: Danish (046f:00000406)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Guarani - Paraguay</p></td>
<td align="left"><p>gn-PY: Guarani (0474:00000474)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Gujarati - India (Gujarati Script)</p></td>
<td align="left"><p>gu-IN: Gujarati (0447:00000447)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hausa (Latin) - Nigeria</p></td>
<td align="left"><p>ha-Latn-NG: Hausa (0468:00000468)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hawaiian - United States</p></td>
<td align="left"><p>haw-US: (0475:00000475)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hebrew - Israel</p></td>
<td align="left"><p>he-IL: (040d:0002040d)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hindi - India</p></td>
<td align="left"><p>hi-IN: Hindi Traditional (0439:00010439)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hungarian - Hungary</p></td>
<td align="left"><p>hu-HU: Hungarian (040e:0000040e)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Icelandic - Iceland</p></td>
<td align="left"><p>is-IS: Icelandic (040f:0000040f)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Igbo - Nigeria</p></td>
<td align="left"><p>ig-NG: Igbo (0470:00000470)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Inari Sami - Finland</p></td>
<td align="left"><p>smn-FI: Finnish with Sami (243b:0001083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Indonesian - Indonesia</p></td>
<td align="left"><p>id-ID: United States - English (0421:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Inuktitut (Latin) - Canada</p></td>
<td align="left"><p>iu-Latn-CA: Inuktitut - Latin (085d:0000085d)</p></td>
<td align="left"><p>en-CA: United States - English (1009:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Inuktitut (Syllabics) - Canada</p></td>
<td align="left"><p>iu-Cans-CA: Inuktitut - Naqittaut (045d:0001045d)</p></td>
<td align="left"><p>en-CA: United States - English (1009:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Irish - Ireland</p></td>
<td align="left"><p>ga-IE: Irish (083c:00001809)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>isiXhosa / Xhosa - South Africa</p></td>
<td align="left"><p>xh-ZA: United States - English (0434:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>isiZulu / Zulu - South Africa</p></td>
<td align="left"><p>zu-ZA: United States - English (0435:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Italian - Italy</p></td>
<td align="left"><p>it-IT: Italian (0410:00000410)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Italian - Switzerland</p></td>
<td align="left"><p>it-CH: Swiss French (0810:0000100c)</p></td>
<td align="left"><p>it-CH: Italian (0810:00000410)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Japanese - Japan</p></td>
<td align="left"><p>ja-JP: Microsoft IME (0411:{03B5835F-F03C-411B-9CE2-AA23E1171E36}{A76C93D9-5523-4E90-AAFA-4DB112F9AC76})</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Javanese (Latin) - Indonesia</p></td>
<td align="left"><p>jv-Latn-ID: US (0c00:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Kannada - India (Kannada Script)</p></td>
<td align="left"><p>kn-IN: Kannada (044b:0000044b)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kazakh - Kazakhstan</p></td>
<td align="left"><p>kk-KZ: Kazakh (043f:0000043f)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Khmer - Cambodia</p></td>
<td align="left"><p>km-KH: Khmer (0453:00000453)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>K'iche - Guatemala</p></td>
<td align="left"><p>qut-GT: Latin American (0486:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Kinyarwanda - Rwanda</p></td>
<td align="left"><p>rw-RW: United States - English (0487:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Konkani - India</p></td>
<td align="left"><p>kok-IN: Devanagari-INSCRIPT (0457:00000439)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Korean(Extended Wansung) - Korea</p></td>
<td align="left"><p>ko-KR: Microsoft IME (0412:{A028AE76-01B1-46C2-99C4-ACD9858AE02F}{B5FE1F02-D5F2-4445-9C03-C568F23C99A1})</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kyrgyz - Kyrgyzstan</p></td>
<td align="left"><p>ky-KG: Kyrgyz Cyrillic (0440:00000440)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Lao - Lao PDR</p></td>
<td align="left"><p>lo-LA: Lao (0454:00000454)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Latvian - Legacy</p></td>
<td align="left"><p>lv-LV: Latvian (QWERTY) (0426:00010426)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Latvian - Standard</p></td>
<td align="left"><p>lv-LV: Latvian (Standard) (0426:00020426)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lithuanian - Lithuania</p></td>
<td align="left"><p>lt-LT: Lithuanian (0427:00010427)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Lower Sorbian - Germany</p></td>
<td align="left"><p>dsb-DE: Sorbian Standard (082e:0002042e)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lule Sami - Norway</p></td>
<td align="left"><p>smj-NO: Norwegian with Sami (103b:0000043b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Lule Sami - Sweden</p></td>
<td align="left"><p>smj-SE: Swedish with Sami (143b:0000083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Luxembourgish - Luxembourg</p></td>
<td align="left"><p>lb-LU: Luxembourgish (046e:0000046e)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Macedonian - F.Y.R.O.M</p></td>
<td align="left"><p>mk-MK: Macedonia (FYROM) - Standard (042f:0001042f)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Malay - Brunei</p></td>
<td align="left"><p>ms-BN: United States - English (083e:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Malay - Malaysia</p></td>
<td align="left"><p>ms-MY: United States - English (043e:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Malayalam - India (Malayalam Script)</p></td>
<td align="left"><p>ml-IN: Malayalam (044c:0000044c)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Maltese - Malta</p></td>
<td align="left"><p>mt-MT: Maltese 47-Key (043a:0000043a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Maori - New Zealand</p></td>
<td align="left"><p>mi-NZ: Maori (0481:00000481)</p></td>
<td align="left"><p>en-NZ: United States - English (1409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mapudungun - Chile</p></td>
<td align="left"><p>arn-CL: Latin American (047a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Marathi - India</p></td>
<td align="left"><p>mr-IN: Marathi (044e:0000044e)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mohawk - Mohawk</p></td>
<td align="left"><p>moh-CA: United States - English (047c:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mongolian (Cyrillic) - Mongolia</p></td>
<td align="left"><p>mn-MN: Mongolian Cyrillic (0450:00000450)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mongolian (Mongolian) - Mongolia</p></td>
<td align="left"><p>mn-Mong-MN: Traditional Mongolian (Standard) (0c50:00010850)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mongolian (Mongolian – PRC – Legacy)</p></td>
<td align="left"><p>mn-Mong-CN: Mongolian (Mongolian Script) (0850:00000850)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mongolian (Mongolian– PRC – Standard)</p></td>
<td align="left"><p>mn-Mong-CN: Mongolian (Mongolian Script) (0850:00010850)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>N'ko – Guinea</p></td>
<td align="left"><p>nqo-GN: N’Ko (0c00:00090C00)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Nepali - Federal Democratic Republic of Nepal</p></td>
<td align="left"><p>ne-NP: Nepali (0461:00000461)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Northern Sami - Finland</p></td>
<td align="left"><p>se-FI: Finnish with Sami (0c3b:0001083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Northern Sami - Norway</p></td>
<td align="left"><p>se-NO: Norwegian with Sami (043b:0000043b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Northern Sami - Sweden</p></td>
<td align="left"><p>se-SE: Swedish with Sami (083b:0000083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Norwegian - Norway (Bokmål)</p></td>
<td align="left"><p>nb-NO: Norwegian (0414:00000414)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Norwegian - Norway (Nynorsk)</p></td>
<td align="left"><p>nn-NO: Norwegian (0814:00000414)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Occitan - France</p></td>
<td align="left"><p>oc-FR: French (0482:0000040c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Odia - India (Odia Script)</p></td>
<td align="left"><p>or-IN: Odia (0448:00000448)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Pashto - Afghanistan</p></td>
<td align="left"><p>ps-AF: Pashto (Afghanistan) (0463:00000463)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Persian</p></td>
<td align="left"><p>fa-IR: Central Kurdish (0429:00000429)</p></td>
<td align="left"><p>Fa-IR: Persian (Standard) (0429:00050429)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Polish - Poland</p></td>
<td align="left"><p>pl-PL: Polish (Programmers) (0415:00000415)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Portuguese - Brazil</p></td>
<td align="left"><p>pt-BR: Portuguese (Brazilian ABNT) (0416:00000416)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Portuguese - Portugal</p></td>
<td align="left"><p>pt-PT: Portuguese (0816:00000816)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Punjabi - India (Gurmukhi Script)</p></td>
<td align="left"><p>pa-IN: Punjabi (0446:00000446)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Punjabi (Islamic Republic of Pakistan)</p></td>
<td align="left"><p>pa-Arab-PK: Urdu (0846:00000420)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Quechua - Bolivia</p></td>
<td align="left"><p>quz-BO: Latin American (046b:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Quechua - Ecuador</p></td>
<td align="left"><p>quz-EC: Latin American (086b:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Quechua - Peru</p></td>
<td align="left"><p>quz-PE: Latin American (0c6b:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Romanian - Romania</p></td>
<td align="left"><p>ro-RO: Romanian (Standard) (0418:00010418)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Romansh - Switzerland</p></td>
<td align="left"><p>rm-CH: Swiss German (0417:00000807)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Russian - Russia</p></td>
<td align="left"><p>ru-RU: Russian (0419:00000419)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sakha - Russia</p></td>
<td align="left"><p>sah-RU: Sakha (0485:00000485)</p></td>
<td align="left"><p>ru-RU Russian (0419:00000419)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sanskrit - India</p></td>
<td align="left"><p>sa-IN: Devanagari-INSCRIPT (044f:00000439)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Scottish Gaelic - Great Britain</p></td>
<td align="left"><p>gd-GB: Gaelic (0491:00011809)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian - Bosnia and Herzegovina (Cyrillic)</p></td>
<td align="left"><p>sr-Cyrl-BA: Serbian (Cyrillic) (1c1a:00000c1a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian - Bosnia and Herzegovina (Latin)</p></td>
<td align="left"><p>sr-Latn-BA: Serbian (Latin) (181a:0000081a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian - Montenegro (Cyrillic)</p></td>
<td align="left"><p>sr-Cyrl-ME: Serbian (Cyrillic) (301a:00000c1a)</p></td>
<td align="left"><p>en-US: United States - International (0409:00020409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian - Montenegro (Latin)</p></td>
<td align="left"><p>sr-Latn-ME: Serbian (Latin) (2c1a:0000081a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian - Serbia (Cyrillic)</p></td>
<td align="left"><p>sr-Cyrl-RS: Serbian (Cyrillic) (281a:00000c1a)</p></td>
<td align="left"><p>en-US: United States - International (0409:00020409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian - Serbia (Latin)</p></td>
<td align="left"><p>sr-Latn-RS: Serbian (Latin) (241a:0000081a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian - Serbia and Montenegro (Former) (Cyrillic)</p></td>
<td align="left"><p>sr-Cyrl-CS: Serbian (Cyrillic) (0c1a:00000c1a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian - Serbia and Montenegro (Former) (Latin)</p></td>
<td align="left"><p>sr-Latn-CS: Serbian (Latin) (081a:0000081a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Sesotho sa Leboa / Northern Sotho - South Africa</p></td>
<td align="left"><p>nso-ZA: Sesotho sa Leboa (046c:0000046c)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Setswana / Tswana - Botswana</p></td>
<td align="left"><p>tn-BW: Setswana (0832:00000432)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Setswana / Tswana - South Africa</p></td>
<td align="left"><p>tn-ZA: Setswana (0432:00000432)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Shona – Zimbabwe</p></td>
<td align="left"><p>sn-Latn-ZW: US (0c00:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Sindhi (Islamic Republic of Pakistan)</p></td>
<td align="left"><p>sd-Arab-PK: Urdu (0859:00000420)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sinhala - Sri Lanka</p></td>
<td align="left"><p>si-LK: Sinhala (045b:0000045b)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Skolt Sami - Finland</p></td>
<td align="left"><p>sms-FI: Finnish with Sami (203b:0001083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Slovak - Slovakia</p></td>
<td align="left"><p>sk-SK: Slovak (041b:0000041b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Slovenian - Slovenia</p></td>
<td align="left"><p>sl-SI: Slovenian (0424:00000424)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Southern Sami - Norway</p></td>
<td align="left"><p>sma-NO: Norwegian with Sami (183b:0000043b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Southern Sami - Sweden</p></td>
<td align="left"><p>sma-SE: Swedish with Sami (1c3b:0000083b)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Argentina</p></td>
<td align="left"><p>es-AR: Latin American (2c0a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Bolivarian Republic of Venezuela</p></td>
<td align="left"><p>es-VE: Latin American (200a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Bolivia</p></td>
<td align="left"><p>es-BO: Latin American (400a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Chile</p></td>
<td align="left"><p>es-CL: Latin American (340a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Colombia</p></td>
<td align="left"><p>es-CO: Latin American (240a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Costa Rica</p></td>
<td align="left"><p>es-CR: Latin American (140a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Dominican Republic</p></td>
<td align="left"><p>es-DO: Latin American (1c0a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Ecuador</p></td>
<td align="left"><p>es-EC: Latin American (300a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - El Salvador</p></td>
<td align="left"><p>es-SV: Latin American (440a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Guatemala</p></td>
<td align="left"><p>es-GT: Latin American (100a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Honduras</p></td>
<td align="left"><p>es-HN: Latin American (480a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Latin America</p></td>
<td align="left"><p>es-419: Latin American (580a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Mexico</p></td>
<td align="left"><p>es-MX: Latin American (080a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Nicaragua</p></td>
<td align="left"><p>es-NI: Latin American (4c0a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Panama</p></td>
<td align="left"><p>es-PA: Latin American (180a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Paraguay</p></td>
<td align="left"><p>es-PY: Latin American (3c0a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Peru</p></td>
<td align="left"><p>es-PE: Latin American (280a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Commonwealth of Puerto Rico</p></td>
<td align="left"><p>es-PR: Latin American (500a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - Spain (International Sort)</p></td>
<td align="left"><p>es-ES: Spanish (0c0a:0000040a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Spain (Traditional Sort)</p></td>
<td align="left"><p>es-ES_tradnl: Spanish (040a:0000040a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish - United States</p></td>
<td align="left"><p>es-US: Latin American (540a:0000080a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish - Uruguay</p></td>
<td align="left"><p>es-UY: Latin American (380a:0000080a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Standard Moroccan Tamazight - Morocco</p></td>
<td align="left"><p>zgh-Tfng-MA: Tifinagh (Basic) (0c00:0000105F)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Swahili - Kenya</p></td>
<td align="left"><p>sw-KE: United States - English (0441:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Swedish - Finland</p></td>
<td align="left"><p>sv-FI: Swedish (081d:0000041d)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Swedish - Sweden</p></td>
<td align="left"><p>sv-SE: Swedish (041d:0000041d)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Syriac - Syria</p></td>
<td align="left"><p>syr-SY: Syriac (045a:0000045a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tajik - Tajikistan</p></td>
<td align="left"><p>tg-Cyrl-TJ: Tajik (0428:00000428)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tamil - India</p></td>
<td align="left"><p>ta-IN: Tamil (0449:00000449)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tamil - Sri Lanka</p></td>
<td align="left"><p>ta-LK: Tamil (0849:00000449)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tatar – Russia (Legacy)</p></td>
<td align="left"><p>tt-RU: Tatar (0444:00000444)</p></td>
<td align="left"><p>ru-RU: Russian (0419:00000419)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tatar – Russia (Standard)</p></td>
<td align="left"><p>tt-RU: Tatar (0444:00010444)</p></td>
<td align="left"><p>ru-RU: Russian (0419:00000419)</p>
<p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Telugu - India (Telugu Script)</p></td>
<td align="left"><p>te-IN: Telugu (044a:0000044a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Thai - Thailand</p></td>
<td align="left"><p>th-TH: Thai Kedmanee (041e:0000041e)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tibetan - PRC</p></td>
<td align="left"><p>bo-CN: Tibetan (PRC) (0451:00010451)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tigrinya (Eritrea)</p></td>
<td align="left"><p>ti-ET: Tigrinya Input Method (0473:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{3CAB88B7-CC3E-46A6-9765-B772AD7761FF})</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tigrinya (Ethiopia)</p></td>
<td align="left"><p>ti-ET: Tigrinya Input Method (0473:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{3CAB88B7-CC3E-46A6-9765-B772AD7761FF})</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Turkish - Turkey</p></td>
<td align="left"><p>tr-TR: Turkish Q (041f:0000041f)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Turkmen - Turkmenistan</p></td>
<td align="left"><p>tk-TM: Turkmen (0442:00000442)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ukrainian - Ukraine</p></td>
<td align="left"><p>uk-UA: Ukrainian (Enhanced) (0422:00020422)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Upper Sorbian - Germany</p></td>
<td align="left"><p>hsb-DE: Sorbian Standard (042e:0002042e)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Urdu – India</p></td>
<td align="left"><p>ur-IN: Urdu (0820:00000420)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Urdu (Islamic Republic of Pakistan)</p></td>
<td align="left"><p>ur-PK: Urdu (0420:00000420)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Uyghur - PRC</p></td>
<td align="left"><p>ug-CN: Uyghur (0480:00010480)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Uzbek - Uzbekistan (Cyrillic)</p></td>
<td align="left"><p>uz-Cyrl-UZ: Uzbek Cyrillic (0843:00000843)</p></td>
<td align="left"><p>uz-Latn-UZ: United States - English (0443:00000409)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Uzbek - Uzbekistan (Latin)</p></td>
<td align="left"><p>uz-Latn-UZ: United States - English (0443:00000409)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Valencian - Valencia</p></td>
<td align="left"><p>ca-ES-valencia: Spanish (0803:0000040a)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Vietnamese - Vietnam</p></td>
<td align="left"><p>vi-VN: Vietnamese (042a:0000042a)</p></td>
<td align="left"><p>en-US: United States - English (0409:00000409)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Welsh - Great Britain</p></td>
<td align="left"><p>cy-GB: Great Britain Extended (0452:00000452)</p></td>
<td align="left"><p>en-GB: Great Britain (0809:00000809)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Wolof - Senegal</p></td>
<td align="left"><p>wo-SN: Wolof (0488:00000488)</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="even">
<td align="left"><p>Yi - PRC</p></td>
<td align="left"><p>ii-CN: Yi Input Method(0478:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{409C8376-007B-4357-AE8E-26316EE3FB0D})</p></td>
<td align="left"><p>zh-CN: Microsoft Pinyin - Simple Fast (0804:{81D4E9C9-1D3B-41BC-9E6C-4B40BF79E35E}{FA550B04-5AD7-411f-A5AC-CA038EC515D7})</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Yoruba - Nigeria</p></td>
<td align="left"><p>yo-NG: Yoruba (046a:0000046a)</p></td>
<td align="left"><p></p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Default Time Zones](default-time-zones.md)

[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Available Language Packs for Windows](available-language-packs-for-windows.md)

[Keyboard identifiers for Windows](windows-language-pack-default-values.md)

[DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

 

 






