---
title: ProtectYourPC
description: ProtectYourPC
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9c09e2f1-9cf5-45fd-80ed-21f1ba8584c5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ProtectYourPC


`ProtectYourPC` specifies whether Express settings are used to:

-   Personalize speech, typing, and inking input by sending contacts and calendar details, along with other associated input data to Microsoft.

-   Let Windows and apps request the user's localization, including location history, and use the advertising ID to personalize experiences on the device.

-   Turn on protection from malicious web content and use page prediction to preload sites in Windows browsers, which sends the browsing history to Microsoft.

-   Automatically connect to suggested open and shared networks.

-   Send problem reports to Microsoft.

**Note**  The functionality for `ProtectYourPC` has changed for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education). In previous releases, this setting specified whether Windows Update installed important and recommended updates automatically.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Turns on Express settings.</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Turns on Express settings.</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Turns off Express settings.</p></td>
</tr>
</tbody>
</table>

 

There is no default value. If a value is not set, the **Get going fast** page opens during setup.

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OOBE](microsoft-windows-shell-setup-oobe.md) | **ProtectYourPC**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML example shows how to turn off Express settings.

``` syntax
<OOBE>
   <ProtectYourPC>3</ProtectYourPC>
</OOBE>
```

## Related topics


[OOBE](microsoft-windows-shell-setup-oobe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ProtectYourPC%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





