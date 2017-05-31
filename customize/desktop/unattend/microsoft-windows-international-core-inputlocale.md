---
title: InputLocale
description: InputLocale
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9c290797-cdde-41db-b3d8-3d03a7dc7cca
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# InputLocale


`InputLocale` specifies the input language and the method for input devices, such as the keyboard layout. The input locale (also called input language) is a per-process setting that describes an input language (for example, Greek) and an input method (for example, the keyboard).

Multiple input locales can be installed, and the user can switch between them. Users can add and remove input locales through the **Keyboard and Languages** tab of the **Region and Language** Control Panel.

For a list of supported languages, locales, and identifiers, see [Supported Language Packs and Default Settings](http://go.microsoft.com/fwlink/?LinkId=206622).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Input_locale</em></p></td>
<td><p>Specifies the input language and keyboard layout for a Windows installation.</p>
<p><em>Input_locale</em> can be one of two values:</p>
<ul>
<li><p>To use the default input locale for a language, specify the language identifier. For example, to use the default keyboard for English (United States) that corresponds with the QWERTY keyboard, you can specify the value <strong>en-US</strong>.</p></li>
<li><p>Specify the locale ID and keyboard layout hexadecimal values. For example, for en-US, use <strong>0409:00000409</strong>. The first value (0409) is the locale ID that represents the input language and the second value (00000409) is the keyboard layout value.</p></li>
</ul>
<p>If you want to specify more than one input locale to add support for more than one keyboard type, you can specify multiple values separated by semicolons. For example, you can specify <code>&lt;InputLocale&gt;en-US; fr-FR; es-ES&lt;/InputLocale&gt;</code> to add support for English (US), French (France), and Spanish (Spain) keyboards. The first value that is listed is used as the default keyboard.</p>
<p>The valid keyboard layouts that can be configured on your system are listed in the <strong>HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts</strong> registry key.</p>
<p>For a list of default input locale values, see [Supported Language Packs and Default Settings](http://go.microsoft.com/fwlink/?LinkId=206622).</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Parent Hierarchy


[Microsoft-Windows-International-Core](microsoft-windows-international-core.md) | **InputLocale**

## Valid Configuration Passes


oobeSystem

specialize

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-International-Core](microsoft-windows-international-core.md).

## XML Example


The following example shows how to set the input locale to the English (US) Dvorak keyboard.

``` syntax
<InputLocale>0409:00010409</InputLocale>
<SystemLocale>en-US</SystemLocale> 
<UILanguage>en-US</UILanguage> 
<UserLocale>en-US</UserLocale>
```

## Related topics


[Microsoft-Windows-International-Core](microsoft-windows-international-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20InputLocale%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





