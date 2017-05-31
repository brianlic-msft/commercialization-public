---
title: Registry values for carrier-unlocked phones
description: Values to use for the mobile operator registry setting.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5d9fb8a8-9109-46f7-94b0-1d25e869419d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Registry values for carrier-unlocked phones


Values to use for the mobile operator registry setting.

The following table contains the values to use for the mobile operator registry setting **PhoneMobileOperatorName** when building carrier-unlocked phones. For more information about the registry key, see [Phone metadata in DeviceTargetingInfo](phone-metadata-in-devicetargetinginfo.md). If you know the mobile operator, use the [Registry values for mobile operator IDs](registry-values-for-mobile-operator-ids.md) instead.

The following table shows the mobile operator ID values for phones that will be sold in a large geographic area instead of a single country/region.

**Note**  
Note that it is not possible to prevent an update from going to one or more countries/regions in that geographical area. If any of the following regional IDs is specified, updates can either go to the entire region or none of it. There is no way to update phones with more granularity.

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Mobile Operator ID</th>
<th>Region</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>000-11</p></td>
<td><p>North America</p></td>
</tr>
<tr class="even">
<td><p>000-22</p></td>
<td><p>Latin America</p></td>
</tr>
<tr class="odd">
<td><p>000-23</p></td>
<td><p>North Latin America</p></td>
</tr>
<tr class="even">
<td><p>000-24</p></td>
<td><p>South Latin America</p></td>
</tr>
<tr class="odd">
<td><p>000-33</p></td>
<td><p>Europe</p></td>
</tr>
<tr class="even">
<td><p>000-34</p></td>
<td><p>Eastern Europe</p></td>
</tr>
<tr class="odd">
<td><p>000-35</p></td>
<td><p>Western Europe</p></td>
</tr>
<tr class="even">
<td><p>000-36</p></td>
<td><p>Northern Europe</p></td>
</tr>
<tr class="odd">
<td><p>000-37</p></td>
<td><p>Southern Europe</p></td>
</tr>
<tr class="even">
<td><p>000-44</p></td>
<td><p>Africa</p></td>
</tr>
<tr class="odd">
<td><p>000-55</p></td>
<td><p>Middle East</p></td>
</tr>
<tr class="even">
<td><p>000-66</p></td>
<td><p>Asia</p></td>
</tr>
<tr class="odd">
<td><p>000-67</p></td>
<td><p>South East Asia</p></td>
</tr>
<tr class="even">
<td><p>000-68</p></td>
<td><p>Central Asia</p></td>
</tr>
<tr class="odd">
<td><p>000-77</p></td>
<td><p>Oceania</p></td>
</tr>
<tr class="even">
<td><p>000-88</p></td>
<td><p>Worldwide</p></td>
</tr>
</tbody>
</table>

 

