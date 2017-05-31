---
title: Change Wi-Fi to WLAN
description: To meet regulatory requirements and/or meet mobile operator requirements for some markets, partners can replace the string Wi-Fi with the generic term WLAN.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 53ffbe79-fcd0-4548-9e16-320df5c6de2e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Change Wi-Fi to WLAN


To meet regulatory requirements and/or meet mobile operator requirements for some markets, partners can replace the string **Wi-Fi** with the generic term **WLAN**. Enabling this customization changes all **Wi-Fi** strings to **WLAN**.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WiFiToWLAN"  
                         Description="Use To replace the 'Wi-Fi' strings in the phone UI to 'WLAN' to meet mobile operator or regulatory requirements."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="WiFi/FirstBoot">  
          <Setting Name="WiFiToWLAN" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `WiFiToWLAN` to one of the following:

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
    <td><p>Use to enable or replace all &quot;Wi-Fi&quot; strings with &quot;WLAN&quot;.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Use to disable the customization. This is the default behavior.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  Go to the **Settings** screen and verify that **WLAN** now shows up instead of **Wi-Fi**.

3.  Tap **WLAN**, and verify that “Wi-Fi” does not appear in the WLAN setting screen.

    All other “Wi-Fi” strings on the phone should now show “WLAN”.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Change%20Wi-Fi%20to%20WLAN%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




