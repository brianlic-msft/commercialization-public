---
title: PlainText
description: PlainText specifies whether the OfflineAdministratorPassword is hidden in the unattended installation answer file.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 15DA23F0-0C66-4295-B08B-DB749CB02CF8
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PlainText


`PlainText` specifies whether the [OfflineAdministratorPassword](microsoft-windows-shell-setup-offlineuseraccounts-offlineadministratorpassword.md) is hidden in the unattended installation answer file.

**Note**  
You can only use this setting to hide the passwords for offline user accounts only. Domain account passwords are not hidden.

 

You cannot set this value directly. Select **Hide sensitive data** on the **Tools** menu to hide all passwords with a `PlainText` setting in your answer file.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the [OfflineAdministratorPassword](microsoft-windows-shell-setup-offlineuseraccounts-offlineadministratorpassword.md) appears in plain text in the answer file. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the [OfflineAdministratorPassword](microsoft-windows-shell-setup-offlineuseraccounts-offlineadministratorpassword.md) is hidden in the answer file.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
This element appears above the **Settings** bar in the **Properties** pane of Windows System Manager. It always appears as **true** in the user interface (UI), even if you have selected **Hide sensitive data**.

 

## Valid Configuration Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OfflineUserAccounts](microsoft-windows-shell-setup-offlineuseraccounts.md) | [OfflineAdministratorPassword](microsoft-windows-shell-setup-offlineuseraccounts-offlineadministratorpassword.md) | **PlainText**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

Windows Server 2016

For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set the password for [OfflineUserAccounts](microsoft-windows-shell-setup-offlineuseraccounts.md).

``` syntax
<OfflineUserAccounts>
   <OfflineAdministratorPassword>
      <Value>cAB3AEEAZABtAGkAbgBpAHMAdAByAGEAdABvAHIAUABhAHMAcwB3AG8AcgBkAA==</Value>
      <PlainText>false</PlainText>
   </OfflineAdministratorPassword>
</OfflineUserAccounts>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PlainText%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




