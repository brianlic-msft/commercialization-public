---
title: Data transfer indicator
description: OEMs can display a data transfer indicator on a device’s status bar for mobile operators that require it.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a677eb4a-458b-419e-8fd6-32d1f1b0b827
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Data transfer indicator


OEMs can display a data transfer indicator on a device’s status bar for mobile operators that require it. When this feature is enabled, an arrow is displayed above the cellular data connection icon or Wi-Fi connection icon to indicate that data transfer is occurring.

The data transfer indicator, the cellular data connection icon, and the cellular signal strength icon are promoted on the status bar for 10 seconds and does not appear more frequently than once every 5 minutes. The data transfer indicator and the Wi-Fi connection icon are not promoted on the status bar.

However, users can tap the status bar to view the data transfer indicator above the bearer that’s transmitting data. The data transfer indicator, the cellular data connection icon, and the cellular signal strength icon are displayed for 10 seconds if cellular data transfer is occurring. The data transfer indicator and the Wi-Fi connection icon are displayed for 2 seconds if Wi-Fi data transfer is occurring.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DataTransferIndicator"  
                         Description="Use to display a data transfer indicator on a device's status bar for operators that require it."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  
        <Settings Path="Shell/SystemTray/DataActivity">  
          <Setting Name="DataActivityIcon" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `DataActivityIcon` to one of the following values:

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
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Hides the data transfer indicator in the status bar.</p>
    <p>This is the default behavior if the setting is not set.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Shows the data transfer indicator in the status bar.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash an image that contains this customization to a device.

2.  Turn off Wi-Fi and send data over your cellular connection. For example, send an email with a photo attachment. Verify that the arrow that indicates data transfer appears above the cellular data connection icon on the status bar.

3.  Turn on Wi-Fi and send data over your Wi-Fi connection. Verify that the arrow that indicates data transfer appears above the Wi-Fi connection icon on the status bar.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Data%20transfer%20indicator%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




