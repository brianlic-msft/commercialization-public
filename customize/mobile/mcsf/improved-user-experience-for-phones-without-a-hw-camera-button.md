---
title: Improved user experience for phones without a HW camera button
description: On mobile devices that do not have a hardware camera button present, OEMs can provide a better user experience by enabling this customization so that parts of the UI and service are updated to indicate to the user that there is no camera button on the device. When this customization is enabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 45441077-2a0a-43b9-bb37-0925c85b784b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Improved user experience for phones without a HW camera button


On mobile devices that do not have a hardware camera button present, OEMs can provide a better user experience by enabling this customization so that parts of the UI and service are updated to indicate to the user that there is no camera button on the device. When this customization is enabled:

-   The camera roll text will not include the string **camera button**.

-   The **camera** settings screen will not include the string **camera button**.

-   The **camera** settings screen will not include settings that are button-specific.

When the user launches the camera app, the device displays a message on the viewfinder that shows the user how to take a picture by tapping on the screen.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HWCameraShutterButtonNotPresent"  
                         Description="Use to provide a better user experience for phones that do not have a hardware camera button."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="Photos/OEM">  
          <Setting Name="HWCameraShutterButtonNotPresent" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  Set the value for `HWCameraShutterButtonNotPresent` to one of the following values:

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
    <td><p>0 or 'False, present'</p></td>
    <td><p>Indicates that there is a HW camera shutter button. This is the default value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True, not present'</p></td>
    <td><p>Indicates that there is no HW camera shutter button.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build that contains this customization to a mobile device without a dedicated hardware camera button.

2.  Navigate to the camera **Settings** screen and verify that **camera button** is not displayed in the UI.

3.  Verify that you do not see the following options in the UI:

    -   **Press and hold camera button**

4.  Navigate to the camera roll. If the camera roll is empty, verify that the caption displayed on the empty camera roll does not reference the camera button.

    If the default camera app is configured to work above the lock screen, verify that the app that launches is the OEM lens app that you chose.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Improved%20user%20experience%20for%20phones%20without%20a%20HW%20camera%20button%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




