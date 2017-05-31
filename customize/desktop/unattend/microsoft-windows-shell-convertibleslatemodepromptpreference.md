---
title: ConvertibleSlateModePromptPreference
description: Configure ConvertibleSlateModePromptPreference to support prompts triggered by changes to ConvertibleSlateMode. OEMs must make sure that ConvertibleSlateMode is always accurate for their devices.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ED60A61B-9A9F-4245-8241-47A636A96FA3
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ConvertibleSlateModePromptPreference


Configure `ConvertibleSlateModePromptPreference` to support prompts triggered by changes to [ConvertibleSlateMode](microsoft-windows-gpiobuttons-convertibleslatemode.md). OEMs must make sure that `ConvertibleSlateMode` is always accurate for their devices.

OEMs can configure `ConvertibleSlateModePromptPreference` to support Continuum, which is a new, adaptive user experience in Windows 10 that optimizes the look and behavior of apps and the Windows UI for a given physical form factor and the customer's usage preferences. OEMs can also configure their devices to boot straight into tablet mode using [SignInMode](microsoft-windows-shell-signinmode.md). In addition, OEMs may also specify the device form factor by setting [DeviceForm](microsoft-windows-deployment-deviceform.md). For more information about Continuum, partners can download the "Windows 10 Continuum whitepaper" through the Microsoft Connect site.

To make this setting work, set up a GPIO pin and a [GPIO Injection Driver](http://go.microsoft.com/fwlink/?LinkId=320790) to detect the mode. When the mode changes, the driver should update the registry value of **HKLM/System/CurrentControlSet/Control/PriorityControl/ConvertibleSlateMode**.

For devices that can use Windows 10 Continuum feature, also see the topic: [Continuum](https://msdn.microsoft.com/library/windows/hardware/dn917883.aspx).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Disable prompting</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Enable prompting</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

offlineServicing

generalize

specialize

auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **ConvertibleSlateModePromptPreference**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## Related topics


[Microsoft-Windows-GPIOButtons](microsoft-windows-gpiobuttons.md)

[ConvertibleSlateMode](microsoft-windows-gpiobuttons-convertibleslatemode.md)

[SignInMode](microsoft-windows-shell-signinmode.md)

[DeviceForm](microsoft-windows-deployment-deviceform.md)

[GPIO Injection Driver](http://go.microsoft.com/fwlink/?LinkId=320790)

[Continuum](https://msdn.microsoft.com/library/windows/hardware/dn917883.aspx)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ConvertibleSlateModePromptPreference%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





