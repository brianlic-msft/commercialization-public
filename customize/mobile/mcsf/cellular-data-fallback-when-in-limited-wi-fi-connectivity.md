---
title: Cellular data fallback when in limited Wi-Fi connectivity
description: OEMs can change the default behavior for the device when Wi-Fi connectivity becomes limited.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0a5587e9-3e1a-424f-8a89-a9303b71d944
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cellular data fallback when in limited Wi-Fi connectivity


OEMs can change the default behavior for the device when Wi-Fi connectivity becomes limited.

By default, if the device is connected to a Wi-Fi network and the data connection to a site is unsuccessful due to limited Wi-Fi connectivity, the device will complete the connection to the site using available cellular data networks (when possible) to provide an optimal user experience.

OEMs can change this default behavior so that the device does not use cellular data when Wi-Fi connectivity becomes limited. When the customization is enabled, a user option to use or not use cellular data for limited Wi-Fi connectivity becomes visible in the **Cellular & SIM** settings screen. This option is automatically set to **don’t use cellular data** when the customization is enabled.

**Note**  
Changing the default behavior may negatively impact the user experience.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CellularFailover"  
                         Description="Use to allow or disallow cellular data fallback when in limited Wi-Fi connectivity."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Cellcore/PerDevice/CellData">  
          <Setting Name="CellularFailOver" Value="" />       
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `CellularFailover` to one of the following:

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
    <td><p>0 or 'Failover is not allowed'</p></td>
    <td><p>Disables cellular data fallback when in limited Wi-Fi connectivity. This also sets the <strong>For limited Wi-Fi connectivity</strong> option in the <strong>Cellular &amp; SIM</strong> settings screen to <strong>don’t use cellular data</strong>.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Failover is allowed'</p></td>
    <td><p>Enables cellular data fallback when in limited Wi-Fi connectivity.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a UICC.

2.  If you set `CellularFailover` to 0 or 'Failover is not allowed', navigate to the **Cellular & SIM** settings screen and verify that the **don’t use cellular data** option is chosen as the default under **For limited Wi-Fi connectivity.**

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Cellular%20data%20fallback%20when%20in%20limited%20Wi-Fi%20connectivity%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




