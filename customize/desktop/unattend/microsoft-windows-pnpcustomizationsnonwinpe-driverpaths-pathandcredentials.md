---
title: PathAndCredentials
description: PathAndCredentials
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4c871867-2d71-4f1d-a167-6488e2d74b1d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PathAndCredentials


`PathAndCredentials` is a list item type and specifies the local or Universal Naming Convention (UNC) path to an additional location for out-of-box device drivers and the credentials (optional) used to access that path.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Credentials](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths-pathandcredentials-credentials.md)</p></td>
<td><p>Specifies the credentials (optional) used to access the path specified by the [Path](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths-pathandcredentials-path.md).</p></td>
</tr>
<tr class="even">
<td><p>[Key](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths-pathandcredentials-key.md)</p></td>
<td><p>Specifies a unique string identifier for the driver path.</p></td>
</tr>
<tr class="odd">
<td><p>[Path](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths-pathandcredentials-path.md)</p></td>
<td><p>Specifies a local or UNC path that contains additional out-of-box device drivers that you copy to the Windows installation.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


auditSystem

offlineServicing

## Parent Hierarchy


[Microsoft-Windows-PnpCustomizationsNonWinPE](microsoft-windows-pnpcustomizationsnonwinpe.md) | [DriverPaths](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths.md) | **PathAndCredentials**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-PnpCustomizationsNonWinPE](microsoft-windows-pnpcustomizationsnonwinpe.md).

## XML Example


The following XML output specifies the UNC paths to two additional locations for device drivers and the credentials used to access those paths.

``` syntax
<DriverPaths>
<DriverPaths>
<!-- First PathAndCredentials list item -->
   <PathAndCredentials wcm:action="add" wcm:keyValue="1">
      <Path>\\myFirstDriverPath\DriversFolder</Path>
      <Credentials>
         <Domain>MyDomain</Domain>
         <Username>MyUsername</Username>
         <Password>MyPassword</Password>
      </Credentials>
   </PathAndCredentials>
<!-- Second PathAndCredentials list item -->
   <PathAndCredentials wcm:action="add" wcm:keyValue="2">
      <Path>C:\Drivers</Path>
      <Credentials>
         <Domain>MyComputerName</Domain>
         <Username>MyUsername</Username>
         <Password>MyPassword</Password>
      </Credentials>
   </PathAndCredentials>
</DriverPaths>
```

## Related topics


[Microsoft-Windows-PnpCustomizationsNonWinPE](microsoft-windows-pnpcustomizationsnonwinpe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PathAndCredentials%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





