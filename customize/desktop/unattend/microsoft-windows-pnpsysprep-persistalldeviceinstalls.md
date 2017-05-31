---
title: PersistAllDeviceInstalls
description: PersistAllDeviceInstalls
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f1bcffb4-a5a0-420d-bf56-2aae17c2bdd4
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PersistAllDeviceInstalls


The `PersistAllDeviceInstalls` setting indicates whether all plug and play devices on the destination computer remain installed during the generalize configuration pass.

To speed up the deployment of a group of computers that have identical hardware configurations, you can instruct Windows Setup to maintain the driver settings from the reference computer when you capture a Windows image. When you apply the image to identical destination computers, the drivers are correctly configured.

To instruct Windows Setup to maintain the driver settings, prepare the computer for image capture by generalizing the computer with an answer file that includes the Microsoft-Windows-PnpSysPrep\\`PersistAllDeviceInstalls` setting.

The hardware must be connected to identical locations and must use the same drivers, and the drivers must have a consistent, unique naming scheme. If the hardware is not identical, severe system problems may result.

To avoid driver conflicts, each device should have driver files associated with it that include unique service names, registry key values, and binary filenames.

**Warning**  
Avoid using the `PersistAllDeviceInstalls` setting when the hardware and the hardware configuration on the reference computer are not identical to the destination computers. Even seemingly minor changes to the hardware or hardware configuration can cause severe or easily overlooked problems.

 

For more information on maintaining driver configurations when capturing a Windows image, see [this Microsoft website](http://go.microsoft.com/fwlink/?LinkId=224866).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that plug and play devices remain installed on the destination computer during the <strong>generalize</strong> configuration pass. The devices then do not need to be reinstalled during the <strong>specialize</strong> configuration pass.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that plug and play devices are uninstalled during the <strong>generalize</strong> configuration pass. If the devices are on the computer during the next <strong>specialize</strong> configuration pass, they are reinstalled.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


generalize

## Parent Hierarchy


[Microsoft-Windows-PnpSysprep](microsoft-windows-pnpsysprep.md) | **PersistAllDeviceInstalls**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-PnpSysprep](microsoft-windows-pnpsysprep.md).

## XML Example


The following XML output specifies that device drivers remain be installed on the destination computer during the **generalize** configuration pass.

``` syntax
<PersistAllDeviceInstalls>true</PersistAllDeviceInstalls>
```

## Related topics


[DoNotCleanUpNonPresentDevices](microsoft-windows-pnpsysprep-donotcleanupnonpresentdevices.md)

[Microsoft-Windows-PnpSysprep](microsoft-windows-pnpsysprep.md)

[Maintain Driver Configurations When Capturing a Windows Image](http://go.microsoft.com/fwlink/?LinkId=184946)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PersistAllDeviceInstalls%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





