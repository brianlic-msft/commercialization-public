---
title: ComputerName
description: ComputerName specifies the computer name used to access the computer from the network.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e573ccd8-b234-42d9-bdb9-66d651238fc5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ComputerName


`ComputerName` specifies the computer name used to access the computer from the network.

**Note**  
In Windows 10, users can no longer enter a computer name during OOBE as the name is auto-generated. To set a default computer name pre-OOBE, OEMs can configure `ComputerName` in the Unattend.xml file and specify a name for the computer. After OOBE, end users can change this default computer name after OOBE by changing it in the **System Properties** page.

 

## Values


If `ComputerName` is set to an asterisk (\*) or is an empty string, a random computer name will be generated. This random name has at most eight characters from the [RegisteredOwner](microsoft-windows-shell-setup-registeredowner.md) and/or [RegisteredOrganization](microsoft-windows-shell-setup-registeredorganization.md) strings plus random characters.

`ComputerName` is a string with a maximum length of 15 bytes of content:

-   `ComputerName` can use ASCII characters (1 byte each) and/or multi-byte characters such as Kanji, so long as you do not exceed 15 bytes of content.

-   `ComputerName` cannot use spaces or any of the following characters: { | } ~ \[ \\ \] ^ ' : ; &lt; = &gt; ? @ ! " \# $ % \` ( ) + / . , \* &, or contain any spaces.

-   `ComputerName` cannot use some non-standard characters, such as emoji.

Computer names that cannot be validated through the DnsValidateName function cannot be used, for example, computer names that only contain numbers (0-9). For more information, see the [DnsValidateName function](http://go.microsoft.com/fwlink/?LinkId=257040).

## Valid Configuration Passes


offlineServicing

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **ComputerName**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set the computer name.

``` syntax
<ComputerName>MyComputer</ComputerName>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ComputerName%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





