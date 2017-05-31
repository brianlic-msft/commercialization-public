---
title: Limited connectivity status
description: Partners may override the default status message shown when a device is connected to a Wi-Fi access point.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c1d6cc28-12eb-4570-bcb0-06801feb62d9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Limited connectivity status


Partners may override the default status message shown when a device is connected to a Wi-Fi access point.

By default, when the device is connected to a Wi-Fi access point (AP), it no longer shows the **No Internet access** status message below the AP name. Partners may choose to override this default behavior and show the status message instead.

In previous OS releases, this status message was shown even when the device is connected to a Wi-Fi AP or even when the user can browse the Internet. The message may cause user confusion because it is shown whenever a proxy is used as hotspot plug-in probes and data do not go through a proxy.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LimitedConnectivityStatus"  
                         Description="Use to show the "No Internet access" status in the Wi-Fi settings page when connectivity is limited."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="WiFi/Config">  
          <Setting Name="PublishLimitedConnectivity" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `PublishLimitedConnectivity` to one of the following values:

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
    <td><p>Do not show the <strong>No Internet access</strong> status message below the AP name.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Show the <strong>No Internet access</strong> status message below the AP name.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build that contains this customization to a device.

2.  Connect to a Wi-Fi access point.

3.  Depending on the value you set for `PublishLimtiedConnectivity`, verify whether the **No Internet access** status message is shown below the AP name.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Limited%20connectivity%20status%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




