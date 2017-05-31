---
title: Path
description: Path
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e3d92574-5ed4-423f-92f2-4340ef7f4948
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Path


`Path` specifies the path to an application. This application should contain an icon to be shown in the visible system notification area on the taskbar.

By setting the **Path** and [GUID](microsoft-windows-shell-setup-notificationarea-promotedicon1-guid.md) elements of the **PromotedIcon1** component, you can configure another icon to be visible in the system notification area. This icon will appear in place of the **Action Center** icon.

To select the icon to be visible, you must:

-   Select a signed binary application file that includes a system notification icon.

-   Set both the **Path** and **GUID** elements for the file.

For information about finding the path and GUID for your icon, see [NOTIFYICONDATA Structure](http://go.microsoft.com/fwlink/?LinkId=120340).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Path</p></td>
<td><p>Specifies the path of an icon to be shown in the visible system notification area on the taskbar.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [NotificationArea](microsoft-windows-shell-setup-notificationarea.md) | [PromotedIcon1](microsoft-windows-shell-setup-notificationarea-promotedicon1.md) | **Path**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to promote a new system notification icon to be visible in place of the **Action Center** icon.

``` syntax
<NotificationArea>
  <PromotedIcon1>
    <Path>%PROGRAMFILES%\Fabrikam\Application1.exe</Path>
    <GUID>{d8742dcb-3e6a-4b3c-b3fe-374623cdcf06}</GUID>
  </PromotedIcon1>
</NotificationArea>
```

## Related topics


[PromotedIcon1](microsoft-windows-shell-setup-notificationarea-promotedicon1.md)

[GUID](microsoft-windows-shell-setup-notificationarea-promotedicon1-guid.md)

[NOTIFYICONDATA Structure](http://go.microsoft.com/fwlink/?LinkId=120340)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Path%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





