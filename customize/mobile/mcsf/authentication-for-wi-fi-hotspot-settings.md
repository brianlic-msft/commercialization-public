---
title: Authentication for Wi-Fi hotspot settings
description: When mobile devices connect to a Wi-Fi hotspot that uses a captive portal, the web browser is automatically opened so that the user can sign in.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e113ac19-261c-4796-b586-6ea64397b05b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Authentication for Wi-Fi hotspot settings


When mobile devices connect to a Wi-Fi hotspot that uses a captive portal, the web browser is automatically opened so that the user can sign in. Until this authentication process is completed, the Wi-Fi hotspot connection is not available for applications and services running on the device. As a result, applications provided by mobile operators or third party vendors to authenticate the Wi-Fi hotspot settings will not work.

To suppress the launch of the browser and enable this type of application to run as expected, OEMs must register the SSID of one or more networks. These networks will be available immediately when the connection is established.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HijackedIgnoreList"  
                         Description="Use specify a list of captive portal SSIDs for which browser should not be launched automatically."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="WiFi/Config">  
          <Setting Name="HijackedIgnoreList" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `HijackedIgnoreList` value to the set list of captive portal SSIDs for which the browser should not be launched automatically. For example, *ContosoWiFi;FabrikamWiFi;ContosoFabrikamWiFi* and so on.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  Connect to a Wi-Fi network that uses one of the registered SSIDs.

3.  Verify the browser does not launch and the network is available immediately.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Authentication%20for%20Wi-Fi%20hotspot%20settings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




