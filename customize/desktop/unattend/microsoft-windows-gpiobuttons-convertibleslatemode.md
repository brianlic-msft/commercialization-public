---
title: ConvertibleSlateMode
description: ConvertibleSlateMode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 78b5f36f-fe4c-4c09-b1ba-bf8c6fafc45d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ConvertibleSlateMode


`ConvertibleSlateMode` specifies whether the device has a physical keyboard. Windows uses this setting when determining whether to show an on-screen keyboard. For example, when the user receives a prompt that can accept keyboard input on a tablet, the on-screen keyboard appears.

This setting is related to [ConvertibleSlateModePromptPreference](microsoft-windows-shell-convertibleslatemodepromptpreference.md), which determines whether to prompt the user to show or hide the keyboard whenever the device changes modes, for example, when the keyboards is attached/detached or rotated to be accessible/inaccessible.

## Recommended settings


**For tablets or other devices that don’t have a keyboard**, set ConvertibleSlateMode to **0**.

**For laptops or other devices that always have an accessible keyboard**, set ConvertibleSlateMode to **1**.

**For convertible or detachable devices that sometimes have an accessible keyboard**:

-   Set ConvertibleSlateMode to **0**.
-   Set [ConvertibleSlateModePromptPreference](microsoft-windows-shell-convertibleslatemodepromptpreference.md) to **1**.
-   Set up a GPIO pin and a [GPIO Injection Driver](http://go.microsoft.com/fwlink/?LinkId=320790) to detect the mode. When the mode changes, the driver should update the registry value of **HKLM/System/CurrentControlSet/Control/PriorityControl/ConvertibleSlateMode**.
-   For devices that can use Windows 10 Continuum feature, also see the topic: [Continuum](https://msdn.microsoft.com/library/windows/hardware/dn917883.aspx).

**For devices without a touchscreen**, this setting does nothing. Even if you set this setting, Windows assumes a physical keyboard is present and will not show the on-screen keyboard.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Laptop mode: Specifies that the device has a physical keyboard accessible to the user.</p></td>
</tr>
<tr class="even">
<td><p>0</p></td>
<td><p>Tablet mode: Specifies that the device does not have a physical keyboard accessible to the user.</p>
<p>This is the default value</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-GPIOButtons](microsoft-windows-gpiobuttons.md) | **ConvertibleSlateMode**

## Valid Configuration Passes


specialize

offlineServicing

## Applies To

For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-GPIOButtons](microsoft-windows-gpiobuttons.md).

## XML Example


The following XML output specifies a laptop form factor.

``` syntax
<ConvertibleSlateMode>1</ConvertibleSlateMode>
```

## Related topics


[Microsoft-Windows-GPIOButtons](microsoft-windows-gpiobuttons.md)

[ConvertibleSlateModePromptPreference](microsoft-windows-shell-convertibleslatemodepromptpreference.md)

[GPIO Injection Driver](http://go.microsoft.com/fwlink/?LinkId=320790)

[Continuum](https://msdn.microsoft.com/library/windows/hardware/dn917883.aspx)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ConvertibleSlateMode%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





