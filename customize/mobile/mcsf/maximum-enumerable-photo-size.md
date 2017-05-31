---
title: Maximum enumerable photo size
description: For phones that have the hardware capability to capture various resolutions, partners can specify the resolution limit for photos that can be accessed by third party apps.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8001faaa-c6da-4bc6-b963-5d6971ced7f2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maximum enumerable photo size


For phones that have the hardware capability to capture various resolutions, partners can specify the resolution limit for photos that can be accessed by third party apps.

Only OEM applications have access to the maximum resolution limit.

**Note**  
This customization is only used by the **Windows.Phone.Media.Capture** service, which is provided in Windows Phone 8.1 for backwards compatibility only. **Windows.Media.Capture** does not support this customization.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MaximumEnumerablePhotoSize"  
                         Description="On phones that can capture multiple resolutions, use to specify the resolution limit for photos
                                      that can be accessed by third party apps."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

       <Settings Path="Camera">  
          <Setting Name="MaximumEnumerablePhotoSize" Value="" />  
       </Settings> 

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value for `MaximumEnumerablePhotoSize` to the photo resolution in pixels. For example, to set 5 megapixels as the maximum enumerable photo size, set `Value` to 5242880 (decimal) or 0x500000 (hexadecimal).

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone that has the hardware capability you are testing.

2.  Run a test using the [PhotoCaptureDevice.GetAvailableCaptureResolutions](http://go.microsoft.com/fwlink/p/?LinkId=286325) method and check if resolutions higher than the value you specified for `MaximumEnumerablePhotoSize` have been filtered out.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Maximum%20enumerable%20photo%20size%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




