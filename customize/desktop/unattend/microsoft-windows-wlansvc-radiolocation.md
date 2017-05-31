---
title: RadioLocation
description: RadioLocation provides instructions to users for enabling the wireless local area network (WLAN) hardware. These instructions are displayed when a wireless connectivity problem is detected, for example, when a wireless adapter is turned off.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 441978fd-fa18-4c9c-a8da-2caf6620485a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RadioLocation


`RadioLocation` provides instructions to users for enabling the wireless local area network (WLAN) hardware. These instructions are displayed when a wireless connectivity problem is detected, for example, when a wireless adapter is turned off.

Use this setting when you are deploying a portable computer with WLAN hardware that can be manually enabled or disabled.

In a typical scenario, a user may deactivate the WLAN hardware by a keyboard command or a physical switch. Later, the user forgets the switch is off, and tries to browse the Internet. Windows Internet Explorer shows an error page. From this page, the user selects **Diagnose connection problems**. Windows diagnoses the problem, and provides a recommendation to resolve the problem.

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Wireless capability on this computer is turned off.</p>
<p>Turn on wireless capability.</p>
<p><em>Use the switch on the front or side of the computer, or function keys if available, to enable wireless capability on this computer.</em></p></td>
</tr>
</tbody>
</table>

 

The third line in this message can be configured using the `RadioLocation` setting to provide a more specific recommendation.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>RadioLocation</em></p></td>
<td><p>Provides user instructions for enabling the WLAN hardware. <code>RadioLocation</code> is a string. The recommended maximum length of the string is 128 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Parent Hierarchy


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md) | **RadioLocation**

## Valid Configuration Passes


specialize

windowsPE

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md).

## XML Example


This XML example shows how to configure Windows to provide specific instructions on how to activate the WLAN for the fictitious computer, Fabrikam Model FNB1:

``` syntax
<RadioLocation>To activate the wireless LAN on the Fabrikam Model FNB1, slide the wireless switch on the left side of the computer to ON.</RadioLocation>
```

This changes the WLAN activation recommendation to:

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Wireless capability on this computer is turned off.</p>
<p>Turn on wireless capability.</p>
<p><em>You can do this by using a switch, usually found on the front or side of the computer, or by using a function-key combination.</em></p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Microsoft-Windows-Wlansvc](microsoft-windows-wlansvc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RadioLocation%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





