---
title: Username
description: Username
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6e7998d4-22f5-4b9d-82f8-e8788641d5b9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Username


`Username` specifies the user name for Windows Deployment Services login. This setting can be either a regular user name or a universal principal name (UPN), in the format of an e-mail address. If this setting is a UPN, [Domain](microsoft-windows-setupwindowsdeploymentservices-login-credentials-domain.md) is not required.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>User_name</em></p></td>
<td><p>Specifies the user name. <em>User_name</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [WindowsDeploymentServices](microsoft-windows-setup-windowsdeploymentservices.md) | [Login](microsoft-windows-setup-windowsdeploymentservices-login.md) | [Credentials](microsoft-windows-setup-windowsdeploymentservices-login-credentials.md) | **Username**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows a complete Windows Deployment Services deployment.

``` syntax
<WindowsDeploymentServices>
   <Login>
      <WillShowUI>OnError</WillShowUI>
      <Credentials>
         <Username>Administrator</Username>
         <Domain>MY-DOMAIN-NAME</Domain>
         <Password>********</Password>
      </Credentials>
   </Login>
  <ImageSelection>
      <WillShowUI>OnError</WillShowUI>
      <InstallImage>
         <ImageName>MY_IMAGE_NAME</ImageName>
         <ImageGroup>My IMAGE GROUP</ImageGroup>
      </InstallImage>
      <InstallTo>
         <DiskID>0</DiskID>
         <PartitionID>1</PartitionID>
      </InstallTo>
   </ImageSelection>
</WindowsDeploymentServices>
<DiskConfiguration>
   <WillShowUI>OnError</WillShowUI>
   <Disk>
      <DiskID>0</DiskID>
      <WillWipeDisk>false</WillWipeDisk>
      <ModifyPartitions>
         <ModifyPartition>
            <Order>1</Order>
            <PartitionID>3</PartitionID>
            <Letter>C</Letter>
            <Label>TestOS</Label>
            <Format>NTFS</Format>
            <Active>true</Active>
            <Extend>false</Extend>
         </ModifyPartition>
      </ModifyPartitions>
   </Disk>
</DiskConfiguration>
```

## Related topics


[Credentials](microsoft-windows-setup-windowsdeploymentservices-login-credentials.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Username%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





