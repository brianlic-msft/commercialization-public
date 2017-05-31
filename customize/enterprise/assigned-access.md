---
title: Assigned access
description: Assigned access
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d90643f0-9476-43d9-9082-c7f5ec962ff2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Assigned access


You can use assigned access to set up single-function devices, such as restaurant menus or displays at trade shows. If an account is configured for assigned access, a Windows app of your choosing runs above the lockscreen for the selected user account. Users of that account cannot access any other functionality on the device.

In addition to configuring assigned access, you can also configure optional features to further personalize the assigned access experience. Some of the optional features include power button availability and welcome screen elements.

## Requirements


Windows 10 Enterprise, Windows 10 Education, or Windows 10 Pro.

## Suggested settings


For the most secure assigned access experience, we recommend that you configure the settings as defined in [Complementary settings for assigned access](create-a-kiosk-image.md#other-aa-settings) and [Other settings to lock down](create-a-kiosk-image.md#lockdown-settings).

## Interactions and interoperability


The following table describes some features that have interoperability issues we recommend that you consider when running assigned access.

**Note**  Where applicable, the table notes which features are optional that you can configure for assigned access.

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Accessibility</p></td>
<td><p>Assigned access does not change Ease of Access settings.</p>
<p>We recommend that you use [Keyboard Filter](keyboardfilter.md) to block the following key combinations that bring up accessibility features:</p>
<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>Blocked behavior</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Left Alt+Left Shift+Print Screen</p></td>
<td><p>Open High Contrast dialog box.</p></td>
</tr>
<tr class="even">
<td><p>Left Alt+Left Shift+Num Lock</p></td>
<td><p>Open Mouse Keys dialog box.</p></td>
</tr>
<tr class="odd">
<td><p>Windows logo key+U</p></td>
<td><p>Open Ease of Access Center.</p></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
<tr class="even">
<td><p>Assigned access Windows PowerShell cmdlets</p></td>
<td><p>In addition to using the Windows UI, you can use the Windows PowerShell cmdlets to set or clear assigned access. For more information, see [Assigned access Windows PowerShell reference](assigned-access-windows-powershell-reference.md).</p></td>
</tr>
<tr class="odd">
<td><p>Key sequences blocked by assigned access</p></td>
<td><p>When in assigned access, some key combinations are blocked for assigned access users.</p>
<p>Alt+F4, Alt+Shift+TaB, Alt+Tab are not blocked by Assigned Access, it is recommended you use [Keyboard Filter](keyboardfilter.md) to block these key combinations.</p>
<p>Ctrl+Alt+Delete is the key to break out of Assigned Access. If needed, you can use Keyboard Filter to configure a different key combination to break out of assigned access by setting BreakoutKeyScanCode as described in [WEKF_Settings](wekf-settings.md).</p>
<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Key combination</th>
<th>Blocked behavior for assigned access users</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Alt+Esc</p></td>
<td><p>Cycle through items in the reverse order from which they were opened.</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+Alt+Esc</p></td>
<td><p>Cycle through items in the reverse order from which they were opened.</p></td>
</tr>
<tr class="odd">
<td><p>Ctrl+Esc</p></td>
<td><p>Open the Start screen.</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+F4</p></td>
<td><p>Close the window.</p></td>
</tr>
<tr class="odd">
<td><p>Ctrl+Shift+Esc</p></td>
<td><p>Open Task Manager.</p></td>
</tr>
<tr class="even">
<td><p>Ctrl+Tab</p></td>
<td><p>Switch windows within the application currently open.</p></td>
</tr>
<tr class="odd">
<td><p>LaunchApp1</p></td>
<td><p>Open the app that is assigned to this key.</p></td>
</tr>
<tr class="even">
<td><p>LaunchApp2</p></td>
<td><p>Open the app that is assigned to this key, which on many Microsoft keyboards is Calculator..</p></td>
</tr>
<tr class="odd">
<td><p>LaunchMail</p></td>
<td><p>Open the default mail client.</p></td>
</tr>
<tr class="even">
<td><p>Windows logo key</p></td>
<td><p>Open the Start screen.</p></td>
</tr>
</tbody>
</table>
<p> </p>
<p>Keyboard Filter settings apply to other standard accounts.</p></td>
</tr>
<tr class="even">
<td><p>Key sequences blocked by [Keyboard Filter](keyboardfilter.md)</p></td>
<td><p>If Keyboard Filter is turned ON then some key combinations are blocked automatically without you having to explicitly block them. For more information, see the [Keyboard Filter](keyboardfilter.md) reference topic.</p>
<div class="alert">
<strong>Note</strong>  [Keyboard Filter](keyboardfilter.md) is only available on Windows 10 Enterprise or Windows 10 Education.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>Power button</p></td>
<td><p>Customizations for the Power button complement assigned access, letting you implement features such as removing the power button from the Welcome screen. Removing the power button ensures the user cannot turn off the device when it is in assigned access.</p>
<p>For more information on removing the power button or disabling the physical power button, see [Custom Logon](custom-logon.md).</p></td>
</tr>
<tr class="even">
<td><p>Unified Write Filter (UWF)</p></td>
<td><p>UWFsettings apply to all users, including those with assigned access.</p>
<p>For more information, see [Unified Write Filter](unified-write-filter.md).</p></td>
</tr>
<tr class="odd">
<td><p>WEDL_AssignedAccess class</p></td>
<td><p>Although you can use this class to configure and manage basic lockdown features for assigned access, we recommend that you use the Windows PowerShell cmdlets instead.</p>
<p>If you need to use assigned access API, see [WEDL_AssignedAccess](wedl-assignedaccess.md).</p></td>
</tr>
<tr class="even">
<td><p>Welcome Screen</p></td>
<td><p>Customizations for the Welcome screen let you personalize not only how the Welcome screen looks, but for how it functions. You can disable the power or language button, or remove all user interface elements. There are many options to make the Welcome screen your own.</p>
<p>For more information, see [Custom Logon](custom-logon.md).</p></td>
</tr>
</tbody>
</table>

 

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Configure assigned access](configure-assigned-access-by-using-the-ui.md)</p></td>
<td><p>An administrator can use assigned access to limit an existing user account to use only one installed Windows app that you choose. This can be useful to set up single-function devices, such as restaurant menus or displays at trade shows.</p></td>
</tr>
<tr class="even">
<td><p>[Assigned access Windows PowerShell reference](assigned-access-windows-powershell-reference.md)</p></td>
<td><p>Provides Windows PowerShell reference material for the Assigned access feature.</p>
<p>You can use assigned access to set up single-function devices, such as restaurant menus or displays at trade shows. If an account is configured for assigned access, a Windows app of your choosing runs above the lockscreen for the selected user account. Users of that account cannot access any other functionality on the device.</p></td>
</tr>
<tr class="odd">
<td><p>[WEDL_AssignedAccess](wedl-assignedaccess.md)</p></td>
<td><p>This Windows Management Instrumentation (WMI) provider class configures settings for assigned access.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Keyboard Filter](keyboardfilter.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Assigned%20access%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





