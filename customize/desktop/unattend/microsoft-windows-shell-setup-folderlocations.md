---
title: FolderLocations
description: FolderLocations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f5b30062-eba6-4a3f-b635-4f33828b1107
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FolderLocations


The `FolderLocations` setting specifies the location of the user-profile and program-data folders.

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[ProfilesDirectory](microsoft-windows-shell-setup-folderlocations-profilesdirectory.md)</p></td>
<td><p>Specifies the path to the user profile folder.</p></td>
</tr>
<tr class="even">
<td><p>[ProgramData](microsoft-windows-shell-setup-folderlocations-programdata.md)</p></td>
<td><p>Specifies the path to the program-data folder.</p>
<div class="alert">
<strong>Warning</strong>  
<p>Use this setting only in a test environment. If you change the default location of the program-data folders to a volume other than the system volume, you cannot service your image. Any updates, fixes, or service packs may not be applied to the installation.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **FolderLocations**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML example shows how to set the paths to folder locations.

``` syntax
<FolderLocations>
   <ProfilesDirectory>%SYSTEMDRIVE%\Profiles</ProfilesDirectory>
</FolderLocations>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FolderLocations%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





