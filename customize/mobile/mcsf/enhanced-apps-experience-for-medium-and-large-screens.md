---
title: Enhanced apps experience for medium and large screens
description: OEMs can use the UserPreferenceWidth setting to override the default behavior based on the screen size and specify the physical width of the device (instead of using the automatically calculated HORZSIZE value).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b3e3ce4d-cfbe-4768-9090-bc463869918f
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enhanced apps experience for medium and large screens


The mobile device screen size is determined by the OS based on the Extended Display Identification Data (EDID). The Start tile defaults to the following layouts based on the **HORZSIZE** value, in millimeters, of the **GetDeviceCaps** function:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>HORSIZE (mm)</th>
<th>Screen size</th>
<th>Start tile layout</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>&lt; 62</p></td>
<td><p>Small</p></td>
<td><p>4-column</p></td>
</tr>
<tr class="even">
<td><p>62 ≤ HORSIZE ≤ 74</p></td>
<td><p>Medium</p></td>
<td><p>6-column</p></td>
</tr>
<tr class="odd">
<td><p>≥74</p></td>
<td><p>Large</p></td>
<td><p>6-column</p></td>
</tr>
</tbody>
</table>

 

The following table shows the device categories and resolutions that are supported for medium and large screen sizes.

<table style="width:100%;">
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th>Display type</th>
<th>Resolution</th>
<th>Aspect ratio</th>
<th>Diagonal size</th>
<th>Medium size supported</th>
<th>Large size supported</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>1080p (FHD)</p></td>
<td><p>1080 x 1920</p></td>
<td><p>16:9</p></td>
<td><p>3.7&quot; to 7&quot;</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>720p (HD)</p></td>
<td><p>720 x 1280</p></td>
<td><p>16:9</p></td>
<td><p>3.7&quot; to 7&quot;</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>WXGA</p></td>
<td><p>768 x 1280</p></td>
<td><p>15:9</p></td>
<td><p>3.5&quot; to 5&quot;</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>WVGA</p></td>
<td><p>480 x 800</p></td>
<td><p>15:9</p></td>
<td><p>3.5&quot; to 5&quot;</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>FWVGA</p></td>
<td><p>480 x 854</p></td>
<td><p>16:9</p></td>
<td><p>3.5&quot; to 5&quot;</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
</tr>
</tbody>
</table>

 

**Note**  
The screen width matrix shown above will not work for 15:9 panel definitions. WXGA and WVGA, which are 15:9 panels only, support the small screen size.

 

For devices that are automatically calculated to have medium and large screen sizes, the entire UI is scaled down unless the screen or an application has opted out of the behavior. For devices with medium screens, the UI is scaled 93%. For devices with large screens, the UI is scaled 78%. Across devices, in case of a fixed size UI element, these will appear to be the same physical size. If the item is full screen width, the item's width will increase with the size of the screen, but the height will maintain the same physical size. Other changes in the UI include the following:

-   More text is displayed horizontally.

-   More items are displayed on a vertical list.

-   Spacing between UI elements, such as text or icons, is proportionally scaled down.

-   Image sizes are proportionally scaled down.

OEMs can use the **UserPreferenceWidth** setting to override the default behavior based on the screen size and specify the physical width of the device (instead of using the automatically calculated **HORZSIZE** value). The value for **UserPreferenceWidth** influences the screen resolution scale factor. A reboot is required for the change to take effect on the chrome process or any apps that are already running. Note that this only has a meaningful impact on 720 x 1280 and 1080 x 1920 devices.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="UserPreferenceWidth"  
                         Description="Use to override the default layout behavior based on the screen size and specify the physical width of the device to influence screen 
    resolution scale factor."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="ScreenSize">  
          <!-- Set the value in millimeters. Specify the value in decimal or hexadecimal (0x prefix) value. -->
          <Setting Name="UserPreferenceWidth" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `UserPreferenceWidth` to the physical width of the device, in millimeters, to override the default screen layout. Use either the decimal or hexadecimal (with the 0x prefix) value.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build that contains this customization to a phone.

2.  Verify that the following changes have been enabled on the phone:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Change</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>System font size</p></td>
    <td><p>Verify that the <strong>Ringtone</strong> label text in the <strong>Settings</strong> screen is smaller.</p></td>
    </tr>
    <tr class="even">
    <td><p>Email list view</p></td>
    <td><p>Open an email inbox and verify that the email items are listed with smaller text and that there is a second preview line for each item.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Messaging chat bubbles</p></td>
    <td><p>Open the <strong>Messaging</strong> app and open a conversation. Verify that the font size for the chat cards is smaller, which scales the size of the chat bubbles.</p></td>
    </tr>
    <tr class="even">
    <td><p>System font size and list item size</p></td>
    <td><p>Open the <strong>People</strong> hub and verify that the font size and icons for each contact are smaller.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Two-column to three-column grid view</p></td>
    <td><p>Open <strong>Photos</strong> and go to the <strong>Albums</strong> screen. Verify that there are more columns and the tile sizes and spacing are smaller.</p></td>
    </tr>
    <tr class="even">
    <td><p>System font size and list item size</p></td>
    <td><p>Open the Windows Store app and verify that the apps list contains smaller tiles and font size.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Two-column to three-column grid view</p></td>
    <td><p>From the Windows Store app, navigate to either top music albums or new releases and verify that there are 3 columns and the tile sizes and spacing are smaller.</p></td>
    </tr>
    </tbody>
    </table>

     

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enhanced%20apps%20experience%20for%20medium%20and%20large%20screens%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




