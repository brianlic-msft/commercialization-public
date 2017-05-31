---
title: Settings for capture mode, burst support, and burst storage duration
description: OEMs can configure burst support on the device, the default capture mode, and the default number of days to store the bursts captured on the device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1863d96f-c78d-486f-9286-1be25ab4cf47
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Settings for capture mode, burst support, and burst storage duration


OEMs can configure burst support on the device, the default capture mode, and the default number of days to store the bursts captured on the device.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="BurstAndCaptureModeSettings"  
                         Description="Use to configure the default capture mode on the device and configure the settings related to burst."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  


       <Settings Path="Photos/OEM">  
          <Setting Name="BurstSupported" Value="" />  
          <Setting Name="CaptureMode" Value="" />  
          <Setting Name="DefaultBurstStorageDuration" Value="" />  
       </Settings> 

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  **To configure burst support on the device**, set `BurstSupported` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1 or 'True, supported'</p></td>
    <td><p>Burst is supported.</p>
    <p>This is the default value set by the OS.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'False, not supported'</p></td>
    <td><p>Burst is not supported.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  **To configure the default capture mode on the device**, set `CaptureMode` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1 or 'Burst'</p></td>
    <td><p>Burst capture mode.</p>
    <p>This is the default value set by the OS.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Single shot'</p></td>
    <td><p>Single shot capture mode.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  **To configure the default number of days to store the bursts captured on the device**, set `DefaultBurstStorageDuration` to the number of days you want to keep the bursts on the device. For example, a value of 1 means the bursts will be kept for 1 day.

    Microsoft recommends using any of these values: 1, 3, 7 (the default value set by the OS), or 14. A value of 0 indicates that bursts will be stored forever.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  Launch the camera app.

3.  To verify the support for burst mode, check if the burst icon is displayed on the right of the settings bar when the camera app is launched.

4.  To verify the default capture mode, check whether single shot or burst mode is selected the first time the camera app was launched. The default should match the value that you specified. For example, if you selected single shot, the camera icon on the right should be twice as big as the other icons.

5.  To verify the default burst storage duration, go to the camera **Settings** screen, choose **photo settings…**, and verify if the default value specified in the **Keep unsaved burst photos for** field matches the value that you specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Settings%20for%20capture%20mode,%20burst%20support,%20and%20burst%20storage%20duration%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




