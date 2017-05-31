---
title: Supplementary services exclusions
description: Partners can define a dialer code to use for 3GP USSD services like changing the pin, changing the password, caller ID, call forwarding, call waiting, call barring, and so on.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9233b52c-b3bf-40f3-a6be-10ee4a791d6c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Supplementary services exclusions


Partners can define a dialer code to use for 3GP USSD services like changing the pin, changing the password, caller ID, call forwarding, call waiting, call barring, and so on. Partners can define new mappings or disable the default mappings. To define a new mapping or change the behavior of a provided supplementary service mappings, see [Dialer codes for supplementary services](dialer-codes-for-supplementary-services.md)

Microsoft provides a number of predefined USSD codes. Partners can exclude predefined USSD entries, allowing the number to be sent as standard DTMF tones instead. This allows for customization for specific markets where the predefined USSD codes need to be sent as a DTMF tones.

**Note**  
Only existing USDD codes can be overridden.

 

The following USSD codes are predefined in Windows Phone, and all of them can be overridden by the OEM.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Codes</th>
<th>Description</th>
<th>DWORD Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>04</p></td>
<td><p>CHANGEPIN</p></td>
<td><p>000000F4</p></td>
</tr>
<tr class="even">
<td><p>042</p></td>
<td><p>CHANGEPIN2</p></td>
<td><p>00000F42</p></td>
</tr>
<tr class="odd">
<td><p>05</p></td>
<td><p>UNBLOCKPIN</p></td>
<td><p>000000F5</p></td>
</tr>
<tr class="even">
<td><p>052</p></td>
<td><p>UNBLOCKPIN2</p></td>
<td><p>00000F52</p></td>
</tr>
<tr class="odd">
<td><p>03</p></td>
<td><p>SSCHANGEPASSWORD</p></td>
<td><p>000000F3</p></td>
</tr>
<tr class="even">
<td><p>75</p></td>
<td><p>EMLPPBASE</p></td>
<td><p>00000075</p></td>
</tr>
<tr class="odd">
<td><p>750</p></td>
<td><p>EMLPPLEVEL0</p></td>
<td><p>00000750</p></td>
</tr>
<tr class="even">
<td><p>751</p></td>
<td><p>EMLPPLEVEL1</p></td>
<td><p>00000751</p></td>
</tr>
<tr class="odd">
<td><p>752</p></td>
<td><p>EMLPPLEVEL2</p></td>
<td><p>00000752</p></td>
</tr>
<tr class="even">
<td><p>753</p></td>
<td><p>EMLPPLEVEL3</p></td>
<td><p>00000753</p></td>
</tr>
<tr class="odd">
<td><p>754</p></td>
<td><p>EMLPPLEVEL4</p></td>
<td><p>00000754</p></td>
</tr>
<tr class="even">
<td><p>66</p></td>
<td><p>CALLDEFLECT</p></td>
<td><p>00000066</p></td>
</tr>
<tr class="odd">
<td><p>30</p></td>
<td><p>CALLIDCLIP</p></td>
<td><p>00000030</p></td>
</tr>
<tr class="even">
<td><p>31</p></td>
<td><p>CALLIDCLIR</p></td>
<td><p>00000031</p></td>
</tr>
<tr class="odd">
<td><p>76</p></td>
<td><p>CALLIDCOLP</p></td>
<td><p>00000076</p></td>
</tr>
<tr class="even">
<td><p>77</p></td>
<td><p>CALLIDCOLR</p></td>
<td><p>00000077</p></td>
</tr>
<tr class="odd">
<td><p>21</p></td>
<td><p>FWDUNCONDITIONAL</p></td>
<td><p>00000021</p></td>
</tr>
<tr class="even">
<td><p>67</p></td>
<td><p>FWDBUSY</p></td>
<td><p>00000067</p></td>
</tr>
<tr class="odd">
<td><p>61</p></td>
<td><p>FWDNOREPLY</p></td>
<td><p>00000061</p></td>
</tr>
<tr class="even">
<td><p>62</p></td>
<td><p>FWDNOTREACHABLE</p></td>
<td><p>00000062</p></td>
</tr>
<tr class="odd">
<td><p>002</p></td>
<td><p>FWDALL</p></td>
<td><p>00000FF2</p></td>
</tr>
<tr class="even">
<td><p>004</p></td>
<td><p>FWDALLCONDITIONAL</p></td>
<td><p>00000FF4</p></td>
</tr>
<tr class="odd">
<td><p>43</p></td>
<td><p>CALLWAITING</p></td>
<td><p>00000043</p></td>
</tr>
<tr class="even">
<td><p>360</p></td>
<td><p>UUSALL</p></td>
<td><p>00000360</p></td>
</tr>
<tr class="odd">
<td><p>361</p></td>
<td><p>UUSSERVICE1</p></td>
<td><p>00000361</p></td>
</tr>
<tr class="even">
<td><p>362</p></td>
<td><p>UUSSERVICE2</p></td>
<td><p>00000362</p></td>
</tr>
<tr class="odd">
<td><p>363</p></td>
<td><p>UUSSERVICE3</p></td>
<td><p>00000363</p></td>
</tr>
<tr class="even">
<td><p>33</p></td>
<td><p>BARROUT</p></td>
<td><p>00000033</p></td>
</tr>
<tr class="odd">
<td><p>331</p></td>
<td><p>BARROUTINTL</p></td>
<td><p>00000331</p></td>
</tr>
<tr class="even">
<td><p>332</p></td>
<td><p>BARROUTINTLEXTOHOME</p></td>
<td><p>00000332</p></td>
</tr>
<tr class="odd">
<td><p>35</p></td>
<td><p>BARRIN</p></td>
<td><p>00000035</p></td>
</tr>
<tr class="even">
<td><p>351</p></td>
<td><p>BARRINROAM</p></td>
<td><p>00000351</p></td>
</tr>
<tr class="odd">
<td><p>330</p></td>
<td><p>BARRALL</p></td>
<td><p>00000330</p></td>
</tr>
<tr class="even">
<td><p>333</p></td>
<td><p>BARRALLOUT</p></td>
<td><p>00000333</p></td>
</tr>
<tr class="odd">
<td><p>353</p></td>
<td><p>BARRALLIN</p></td>
<td><p>00000353</p></td>
</tr>
<tr class="even">
<td><p>354</p></td>
<td><p>BARRINCOMINGINTERMEDIATE</p></td>
<td><p>00000354</p></td>
</tr>
<tr class="odd">
<td><p>96</p></td>
<td><p>CALLTRANSFER</p></td>
<td><p>00000096</p></td>
</tr>
<tr class="even">
<td><p>37</p></td>
<td><p>CALLCOMPLETEBUSY</p></td>
<td><p>00000037</p></td>
</tr>
<tr class="odd">
<td><p>070</p></td>
<td><p>PNP0</p></td>
<td><p>00000F70</p></td>
</tr>
<tr class="even">
<td><p>071</p></td>
<td><p>PNP1</p></td>
<td><p>00000F71</p></td>
</tr>
<tr class="odd">
<td><p>072</p></td>
<td><p>PNP2</p></td>
<td><p>00000F72</p></td>
</tr>
<tr class="even">
<td><p>073</p></td>
<td><p>PNP3</p></td>
<td><p>00000F73</p></td>
</tr>
<tr class="odd">
<td><p>074</p></td>
<td><p>PNP4</p></td>
<td><p>00000F74</p></td>
</tr>
<tr class="even">
<td><p>075</p></td>
<td><p>PNP5</p></td>
<td><p>00000F75</p></td>
</tr>
<tr class="odd">
<td><p>076</p></td>
<td><p>PNP6</p></td>
<td><p>00000F76</p></td>
</tr>
<tr class="even">
<td><p>077</p></td>
<td><p>PNP7</p></td>
<td><p>00000F77</p></td>
</tr>
<tr class="odd">
<td><p>078</p></td>
<td><p>PNP8</p></td>
<td><p>00000F78</p></td>
</tr>
<tr class="even">
<td><p>079</p></td>
<td><p>PNP9</p></td>
<td><p>00000F79</p></td>
</tr>
<tr class="odd">
<td><p>300</p></td>
<td><p>CALLCNAP</p></td>
<td><p>00000300</p></td>
</tr>
<tr class="even">
<td><p>591</p></td>
<td><p>MSP1</p></td>
<td><p>00000591</p></td>
</tr>
<tr class="odd">
<td><p>592</p></td>
<td><p>MSP2</p></td>
<td><p>00000592</p></td>
</tr>
<tr class="even">
<td><p>593</p></td>
<td><p>MSP3</p></td>
<td><p>00000593</p></td>
</tr>
<tr class="odd">
<td><p>594</p></td>
<td><p>MSP4</p></td>
<td><p>00000594</p></td>
</tr>
</tbody>
</table>

 

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SupplementaryServicesExclusions"  
                         Description="Use to exclude predefined USSD entries to allow the number to be sent as standart DTMF tones instead."  
                         Owner=""  
                         OwnerType="OEM"> 

      
      <!-- Define the Targets --> 
      <Targets>
         <Target Id="">
            <TargetState>
               <Condition Name="" Value="" />
               <Condition Name="" Value="" />
            </TargetState>
         </Target>
      </Targets>
      
      <Static>
        <Settings Path="Multivariant">
          <Setting Name="Enable" Value="1" />
        </Settings>
        <Settings Path="AutoDataConfig">
          <Setting Name="Enable" Value="0" />
        </Settings>
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <Settings Path="Phone/PerSimSettings/$(__IMSI)"> 
          <Setting Name="IgnoreUssdExclusions" Value="" />    
          <Setting Name="UssdExclusionList" Value="" />    
          </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  For the **per-IMSI** case:

    1.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

4.  Set `IgnoreUssdExclusions` to one of the following values:

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
    <td><p>Uses the USSD exclusion list.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Ignores the USSD exclusion list.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  Set `UssdExclusionList` to the list of desired exclusions, separated by semicolons. For example, to override 2 and 4, set the value to *2;4*

    Leading zeros are specified by using `F`. For example, to override code 079, set the value to *F79*.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Tap on the keypad button in **Phone**.

3.  Verify modified dialer codes are handled as configured.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Supplementary%20services%20exclusions%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




