---
title: Threshold for automatic time update
description: For mobile networks that support Network Identity and Time Zone (NITZ), OEMs can specify the difference (in number of seconds) between the NITZ information and the current device time before a device time update is triggered.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d5793eda-9b34-4c14-b225-3db9c38a95db
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Threshold for automatic time update


For mobile networks that support Network Identity and Time Zone (NITZ), OEMs can specify the difference (in number of seconds) between the NITZ information and the current device time before a device time update is triggered. When set, the OS updates the device time if the time difference is larger than the value specified by the OEM.

The threshold must be a value between 1 and 59 seconds, inclusive.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="NetworkTimeUpdateThreshold"  
                         Description="Use to specify the difference (in seconds) between the NITZ information and the current 
                                      device time before a device time update is triggered."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  
        <Settings Path="AutomaticTime">  
          <Setting Name="NetworkTimeUpdateThreshold" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value for `NetworkTimeUpdateThreshold` between 1 and 59 seconds (inclusive). This is equivalent to 0x1 and 0x3B (inclusive) in hexadecimal.

<a href="" id="testing-"></a>**Testing:**  
Flash the build containing this customization to a phone connected to a network that supports NITZ.

**Note**  
OEMs may need to configure the value a few times to determine the best threshold value.

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Threshold%20for%20automatic%20time%20update%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