The following table shows more specific mobile operator ID values for carrier-unlocked phones that will be sold in only one country/region. If multiple codes apply, use the regional IDs listed in the preceding table instead. However, if the specific value is used, updates can be targeted more carefully if needed.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Mobile Operator ID</th>
<th>Country/Region</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>000-AD</strong></p></td>
<td><p>Andorra</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AE</strong></p></td>
<td><p>United Arab Emirates</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AF</strong></p></td>
<td><p>Afghanistan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AG</strong></p></td>
<td><p>Antigua and Barbuda</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AI</strong></p></td>
<td><p>Anguilla</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AL</strong></p></td>
<td><p>Albania</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AM</strong></p></td>
<td><p>Armenia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AO</strong></p></td>
<td><p>Angola</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AQ</strong></p></td>
<td><p>Antarctica</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AR</strong></p></td>
<td><p>Argentina</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AS</strong></p></td>
<td><p>American Samoa</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AT</strong></p></td>
<td><p>Austria</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AU</strong></p></td>
<td><p>Australia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AW</strong></p></td>
<td><p>Aruba</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-AX</strong></p></td>
<td><p>Åland Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-AZ</strong></p></td>
<td><p>Azerbaijan</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BA</strong></p></td>
<td><p>Bosnia and Herzegovina</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BB</strong></p></td>
<td><p>Barbados</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BD</strong></p></td>
<td><p>Bangladesh</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BE</strong></p></td>
<td><p>Belgium</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BF</strong></p></td>
<td><p>Burkina Faso</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BG</strong></p></td>
<td><p>Bulgaria</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BH</strong></p></td>
<td><p>Bahrain</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BI</strong></p></td>
<td><p>Burundi</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BJ</strong></p></td>
<td><p>Benin</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BL</strong></p></td>
<td><p>Saint Barthélemy</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BM</strong></p></td>
<td><p>Bermuda</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BN</strong></p></td>
<td><p>Brunei</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BO</strong></p></td>
<td><p>Bolivia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BQ</strong></p></td>
<td><p>Bonaire</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BR</strong></p></td>
<td><p>Brazil</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BS</strong></p></td>
<td><p>Bahamas, The</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BT</strong></p></td>
<td><p>Bhutan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BV</strong></p></td>
<td><p>Bouvet Island</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BW</strong></p></td>
<td><p>Botswana</p></td>
</tr>
<tr class="even">
<td><p><strong>000-BY</strong></p></td>
<td><p>Belarus</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-BZ</strong></p></td>
<td><p>Belize</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CA</strong></p></td>
<td><p>Canada</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CC</strong></p></td>
<td><p>Cocos (Keeling) Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CD</strong></p></td>
<td><p>Congo (DRC)</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CF</strong></p></td>
<td><p>Central African Republic</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CG</strong></p></td>
<td><p>Congo</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CH</strong></p></td>
<td><p>Switzerland</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CI</strong></p></td>
<td><p>Côte d'Ivoire</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CK</strong></p></td>
<td><p>Cook Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CL</strong></p></td>
<td><p>Chile</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CM</strong></p></td>
<td><p>Cameroon</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CN</strong></p></td>
<td><p>China</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CO</strong></p></td>
<td><p>Colombia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CR</strong></p></td>
<td><p>Costa Rica</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CV</strong></p></td>
<td><p>Cabo Verde</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CW</strong></p></td>
<td><p>Curaçao</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CX</strong></p></td>
<td><p>Christmas Island</p></td>
</tr>
<tr class="even">
<td><p><strong>000-CY</strong></p></td>
<td><p>Cyprus</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-CZ</strong></p></td>
<td><p>Czech Republic</p></td>
</tr>
<tr class="even">
<td><p><strong>000-DE</strong></p></td>
<td><p>Germany</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-DJ</strong></p></td>
<td><p>Djibouti</p></td>
</tr>
<tr class="even">
<td><p><strong>000-DK</strong></p></td>
<td><p>Denmark</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-DM</strong></p></td>
<td><p>Dominica</p></td>
</tr>
<tr class="even">
<td><p><strong>000-DO</strong></p></td>
<td><p>Dominican Republic</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-DZ</strong></p></td>
<td><p>Algeria</p></td>
</tr>
<tr class="even">
<td><p><strong>000-EC</strong></p></td>
<td><p>Ecuador</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-EE</strong></p></td>
<td><p>Estonia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-EG</strong></p></td>
<td><p>Egypt</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-ER</strong></p></td>
<td><p>Eritrea</p></td>
</tr>
<tr class="even">
<td><p><strong>000-ES</strong></p></td>
<td><p>Spain</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-ET</strong></p></td>
<td><p>Ethiopia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-FI</strong></p></td>
<td><p>Finland</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-FJ</strong></p></td>
<td><p>Fiji</p></td>
</tr>
<tr class="even">
<td><p><strong>000-FK</strong></p></td>
<td><p>Falkland Islands (Islas Malvinas)</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-FM</strong></p></td>
<td><p>Micronesia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-FO</strong></p></td>
<td><p>Faroe Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-FR</strong></p></td>
<td><p>France</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GA</strong></p></td>
<td><p>Gabon</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GB</strong></p></td>
<td><p>United Kingdom</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GD</strong></p></td>
<td><p>Grenada</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GE</strong></p></td>
<td><p>Georgia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GF</strong></p></td>
<td><p>French Guiana</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GG</strong></p></td>
<td><p>Guernsey</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GH</strong></p></td>
<td><p>Ghana</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GI</strong></p></td>
<td><p>Gibraltar</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GL</strong></p></td>
<td><p>Greenland</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GM</strong></p></td>
<td><p>Gambia, The</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GN</strong></p></td>
<td><p>Guinea</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GP</strong></p></td>
<td><p>Guadeloupe</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GQ</strong></p></td>
<td><p>Equatorial Guinea</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GR</strong></p></td>
<td><p>Greece</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GS</strong></p></td>
<td><p>South Georgia and the South Sandwich Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GT</strong></p></td>
<td><p>Guatemala</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GU</strong></p></td>
<td><p>Guam</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-GW</strong></p></td>
<td><p>Guinea-Bissau</p></td>
</tr>
<tr class="even">
<td><p><strong>000-GY</strong></p></td>
<td><p>Guyana</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-HK</strong></p></td>
<td><p>Hong Kong SAR</p></td>
</tr>
<tr class="even">
<td><p><strong>000-HM</strong></p></td>
<td><p>Heard Island and McDonald Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-HN</strong></p></td>
<td><p>Honduras</p></td>
</tr>
<tr class="even">
<td><p><strong>000-HR</strong></p></td>
<td><p>Croatia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-HT</strong></p></td>
<td><p>Haiti</p></td>
</tr>
<tr class="even">
<td><p><strong>000-HU</strong></p></td>
<td><p>Hungary</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-ID</strong></p></td>
<td><p>Indonesia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-IE</strong></p></td>
<td><p>Ireland</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-IL</strong></p></td>
<td><p>Israel</p></td>
</tr>
<tr class="even">
<td><p><strong>000-IM</strong></p></td>
<td><p>Isle of Man</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-IN</strong></p></td>
<td><p>India</p></td>
</tr>
<tr class="even">
<td><p><strong>000-IO</strong></p></td>
<td><p>British Indian Ocean Territory</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-IQ</strong></p></td>
<td><p>Iraq</p></td>
</tr>
<tr class="even">
<td><p><strong>000-IS</strong></p></td>
<td><p>Iceland</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-IT</strong></p></td>
<td><p>Italy</p></td>
</tr>
<tr class="even">
<td><p><strong>000-JE</strong></p></td>
<td><p>Jersey</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-JM</strong></p></td>
<td><p>Jamaica</p></td>
</tr>
<tr class="even">
<td><p><strong>000-JO</strong></p></td>
<td><p>Jordan</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-JP</strong></p></td>
<td><p>Japan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-KE</strong></p></td>
<td><p>Kenya</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-KG</strong></p></td>
<td><p>Kyrgyzstan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-KH</strong></p></td>
<td><p>Cambodia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-KI</strong></p></td>
<td><p>Kiribati</p></td>
</tr>
<tr class="even">
<td><p><strong>000-KM</strong></p></td>
<td><p>Comoros</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-KN</strong></p></td>
<td><p>Saint Kitts and Nevis</p></td>
</tr>
<tr class="even">
<td><p><strong>000-KR</strong></p></td>
<td><p>Korea</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-KW</strong></p></td>
<td><p>Kuwait</p></td>
</tr>
<tr class="even">
<td><p><strong>000-KY</strong></p></td>
<td><p>Cayman Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-KZ</strong></p></td>
<td><p>Kazakhstan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LA</strong></p></td>
<td><p>Laos</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-LB</strong></p></td>
<td><p>Lebanon</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LC</strong></p></td>
<td><p>Saint Lucia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-LI</strong></p></td>
<td><p>Liechtenstein</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LK</strong></p></td>
<td><p>Sri Lanka</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-LR</strong></p></td>
<td><p>Liberia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LS</strong></p></td>
<td><p>Lesotho</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-LT</strong></p></td>
<td><p>Lithuania</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LU</strong></p></td>
<td><p>Luxembourg</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-LV</strong></p></td>
<td><p>Latvia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-LY</strong></p></td>
<td><p>Libya</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MA</strong></p></td>
<td><p>Morocco</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MC</strong></p></td>
<td><p>Monaco</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MD</strong></p></td>
<td><p>Moldova</p></td>
</tr>
<tr class="even">
<td><p><strong>000-ME</strong></p></td>
<td><p>Montenegro</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MF</strong></p></td>
<td><p>Saint Martin</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MG</strong></p></td>
<td><p>Madagascar</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MH</strong></p></td>
<td><p>Marshall Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MK</strong></p></td>
<td><p>Macedonia, FYRO</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-ML</strong></p></td>
<td><p>Mali</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MM</strong></p></td>
<td><p>Myanmar</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MN</strong></p></td>
<td><p>Mongolia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MO</strong></p></td>
<td><p>Macao SAR</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MP</strong></p></td>
<td><p>Northern Mariana Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MQ</strong></p></td>
<td><p>Martinique</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MR</strong></p></td>
<td><p>Mauritania</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MS</strong></p></td>
<td><p>Montserrat</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MT</strong></p></td>
<td><p>Malta</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MU</strong></p></td>
<td><p>Mauritius</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MV</strong></p></td>
<td><p>Maldives</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MW</strong></p></td>
<td><p>Malawi</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MX</strong></p></td>
<td><p>Mexico</p></td>
</tr>
<tr class="even">
<td><p><strong>000-MY</strong></p></td>
<td><p>Malaysia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-MZ</strong></p></td>
<td><p>Mozambique</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NA</strong></p></td>
<td><p>Namibia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NC</strong></p></td>
<td><p>New Caledonia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NE</strong></p></td>
<td><p>Niger</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NF</strong></p></td>
<td><p>Norfolk Island</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NG</strong></p></td>
<td><p>Nigeria</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NI</strong></p></td>
<td><p>Nicaragua</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NL</strong></p></td>
<td><p>Netherlands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NO</strong></p></td>
<td><p>Norway</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NP</strong></p></td>
<td><p>Nepal</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NR</strong></p></td>
<td><p>Nauru</p></td>
</tr>
<tr class="even">
<td><p><strong>000-NU</strong></p></td>
<td><p>Niue</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-NZ</strong></p></td>
<td><p>New Zealand</p></td>
</tr>
<tr class="even">
<td><p><strong>000-OM</strong></p></td>
<td><p>Oman</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PA</strong></p></td>
<td><p>Panama</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PE</strong></p></td>
<td><p>Peru</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PF</strong></p></td>
<td><p>French Polynesia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PG</strong></p></td>
<td><p>Papua New Guinea</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PH</strong></p></td>
<td><p>Philippines</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PK</strong></p></td>
<td><p>Pakistan</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PL</strong></p></td>
<td><p>Poland</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PM</strong></p></td>
<td><p>Saint Pierre and Miquelon</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PN</strong></p></td>
<td><p>Pitcairn Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PR</strong></p></td>
<td><p>Puerto Rico</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PS</strong></p></td>
<td><p>Palestinian Authority</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PT</strong></p></td>
<td><p>Portugal</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-PW</strong></p></td>
<td><p>Palau</p></td>
</tr>
<tr class="even">
<td><p><strong>000-PY</strong></p></td>
<td><p>Paraguay</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-QA</strong></p></td>
<td><p>Qatar</p></td>
</tr>
<tr class="even">
<td><p><strong>000-RE</strong></p></td>
<td><p>Reunion</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-RO</strong></p></td>
<td><p>Romania</p></td>
</tr>
<tr class="even">
<td><p><strong>000-RS</strong></p></td>
<td><p>Serbia</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-RU</strong></p></td>
<td><p>Russia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-RW</strong></p></td>
<td><p>Rwanda</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SA</strong></p></td>
<td><p>Saudi Arabia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SB</strong></p></td>
<td><p>Solomon Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SC</strong></p></td>
<td><p>Seychelles</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SE</strong></p></td>
<td><p>Sweden</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SG</strong></p></td>
<td><p>Singapore</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SH</strong></p></td>
<td><p>Saint Helena, Ascension, and Tristan da Cunha</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SI</strong></p></td>
<td><p>Slovenia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SJ</strong></p></td>
<td><p>Svalbard</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SK</strong></p></td>
<td><p>Slovakia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SL</strong></p></td>
<td><p>Sierra Leone</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SM</strong></p></td>
<td><p>San Marino</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SN</strong></p></td>
<td><p>Senegal</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SO</strong></p></td>
<td><p>Somalia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SR</strong></p></td>
<td><p>Suriname</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SS</strong></p></td>
<td><p>South Sudan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-ST</strong></p></td>
<td><p>São Tomé and Príncipe</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SV</strong></p></td>
<td><p>El Salvador</p></td>
</tr>
<tr class="even">
<td><p><strong>000-SX</strong></p></td>
<td><p>Sint Maarten</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-SZ</strong></p></td>
<td><p>Swaziland</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TC</strong></p></td>
<td><p>Turks and Caicos Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TD</strong></p></td>
<td><p>Chad</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TF</strong></p></td>
<td><p>French Southern and Antarctic Lands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TG</strong></p></td>
<td><p>Togo</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TH</strong></p></td>
<td><p>Thailand</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TJ</strong></p></td>
<td><p>Tajikistan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TK</strong></p></td>
<td><p>Tokelau</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TL</strong></p></td>
<td><p>Timor-Leste</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TM</strong></p></td>
<td><p>Turkmenistan</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TN</strong></p></td>
<td><p>Tunisia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TO</strong></p></td>
<td><p>Tonga</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TR</strong></p></td>
<td><p>Turkey</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TT</strong></p></td>
<td><p>Trinidad and Tobago</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TV</strong></p></td>
<td><p>Tuvalu</p></td>
</tr>
<tr class="even">
<td><p><strong>000-TW</strong></p></td>
<td><p>Taiwan</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-TZ</strong></p></td>
<td><p>Tanzania</p></td>
</tr>
<tr class="even">
<td><p><strong>000-UA</strong></p></td>
<td><p>Ukraine</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-UG</strong></p></td>
<td><p>Uganda</p></td>
</tr>
<tr class="even">
<td><p><strong>000-UM</strong></p></td>
<td><p>US Minor Outlying Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-US</strong></p></td>
<td><p>United States</p></td>
</tr>
<tr class="even">
<td><p><strong>000-UY</strong></p></td>
<td><p>Uruguay</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-UZ</strong></p></td>
<td><p>Uzbekistan</p></td>
</tr>
<tr class="even">
<td><p><strong>000-VA</strong></p></td>
<td><p>Holy See (Vatican City)</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-VC</strong></p></td>
<td><p>Saint Vincent and the Grenadines</p></td>
</tr>
<tr class="even">
<td><p><strong>000-VE</strong></p></td>
<td><p>Venezuela</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-VG</strong></p></td>
<td><p>British Virgin Islands</p></td>
</tr>
<tr class="even">
<td><p><strong>000-VI</strong></p></td>
<td><p>US Virgin Islands</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-VN</strong></p></td>
<td><p>Vietnam</p></td>
</tr>
<tr class="even">
<td><p><strong>000-VU</strong></p></td>
<td><p>Vanuatu</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-WF</strong></p></td>
<td><p>Wallis and Futuna</p></td>
</tr>
<tr class="even">
<td><p><strong>000-WS</strong></p></td>
<td><p>Samoa</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-XE</strong></p></td>
<td><p>Sint Eustatius</p></td>
</tr>
<tr class="even">
<td><p><strong>000-XJ</strong></p></td>
<td><p>Jan Mayen</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-XS</strong></p></td>
<td><p>Saba</p></td>
</tr>
<tr class="even">
<td><p><strong>000-YE</strong></p></td>
<td><p>Yemen</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-YT</strong></p></td>
<td><p>Mayotte</p></td>
</tr>
<tr class="even">
<td><p><strong>000-ZA</strong></p></td>
<td><p>South Africa</p></td>
</tr>
<tr class="odd">
<td><p><strong>000-ZM</strong></p></td>
<td><p>Zambia</p></td>
</tr>
<tr class="even">
<td><p><strong>000-ZW</strong></p></td>
<td><p>Zimbabwe</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Registry%20values%20for%20carrier-unlocked%20phones%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




