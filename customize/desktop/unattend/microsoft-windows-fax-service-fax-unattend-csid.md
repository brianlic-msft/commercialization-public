---
title: Csid
description: Csid
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6bdaf4db-f9b8-4565-90d0-831200508b1a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Csid


`Csid` specifies the called subscriber ID (CSID) transmitted to the sending fax machine when receiving incoming faxes.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Csid</em></p></td>
<td><p>Specifies the CSID transmitted to the sending fax machine when receiving incoming faxes. <em>Csid</em> is a string with a maximum length of 19 characters. The default value is <strong>Fax</strong>.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Fax-Service](microsoft-windows-fax-service.md) | [FaxUnattend](microsoft-windows-fax-service-fax-unattend.md) | **Csid**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Fax-Service](microsoft-windows-fax-service.md).

## XML Example


The following XML output shows how to set fax settings.

``` syntax
<Fax>
   <ArchiveFaxes>false</ArchiveFaxes>
   <IncomingFaxesArePublic>false</IncomingFaxesArePublic>
   <ArchiveFolderName>C:\MyFaxArchives</ArchiveFolderName>
</Fax>
<FaxUnattend>
   <FaxPrinterIsShared>true</FaxPrinterIsShared>
   <ReceiveFaxes>false</ReceiveFaxes>
   <Rings>6</Rings>
   <RouteToFolder>true</RouteToFolder>
   <RouteToPrinter>true</RouteToPrinter>
   <SendFaxes>true</SendFaxes>
   <Csid>Fax1</Csid>
   <Tsid>Fax1</Tsid>
   <RouteFolderName>C:\Router</RouteFolderName>
   <RoutePrinterName>C:\Printer</RoutePrinterName>
</FaxUnattend>
<Receipts>
   <FaxUserName>MyUserName</FaxUserName>
   <FaxUserPassword>MyPassword</FaxUserPassword>
   <SmtpNotificationsEnabled>true</SmtpNotificationsEnabled>
   <SmtpSenderAddress>MyUserName@fabrikam.com</SmtpSenderAddress>
   <SmtpServerAddress>207.46.197.32</SmtpServerAddress>
   <SmtpServerAuthenticationMechanism>1</SmtpServerAuthenticationMechanism>
   <SmtpServerPort>26</SmtpServerPort>
</Receipts>
```

## Related topics


[FaxUnattend](microsoft-windows-fax-service-fax-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Csid%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





