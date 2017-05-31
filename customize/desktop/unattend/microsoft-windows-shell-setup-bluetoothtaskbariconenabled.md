---
title: BluetoothTaskbarIconEnabled
description: BluetoothTaskbarIconEnabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f0669dde-144d-4628-a8e9-0fc5c108a0ec
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BluetoothTaskbarIconEnabled


`BluetoothTaskbarIconEnabled` specifies whether the Bluetooth taskbar icon should appear in the taskbar.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the Bluetooth icon is displayed in the taskbar.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the Bluetooth icon is not displayed in the taskbar.</p></td>
</tr>
</tbody>
</table>

 

By default, Windows displays the Bluetooth icon when the system has a Bluetooth module or adapter. Otherwise, the icon is not displayed.

## Valid Passes


auditUser

generalize

offlineServicing

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **BluetoothTaskbarIconEnabled**

## Applies To


This setting has no effect on Server Core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.

For a list of other supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md). This setting is not configured in a Nano Server image.

## XML Example


The following XML output shows how to enable the Bluetooth taskbar.

``` syntax
<BluetoothTaskbarIconEnabled>true</BluetoothTaskbarIconEnabled>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20BluetoothTaskbarIconEnabled%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





