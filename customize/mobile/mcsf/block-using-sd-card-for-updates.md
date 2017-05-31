---
title: Block using SD card for updates
description: For devices that support an SD card, OEMs can either allow or block the use of the SD card for device updates.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4a215003-8b89-4756-8797-c7b73607049e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Block using SD card for updates


For devices that support an SD card, OEMs can either allow or block the use of the SD card for device updates.

By default, this customization is not set and the OS can use the SD card for updates. If there is enough space on the *e*MMC to download an update, the OS will use the *e*MMC instead of the SD card.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="BlockUsingSDCard"  
                         Description="Use to determine whether to block the use of the SD card for device updates."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="DeviceUpdate">  
          <Setting Name="BlockUsingSDCard" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `BlockUsingSDCard` to one of the following:

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
    <td><p>0 or 'No'</p></td>
    <td><p>Do not block the use of the SD card for device updates.</p>
    <div class="alert">
    <strong>Note</strong>  
    <p>Make sure that your UEFI supports powering up the SD card on the UpdateOS.</p>
    </div>
    <div>
     
    </div></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Block the use of the SD card for device updates.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  If you set `BlockUsingSDCard` to allow the use of the SD card for updates and your device supports an SD card, if space on the *e*MMC is not enough for the update, the OS will choose the SD card to use for the update.

    When there is an update available and you have synced and downloaded the update, verify whether the update was installed from the SD card.

3.  When the update has been successfully installed, use GetDULogs.exe to check if the update was done through the SD card.

    Make sure that your UEFI supports the powering up of the SD card on the UpdateOS.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Block%20using%20SD%20card%20for%20updates%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




