---
title: Connecting to open Wi-Fi hotspots in Windows 10
description: Partners can change the default settings for detecting Wi-Fi hotspots.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0900eb56-c120-41e8-9193-240b1e7d1fae
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Wi-Fi hotspots


Partners can change the default settings for detecting Wi-Fi hotspots.

Windows 10 automatically connects users to Wi-Fi so they can get online quickly in more places. It can connect them to open Wi-Fi hotspots that it knows about through crowdsourcing.
##How it works
Users choose the settings for automatically connecting to suggested open hotspots by going to Settings > Network & Internet > Wi-Fi on a Windows 10 PC or a phone with Windows 10 Mobile in Settings > Network & wireless > Wi-Fi > Additional settings. To use this feature, customers will need to be signed in with their Microsoft account on your Windows 10 PC or mobile device. (Note that this feature isn't available in all countries or regions.)

Windows 10 learns about open Wi-Fi hotspots a Windows PC or Windows phone connects to by collecting information about the network, like whether the open Wi-Fi network has a high-quality Internet connection. By using that information from your device and from other Windows customers' devices, we build a database of these high-quality networks. When you’re in range of one of these Wi-Fi hotspots, you automatically get connected to it.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WiFiConnections"  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="WiFi/FirstBoot">  
          <Setting Name="AutoConnectAllowed" Value="" />    
          <Setting Name="DefaultAutoConnectState" Value="" />  
          <Setting Name="DefaultWiFiSharingState" Value="" />  
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `AutoConnectAllowed` to one of the following values:

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
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Use to enable Wi-Fi detection. When enabled, users can opt-in to Wi-Fi detection.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Use to disable Wi-Fi detection.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  Set the value of `DefaultAutoConnectState` to one of the following values:

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
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Sets the checkbox for <strong>Automatically connect to Wi-Fi networks and accept terms for me</strong> during initial phone setup.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Clears the checkbox for <strong>Automatically connect to Wi-Fi networks and accept terms for me</strong> during initial phone setup.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  Set the value of `DefaultWiFiSharingState` to one of the following values:

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
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Sets the checkbox for <strong>Allow me to exchange Wi-Fi network access with my contacts</strong> during initial phone setup.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Clears the checkbox for <strong>Allow me to exchange Wi-Fi network access with my contacts</strong> during initial phone setup.</p></td>
    </tr>
    </tbody>
    </table>


 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Wi-Fi%20Sense%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




