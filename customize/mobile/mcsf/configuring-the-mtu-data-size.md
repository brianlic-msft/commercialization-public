---
title: Configuring the MTU data size
description: For TCP, the default maximum transmission unit (MTU) is set to 1500 bytes, and the maximum segment size (MSS) is 1460 bytes.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0B84B86E-7917-4C52-B26A-AB02A83FDFC9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuring the MTU data size


For TCP, the default maximum transmission unit (MTU) is set to 1500 bytes, and the maximum segment size (MSS) is 1460 bytes. In general, this value should not be changed, as the user experience will degrade if low values are set. However, if the MSS does not meet the requirements of the mobile operator network, OEMs can customize it by setting the MTU data size.

**Note**  This customization configures the MTU so the size should be set to the required MSS size plus 40 bytes.

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MTUDataSizeSettings"  
                         Description="Use to configure the MTU data size or roaming MTU data size."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="CellCore/PerDevice/External/ImageOnly">  
          <Setting Name="MTU/MTUDataSize" Value="" />  
          <Setting Name="MTU/RoamingMTUDataSize" Value="" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  To change the default MTU data size, set the value for the `MTU/MTUDataSize` setting.

4.  To change the default roaming MTU data size, set the value for the `MTU/RoamingMTUDataSize` setting.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configuring%20the%20MTU%20data%20size%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




