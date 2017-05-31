---
title: Time zone priority list
description: Beginning with Windows 10 Mobile, this customization is no longer necessary as the OS supports a location-based timezone detection service.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d8683e3f-8e1d-4a1e-b5c3-dbfaf4cb4fc3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Time zone priority list


Beginning with Windows 10 Mobile, this customization is no longer necessary as the OS supports a location-based timezone detection service. However, to maintain backwards compatibility for some RPAL APIs that were previously released (such as **GetTimeZoneInformationID**, **SetTimeZoneInformationByID**, and so on), an updated table of the timezone IDs is provided for your reference.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
# <td><pre class="syntax" space="preserve"><code>ID     Time zone

0x0    UTC-12 International Date Line West
0x6E   UTC-11 Coordinated Universal Time-11
0xC8   UTC-10 Hawaii
0x12C  UTC-09 Alaska
0x190  UTC-08 Pacific Time (US &amp; Canada)
0x19A  UTC-08 Baja California
0x1F4  UTC-07 Mountain Time (US &amp; Canada)
0x1FE  UTC-07 Chihuahua, La Paz, Mazatlan
0x208  UTC-07 Arizona
0x258  UTC-06 Saskatchewan
0x262  UTC-06 Central America
0x26C  UTC-06 Central Time (US &amp; Canada)
0x276  UTC-06 Guadalajara, Mexico City, 
              Monterrey
0x2BC  UTC-05 Eastern Time (US &amp; Canada)
0x2C6  UTC-05 Bogota, Lima, Quito, Rio Branco
0x2D0  UTC-05 Indiana (East)
0x2DA  UTC-05 Chetumal
0x348  UTC-4:30 Caracas
0x320  UTC-04 Atlantic Time (Canada)
0x32A  UTC-04 Cuiaba
0x33E  UTC-04 Georgetown, La Paz, Manaus, 
              San Juan
0x352  UTC-04 Asuncion
0x384  UTC-03:30 Newfoundland
0x334  UTC-03 Santiago
0x38E  UTC-03 Brasilia
0x398  UTC-03 Greenland
0x3A2  UTC-03 Montevideo
0x3AC  UTC-03 Cayenne, Fortaleza
0x3B6  UTC-03 Buenos Aires
0x3C0  UTC-03 Salvador
0x3E8  UTC-02 Mid-Atlantic - Old
0x3F2  UTC-02 Coordinated Universal Time-02
0x44C  UTC-01 Azores
0x456  UTC-01 Cabo Verde Is.
0x4B0  UTC    Greenwich Mean Time: Dublin, 
              Edinburgh, Lisbon, London
0x4BA  UTC    Monrovia, Reykjavik
0x4C4  UTC    Casablanca
0x4CE  UTC    Coordinated Universal Time
0x514  UTC+01 Belgrade, Bratislava, Budapest, 
              Ljubljana, Prague
0x51E  UTC+01 Sarajevo, Skopje, Warsaw, Zagreb
0x528  UTC+01 Brussels, Copenhagen, Madrid, 
              Paris
0x532  UTC+01 West Central Africa
0x53C  UTC+01 Amsterdam, Berlin, Bern, Rome, 
              Stockholm, Vienna
0x546  UTC+01 Windhoek
0x550  UTC+02 Tripoli
0x578  UTC+02 E. Europe
0x582  UTC+02 Cairo
0x58C  UTC+02 Helsinki, Kyiv, Riga, Sofia, 
              Tallinn, Vilnius
0x596  UTC+02 Athens, Bucharest
0x5A0  UTC+02 Jerusalem
0x5AA  UTC+02 Amman
0x5B4  UTC+02 Beirut </code></pre></td>
# <td><pre class="syntax" space="preserve"><code>ID     Time zone

0x5BE  UTC+02 Harare, Pretoria
0x5C8  UTC+02 Damascus
0x5D2  UTC+02 Istanbul
0x5DC  UTC+03 Kuwait, Riyadh
0x5E6  UTC+03 Baghdad
0x5F0  UTC+03 Nairobi
0x5FA  UTC+02 Kaliningrad (RTZ 1)
0x604  UTC+03 Moscow, St. Petersburg, Volgograd (RTZ 2)
0x618  UTC+03 Minsk
0x60E  UTC+03:30 Tehran
0x640  UTC+04 Abu Dhabi, Muscat
0x64A  UTC+04 Baku
0x654  UTC+04 Yerevan
0x668  UTC+04 Tbilisi
0x672  UTC+04 Port Louis
0x67C  UTC+04 Izhevsk, Samara (RTZ 3)
0x65E  UTC+04:30 Kabul
0x6A4  UTC+05 Ekaterinburg (RTZ 4)
0x6AE  UTC+05 Ashgabat, Tashkent
0x6D6  UTC+05 Islamabad, Karachi
0x6B8  UTC+05:30 Chennai, Kolkata, Mumbai, 
              New Delhi
