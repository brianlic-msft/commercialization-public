---
title: Cellular data connection icon
description: The one-, two-, or three-character codes used to signify the data connection type in the status bar can be modified.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eec95772-cf38-4ded-b5c5-eede2e485a56
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cellular data connection icon


The one-, two-, or three-character codes used to signify the data connection type in the status bar can be modified. The default values are G (GPRS), 1x (RTT), DO (EVDO), E (EDGE), 3G (3G), H (HSDPA/HSUPA), LTE (LTE), or no letters displayed if there is no active connection.

**Limitations and restrictions**:

-   Partners cannot modify the types of data connections available; only the display code can be modified.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DataConnectionIcon"  
                         Description="Use to modify the one-, two-, or three-character codes used to signify the data connection type in the status bar."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Shell/SystemTray/DataConnectionStrings">  
          <Setting Name="1XRTTDEFAULT" Value="1X" />  
          <Setting Name="1XRTT" Value="1X" />  
          <Setting Name="EVDODEFAULT" Value="DO" />  
          <Setting Name="EVDOREV0" Value="DO" />  
          <Setting Name="EVDOREVA" Value="DO" />  
          <Setting Name="EVDOREVB" Value="DO" />  
          <Setting Name="GSMDEFAULT" Value="G" />  
          <Setting Name="GSMGSM" Value="" />  
          <Setting Name="GSMGPRS" Value="G" />  
          <Setting Name="GSMEDGE" Value="E" />  
          <Setting Name="UMTSDEFAULT" Value="3G" />  
          <Setting Name="UMTSUMTS" Value="3G" />  
          <Setting Name="UMTSHSDPA" Value="H" />  
          <Setting Name="UMTSHSUPA" Value="H" />  
          <Setting Name="UMTSHSPAPLUS" Value="H+" />  
          <Setting Name="UMTSDCHSPAPLUS" Value="H+" />  
          <Setting Name="UMTSHSPAPLUS64QAM" Value="H+" />  
          <Setting Name="LTEDEFAULT" Value="LTE" />  
          <Setting Name="LTEFDD" Value="LTE" />  
          <Setting Name="LTETDD" Value="LTE" />  
          <Setting Name="TDSCDMADEFAULT" Value="T" />  
          <Setting Name="TDSCDMAUMTS" Value="T" />  
          <Setting Name="TDSCDMAHSDPA" Value="H" />  
          <Setting Name="TDSCDMAHSUPA" Value="H" />  
          <Setting Name="TDSCDMAHSPAPLUS" Value="H+" />  
          <Setting Name="TDSCDMADCHSPAPLUS" Value="H+" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To change the default one-, two-, or three-character codes used to signify the data connection type in the status bar, modify the `Value` that corresponds to the setting you want to change.

    **Note**  
    All the `Value` attributes are the current default values for each data connection type. You can change these to something else. Maximum character length is 3 characters.

     

    The following table shows the settings you can modify and their default values.

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting Name</th>
    <th>Default Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1XRTTDEFAULT</p></td>
    <td><p>1X</p></td>
    <td><p>1XRTT connection</p></td>
    </tr>
    <tr class="even">
    <td><p>1XRTT</p></td>
    <td><p>1X</p></td>
    <td><p>1XRTT</p></td>
    </tr>
    <tr class="odd">
    <td><p>EVDODEFAULT</p></td>
    <td><p>DO</p></td>
    <td><p>EVDO connection</p></td>
    </tr>
    <tr class="even">
    <td><p>EVDOREV0</p></td>
    <td><p>DO</p></td>
    <td><p>EVDO rev. 0</p></td>
    </tr>
    <tr class="odd">
    <td><p>EVDOREVA</p></td>
    <td><p>DO</p></td>
    <td><p>EVDO rev. A</p></td>
    </tr>
    <tr class="even">
    <td><p>EVDOREVB</p></td>
    <td><p>DO</p></td>
    <td><p>EVDO rev. B</p></td>
    </tr>
    <tr class="odd">
    <td><p>GSMDEFAULT</p></td>
    <td><p>G</p></td>
    <td><p>GSM connection</p></td>
    </tr>
    <tr class="even">
    <td><p>GSMGSM</p></td>
    <td><p></p></td>
    <td><p>No GSM connection</p></td>
    </tr>
    <tr class="odd">
    <td><p>GSMGPRS</p></td>
    <td><p>G</p></td>
    <td><p>GSM General Packet Radio Service</p></td>
    </tr>
    <tr class="even">
    <td><p>GSMEDGE</p></td>
    <td><p>E</p></td>
    <td><p>GSM Enhanced Data rates for Global Evolution</p></td>
    </tr>
    <tr class="odd">
    <td><p>UMTSDEFAULT</p></td>
    <td><p>3G</p></td>
    <td><p>UMTS connection</p></td>
    </tr>
    <tr class="even">
    <td><p>UMTSUMTS</p></td>
    <td><p>3G</p></td>
    <td><p>UMTS</p></td>
    </tr>
    <tr class="odd">
    <td><p>UMTSHSDPA</p></td>
    <td><p>H</p></td>
    <td><p>High Speed Downlink Packet Access</p></td>
    </tr>
    <tr class="even">
    <td><p>UMTSHSUPA</p></td>
    <td><p>H</p></td>
    <td><p>High Speed Uplink Packet Access</p></td>
    </tr>
    <tr class="odd">
    <td><p>UMTSHSPAPLUS</p></td>
    <td><p>H+</p></td>
    <td><p>High Speed Packet Access “Plus”</p></td>
    </tr>
    <tr class="even">
    <td><p>UMTSDCHSPAPLUS</p></td>
    <td><p>H+</p></td>
    <td><p>Dual-carrier HSPA+</p></td>
    </tr>
    <tr class="odd">
    <td><p>UMTSHSPAPLUS64QAM</p></td>
    <td><p>By default, the value inherited from UMTSDCHSPAPLUS.</p>
    <p>To set a value different from the value for UMTSDCHSPAPLUS, you must set the value explicitly.</p></td>
    <td><p>UMTS HSPA+ 64QAM (high order modulation)</p></td>
    </tr>
    <tr class="even">
    <td><p>LTEDEFAULT</p></td>
    <td><p>LTE</p></td>
    <td><p>LTE connection</p></td>
    </tr>
    <tr class="odd">
    <td><p>LTEFDD</p></td>
    <td><p>LTE</p></td>
    <td><p>LTE Frequency Division Duplexing</p></td>
    </tr>
    <tr class="even">
    <td><p>LTETDD</p></td>
    <td><p>LTE</p></td>
    <td><p>LTE Time Division Duplexing</p></td>
    </tr>
    <tr class="odd">
    <td><p>TDSCDMADEFAULT</p></td>
    <td><p>T</p></td>
    <td><p>TD-SCDMA connection</p></td>
    </tr>
    <tr class="even">
    <td><p>TDSCDMAUMTS</p></td>
    <td><p>T</p></td>
    <td><p>TD-SCDMA</p></td>
    </tr>
    <tr class="odd">
    <td><p>TDSCDMAHSDPA</p></td>
    <td><p>H</p></td>
    <td><p>TD-SCDMA High Speed Downlink Packet Access</p></td>
    </tr>
    <tr class="even">
    <td><p>TDSCDMAHSUPA</p></td>
    <td><p>H</p></td>
    <td><p>TD-SCDMA High Speed Uplink Packet Access</p></td>
    </tr>
    <tr class="odd">
    <td><p>TDSCDMAHSPAPLUS</p></td>
    <td><p>H+</p></td>
    <td><p>TD-SCDMA High Speed Packet Access “Plus”</p></td>
    </tr>
    <tr class="even">
    <td><p>TDSCDMADCHSPAPLUS</p></td>
    <td><p>H+</p></td>
    <td><p>TD-SCDMA Dual-carrier HSPA+</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash an image containing this customization to a phone that has a UICC.

2.  Verify that the one-, two-, or three-character code(s) you used for the cellular data connection type is displayed in the status bar at the top of the screen.

    You may have to tap the clock to make the status bar appear if it is hidden.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Cellular%20data%20connection%20icon%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




