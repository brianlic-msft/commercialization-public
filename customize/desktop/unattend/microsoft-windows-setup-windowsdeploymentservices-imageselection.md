---
title: ImageSelection
description: ImageSelection
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d3a5536d-9532-427c-abf2-ed23fe30f68c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ImageSelection


`ImageSelection` specifies the image to be installed and the location to which it is installed, as well as whether the user interface (UI) is displayed.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[InstallImage](microsoft-windows-setup-windowsdeploymentservices-imageselection-installimage.md)</p></td>
<td><p>Specifies the file name, the image group, and the name of the image to be installed.</p></td>
</tr>
<tr class="even">
<td><p>[InstallTo](microsoft-windows-setup-windowsdeploymentservices-imageselection-installto.md)</p></td>
<td><p>Specifies the location to which the image is to be installed.</p></td>
</tr>
<tr class="odd">
<td><p>[WillShowUI](microsoft-windows-setup-windowsdeploymentservices-imageselection-willshowui.md)</p></td>
<td><p>Specifies in what circumstances the UI is displayed.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [WindowsDeploymentServices](microsoft-windows-setup-windowsdeploymentservices.md) | **ImageSelection**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

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


[WindowsDeploymentServices](microsoft-windows-setup-windowsdeploymentservices.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ImageSelection%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





