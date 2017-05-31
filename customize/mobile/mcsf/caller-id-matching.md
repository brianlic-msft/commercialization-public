---
title: Caller ID matching
description: Each country/region has a varying phone number length and style so with Windows 10 Mobile the OS maps a different minimum number of digits for matching caller ID that defaults to each country/region setting on the mobile device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cddd30e4-29b9-43ca-8dd5-ab76b2feef3d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Caller ID matching


Each country/region has a varying phone number length and style so with Windows 10 Mobile the OS maps a different minimum number of digits for matching caller ID that defaults to each country/region setting on the mobile device. This enables mobile users to get the proper settings for their preferred country/region.

In Windows 10 Mobile:

-   Mobile operators can modify the default mapping values specified by Microsoft using the settings in the `Phone/CallIDMatchOverrides` settings group. For more information on how to do this, see [Overriding the OS default minimum number of digits for caller ID matching](#overriding-os-default-min-number-digits).

    If mobile operators specify a number of digits that is outside the OS-supported range of 4-20, the OS defaults back to 6 digits.

-   For any country/region that doesn't exist in the default mapping table, mobile operators can use the legacy `CallIDMatch` setting to specify the minimum number of digits to use for matching caller ID. For more information on how to do this, see [Specifying the minimum number of digits for caller ID matching for other countries/regions](#specifying-min-digits-for-other-countries-regions).

If OEMs do not customize this setting based on mobile operator requirements, the OS uses the current default of 6, which is the last 6 digits of the phone number.

**Note**  
Microsoft does not recommend changing the default value without a full and complete testing of how number matching will be affected on the phone. The testing process should include numbers with and without country codes, "+", area codes, NDD, IDD, and other dialing variations. The default value has generally been found to yield the best matching results for all various dialing options for a number.

 

## Caller ID matching for dual SIM phones


For dual SIM phones, each SIM will use the same logic and the same minimum number of digits to match.

## <a href="" id="overriding-os-default-min-number-digits"></a>Overriding the OS default minimum number of digits for caller ID matching


The following table shows a mapping of the country/region and the default minimum number of digits (**CID**) that Windows 10 uses for caller ID matching.

For any country/region that you want to modify, note the **GEOID** for the country/region and the **CID** for the country/region. You will need the **GEOID** to identify the correct setting name to use while **CID** denotes the default OS value for the country/region.

| GEOID     | Country/region                               | CID |
|-----------|----------------------------------------------|-----|
| 2         | Antigua and Barbuda                          | 6   |
| 3         | Afghanistan                                  | 6   |
| 4         | Algeria                                      | 8   |
| 5         | Azerbaijan                                   | 6   |
| 6         | Albania                                      | 6   |
| 7         | Armenia                                      | 6   |
| 8         | Andorra                                      | 6   |
| 9         | Angola                                       | 9   |
| 10        | American Samoa                               | 6   |
| 11        | Argentina                                    | 7   |
| 12        | Australia                                    | 8   |
| 14        | Austria                                      | 8   |
| 17        | Bahrain                                      | 8   |
| 18        | Barbados                                     | 7   |
| 19        | Botswana                                     | 7   |
| 20        | Bermuda                                      | 6   |
| 21        | Belgium                                      | 6   |
| 22        | Bahamas, The                                 | 6   |
| 23        | Bangladesh                                   | 10  |
| 24        | Belize                                       | 6   |
| 25        | Bosnia and Herzegovina                       | 6   |
| 26        | Bolivia                                      | 6   |
| 27        | Myanmar                                      | 6   |
| 28        | Benin                                        | 6   |
| 29        | Belarus                                      | 6   |
| 30        | Solomon Islands                              | 6   |
| 32        | Brazil                                       | 8   |
| 34        | Bhutan                                       | 6   |
| 35        | Bulgaria                                     | 6   |
| 37        | Brunei                                       | 6   |
| 38        | Burundi                                      | 6   |
| 39        | Canada                                       | 10  |
| 40        | Cambodia                                     | 6   |
| 41        | Chad                                         | 6   |
| 42        | Sri Lanka                                    | 9   |
| 43        | Congo                                        | 6   |
| 44        | Congo (DRC)                                  | 6   |
| 45        | China                                        | 11  |
| 46        | Chile                                        | 8   |
| 49        | Cameroon                                     | 7   |
| 50        | Comoros                                      | 6   |
| 51        | Colombia                                     | 10  |
| 54        | Costa Rica                                   | 8   |
| 55        | Central African Republic                     | 6   |
| 56        | Cuba                                         | 6   |
| 57        | Cabo Verde                                   | 6   |
| 59        | Cyprus                                       | 6   |
| 61        | Denmark                                      | 6   |
| 62        | Djibouti                                     | 6   |
| 63        | Dominica                                     | 6   |
| 65        | Dominican Republic                           | 7   |
| 66        | Ecuador                                      | 8   |
| 67        | Egypt                                        | 7   |
| 68        | Ireland                                      | 6   |
| 69        | Equatorial Guinea                            | 6   |
| 70        | Estonia                                      | 6   |
| 71        | Eritrea                                      | 6   |
| 72        | El Salvador                                  | 8   |
| 73        | Ethiopia                                     | 6   |
| 75        | Czech Republic                               | 8   |
| 77        | Finland                                      | 9   |
| 78        | Fiji Islands                                 | 6   |
| 80        | Micronesia                                   | 6   |
| 81        | Faroe Islands                                | 6   |
| 84        | France                                       | 6   |
| 86        | Gambia, The                                  | 6   |
| 87        | Gabon                                        | 6   |
| 88        | Georgia                                      | 6   |
| 89        | Ghana                                        | 8   |
| 90        | Gibraltar                                    | 6   |
| 91        | Grenada                                      | 6   |
| 93        | Greenland                                    | 6   |
| 94        | Germany                                      | 7   |
| 98        | Greece                                       | 8   |
| 99        | Guatemala                                    | 8   |
| 100       | Guinea                                       | 6   |
| 101       | Guyana                                       | 6   |
| 103       | Haiti                                        | 6   |
| 104       | Hong Kong S.A.R.                             | 6   |
| 106       | Honduras                                     | 8   |
| 108       | Croatia                                      | 8   |
| 109       | Hungary                                      | 8   |
| 110       | Iceland                                      | 6   |
| 111       | Indonesia                                    | 6   |
| 113       | India                                        | 10  |
| 114       | British Indian Ocean Territory               | 6   |
| 116       | Iran                                         | 10  |
| 117       | Israel                                       | 7   |
| 118       | Italy                                        | 9   |
| 119       | Côte d'Ivoire                                | 6   |
| 121       | Iraq                                         | 7   |
| 122       | Japan                                        | 6   |
| 124       | Jamaica                                      | 7   |
| 125       | Jan Mayen                                    | 6   |
| 126       | Jordan                                       | 7   |
| 127       | Johnston Atoll                               | 6   |
| 129       | Kenya                                        | 9   |
| 130       | Kyrgyzstan                                   | 6   |
| 131       | North Korea                                  | 6   |
| 133       | Kiribati                                     | 6   |
| 134       | Korea                                        | 6   |
| 136       | Kuwait                                       | 8   |
| 137       | Kazakhstan                                   | 7   |
| 138       | Laos                                         | 6   |
| 139       | Lebanon                                      | 7   |
| 140       | Latvia                                       | 6   |
| 141       | Lithuania                                    | 6   |
| 142       | Liberia                                      | 6   |
| 143       | Slovakia                                     | 8   |
| 145       | Liechtenstein                                | 6   |
| 146       | Lesotho                                      | 6   |
| 147       | Luxembourg                                   | 6   |
| 148       | Libya                                        | 7   |
| 149       | Madagascar                                   | 6   |
| 151       | Macao S.A.R.                                 | 6   |
| 152       | Moldova                                      | 6   |
| 154       | Mongolia                                     | 6   |
| 156       | Malawi                                       | 6   |
| 157       | Mali                                         | 7   |
| 158       | Monaco                                       | 6   |
| 159       | Morocco                                      | 6   |
| 160       | Mauritius                                    | 6   |
| 162       | Mauritania                                   | 6   |
| 163       | Malta                                        | 6   |
| 164       | Oman                                         | 8   |
| 165       | Maldives                                     | 6   |
| 166       | Mexico                                       | 7   |
| 167       | Malaysia                                     | 6   |
| 168       | Mozambique                                   | 9   |
| 173       | Niger                                        | 6   |
| 174       | Vanuatu                                      | 6   |
| 175       | Nigeria                                      | 8   |
| 176       | Netherlands                                  | 8   |
| 177       | Norway                                       | 6   |
| 178       | Nepal                                        | 10  |
| 180       | Nauru                                        | 6   |
| 181       | Suriname                                     | 6   |
| 182       | Nicaragua                                    | 8   |
| 183       | New Zealand                                  | 8   |
| 184       | Palestinian Authority                        | 7   |
| 185       | Paraguay                                     | 9   |
| 187       | Peru                                         | 8   |
| 190       | Pakistan                                     | 9   |
| 191       | Poland                                       | 9   |
| 192       | Panama                                       | 8   |
| 193       | Portugal                                     | 7   |
| 194       | Papua New Guinea                             | 9   |
| 195       | Palau                                        | 6   |
| 196       | Guinea-Bissau                                | 6   |
| 197       | Qatar                                        | 8   |
| 198       | Reunion                                      | 6   |
| 199       | Marshall Islands                             | 6   |
| 200       | Romania                                      | 8   |
| 201       | Philippines                                  | 8   |
| 202       | Puerto Rico                                  | 7   |
| 203       | Russia                                       | 6   |
| 204       | Rwanda                                       | 6   |
| 205       | Saudi Arabia                                 | 8   |
| 206       | St. Pierre and Miquelon                      | 6   |
| 207       | St. Kitts and Nevis                          | 6   |
| 208       | Seychelles                                   | 6   |
| 209       | South Africa                                 | 9   |
| 210       | Senegal                                      | 8   |
| 212       | Slovenia                                     | 6   |
| 213       | Sierra Leone                                 | 6   |
| 214       | San Marino                                   | 6   |
| 215       | Singapore                                    | 6   |
| 216       | Somalia                                      | 6   |
| 217       | Spain                                        | 9   |
| 218       | St. Lucia                                    | 6   |
| 219       | Sudan                                        | 6   |
| 220       | Svalbard                                     | 6   |
| 221       | Sweden                                       | 7   |
| 222       | Syria                                        | 6   |
| 223       | Switzerland                                  | 6   |
| 224       | United Arab Emirates                         | 9   |
| 225       | Trinidad and Tobago                          | 6   |
| 227       | Thailand                                     | 6   |
| 228       | Tajikistan                                   | 6   |
| 231       | Tonga                                        | 6   |
| 232       | Togo                                         | 6   |
| 233       | Sao Tomé and Príncipe                        | 6   |
| 234       | Tunisia                                      | 7   |
| 235       | Turkey                                       | 6   |
| 236       | Tuvalu                                       | 6   |
| 237       | Taiwan                                       | 9   |
| 238       | Turkmenistan                                 | 6   |
| 239       | Tanzania                                     | 9   |
| 240       | Uganda                                       | 9   |
| 241       | Ukraine                                      | 6   |
| 242       | United Kingdom                               | 7   |
| 244       | United States                                | 8   |
| 245       | Burkina Faso                                 | 6   |
| 246       | Uruguay                                      | 8   |
| 247       | Uzbekistan                                   | 6   |
| 248       | St. Vincent and the Grenadines               | 6   |
| 249       | Bolivarian Republic of Venezuela             | 8   |
| 251       | Vietnam                                      | 9   |
| 252       | Virgin Islands                               | 6   |
| 253       | Vatican City                                 | 6   |
| 254       | Namibia                                      | 6   |
| 258       | Wake Island                                  | 6   |
| 259       | Samoa                                        | 6   |
| 260       | Swaziland                                    | 6   |
| 261       | Yemen                                        | 8   |
| 263       | Zambia                                       | 9   |
| 264       | Zimbabwe                                     | 6   |
| 269       | Serbia and Montenegro                        | 8   |
| 270       | Montenegro                                   | 6   |
| 271       | Serbia                                       | 6   |
| 273       | Curaçao                                      | 6   |
| 276       | South Sudan                                  | 6   |
| 300       | Anguilla                                     | 6   |
| 301       | Antarctica                                   | 6   |
| 302       | Aruba                                        | 6   |
| 303       | Ascension Island                             | 6   |
| 304       | Ashmore and Cartier Islands                  | 6   |
| 305       | Baker Island                                 | 6   |
| 306       | Bouvet Islands                               | 6   |
| 307       | Cayman Islands                               | 6   |
| 309       | Christmas Island                             | 6   |
| 310       | Clipperton Island                            | 6   |
| 311       | Cocos (Keeling) Islands                      | 6   |
| 312       | Cook Islands                                 | 6   |
| 313       | Coral Sea Islands                            | 6   |
| 314       | Diego Garcia                                 | 6   |
| 315       | Falkland Islands (Islas Malvinas)            | 6   |
| 317       | French Guiana                                | 6   |
| 318       | French Polynesia                             | 6   |
| 319       | French Southern and Antarctic Lands          | 6   |
| 321       | Guadeloupe                                   | 6   |
| 322       | Guam                                         | 6   |
| 323       | Guantanamo Bay                               | 6   |
| 324       | Guernsey                                     | 6   |
| 325       | Heard Island and McDonald Islands            | 6   |
| 326       | Howland Island                               | 6   |
| 327       | Jarvis Island                                | 6   |
| 328       | Jersey                                       | 6   |
| 329       | Kingman Reef                                 | 6   |
| 330       | Martinique                                   | 6   |
| 331       | Mayotte                                      | 6   |
| 332       | Montserrat                                   | 6   |
| 334       | New Caledonia                                | 6   |
| 335       | Niue                                         | 6   |
| 336       | Norfolk Island                               | 6   |
| 337       | Northern Maria Islands                       | 6   |
| 338       | Palmyra Atoll                                | 6   |
| 339       | Pitcairn Islands                             | 6   |
| 340       | Rota Island                                  | 6   |
| 341       | Saipan                                       | 6   |
| 342       | South Georgia and the South Sandwich Islands | 6   |
| 343       | St. Helena                                   | 6   |
| 346       | Tinian Island                                | 6   |
| 347       | Tokelau                                      | 6   |
| 348       | Tristan da Cunha                             | 6   |
| 349       | Turks and Caicos Islands                     | 6   |
| 351       | Virgin Islands, British                      | 6   |
| 352       | Wallis and Futuna                            | 6   |
| 15126     | Isle of Man                                  | 6   |
| 19618     | Macedonia, Former Yugoslav Republic of       | 8   |
| 21242     | Midway Islands                               | 6   |
| 30967     | Sint Maarten (Dutch part)                    | 6   |
| 31706     | Saint Martin (French part)                   | 6   |
| 7299303   | Democratic Republic of Timor-Leste           | 6   |
| 10028789  | Åland Islands                                | 6   |
| 161832015 | Saint Barthélemy                             | 6   |
| 161832256 | U.S. Minor Outlying Islands                  | 6   |
| 161832258 | Bonaire, Saint Eustatius and Saba            | 6   |

 

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
To modify the Microsoft-specified minimum number of digits to use for caller ID matching for one or more countries/regions, see the following example.

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CallerIDMatchingOverrides"  
                         Description="Use to modify the default number of digits to use for matching caller ID."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/CallIDMatchOverrides">  
          <Setting Name="2" Value="" />  <!-- Use to modify the default CID for Antigua and Barbuda -->
          <Setting Name="3" Value="" />  <!-- Use to modify the default CID for Afghanistan -->
          <Setting Name="4" Value="" />  <!-- Use to modify the default CID for Algeria -->
          <Setting Name="5" Value="" />  <!-- Use to modify the default CID for Azerbaijan -->
          <Setting Name="6" Value="" />  <!-- Use to modify the default CID for Albania -->
          <Setting Name="7" Value="" />  <!-- Use to modify the default CID for Armenia -->
          <Setting Name="8" Value="" />  <!-- Use to modify the default CID for Andorra -->
          <!-- And so on if you are modifying several values -->
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  In the above mapping table, identify the `Setting Name` that corresponds to the country/region you want to modify (noted by the value in the **GEOID** column in the above table) and then set the `Value` for that country/region to a new number (different from the default **CID**) that you want to use as the minimum number of digits for caller ID matching. The new `Value` must be within the OS-supported range of 4-20.

    For example, to change the default minimum caller ID matching for Antigua and Barbuda (`Setting Name="2"`) and the Åland Islands (`Setting Name="10028789"`) from the default 6 to a new minimum of 8, the following settings can be set within the MCSF customization answer file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CallerIDMatchingOverrides"  
                         Description="Use to modify the default number of digits to use for matching caller ID."  
                         Owner="Contoso"  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/CallIDMatchOverrides">  
          <Setting Name="2" Value="8" />         <!-- Antigua and Barbuda -->
          <Setting Name="10028789" Value="8" />  <!-- Åland Islands -->
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

    Note that this simple example doesn't show variants.

## <a href="" id="specifying-min-digits-for-other-countries-regions"></a>Specifying the minimum number of digits for caller ID matching for other countries/regions


<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
For any country/region that doesn't exist in the default mapping table, mobile operators can use the legacy `CallIDMatch` setting to specify the minimum number of digits to use for matching caller ID.

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CallerIDMatching"  
                         Description="Use to configure the number of digits to use for matching caller ID."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="CallIDMatch" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` to the number of digits used in the complete phone number. The `Value` must be within the OS-supported range of 4-20.

<a href="" id="testing-steps-"></a>**Testing steps:**  
The full testing process should include numbers with and without country codes, "+", area codes, NDD, IDD, and other dialing variations.

1.  Flash the build containing this customization to a phone that has a SIM.

2.  Have a second phone with a phone number.

3.  Go to the **Accounts** screen in **Settings**. Configure an email account.

4.  Go to the **People** app and add a new contact with a name and the phone number of the second phone.

5.  Call the phone from the second phone.

6.  Verify that the caller ID is matched and the contact name is displayed.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Caller%20ID%20matching%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




