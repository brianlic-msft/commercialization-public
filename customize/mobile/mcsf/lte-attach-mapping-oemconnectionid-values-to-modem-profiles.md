---
title: LTE attach Mapping OEMConnectionId values to modem profiles
description: Partners can set the list of OEMConnectionId values that map to a LTE attach profile in the MBB driver.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cd65fb93-fb90-48cd-9337-7ba7e6c03c37
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LTE attach: Mapping OEMConnectionId values to modem profiles


Partners can set the list of OEMConnectionId values that map to a LTE attach profile in the MBB driver. This list is used to specify which OEMConnectionIds require a detach/attach in order for changes to apply. If an OEMConnectionId is not included in this list and the LTE attach info is updated, it will not take effect until the device is rebooted.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  
This customization supports: **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LTEAttachProfileMap"  
                         Description="Use to set the list of OEMConnectionId values that map to a LTE attach profile on the MBB driver side."  
                         Owner=""  
                         OwnerType="OEM">

      <Static>  

        <Settings Path="CellCore/PerDevice/CellData/ModemProfiles">        
          <Setting Name="LTEAttachGuids" Value="" />    
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `LTEAttachGuids` to the semicolon-separated list of OEMConnectionId values that map to a LTE attach profile on the MBB driver. OEMConnectionIds are GUIDs in the string format “XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX”.

<a href="" id="testing-"></a>**Testing:**  
Refer to the documentation provided by the modem vendor and work with your mobile operator to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20LTE%20attach:%20Mapping%20OEMConnectionId%20values%20to%20modem%20profiles%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




