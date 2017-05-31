---
title: NotificationArea
description: NotificationArea
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a2c2649d-3d85-4823-9e5b-a5d17279e52f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# NotificationArea


`NotificationArea` manages settings related to the notification area of the taskbar.

Four notification icons are shown in the visible portion of the notification area on the desktop. By default, these icons are **Action Center**, **Battery**—if the system hardware includes battery support—**Network**, and **Volume**.

You can select up to two other icons to be visible in the notification area. These other icons will appear in place of the **Action Center** and **Battery** icons.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[PromotedIcon1](microsoft-windows-shell-setup-notificationarea-promotedicon1.md)</p></td>
<td><p>Specifies an icon to be visible in the notification area in place of the <strong>Action Center</strong> icon.</p></td>
</tr>
<tr class="even">
<td><p>[PromotedIcon2](microsoft-windows-shell-setup-notificationarea-promotedicon2.md)</p></td>
<td><p>Specifies an icon to be visible in the notification area in place of the <strong>Battery</strong> icon.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **Notification Area**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to promote two other notification icons to be visible in place of the **Action Center** and **Battery** icons.

``` syntax
<NotificationArea>
  <PromotedIcon1>
    <Path>%PROGRAMFILES%\Fabrikam\Application1.exe</Path>
    <GUID>{d8742dcb-3e6a-4b3c-b3fe-374623cdcf06}</GUID>
  </PromotedIcon1>
  <PromotedIcon2>
    <Path>%PROGRAMFILES%\Fabrikam\Application2.exe</Path>
    <GUID>{a1bc23cb-3456-bcde-abcd-feb363cacc88}</GUID>
  </PromotedIcon2>
</NotificationArea>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20NotificationArea%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