0x6C2  UTC+05:30 Sri Jayawardenepura
0x6CC  UTC+05:45 Kathmandu
0x708  UTC+06 Astana
0x712  UTC+06 Novosibirsk (RTZ 5)
0x726  UTC+06 Dhaka
0x71C  UTC+06:30 Yangon (Rangoon)
0x776  UTC+07 Bangkok, Hanoi, Jakarta
0x76C  UTC+07 Krasnoyarsk (RTZ 6)
0x7D0  UTC+08 Beijing, Chongqing, Hong Kong, 
              Urumqi
0x7DA  UTC+08 Irkutsk (RTZ 7)
0x7E4  UTC+08 Kuala Lumpur, Singapore
0x7EE  UTC+08 Taipei
0x7F8  UTC+08 Perth
0x802  UTC+08 Ulaanbaatar
0x80C  UTC+08:30 Pyongyang
0x834  UTC+09 Seoul
0x83E  UTC+09 Osaka, Sapporo, Tokyo
0x848  UTC+09 Yakutsk (RTZ 8)
0x852  UTC+09:30 Darwin
0x85C  UTC+09:30 Adelaide
0x898  UTC+10 Canberra, Melbourne, Sydney
0x8A2  UTC+10 Brisbane
0x8AC  UTC+10 Hobart
0x8B6  UTC+10 Vladivostok, Magadan (RTZ 9)
0x8C0  UTC+10 Guam, Port Moresby
0x906  UTC+10 Magadan
0x8FC  UTC+11 Solomon Is., New Caledonia
0x91A  UTC+11 Chokurdakh (RTZ 10)
0x960  UTC+12 Fiji
0x96A  UTC+12 Auckland, Wellington
0x974  UTC+12 Petropavlovsk-Kamchatsky – Old 
0x97E  UTC+12 Coordinated Universal Time+12
0x988  UTC+12 Anadyr, Petropavlovsk-Kamchatsky (RTZ 11)
0x9C4  UTC+13 Nuku&#39;alofa
0x64   UTC+13 Samoa
0xA28  UTC+14 Kiritimati Island</code></pre></td>
</tr>
</tbody>
</table>

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
**Note**  The following instructions have been provided for backwards compatibility only. You may set the values for the `TimeZonePriority` settings, but the OS will ignore the values as a location-based timezone detection service is used instead.

 

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="TimeZonePriorityList"  
                         Description="Use To specify a preference list for the most applicable time zones relative to the UTC offset."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="AutomaticTime">  

          <Setting Name="TimeZonePriority1" Value="" />    
          <Setting Name="TimeZonePriority2" Value="" /> 
          <Setting Name="TimeZonePriority3" Value="" />    
          <Setting Name="TimeZonePriority4" Value="" /> 
          <Setting Name="TimeZonePriority5" Value="" />   

          <!-- You can use up to 15 time zones, but do not add or set unless you need it. 
          <Setting Name="TimeZonePriority6" Value="" /> 
          <Setting Name="TimeZonePriority7" Value="" />    
          <Setting Name="TimeZonePriority8" Value="" /> 
          <Setting Name="TimeZonePriority9" Value="" />    
          <Setting Name="TimeZonePriority10" Value="" /> 
          <Setting Name="TimeZonePriority11" Value="" />    
          <Setting Name="TimeZonePriority12" Value="" /> 
          <Setting Name="TimeZonePriority13" Value="" />    
          <Setting Name="TimeZonePriority14" Value="" /> 
          <Setting Name="TimeZonePriority15" Value="" />    
          -->

       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Specify the `Value` keys using the IDs of the time zones appropriate for the locations in which the device will be sold.

4.  Add additional priorities as necessary. You can add up to 15 time zones or specify up to `TimeZonePriority15`. For example, if you are only specifying up to 3 time zones, only include up to the `TimeZonePriority3` setting, set their values, and do not add the rest.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Time%20zone%20priority%20list%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




