---
title: Adjust the call duration information for CDMA calls
description: On CDMA devices, call durations in the call history may include the time spent before the call was connected.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 92a35202-bfbb-4aed-8197-8fe253085d99
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Adjust the call duration information for CDMA calls


On CDMA devices, call durations in the call history may include the time spent before the call was connected. This behavior results in an incorrect calculation of the call duration. OEMs can address this potential issue by enabling this customization, which excludes the time spent before the call was connected. When enabled, the customization will also adjust the call duration to indicate that zero time was spent if the call ends before the connection was made.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AdjustCDMACallTime"  
                         Description="Use to adjust the calculation of the duration for a CDMA call to exclude the time
                                      before the call was connected. "  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="AdjustCDMACallTime" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `AdjustCDMACallTime` setting to one of the following values:

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
    <td><p>0 or 'False'</p></td>
    <td><p>Do not adjust the calculation of the duration for a phone call to exclude the time before the call was connected.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Adjust the calculation of the duration for a phone call to exclude the time before the call was connected.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your CDMA mobile operator partner to test this customization on their network.

1.  Flash the build containing this customization to a device that's connected to a CDMA network.

2.  Set up the device and then call a valid phone number until the call is connected.

    If you set `AdjustCDMACallTime` to 1 or 'True', go to the call **History** and confirm that the duration for the phone call only includes the time spent from when the phone call was connected and until you disconnected the call.

3.  Call a valid phone number, but end the call before the call can be connected.

    If you set `AdjustCDMACallTime` to 1 or 'True', go to the call **History** and confirm that the duration for the phone call indicates zero or no time spent on the call.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Adjust%20the%20call%20duration%20information%20for%20CDMA%20calls%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




