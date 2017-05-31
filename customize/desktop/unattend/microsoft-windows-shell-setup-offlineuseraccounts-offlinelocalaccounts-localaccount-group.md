---
title: Group
description: Group specifies the name of an existing local security group to which a new LocalAccount will be added during installation. You can add a user to multiple groups by entering multiple group names separated by semicolons.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2EE76045-2A73-4105-B90A-C73A9CF598FF
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Group


`Group` specifies the name of an existing local security group to which a new [LocalAccount](microsoft-windows-shell-setup-offlineuseraccounts-offlinelocalaccounts-localaccount.md) will be added during installation. You can add a user to multiple groups by entering multiple group names separated by semicolons.

The [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) component recognizes the following English group names and sets the appropriate localized group name, regardless of the default language of the Windows image:

-   AccountOperators

-   Administrators

-   BackupOperators

-   Guests

-   PowerUsers

-   PrintOperators

-   Replicator

-   SystemOperators

-   Users

Specify the account names and group names by using language-neutral names. The language-neutral account and group names are specified in English—for example, **Administrators**, **Power Users**, and **Guest**. This is required because the shell account settings are processed before a default user interface (UI) language is applied to the computer.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Group_name</em></p></td>
<td><p>Specifies the existing local security group for the local account. More than one group can be specified (separated by semicolons). <em>Group_name</em> is a string with a maximum length of 256 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)| [OfflineUserAccounts](microsoft-windows-shell-setup-offlineuseraccounts.md) | [OfflineLocalAccounts](microsoft-windows-shell-setup-offlineuseraccounts-offlinelocalaccounts.md) | [LocalAccount](microsoft-windows-shell-setup-offlineuseraccounts-offlinelocalaccounts-localaccount.md) | **Group**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

Windows Server 2016

For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Group%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




