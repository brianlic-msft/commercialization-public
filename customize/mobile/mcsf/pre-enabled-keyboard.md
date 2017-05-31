---
title: Pre-enabled keyboard
description: OEMs can use this customization to pre-enable additional device keyboards.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 93dfd9ea-587a-4b97-8b6e-fb589444abef
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Pre-enabled keyboard


OEMs can use this customization to pre-enable additional device keyboards.

During device bring-up, OEMs must set the boot locale, or default locale, for the device. During first boot, the OS reads the locale setting and automatically enables a default keyboard based on the locale to keyboard mapping table in [Set languages and locales](set-languages-and-locales.md).

The mapping works for almost all regions and additional customizations are not needed unless specified in the pre-enabled keyboard column in [Set languages and locales](set-languages-and-locales.md). If an OEM chooses to pre-enable more keyboards for a particular market, they can do so by specifying this setting. Pre-enabled keyboards will automatically be enabled during boot. Microsoft recommends that partners limit the number of pre-enabled keyboards to those languages that correspond to the languages spoken within the market.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PreEnabledKeyboard"  
                         Description="Use to pre-enable more keyboards for a particular market and specify the keyboards automatically enabled during boot."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="TextInput">  

          <!-- Replace $(InputMethodId) with the keyboard to pre-enable. Format is "LocaleCode.LocaleValue" 
               For example, set Setting Name to "PreEnabledKeyboard/ko-KR.4" to pre-enable Korean 12-key Sky.
               Value is always set to 1 to enable the keyboard. -->
          <Setting Name="PreEnabledKeyboard/$(InputMethodId)" Value="1" />

          <!-- Add additional keyboards 
          <Setting Name="PreEnabledKeyboard/$(InputMethodId)" Value="1" />
          <Setting Name="PreEnabledKeyboard/$(InputMethodId)" Value="1" />
          -->    

       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Replace *$(InputMethodId)* with the keyboard you want to pre-enable. The format must be: **Locale code.Locale value**. See the following table for more information on the locale codes and values that you can use. The setting `Value` must be set to 1 to enable the keyboard.

    For example, to pre-enable US English and Korean 12-key Sky, add the following key/value pairs:

    ``` syntax
    <Settings Path="TextInput">  
          <Setting Name="PreEnabledKeyboard/en-US.1" Value="1" />
          <Setting Name="PreEnabledKeyboard/ko-KR.4" Value="1" />
       </Settings>
    ```

The following table shows the values that you can use for the *$(InputMethodId)* part of the setting name. Replace *$(InputMethod)* with this format: **Locale code.Locale value**

