---
title: OOBE
description: OOBE
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 803193bb-87ab-405b-8bf8-a429f51cf602
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OOBE


`OOBE` specifies the behavior of some of the Windows Out of Box Experience (OOBE) screens. 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[HideEULAPage](microsoft-windows-shell-setup-oobe-hideeulapage.md)</p></td>
<td><p>Hides the <strong>Microsoft Software License Terms</strong> page.</p>
<div class="alert">
<strong>Note</strong>  
<p>OEMs and System Builders can use this setting only for testing prior to shipment.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>[HideLocalAccountScreen](microsoft-windows-shell-setup-oobe-hidelocalaccountscreen.md)</p></td>
<td><p>Hides the Administrator password screen.</p>
<p>This setting applies only to the Windows Server editions.</p></td>
</tr>
<tr class="odd">
<td><p>[HideOEMRegistrationScreen](microsoft-windows-shell-setup-oobe-hideoemregistrationscreen.md)</p></td>
<td><p>Hides the OEM registration page.</p></td>
</tr>
<tr class="even">
<td><p>[HideOnlineAccountScreens](microsoft-windows-shell-setup-oobe-hideonlineaccountscreens.md)</p></td>
<td><p>Specifies whether the user will be required to sign-in during OOBE.</p></td>
</tr>
<tr class="odd">
<td><p>[HideWirelessSetupInOOBE](microsoft-windows-shell-setup-oobe-hidewirelesssetupinoobe.md)</p></td>
<td><p>Hides the <strong>Join Wireless Network</strong> page.</p></td>
</tr>
<tr class="even">
<td><p>[NetworkLocation](microsoft-windows-shell-setup-oobe-networklocation.md)</p></td>
<td><p>Specifies the network type.</p></td>
</tr>
<tr class="odd">
<td><p>[OEMAppID](microsoft-windows-shell-setup-oobe-oemappid.md)</p></td>
<td><p>Enables the OEM to specify app information.</p></td>
</tr>
<tr class="even">
<td><p>[ProtectYourPC](microsoft-windows-shell-setup-oobe-protectyourpc.md)</p></td>
<td><p>Hides the <strong>Help protect your computer and improve Windows automatically</strong> page. That page specifies whether updates are automatically downloaded and installed.</p></td>
</tr>
<tr class="odd">
<td><p>[UnattendEnableRetailDemo](microsoft-windows-shell-setup-oobe-unattendenableretaildemo.md)</p></td>
<td><p>Use to enable retail demo mode on the device.</p></td>
</tr>
<tr class="even">
<td><p>[VMModeOptimizations](microsoft-windows-shell-setup-oobe-vmmodeoptimizations.md)</p></td>
<td><p>Use to customize the user experience when in VM mode.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **OOBE**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML example shows how to set OOBE information for testing.

``` syntax
<OOBE>
   <HideEULAPage>true</HideEULAPage>
   <NetworkLocation>Other</NetworkLocation>
   <ProtectYourPC>3</ProtectYourPC>
</OOBE>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20OOBE%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





