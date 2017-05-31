---
title: Auto scan for phone updates
description: OEMs can show or hide the auto scan for updates setting on the device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ffaddfb7-cacb-45bd-8ee0-94c8b2cd0904
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Auto scan for phone updates


OEMs can show or hide the auto scan for updates setting on the device. When auto scan is visible, users can see a checkbox in the **Settings** &gt; **device update** screen to inform them when updates are available for their devices. When hidden, the device will always scan for updates and the user option is not visible.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisplayCheckForUpdates"  
                         Description="Use to show or hide the auto scan setting in the Settings > Phone Update screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="DeviceUpdate">  
          <!-- Use to determine whether to show or hide the auto scan settings for device updates. Set the value to 0 or 'Hidden', 
               or set to 1 or 'Visible'. -->
          <Setting Name="DisplayCheckForUpdates" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `DisplayCheckForUpdates` to one of the following:

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
    <td><p>0 or 'Hidden'</p></td>
    <td><p>The device will always scan for updates and the <strong>Tell me when updates are available for my phone</strong> checkbox is not displayed.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Visible'</p></td>
    <td><p>The <strong>Tell me when updates are available for my phone</strong> checkbox is displayed in the <strong>Settings</strong> &gt; <strong>phone update</strong> screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Go to the **Settings** &gt; **phone update** screen.

3.  Depending on the value you set for `DisplayCheckForUpdates`, verify whether the **Tell me when updates are available for my phone** checkbox is visible or hidden.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Auto%20scan%20for%20phone%20updates%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




