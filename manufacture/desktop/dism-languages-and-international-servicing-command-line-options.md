---
author: Justinha
Description: 'DISM Languages and International Servicing Command-Line Options'
ms.assetid: 6434373a-a7f9-43ff-be28-e4d48fa0b70f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Languages and International Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Languages and International Servicing Command-Line Options


The international commands can be used to change international settings in Windows and Windows Preinstallation Environment (WinPE) images. You can also query existing settings in an offline or online Windows image.

The base syntax for servicing a Windows image using the Deployment Image Servicing and Management (DISM.exe) tool is:

**DISM.exe** {**/Image:**&lt;*path\_to\_offline\_image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

There are three types of international servicing commands:

-   **Get commands**. Retrieves a report of the international settings for an offline image or a running operating system.
-   **Set commands**. Sets the different international settings for an offline image.
-   **Gen-LangIni commands**. Generates the Lang.ini file that is used during Setup.

The following international servicing options are available for an offline image:

**DISM.exe /Image:**&lt;*path\_to\_offline\_image\_directory*&gt; \[**/Get-Intl**\] \[**/Set-UILang** | **/Set-UILangFallback** | **/Set-SysLocale** | **/Set-UserLocale** | **/Set-InputLocale** | **/Set-AllIntl** | **/Set-Timezone** | **/Set-SKUIntlDefaults** | **/Set-LayeredDriver**\] \[**/Gen-Langini** | **/Set-SetupUILang** | **/Distribution**\]

The following international servicing options are available for a running operating system:

**DISM.exe /Online** **/Get-Intl**

The following table provides a description of how each international servicing option can be used. These options are not case-sensitive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option/Argument</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Option: <strong>/Get-Help /?</strong></p></td>
<td align="left"><p>When used immediately after an international servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.</p>
<p>Examples:</p>
<p><strong>Dism /image:C:\test\offline /Set-UILang /?</strong></p>
<p><strong>Dism /online /Get-intl /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Get-Intl</strong></p></td>
<td align="left"><p>Displays information about international settings and languages.</p>
<p>Use the <strong>/Online</strong> option to display information about international settings and languages in the running operating system.</p>
<p>Use the <strong>/Image</strong>:&lt;<em>path_to_offline_image_directory</em>&gt; option to display information about international settings and languages in the offline image.</p>
<p>When used with the <strong>/Distribution</strong> options, information about international settings and languages in the distribution is displayed. The name of the folder in the distribution share is not validated. It will be reported as …\Langpacks\&lt;<em>locale_name</em>&gt;\Lp.cab. Where &lt;<em>locale_name</em>&gt; is the name of the folder.</p>
<div class="alert">
<strong>Note</strong>  
<p>The user locale is reported only for offline images. The report does not include this setting for running operating systems.</p>
</div>
<div>
 
</div>
<p>Examples:</p>
<p><strong>Dism /online /Get-Intl</strong></p>
<p><strong>Dism /image:C:\test\offline /Get-Intl</strong></p>
<p><strong>Dism /image:C:\test\offline /distribution:C:\windows_distribution /Get-Intl</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-UILang:</strong></p>
<p>Argument: &lt;<em>language_name</em>&gt;</p></td>
<td align="left"><p>Sets the default system user interface (UI) language. If the language is not installed in the Windows image, the command will fail.</p>
<p>&lt;<em>language_name</em>&gt; specifies the name of the language to set as the default; for example, ja-JP.</p>
<div class="alert">
<strong>Note</strong>  
<p>If you install a Language Interface Pack (LIP) and specify its language as the default UI language, the LIP language will be set as the system default UI language (or Install language) and the parent language will be set as the default UI language.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-UILang:fr-FR</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Set-UILangFallback:</strong></p>
<p>Argument: &lt;<em>language_name</em>&gt;</p></td>
<td align="left"><p>Sets the fallback default language for the system UI in the offline Windows image. This setting is used only when the language specified by the <strong>/Set-UILang</strong> option is a partially localized language.</p>
<p>&lt;<em>language_name</em>&gt; specifies the name of the language to set as the default fallback; for example, en-US.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-UILangFallBack:fr-FR</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-Syslocale:</strong></p>
<p>Argument: &lt;<em>locale_name</em>&gt;</p></td>
<td align="left"><p>Sets the language for non-Unicode programs (also called system locale) and font settings in the offline Windows image.</p>
<p>&lt;<em>locale_name</em>&gt; specifies the name of the language and locale to set as the default language for non-Unicode; for example, en-US.</p>
<div class="alert">
<strong>Important</strong>  
<p>You cannot set Unicode-only languages as the system locale. If you try, the <strong>/Set-SysLocale</strong> option will fail and the language for non-Unicode programs will not be changed.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-SysLocale:fr-FR</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Set-UserLocale:</strong></p>
<p>Argument: &lt;<em>locale_name</em>&gt;</p></td>
<td align="left"><p>Sets the &quot;standards and formats&quot; language (also called user locale) in the offline Windows image. The &quot;standards and formats&quot; language is a per-user setting that determines default sort order and the default settings for formatting dates, times, currency, and numbers.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-UserLocale:fr-FR</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-InputLocale:</strong></p>
<p>Argument: &lt;<em>input_locale</em>&gt;:&lt;<em>keyboard_layout</em>&gt;</p></td>
<td align="left"><p>Sets the input locales and keyboard layouts to use in the offline Windows image.</p>
<p>The value of the &lt;<em>input_locale</em>&gt;:&lt;<em>keyboard_layout</em>&gt; pair can be one of the following:</p>
<ul>
<li><p>&lt;<em>language_id</em>:<em>keyboard_layout</em>&gt;</p>
<p>For example, 0409:00000409</p></li>
<li><p>&lt;<em>locale_name</em>&gt;</p>
<p>For example, if you specify en-US as the local name, The <strong>Set-InputLocale:</strong> option also sets the default keyboard layout defined for this locale.</p></li>
</ul>
<p>You can specify more than one value by using semicolons as separators. This is useful when you want to include support for multiple keyboards on a single computer. The first value will be set as the default keyboard.</p>
<p>The valid keyboard layouts that can be configured on your computer are listed in the following registry key.</p>
<p><strong>HKEY_LOCAL_MACHINE \SYSTEM\CurrentControlSet\Control\Keyboard Layouts</strong></p>
<p>For a list of the values, see [Default Input Locales](default-input-locales-for-windows-language-packs.md) and [Default Keyboard Settings](windows-language-pack-default-values.md).</p>
<p>Use the hexadecimal value of the language ID and keyboard layout that you intend to configure.</p>
<p>This parameter is optional.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>Dism /image:C:\test\offline /Set-InputLocale:fr-fr</code></pre>
<pre class="syntax" space="preserve"><code>Dism /image:C:\test\offline /Set-InputLocale:0410:00010410</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Set-AllIntl:</strong></p>
<p>Argument: &lt;<em>language_name</em>&gt;</p></td>
<td align="left"><p>Sets the default system UI language, the language for non-Unicode programs, the &quot;standards and formats&quot; language, and the input locales and keyboard layouts to the specified language in the offline Windows image. This option specifies the language value for the following:</p>
<ul>
<li><p>UI language</p></li>
<li><p>System locale</p></li>
<li><p>User locale</p></li>
<li><p>Input locale</p></li>
</ul>
<p>If used with any of the options that specify the individual language or locales, then the individual settings take precedence.</p>
<p>&lt;<em>language_name</em>&gt; specifies the language name and locale code; for example, en-US, es-ES, or fr-FR.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-AllIntl:fr-FR</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-TimeZone:</strong></p>
<p>Argument: &lt;<em>timezone_name</em>&gt;</p></td>
<td align="left"><p>Sets the default time zone in a Windows image. Before setting the time zone, DISM verifies that the specified time zone string is valid for the image.</p>
<p>&lt;<em>timezone_name</em>&gt; specifies the name of the time zone to use; for example, Pacific Standard Time. For a complete list of time-zone strings, see the Windows® Unattended Setup Reference. On a computer that is running Windows 7, you can use the tzutil command-line tool to list the time zone for that computer. The tzutil tool is installed by default on Windows 7.</p>
<p>The name of the time zone must exactly match the name of the time zone settings in the registry in <strong>HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\TimeZones\</strong>.</p>
<p>If you add a custom time zone to your computer, you can specify that custom time-zone string.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-TimeZone:&quot;W. Europe Standard Time&quot;</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Set-SKUIntlDefaults:</strong></p>
<p>Argument: &lt;<em>language_name</em>&gt;</p></td>
<td align="left"><p>Sets the default system UI language, the language for non-Unicode programs, the &quot;standards and formats&quot; language, and the input locales, keyboard layouts, and time zone values in an offline Windows image to the default value specified by &lt;<em>language_name</em>&gt;. The <strong>/Set-SKUIntlDefaults</strong> option does not change the keyboard driver for Japanese and Korean keyboards. You must use the <strong>/Set-LayeredDriver</strong> option to change this.</p>
<p>Use <strong>/ Set-SKUIntlDefaults</strong> to change all the international settings in an offline Windows image to match the default values that are set during retail installations. For more information about the default values of each language pack, see [Default Input Locales for Windows Language Packs](default-input-locales-for-windows-language-packs.md).</p>
<p>This parameter is optional. If combined with one of the settings earlier in this section, the individual setting takes priority.</p>
<p>If the language passed matches a Unicode-only locale setting, the system locale will not be changed but the command will not fail.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-SKUIntlDefaults:fr-FR</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-LayeredDriver:</strong></p>
<p>Arguments: &lt;<em>1-6</em>&gt;</p></td>
<td align="left"><p>Specifies a keyboard driver to use for Japanese or Korean keyboards.</p>
<p>In Japan, many retail users have 106-key keyboards, whereas others have 101- or 102-key keyboards. In Korea, there are several different types of keyboards, some with different numbers of keys.</p>
<p>The possible values for these settings are [1-6]:</p>
<ol>
<li><p>Specifies the PC/AT Enhanced Keyboard (101/102-Key).</p></li>
<li><p>Specifies the Korean PC/AT 101-Key Compatible Keyboard/MS Natural Keyboard (Type 1).</p></li>
<li><p>Specifies the Korean PC/AT 101-Key Compatible Keyboard/MS Natural Keyboard (Type 2).</p></li>
<li><p>Specifies the Korean PC/AT 101-Key Compatible Keyboard/MS Natural Keyboard (Type 3).</p></li>
<li><p>Specifies the Korean Keyboard (103/106 Key).</p></li>
<li><p>Specifies the Japanese Keyboard (106/109 Key).</p></li>
</ol>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-LayeredDriver:1</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Gen-LangINI:</strong></p></td>
<td align="left"><p>Generates a new Lang.ini file, which is used by Setup to define the language packs inside the image and outside in the distribution. It also defines the default UI language for Setup.</p>
<p>The new Lang.ini file will be added to the Sources folder of the Windows distribution.</p>
<div class="alert">
<strong>Note</strong>  
<p>You will not be prompted for permission to overwrite an existing Lang.ini file. The existing Lang.ini file will be overwritten automatically.</p>
</div>
<div>
 
</div>
<p>You must specify an offline Windows image (<strong>/Image:</strong>&lt;<em>path_to_offline_image.wim</em>&gt; and a distribution (<strong>/Distribution:</strong>&lt;<em>path_to_distribution_directory</em>&gt;).</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Gen-LangINI /distribution:C:\windows_distribution</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Set-SetupUILang:</strong></p>
<p>Argument: &lt;<em>language_name</em>&gt;</p></td>
<td align="left"><p>Defines the default language that will be used by Setup. If this language cannot be used, Setup automatically uses English.</p>
<p>This is an optional command. If not used, the default UI language in the image will be used. If the language is not present, the first language in the list of present languages will be used.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Set-SetupUILang:fr-FR /distribution:C:\windows_distribution</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Distribution:</strong></p>
<p>Argument: &lt;<em>path_to-distribution_directory</em>&gt;</p></td>
<td align="left"><p>Specifies the path to the Windows distribution. The Windows distribution is a copy of the content that releases on the Windows product DVD. This option is only for use with the <strong>/Get-Intl</strong> and <strong>/Gen-LangINI</strong> option if there are external language packs.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Gen-LangINI /distribution:C:\windows_distribution</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


-   The DISM International servicing commands cannot be used on a Windows Vista or a Windows Server 2008 image. For information about servicing Windows Vista and Windows Server 2008 images, see the Windows Vista SP1 release of the Windows OEM Preinstallation Kit (Windows OPK) or Windows Automated Installation Kit (Windows AIK).
-   You cannot use other servicing commands on the same command line with international servicing commands.
-   You cannot set a Unicode-only language as the system locale.

    The following languages are Unicode-only (Languages are listed in the table in the format: Language - Country/Region):

    Amharic - Ethiopia

    Kazakh - Kazakhstan

    Odia - India (Odia Script)

    Armenian - Armenia

    Khmer - Cambodia

    Pashto - Afghanistan

    Assamese - India

    Konkani - India

    Punjabi - India (Gurmukhi Script)

    Bangla - Bangladesh

    Lao - Lao PDR

    Sanskrit - India

    Bangla - India (Bengali Script)

    Malayalam - India (Malayalam Script)

    Sinhala - Sri Lanka

    Divehi - Maldives

    Maltese - Malta

    Syriac - Syria

    Georgian - Georgia

    Maori - New Zealand

    Tamil - India

    Gujarati - India (Gujarati Script)

    Marathi - India

    Telugu - India (Telugu Script)

    Hindi - India

    Mongolian (Mongolian) - PRC

    Tibetan - PRC

    Inuktitut (Syllabics) - Canada

    Nepali - Federal Democratic Republic of Nepal

    Yi - PRC

    Kannada - India (Kannada Script)

     

-   Do not install a language pack after an update.

    If you install an update (hotfix, general distribution release \[GDR\], or service pack \[SP\]) that contains language-dependent resources before you install a language pack, the language-specific changes contained in the update are not applied. Always install language packs before installing updates.

-   When specifying a time zone by using **/Set-TimeZone:**&lt;*timezone\_name*&gt; you must use straight quotation marks for multiple words. For example, **/Set-TimeZone:"Pacific Standard Time"**. If you copy and paste the time zone name, including quotation marks, from a Microsoft® Word document, the quotation marks might not be recognized and the command line might fail.
-   If you are servicing an international image, and your host environment does not support the language in that image, you might not be able to read an error message that originates from the international image.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

 

 






