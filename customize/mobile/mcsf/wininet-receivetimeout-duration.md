---
title: WinInet ReceiveTimeOut duration
description: In cases where there are issues related to network handovers, partners can increase the WinInet ReceiveTimeOut value to provide more time for the network switch to take place.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 80ff5a90-1ac4-4275-940d-a9bbc784f2a1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinInet ReceiveTimeOut duration


In cases where there are issues related to network handovers, partners can increase the WinInet ReceiveTimeOut value to provide more time for the network switch to take place.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WinInetReceiveTimeOut"  
                         Description="Use to configure the WinInet Internet options ReceiveTimeOut value."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="WinInet/InternetSettings">  
          <Setting Name="WinInetReceiveTimeOut" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value`, in milliseconds, to a number between 30000 and 120000 (inclusive). This value is will be used as the WinInet ReceiveTimeOut value.

    The default OS value is 60000 milliseconds (60 seconds).

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator partner to fully test this customization on their network.

1.  Flash a build containing this customization to a phone with a cellular connection.

2.  Place the phone in an area with a weak field signal, for example a weak 3G field.

3.  Download a file during 2G to 3G handover.

4.  Download a file during 3G to 2G handover.

5.  Verify that the files were downloaded successfully. If not, adjust the value for `WinInetReceiveTimeOut` as needed.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20WinInet%20ReceiveTimeOut%20duration%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




