---
title: Use OK for USSD dialogs
description: To meet certain market requirements or user expectations, OEMs can change the button label in USSD dialogs from Close (the default) to OK.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7b18f01e-dd3a-46b4-9016-7fb5c0da7aa8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use OK for USSD dialogs


To meet certain market requirements or user expectations, OEMs can change the button label in USSD dialogs from **Close** (the default) to **OK**.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="UseOKForUssdDialogs"  
                         Description="Use to change the button label in USSD dialogs from 'Close' to 'OK'."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="UseOKForUssdDialogs" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Change the button label in the USSD dialog by setting `UseOKForUssdDialogs` to one of the following values:

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
    <td><p>USSD success and failure dialogs have a single button to close the dialog labeled <strong>Close</strong></p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>USSD success and failure dialogs have a single button to close the dialog labeled <strong>OK</strong></p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a phone that has a UICC.

2.  Open the **Phone** app and tap the keypad button.

3.  Use several USSD codes and strings to bring up a USSD success dialog and a USSD failure dialog.

4.  Verify that the button label in the dialog shows **OK**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Use%20OK%20for%20USSD%20dialogs%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




