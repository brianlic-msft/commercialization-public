---
title: TimeZone
description: TimeZone
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d71a5a92-c3ab-4960-a117-a4e05698bd31
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TimeZone


`TimeZone` specifies the time zone of the computer.

For a list of available time zones, use the `tzutil /l` command to view the available time zones in Windows 8. For more information, see [Tzutil Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=247423).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Time_zone</em></p></td>
<td><p>Specifies the time zone of the computer. <em>Time_zone</em> is a string that has a maximum length of 256 characters.</p></td>
</tr>
</tbody>
</table>

 

If the time zone is not specified, Windows creates a default time zone value that is based on the installed language and region that are specified in an answer file.

If a region has more than one time zone, the default time zone for that region is specified by the location of a capital or a major city. For example, if en-AU is specified, `AUS Eastern Standard Time` is used as the default time zone because the Australian capital, Canberra, uses Australian Eastern Standard Time. If en-US is specified as the `UserLocale`, the time zone of the Windows installation defaults to `Pacific Standard Time`.

**Note**  
-   The time zones that are specified in Windows System Image Manager (Windows SIM) are not localized.

-   Greenwich Mean Time (GMT) is now known as Coordinated Universal Time (UTC).

 

## Valid Configuration Passes


auditSystem

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **TimeZone**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following example shows how to set the time zone to China Standard Time (UTC+08:00).

``` syntax
<TimeZone>China Standard Time</TimeZone>
```

The following example shows how to set the time zone to Pacific Standard Time (UTC-08:00) without observing daylight savings time (UTC+01:00).

``` syntax
<TimeZone>Pacific Standard Time_dstoff</TimeZone>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

[Tzutil Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=247423)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TimeZone%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





