---
title: Hide the SIM security settings option
description: OEMs can hide the SIM security settings option.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 80edbbce-5a6c-4dae-a5f2-68f7fff07e29
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hide the SIM security settings option


OEMs can hide the **SIM security** settings option.

By default, the is visible when you go to the **Settings** &gt; **applications** &gt; **phone** screen. To meet certain mobile operator requirements or to provide a better user experience (including scenarios where a device contains a brand new SIM that doesn't require a security PIN), OEMs can hide this settings option.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HideSIMSecurityUI"  
                         Description="Use to hide the 'SIM security' settings option from the Phone settings screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="HideSIMSecurityUI" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `HideSIMSecurityUI` setting to one of the following values:

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
    <td><p>Show the <strong>SIM security</strong> settings option in the <strong>Settings</strong> &gt; <strong>applications</strong> &gt; <strong>phone</strong> screen.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Hide the <strong>SIM security</strong> settings option in the <strong>Settings</strong> &gt; <strong>applications</strong> &gt; <strong>phone</strong> screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator partner to test this customization on their network.

1.  Flash the build containing this customization to a device that has a brand new SIM that doesn't require a security PIN.

2.  Set up the device.

3.  If you set `HideSIMSecurityUI` to 1 or 'True', go to the **Phone** settings screen and verify that the **SIM security** settings option is not visible.

4.  If you set `HideSIMSecurityUI` to 0 or 'False' or you did not change the default OS value, go to the **Phone** settings screen and verify that the **SIM security** settings option is visible.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Hide%20the%20SIM%20security%20settings%20option%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




