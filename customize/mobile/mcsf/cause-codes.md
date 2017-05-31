---
title: Cause codes
description: On GSM networks, OEMs can enable mobile operator-defined codes, or cause codes, to show in the UI whenever a phone call is terminated unexpectedly.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7c7fb6ed-0e82-4a6a-a910-68f00b0ce7c8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cause codes


On GSM networks, OEMs can enable mobile operator-defined codes, or cause codes, to show in the UI whenever a phone call is terminated unexpectedly.

Cause codes indicate the reason why the call ended unexpectedly and are used by mobile operators to troubleshoot customer issues and determine the source of network problems. Note that Windows 10 Mobile does not support cause codes for CDMA networks.

An OEM must work with their mobile operator partner to support this customization. The mobile operator partner, through the OEM, must do the following:

1.  Specify the cause codes that must be registered. These are the cause codes that the mobile operator is interested in and the OEM uses these codes to populate the registry. Cause codes that are not registered will not be logged and will not show up in the device's UI.

2.  Provide the localized string or message to display for each specific cause code in all languages corresponding to markets or locales that the mobile network covers. Each string is limited to 255 Unicode characters. If a cause code is registered, but no localized string is provided, the device UI will only show the numerical cause code.

This customization enables the cause code to persist in the call history so that the cause code is still visible even after the device reboots. The user can also view the error in the call history UI if a cause code is available.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CauseCodes"  
                         Description="Use to enable operator-defined codes, or cause codes, to show in the UI whenever a phone call is terminated unexpectedly."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/CauseCodeRegistrationTable">  
          <!-- Replace $(CAUSECODEMCCMNC) with the appropriate "MCCMNC" pairs for your mobile operator. Both MCC and MNC have to be three digits. 
               Set the Value to the network descriptor or ID. ID values can be used more than once. -->
          <Setting Name="NetworkDescriptor/$(CAUSECODEMCCMNC)" Value="" />      
          <Setting Name="NetworkDescriptor/$(CAUSECODEMCCMNC)" Value="" />           
        </Settings>  

        <!-- Register the cause codes for the mobile operator -->

        <!-- Define a cause code and localized strings for that cause code. -->
        <Settings Path="Phone/CauseCodeRegistrationTable/$(NETWORKDESCRIPTOR)">  
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
        </Settings>

        <!-- Define a cause code and localized strings for that cause code. -->
        <Settings Path="Phone/CauseCodeRegistrationTable/$(NETWORKDESCRIPTOR)">  
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
          <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
        </Settings>

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  **To register the mobile network**

    1.  In the `Phone/CauseCodeRegistrationTable` settings group, replace *$(CAUSECODEMCCMNC)* in `NetworkDescriptor/$(CAUSECODEMCCMNC)` with the *MCCMNC* pair that corresponds to a *Network\_Descriptor*.

    2.  Use the format `MCCMNC` for *$(CAUSECODEMCCMNC)*. The MCC/MNC pairs must follow this format—each must have 3 digits specified. For example, if you have an MCC/MNC pair that corresponds to 412/89, you must store this in the registry as `412089`.

        The setting value for each MCC/MNC combination will be the relative path to another setting that will contain all the cause codes information for that network.

        There must be one entry for each MCC/MNC pair that is supported by the mobile operator. The same network ID or descriptor can be used for all MCC/MNC entries, or multiple IDs can be defined.

    3.  Set *Network\_Descriptor* as the value. You can use the mobile operator ID for the *Network\_Descriptor*. The network descriptor can be arbitrarily chosen by the mobile operator. For example, for the MCC/MNC pair 412/123 and 412/125, the mobile operator can choose "MOID2" as the network descriptor. MCC/MNC pairs that have the same network descriptor or mobile operator IDs will share the same cause code.

        The following example shows how to describe two networks that have MCC/MNC pairs of 412/89, 412/123, and 412/125 and network descriptors MOID1, MOID2, and MOID2, respectively:

        ``` syntax
            <Settings Path="Phone/CauseCodeRegistrationTable">  
              <Setting Name="NetworkDescriptor/412089" Value="MOID1" />      
              <Setting Name="NetworkDescriptor/412123" Value="MOID2" />      
              <Setting Name="NetworkDescriptor/412125" Value="MOID2" />      
            </Settings>
        ```

