---
title: Cortana phone number
description: Partners can configure a phone book entry for Cortana to allow users to initiate speech from a car that doesn't have support for activating speech on the device that is connected over Bluetooth.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 286e76cc-2099-421e-921b-3dbd925caf65
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cortana phone number


Partners can configure a phone book entry for Cortana to allow users to initiate speech from a car that doesn't have support for activating speech on the device that is connected over Bluetooth. The custom phone book entry will show up in the car's UI, but not in the Windows 10 Mobile UI.

When the user dials the custom phone number from the car, the device activates Cortana (or the device's default speech engine if Cortana is turned off or is not available), instead of making a phone call. The phone number also becomes associated with the contact name **Cortana** (or **Speech**) when the car downloads the phone book from the phone. To start the device's speech engine, the user can dial the custom contact from the car's UI or use the car's speech engine to "call Cortana" (or "call Speech" if Cortana is not enabled).

Once the phone book entry for Cortana has been configured, users cannot change the number. Only OEMs or mobile operators can change this number. Partners must set this phone number to a number that will not be used for actual phone numbers. Partners must also not use phone numbers that are used for emergencies, such as 911 in the United States.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CortanaPhoneNumber"  
                         Description="Use to assign a phone number to associate with Cortana. Users can use this number to start a 
                                      conversation with Cortana on the phone if a car doesn't have support for activating speech on 
                                      the phone that is connected over Bluetooth."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  
        <Settings Path="Bluetooth/BTAGService">   
          <Setting Name="CortanaPhoneNumber" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value for `CortanaPhoneNumber` to a phone number that will not be used for actual phone numbers or for those used for emergencies. The phone number should be specified for all countries/regions that support Cortana or legacy speech. If Cortana is off or not available for the market, the string **Speech** is used instead of **Cortana**.

    The default Cortana phone number is currently set to a fictitious phone number, 5555559876. If you do not change the default value, the OS will only recognize this phone number.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash an image that contains this customization to a phone.

2.  Connect your phone to your car over Bluetooth.

3.  If Cortana or the default phone speech engine is supported, start the phone's speech engine by dialing the custom contact from the car's UI. Alternatively, you can use the car's speech engine and say "call Cortana" (or "call Speech) if Cortana is not enabled).

    Verify that the phone activates either Cortana or the default speech instead of making a phone call. If Cortana is available, start a conversation.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Cortana%20phone%20number%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




