---
title: Disabling NITZ or daylight saving time
description: OEMs can configure NITZ to handle daylight saving time appropriately for their market, or disable automatic setting of date and time completely.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 407cd4ce-3998-4d43-8799-b198ca11d093
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disabling NITZ or daylight saving time


OEMs can configure NITZ to handle daylight saving time appropriately for their market, or disable automatic setting of date and time completely.

By default, the OS automatically sets the time and date by using Network Identity and Time Zone (NITZ). OEMs can configure NITZ to handle daylight saving time appropriately for their market, or disable automatic setting of date and time on the device completely if NITZ is not supported by the network.

In addition, if the device will be sold in a country or region that does not use daylight saving time, partners can disable it on the device. This will help the automatic time algorithm choose the correct time zone with greater accuracy.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisableNITZorDST"  
                         Description="Use to configure NITZ to handle DST or disable automatic date and time setting if NITZ is not supported."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="AutomaticTime">  

          <!-- Use to disable automatic date and time configuration -->
          <Setting Name="EnableAutomaticTime" Value="" /> 
          
          <!-- Use to disable automatic DST adjustment -->
          <Setting Name="DisableDaylightSavingsTime" Value="" /> 

       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  The following values are valid for `EnableAutomaticTime`:

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
    <td><p>0</p></td>
    <td><p>Use to disable automatic time setting with NITZ.</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>Use to enable automatic time setting with NITZ.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  The following values are valid for `DisableDaylightSavingsTime`:

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
    <td><p>0</p></td>
    <td><p>Use to enable daylight saving time.</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>Use to disable daylight saving time.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  Delete either of the `EnableAutomaticTime` or `DisableDaylightSavingsTime` settings if the feature does not need to be disabled.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device with a SIM or UICC.

2.  If you have disabled automatic time setting with NITZ, ensure that the date and time is not set automatically for the user during setup.

    If you have disabled NITZ, the default time zone shown during setup will come from the country/region default time zone list based on the current country/region setting. Also, the **date + time** screen in **Settings** will have fields for **Time zone**, **Date**, and **Time**, but no **Set automatically** toggle.

3.  If daylight saving time has been disabled and automatic time is enabled, the device determines the most likely time zone by the current offset only.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disabling%20NITZ%20or%20daylight%20saving%20time%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




