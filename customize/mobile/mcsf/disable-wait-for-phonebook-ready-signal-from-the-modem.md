---
title: Disable wait for phonebook ready signal from the modem
description: FDN SIM contacts syncs from the SIM during device boot.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3872329f-80d2-460d-b7af-51e192200631
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disable wait for phonebook ready signal from the modem


FDN SIM contacts syncs from the SIM during device boot. By default, this component waits until the phonebook ready signal is received from the modem and then it verifies whether FDN contact management is enabled on the SIM. If needed, OEMs can disable the wait for the phonebook ready signal.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CheckFDNStateAfterPhonebookReady"  
                         Description="Use to disable the wait for the phonebook ready signal from the modem."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="People/SIMContactManagement">  
          <Setting Name="CheckFDNStateAfterPhonebookReady" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `CheckFDNStateAfterPhonebookReady` to one of the following values:

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
    <td><p>Disables the wait until the phonebook ready signal from the modem is received.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Waits for the phonebook ready signal from the modem before verifying whether FDN contact management is enabled on the SIM.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device with a SIM that has FDN enabled.

2.  Go through the setup process and then enter the PIN to unlock the SIM when prompted and wait for the Start screen to appear.

3.  Go to the **People** Hub and verify that FDN contacts are visible.

4.  Go to the **Settings** &gt; **phone** &gt; **SIM** settings screen and verify that FDN is shown as On.

5.  Additionally, you can test SIMs from two operators and verify that:

    -   Both SIM cards show FDN contacts correctly.

    -   Enabling and disabling FDN works.

    -   Operator voice calls are allowed or blocked correctly based on the FDN status and FDN contacts list.

    -   Adding and deleting contacts in the FDN phonebook works.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disable%20wait%20for%20phonebook%20ready%20signal%20from%20the%20modem%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




