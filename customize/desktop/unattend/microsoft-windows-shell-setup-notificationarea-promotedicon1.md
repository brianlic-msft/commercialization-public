---
title: PromotedIcon1
description: PromotedIcon1
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6b24fbd2-5050-4b18-9f81-9b9ba7954fb6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PromotedIcon1


`PromotedIcon1` specifies an icon to be shown in the visible system notification area on the taskbar in place of the **Action Center** icon.

Up to four system notification icons are shown in the visible portion of the system notification area on the desktop. By default, these icons are **Action Center**, **Battery**—if the system hardware includes battery support—**Network**, and **Volume**.

By setting the **PromotedIcon1** component, you can select another icon to be visible in the system notification area. This icon will appear in place of the **Action Center** icon.

To select the icon to be visible, you must:

-   Select an application file that includes a system notification icon. This application file must be signed.

-   Set both the **Path** and **GUID** elements for the file.

For information about specifying the GUID for your icon, see [NOTIFYICONDATA Structure](http://go.microsoft.com/fwlink/?LinkId=120340).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[GUID](microsoft-windows-shell-setup-notificationarea-promotedicon1-guid.md)</p></td>
<td><p>Specifies the GUID of the icon to be displayed in the notification area.</p></td>
</tr>
<tr class="even">
<td><p>[Path](microsoft-windows-shell-setup-notificationarea-promotedicon1-path.md)</p></td>
<td><p>Specifies the path to the application that contains the icon.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [NotificationArea](microsoft-windows-shell-setup-notificationarea.md) | **PromotedIcon1**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to promote a new system notification icon to be visible in place of the **Action Center** icon.

``` syntax
  <PromotedIcon1>
    <Path>%PROGRAMFILES%\Fabrikam\Application1.exe</Path>
    <GUID>{d8742dcb-3e6a-4b3c-b3fe-374623cdcf06}</GUID>
  </PromotedIcon1>
```

## Related topics


[NotificationArea](microsoft-windows-shell-setup-notificationarea.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PromotedIcon1%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