**Note**  
The keyboards for some locales require additional language model files. To pre-enable the keyboards for the following locales, OEMs must include corresponding locales in the *Keyboard* section described in [Text correction and suggestions](text-correction-and-suggestions.md): am-ET, bn-IN, gu-IN, hi-IN, ja-JP, kn-IN, ko-KR, ml-IN, mr-IN, my-MM, or-IN, pa-IN, si-LK, ta-IN, te-IN, zh-TW, zh-CN, and zh-HK.

 

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Name</th>
<th>Locale code</th>
<th>Keyboard layout value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Afrikaans (South Africa)</p></td>
<td><p>af-ZA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Albanian</p></td>
<td><p>sq-AL</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Amharic</p></td>
<td><p>am-ET</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Arabic</p></td>
<td><p>ar-SA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Armenian</p></td>
<td><p>hy-AM</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Assamese - INSCRIPT</p></td>
<td><p>as-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Azerbaijani (Cyrillic)</p></td>
<td><p>az-Cyrl-AZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Azerbaijani (Latin)</p></td>
<td><p>az-Latn-AZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Bangla (Bangladesh) - 49 key</p></td>
<td><p>bn-BD</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Bangla (India) - INSCRIPT</p></td>
<td><p>bn-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Bangla (India) - Phonetic</p></td>
<td><p>bn-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Bashkir</p></td>
<td><p>ba-RU</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Basque</p></td>
<td><p>eu-ES</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Belarusian</p></td>
<td><p>be-BY</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Bosnian (Cyrillic)</p></td>
<td><p>bs-Cyrl-BA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Bosnian (Latin)</p></td>
<td><p>bs-Latn-BA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Bulgarian</p></td>
<td><p>bg-BG</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Catalan</p></td>
<td><p>ca-ES</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Central Kurdish</p></td>
<td><p>ku-Arab-IQ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Cherokee</p></td>
<td><p>chr-Cher-US</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Chinese Simplified QWERTY</p></td>
<td><p>zh-CN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Chinese Simplified - 12-key</p></td>
<td><p>zh-CN</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Chinese Simplified - Handwriting</p></td>
<td><p>zh-CN</p></td>
<td><p>3</p></td>
</tr>
<tr class="even">
<td><p>Chinese Simplified - Stroke</p></td>
<td><p>zh-CN</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>Chinese Traditional (Hong Kong SAR) - Cangjie</p></td>
<td><p>zh-HK</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Chinese Traditional (Hong Kong SAR) - Quick</p></td>
<td><p>zh-HK</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Chinese Traditional (Hong Kong SAR) - Stroke</p></td>
<td><p>zh-HK</p></td>
<td><p>3</p></td>
</tr>
<tr class="even">
<td><p>Chinese Traditional (Taiwan) - BoPoMoFo</p></td>
<td><p>zh-TW</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Chinese Traditional (Taiwan) - Handwriting</p></td>
<td><p>zh-TW</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Croatian</p></td>
<td><p>hr-HR</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Czech</p></td>
<td><p>cs-CZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Danish</p></td>
<td><p>da-DK</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Divehi</p></td>
<td><p>dv-MV</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Dutch (Belgium)</p></td>
<td><p>nl-BE</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Dutch (Netherlands)</p></td>
<td><p>nl-NL</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Dzongkha</p></td>
<td><p>dz-BT</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>English (Australia)</p></td>
<td><p>en-AU</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>English (Canada)</p></td>
<td><p>en-CA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>English (India)</p></td>
<td><p>en-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>English (Ireland)</p></td>
<td><p>en-IE</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>English (United Kingdom)</p></td>
<td><p>en-GB</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>English (United States)</p></td>
<td><p>en-US</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Estonian</p></td>
<td><p>et-EE</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Faroese</p></td>
<td><p>fo-FO</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Filipino</p></td>
<td><p>fil-PH</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Finnish</p></td>
<td><p>fi-FI</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>French (Belgium)</p></td>
<td><p>fr-BE</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>French (Canada)</p></td>
<td><p>fr-CA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>French (France)</p></td>
<td><p>fr-FR</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>French (Switzerland)</p></td>
<td><p>fr-CH</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Galician</p></td>
<td><p>gl-ES</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Georgian</p></td>
<td><p>ka-GE</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>German (Germany)</p></td>
<td><p>de-DE</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>German (Switzerland)</p></td>
<td><p>de-CH</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Greek</p></td>
<td><p>el-GR</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Greenlandic</p></td>
<td><p>kl-GL</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Guarani</p></td>
<td><p>gn-PY</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Gujarati - INSCRIPT</p></td>
<td><p>gu-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Gujarati - Phonetic</p></td>
<td><p>gu-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Hausa</p></td>
<td><p>ha-Latn-NG</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Hebrew</p></td>
<td><p>he-IL</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Hindi - 37-key</p></td>
<td><p>hi-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Hindi - INSCRIPT</p></td>
<td><p>hi-IN</p></td>
<td><p>3</p></td>
</tr>
<tr class="even">
<td><p>Hindi - Phonetic</p></td>
<td><p>hi-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Hinglish</p></td>
<td><p>hi-Latn</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Hungarian</p></td>
<td><p>hu-HU</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Icelandic</p></td>
<td><p>is-IS</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Igbo</p></td>
<td><p>ig-NG</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Indonesian</p></td>
<td><p>id-ID</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Inuktitut - Latin</p></td>
<td><p>iu-Latn-CA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Irish</p></td>
<td><p>ga-IE</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Italian</p></td>
<td><p>it-IT</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Japanese - 12-key</p></td>
<td><p>ja-JP</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Japanese - QWERTY</p></td>
<td><p>ja-JP</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Kannada - INSCRIPT</p></td>
<td><p>kn-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Kannada - Phonetic</p></td>
<td><p>kn-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Kazakh</p></td>
<td><p>kk-KZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Khmer</p></td>
<td><p>km-KH</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Kinyarwanda</p></td>
<td><p>rw-RW</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Kiswahili</p></td>
<td><p>sw-KE</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Konkani</p></td>
<td><p>kok-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Korean - 12-key Chunjiin</p></td>
<td><p>ko-KR</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Korean - 12-key Naratgeul</p></td>
<td><p>ko-KR</p></td>
<td><p>3</p></td>
</tr>
<tr class="even">
<td><p>Korean - 12-key Sky</p></td>
<td><p>ko-KR</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>Korean - QWERTY</p></td>
<td><p>ko-KR</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Kyrgyz</p></td>
<td><p>ky-KG</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Lao</p></td>
<td><p>lo-LA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Latvian</p></td>
<td><p>lv-LV</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Lithuanian</p></td>
<td><p>lt-LT</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Luxembourgish</p></td>
<td><p>lb-LU</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Macedonian</p></td>
<td><p>mk-MK</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Malay (Brunei Darussalam)</p></td>
<td><p>ms-BN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Malay (Malaysia)</p></td>
<td><p>ms-MY</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Malayalam - INSCRIPT</p></td>
<td><p>ml-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Malayalam - Phonetic</p></td>
<td><p>ml-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Maltese</p></td>
<td><p>mt-MT</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Maori</p></td>
<td><p>mi-NZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Marathi - INSCRIPT</p></td>
<td><p>mr-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Marathi - Phonetic</p></td>
<td><p>mr-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Mongolian - Cyrillic</p></td>
<td><p>mn-MN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Mongolian - Traditional Mongolian</p></td>
<td><p>mn-Mong-CN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Myanmar</p></td>
<td><p>my-MM</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Nepali</p></td>
<td><p>ne-NP</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Norwegian - Bokmal</p></td>
<td><p>nb-NO</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Norwegian - Nynorsk</p></td>
<td><p>ny-NO</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Odia - INSCRIPT</p></td>
<td><p>or-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Odia - Phonetic</p></td>
<td><p>or-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Pashto</p></td>
<td><p>ps-AF</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Persian</p></td>
<td><p>fa-IR</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Polish</p></td>
<td><p>pl-PL</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Portuguese (Brazil)</p></td>
<td><p>pt-BR</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Portuguese (Portugal)</p></td>
<td><p>pt-PT</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Punjabi - INSCRIPT</p></td>
<td><p>pa-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Punjabi - Phonetic</p></td>
<td><p>pa-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Romanian</p></td>
<td><p>ro-RO</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Romansh</p></td>
<td><p>rm-CH</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Russian</p></td>
<td><p>ru-RU</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Sakha</p></td>
<td><p>sah-RU</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Sami, Northern (Norway)</p></td>
<td><p>se-NO</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Sami, Northern (Sweden)</p></td>
<td><p>se-NO</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Scottish Gaelic</p></td>
<td><p>gd-GB</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Serbian - Cyrillic</p></td>
<td><p>sr-Cyrl-RS</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Serbian - Latin</p></td>
<td><p>sr-Latn-RS</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Sesotho sa Leboa</p></td>
<td><p>nso-ZA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Setswana</p></td>
<td><p>tn-ZA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Sinhala</p></td>
<td><p>si-LK</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Slovak</p></td>
<td><p>sk-SK</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Slovenian</p></td>
<td><p>sl-SI</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Sorbian, Upper</p></td>
<td><p>hsb-DE</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Spanish (Mexico)</p></td>
<td><p>es-MX</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Spanish (Spain)</p></td>
<td><p>es-ES</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Swedish</p></td>
<td><p>sv-SE</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Syriac</p></td>
<td><p>syr-SY</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Tajik</p></td>
<td><p>tg-Cyrl-TJ</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Tamazight (Central Atlas) - Tifinagh</p></td>
<td><p>tzm-Tfng-MA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Tamazight (Central Atlas) - Latin</p></td>
<td><p>tzm-Latn-DZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Tamil - INSCRIPT</p></td>
<td><p>ta-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Tamil - Phonetic</p></td>
<td><p>ta-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="odd">
<td><p>Tatar</p></td>
<td><p>tt-RU</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Telugu - INSCRIPT</p></td>
<td><p>te-IN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Telugu - Phonetic</p></td>
<td><p>te-IN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Thai</p></td>
<td><p>th-TH</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Tibetan</p></td>
<td><p>bo-CN</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Turkish</p></td>
<td><p>tr-TR</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Turkmen</p></td>
<td><p>tk-TM</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Ukrainian</p></td>
<td><p>uk-UA</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Urdu</p></td>
<td><p>ur-PK</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Uyghur</p></td>
<td><p>ug-CN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Uzbek - Cyrillic</p></td>
<td><p>uz-Cyrl-UZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Uzbek - Latin</p></td>
<td><p>uz-Latn-UZ</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Valencian</p></td>
<td><p>ca-ES-valencia</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Vietnamese - QWERTY</p></td>
<td><p>vi-VN</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Vietnamese - TELEX</p></td>
<td><p>vi-VN</p></td>
<td><p>2</p></td>
</tr>
<tr class="even">
<td><p>Vietnamese - VNI</p></td>
<td><p>vi-VN</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>Welsh</p></td>
<td><p>cy-GB</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Wolof</p></td>
<td><p>#N/A</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Xhosa</p></td>
<td><p>xh-ZA</p></td>
<td><p>1</p></td>
</tr>
<tr class="even">
<td><p>Yoruba</p></td>
<td><p>yo-NG</p></td>
<td><p>1</p></td>
</tr>
<tr class="odd">
<td><p>Zulu</p></td>
<td><p>zu-ZA</p></td>
<td><p>1</p></td>
</tr>
</tbody>
</table>

 

<a href="" id="testing-steps-"></a>**Testing Steps:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **keyboard** screen in **Settings**.

3.  Verify that the list of keyboard languages enabled on the device is correct.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Pre-enabled%20keyboard%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




