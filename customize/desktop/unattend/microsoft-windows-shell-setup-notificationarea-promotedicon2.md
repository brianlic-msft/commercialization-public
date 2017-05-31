---
title: PromotedIcon2
description: PromotedIcon2
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3296422c-4803-4f6b-ad54-af820916ec82
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PromotedIcon2


`PromotedIcon2` specifies an icon to be shown in the visible system notification area on the taskbar in place of the **Battery** icon.

Up to four system notification icons are shown in the visible portion of the system notification area on the desktop. By default, these icons are **Action Center**, **Battery**—(if the system hardware includes battery support—**Network**, and **Volume**.

By setting the **PromotedIcon2** component, you can select another icon to be visible in the system notification area. This icon will appear in place of the **Battery** icon.

**Note**  
For portable computers, we recommend including a battery indicator that is visible at all times, such as the default **Battery** system notification icon.

 

To select the icon to be visible, you must:

1.  Select an application file that includes a system notification icon. This application file must be signed.

2.  Set both the **Path** and **GUID** elements for the file.

For information about specifying the GUID for your icon, see the MSDN Topic: [NOTIFYICONDATA Structure](http://go.microsoft.com/fwlink/?LinkId=120340).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[GUID](microsoft-windows-shell-setup-notificationarea-promotedicon2-guid.md)</p></td>
<td><p>Specifies the GUID of the icon to be displayed in the notification area.</p></td>
</tr>
<tr class="even">
<td><p>[Path](microsoft-windows-shell-setup-notificationarea-promotedicon2-path.md)</p></td>
<td><p>Specifies the path to the application that contains the icon.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [NotificationArea](microsoft-windows-shell-setup-notificationarea.md) | **PromotedIcon1**

## Applies To


Windows 8, Windows 7, Windows Server 2012, and Windows Server 2008 R2 editions.

For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to promote a new system notification icon to be visible in place of the **Battery** icon.

``` syntax
  <PromotedIcon2>
    <Path>%PROGRAMFILES%\Fabrikam\Application2.exe</Path>
    <GUID>{a1bc23cb-3456-bcde-abcd-feb363cacc88}</GUID>
  </PromotedIcon2>
```

## Related topics


[NotificationArea](microsoft-windows-shell-setup-notificationarea.md)

[NOTIFYICONDATA Structure](http://go.microsoft.com/fwlink/?LinkId=120340)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PromotedIcon2%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





