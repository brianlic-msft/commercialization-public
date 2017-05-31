---
title: Ringtone store application
description: Partner apps can be used to sell ringtones to users.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 05b7df91-be48-4aaf-bf63-cbc3ced0fa28
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Ringtone store application


Partner apps can be used to sell ringtones to users. The app owner must provide the service for the ringtone catalog and to manage downloads. Users are shown an option to **Get more** ringtones in the ringtone picker, from which they can automatically launch the ringtone store application.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create an application that supports ringtones. For more information on how to do this, see *How to use the save ringtone task for Windows Phone* in the Windows Phone SDK Documentation.

2.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="RingtoneStoreApp"  
                         Description="Use to enable users to automatically launch the ringtone store application that was created by
                                      the partner to sell ringtones to users."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <!-- Preload the ringtone store app. Specify the source, license, and ProvXML files. -->
        <Applications>
          <Application Source=""
                       License=""
                       ProvXML="" />
        </Applications>

        <Settings Path="EventSounds">  
          <Setting Name="GetMoreRingtonesLink" Value="app://" />
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

3.  Specify an `Owner`.

4.  Preload your ringtone store app. To do this:

    1.  Set `Source` to the location and file name of your .xap or .appx. For example, *C:\\Path\\ContosoRingtoneStoreApp.xap*.

    2.  Set `License` to the location and name of the app license file. For example, *C:\\Path\\ContosoRingtoneStoreAppLicense.xml*.

    3.  Set `ProvXML` to the location and name of the provXML file. For example, *C:\\Path\\mpap\_oemapp\_01.provxml*.

5.  Set the value of `GetMoreRingtonesLink` your application ID preceded by the **app://** prefix. For example, if your app ID is *{5B04B775-356B-4AA0-AAF8-6491FFEA5605}*, you must set the value to `app://5B04B775-356B-4AA0-AAF8-6491FFEA5605`. You may also set it to `app://5B04B775-356B-4AA0-AAF8-6491FFEA5605/_default`.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Go to the **Sounds** screen in **Settings**.

3.  Select the **Ringtone** picker.

4.  In the ringtone picker screen, scroll to the bottom and verify that the **Get more** link is visible.

5.  Tap the link and confirm that it launches your ringtone store application.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Ringtone%20store%20application%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