4.  **To specify the cause codes and localized strings for the cause code**

    1.  In the `Phone/CauseCodeRegistrationTable/$(NETWORKDESCRIPTOR)` settings path, replace *$(NETWORKDESCRIPTOR)* with the network IDs or descriptors you defined in the previous section.

        For example, if you have two network descriptors or mobile operator IDs called MOID1 and MOID2, define a settings group for each as shown in the following example.

        ``` syntax
            <Settings Path="Phone/CauseCodeRegistrationTable/MOID1">  
              <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
              <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
            </Settings>

            <Settings Path="Phone/CauseCodeRegistrationTable/MOID2">  
              <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
              <Setting Name="CauseCode/$(CAUSECODE)/$(LOCALEID)" Value="" />   
            </Settings>
        ```

    2.  For each network group, specify the cause codes, the corresponding locale IDs, and the localized strings for the cause codes.

        -   *$(CAUSECODE)* must be the decimal representation of the cause code.

        -   *$(LOCALEID)* must be the locale ID identifying the locale for the cause code string.

        -   `Value` must be set to the localized string to display for the cause code specific to the locale *$(LOCALEID)*.

        For example, to register a cause code 1 for MOID1 and specify all the localized strings for cause code 1 for the 0409 (English (US)), 0416 (Portuguese (Brazil)), and 040A (Spanish (Spain)) locales, add the following settings and values:

        ``` syntax
            <Settings Path="Phone/CauseCodeRegistrationTable/MOID1">  
              <Setting Name="CauseCode/1/0409" Value="Dialed number is unavailable -01-" />   
              <Setting Name="CauseCode/1/0416" Value="Numero discado indisponivel -01-" />   
              <Setting Name="CauseCode/1/040A" Value="Marcacion no disponible -01-" />   
            </Settings>
        ```

        In this example, if the device's locale is set to English (US), the OS will look for the appropriate entry in the registry and display "Dialed number is unavailable -01-". If the device's locale is set to Portuguese (Brazil), "Numero discado indisponivel -01-" will be displayed, and so on.

<a href="" id="example-"></a>**Example:**  
The following example customization answer file shows how to register two mobile networks (MOID1 and MOID2), specify their corresponding MCC/MNC pairs, and register a set of cause codes for both mobile networks in a limited number of locales.

``` syntax
<?xml version="1.0" encoding="utf-8" ?>  
<ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                     Name="CauseCodes"  
                     Description="Cause codes for MOID1 and MOID2."  
                     Owner="Contoso"  
                     OwnerType="OEM"> 
  
  <Static>  

    <Settings Path="Phone/CauseCodeRegistrationTable">  
      <Setting Name="NetworkDescriptor/412089" Value="MOID1" />      
      <Setting Name="NetworkDescriptor/412123" Value="MOID2" />      
      <Setting Name="NetworkDescriptor/412125" Value="MOID2" />      
    </Settings>  

    <!-- Register the cause codes for MOID1 -->
    <Settings Path="Phone/CauseCodeRegistrationTable/MOID1">  
      <!-- Cause code 1 -->
      <Setting Name="CauseCode/1/0409" Value="Dialed number is unavailable -01-" />   
      <Setting Name="CauseCode/1/0416" Value="Numero discado indisponivel -01-" />   
      <Setting Name="CauseCode/1/040A" Value="Marcacion no disponible -01-" />   
      <!-- Cause code 3 -->
      <Setting Name="CauseCode/3/0409" Value="Unavailable -03-" />   
      <Setting Name="CauseCode/3/0416" Value="Nao disponivel -03-" />   
      <Setting Name="CauseCode/3/040A" Value="Usuario no disponible -03-" />   
      <!-- Cause code 8 -->
      <Setting Name="CauseCode/8/0409" Value="User busy -08-" />   
      <Setting Name="CauseCode/8/0416" Value="Usuario ocupado -08-" />   
      <Setting Name="CauseCode/8/040A" Value="Usuario ocupado -08-" />   
    </Settings>

    <!-- Register the cause codes for MOID2 -->
    <Settings Path="Phone/CauseCodeRegistrationTable/MOID2">  
      <!-- Cause code 18 -->
      <Setting Name="CauseCode/18/0409" Value="No answer -18-" />   
      <Setting Name="CauseCode/18/0416" Value="Sem resposta -18-" />   
      <Setting Name="CauseCode/18/040A" Value="Usuario no responde -18-" />   
      <!-- Cause code 29 -->
      <Setting Name="CauseCode/29/0409" Value="Call ended -29-" />   
      <Setting Name="CauseCode/29/0416" Value="Chamada terminada -29-" />   
      <Setting Name="CauseCode/29/040A" Value="Llamada terminada -29-" />   
    </Settings>

  </Static>

</ImageCustomizations>
```

<a href="" id="testing-"></a>**Testing:**  
An OEM must work with their mobile operator partner to fully test this customization on the mobile operator's network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Cause%20codes%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




