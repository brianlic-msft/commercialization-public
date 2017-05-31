---
title: Custom percentages for signal strength bars
description: Partners must modify the percentage values used for the signal strength bars in the status bar.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7cf70c2c-a2bd-44d8-9956-dcf309ecce6d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom percentages for signal strength bars


Partners must modify the percentage values used for the signal strength bars in the status bar. These five bars represent the strength of the cellular connection and are determined by a mapping table defined for the network. It is considered a manufacturing defect if a device ships with incomplete or incorrect mapping tables.

Partners must also tune the thresholds for measuring the signal strength received from the modem. Filters determine the magnitude of change in signal strength that triggers a report. Filter values are specific to the mobile operator network. The following filters must be configured:

-   GSM

-   UMTS RSSI

-   UMTS Ec/No

-   CDMA 1X Receive Channel Power

-   CDMA 1X Pilot Energy

-   CDMA EVDO Carrier Strength

-   CDMA EVDO SINR

-   LTE reference signal received power (RSRP)

-   LTE reference signal signal-to-noise ratio (RS\_SNR)

**Note**  
Windows 10 Mobile always shows the signal strength for the highest technology. For example:

-   If 1X and EVDO register at the same time, the device shows the EVDO signal strength in the status bar.

-   If 1X and LTE register at the same time, the device shows the LTE signal strength in the status bar.

In these examples, if the 1X signal strength changes and there is a higher radio access technology, the device will not do anything.

 

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SignalStrengthBars"  
                         Description="Use to modify the percentage values used for the signal strength bars in the status bar."  
                         Owner=""  
                         OwnerType="OEM">

      <Static>  

        <Settings Path="Cellcore/PerDevice/External">        
          <!-- Use to modify the percentage value for GSM. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/GERAN/5" Value="" />    
          <Setting Name="SignalBarMappingTable/GERAN/4" Value="" />  
          <Setting Name="SignalBarMappingTable/GERAN/3" Value="" />  
          <Setting Name="SignalBarMappingTable/GERAN/2" Value="" />  
          <Setting Name="SignalBarMappingTable/GERAN/1" Value="" />  

          <!-- Use to modify the percentage value for UMTS RSSI. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/UMTS/5" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTS/4" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTS/3" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTS/2" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTS/1" Value="" />  

          <!-- Use to modify the percentage value for UMTS Ec/No. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/UMTSEcNo/5" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTSEcNo/4" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTSEcNo/3" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTSEcNo/2" Value="" />  
          <Setting Name="SignalBarMappingTable/UMTSEcNo/1" Value="" />  

          <!-- Use to modify the percentage value for CDMA 1X Receive Channel Power. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/CDMA1xRCP/5" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xRCP/4" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xRCP/3" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xRCP/2" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xRCP/1" Value="" />  

          <!-- Use to modify the percentage value for CDMA 1X Pilot Energy. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/CDMA1xPE/5" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xPE/4" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xPE/3" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xPE/2" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMA1xPE/1" Value="" />  

          <!-- Use to modify the percentage value for CDMA EVDO Carrier Strength. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/CDMAEvdoCS/5" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoCS/4" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoCS/3" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoCS/2" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoCS/1" Value="" />  

          <!-- Use to modify the percentage value for CDMA EVDO SINR. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/CDMAEvdoSinr/5" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoSinr/4" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoSinr/3" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoSinr/2" Value="" />  
          <Setting Name="SignalBarMappingTable/CDMAEvdoSinr/1" Value="" />  

          <!-- Use to modify the percentage value for LTE reference signal received power. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/LTESRSRP/5" Value="" />  
          <Setting Name="SignalBarMappingTable/LTESRSRP/4" Value="" />  
          <Setting Name="SignalBarMappingTable/LTESRSRP/3" Value="" />  
          <Setting Name="SignalBarMappingTable/LTESRSRP/2" Value="" />  
          <Setting Name="SignalBarMappingTable/LTESRSRP/1" Value="" />  

          <!-- Use to modify the percentage value for LTE reference signal signal-to-noise radio. The numbers represent the signal strength bars. -->
          <Setting Name="SignalBarMappingTable/LTERSSNR/5" Value="" />  
          <Setting Name="SignalBarMappingTable/LTERSSNR/4" Value="" />  
          <Setting Name="SignalBarMappingTable/LTERSSNR/3" Value="" />  
          <Setting Name="SignalBarMappingTable/LTERSSNR/2" Value="" />  
          <Setting Name="SignalBarMappingTable/LTERSSNR/1" Value="" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` for the filters that you want to configure. You can use either a decimal or hexadecimal value, but you must add the **0x** prefix when specifying a hexadecimal value.

    **Note**  
    The signal strength mapping is implemented by the modem vendor. For information about how to change the required values under the **SignalBarMappingTable** setting, see the documentation provided by the modem vendor.

     

<a href="" id="testing-"></a>**Testing:**  
Refer to the documentation provided by the modem vendor and work with your mobile operator to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Custom%20percentages%20for%20signal%20strength%20bars%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




