---
title: Enable static IP
description: To facilitate Wi-Fi certification tests, OEMs can enable a screen from the Wi-Fi settings screen that provides UI elements that allow you to specify a static IP address, gateway address, and DNS server address.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 568786bc-4608-4fe0-b9e7-b1721073edc5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable static IP


To facilitate Wi-Fi certification tests, OEMs can enable a screen from the Wi-Fi settings screen that provides UI elements that allow you to specify a static IP address, gateway address, and DNS server address.

To enable the **Static IP** UI, set the value of the `EnableStaticIP` setting to 1. If the setting is not set, or is set to any value other than 1, the static IP UI is not enabled. When enabled, the Wi-Fi **Static IP** UI button appears directly below the **Advanced** button in the Wi-Fi settings screen.

**Warning**  
The static IP UI must only be used for certification purposes and not for production or retail devices.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EnableStaticIP"  
                         Description="Use to show the static IP settings in the advanced Wi-Fi settings screen.
                                      This customization is for testing purposes only and should not be set in 
                                      production or retail images."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="WiFi/Config">  
          <Setting Name="EnableStaticIP" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `EnableStaticIP` to one of the following:

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
    <td><p>1</p></td>
    <td><p>Use to show the <strong>Static IP</strong> settings under <strong>Settings</strong> &gt; <strong>Wi-Fi</strong> &gt; <strong>Static IP</strong>.</p></td>
    </tr>
    <tr class="even">
    <td><p>0</p></td>
    <td><p>Use to disable the customization.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Go to the **Settings** &gt; **Wi-Fi** screen and connect to a Wi-Fi network.

3.  From the Wi-Fi settings screen, verify that you can see the **Static IP** setting.

4.  Tap **Static IP** and configure your IP settings.

5.  Reboot the device.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enable%20static%20IP%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




