---
title: Configuring boot battery charging behavior
description: The boot (UEFI) environment contains a battery charging application (owned by Microsoft) that is responsible for charging the battery in pre-boot and low power states.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2921db35-ce81-47cd-b28a-132379549980
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuring boot battery charging behavior


The boot (UEFI) environment contains a battery charging application (owned by Microsoft) that is responsible for charging the battery in pre-boot and low power states. OEMs can configure some of the behavior of this application by using the registry values described in this topic.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
**Charging boot threshold**

OEMs can specify the threshold at which the device boots from UEFI-based charging to the Main OS. It is necessary to hold the device in the UEFI charging phase to charge the battery when it is too low to boot into the Main OS.

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ChargeSettings"  
                         Description="Use to specify the threshold at which the device boots from UEFI-based charging to the main OS and to enable power-off charging mode."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="ChargeSettings">  
          <Setting Name="ChargingBootThreshold" Value="" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` to a threshold value between 1 and 10. Microsoft recommends that OEMs calibrate this value so that the device spends a minimal amount of time in the threshold charging mode.

    **Note**  
    In Windows 10 Mobile, the UEFI charging app included in the OS is being deprecated. Microsoft recommends that OEMs use the app published by the SoC vendor. If you use the SoC vendor’s app, make sure that you disable the Windows 10 app by updating ChargingBootThreshold to 255 (hex 0xFF).

     

**Power-off charging**

This setting enables *power-off charging*. Power-off charging allows the device to charge while it appears off to the user. In power-off charging mode, the device does not boot to the OS when plugged in. Instead, the device waits for the user to press and hold the power button before booting to the OS.

**Important**  
Power-off charging can only be configured when the device image is generated. Windows 10 Mobile does not provide a way for users to enable or disable power-off charging.

 

1.  Create a customization answer file using the contents shown in the following code sample or use the sample ChargeSettings.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ChargeSettings"  
                         Description="Use to specify the threshold at which the device boots from UEFI-based charging to the main OS and to enable power-off charging mode."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="ChargeSettings">  
          <Setting Name="PowerOffChargingEnabled" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` to 1 to enable power-off charging or to 0 to disable power-off charging.


 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configuring%20boot%20battery%20charging%20behavior%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





