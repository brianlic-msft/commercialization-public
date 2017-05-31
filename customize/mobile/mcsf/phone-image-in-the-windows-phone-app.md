---
title: Phone image in the phone app
description: OEMs can replace the default images of the phone that appears in the phone app.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 170a5556-9902-4efb-84d6-41d5901ff33e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Phone image in the phone app


OEMs can replace the default images of the phone that appears in the phone app. These images are included in the OEMImage.cab that is provided in this customization sample. The OEM can replace these images with custom ones that more accurately depict their phone. When the OEM provides a new image, this image will be used and will replace the OEMavatar.cab file that is used by default.

**Limitations and restrictions:**

The custom image files to represent the phone must meet the following specifications:

-   PNG24

-   RGB

-   Bicubic

-   96 DPI

-   Alpha background transparency

-   Dimensions - Height (width varies by device):

    800 px

    400 px

    200 px

    150 px

    120 px

    80 px

-   The image must be the exact height and width of the device with no padding.

-   Match the orientation and general creative style of the sample image. To avoid issues associated with the localization of the screen image text, the phone image must depict a phone that is turned off.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Complete the following steps to create a cab file containing six custom .png image files to represent the phone.

    1.  Create the six custom phone images and place them in a folder named OEMImage.

    2.  Create a new OEMImage.cab file that contains your custom images using Makecab.exe, which is a utility included with Windows. To do this:

        1.  Create a directive file for Makecab.exe with the filename OEMImage.ddf.

            The .ddf file must have the following contents:

            ``` syntax
            ;*** OEMImage.ddf example
            ;
            .OPTION EXPLICIT     ; Generate errors 
            .Set CabinetNameTemplate=OEMImage.cab
            .set DiskDirectoryTemplate=CDROM ; All cabinets go in a single directory
            .Set UniqueFiles="OFF"
            .Set Cabinet=on
            .Set DiskDirectory1=OEMImage.CAB
            DeviceImage_80.png
            DeviceImage_120.png
            DeviceImage_150.png
            DeviceImage_200.png
            DeviceImage_400.png
            DeviceImage_800.png
            ```

        2.  Place the OEMImage.ddf file in the OEMImage folder along with the six .png image files. At a command-line prompt in the OEMImage folder, run the following command:

            ``` syntax
            Makecab.exe /F OEMImage.ddf
            ```

            This produces a .cab file called OEMImage.cab.

2.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WindowsPhoneAppImage"  
                         Description="Use to replace the default images of the phone that appears in the Windows Phone app."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="MediaTransferProtocol/DeviceAssets">  
             <!-- Use to add the .cab containing the PNG image files that depict the phone at various sizes and the OEMImage.ddf -->
             <Asset Name="DeviceImageCab" Source="C:\Path\OEMImage.cab" />
             
             <!-- Use to specify which device image .cab should be used to display images of the phone in the Windows Phone app -->
             <Setting Name="Avatar" Value="OEMImage.cab" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

3.  Specify an `Owner`.

4.  Add the OEMImage.cab file to the customization package. To do this:

    1.  Set the asset `Name` to **DeviceImageCab**.

    2.  Specify the location of the OEMImage.cab on your workstation by changing *C:\\Path\\* in the `Source` attribute to match the location of OEMImage.cab.

5.  Specify which device image .cat to use when displaying images of the phone in the Windows Phone app by setting the `Avatar` value to OEMImage.cab.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  On the computer, install the Windows 10 Mobile app.

3.  Connect the phone to the computer using a USB cable.

4.  On the computer, open the mobile app.

5.  Verify that the phone image that you included in the build is visible in the mobile app.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Phone%20image%20in%20the%20phone%20app%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




