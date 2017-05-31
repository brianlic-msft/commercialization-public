---
title: DefaultReturnCodeAction
description: Specifies what action to take based on the return code.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 47111F61-7258-4046-9D48-1B6D153EAF6F
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DefaultReturnCodeAction


Specifies what action to take based on the return code.

## Values


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
<td><p>0</p></td>
<td><p>Restart the shell.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Restart the device.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Shut down the device.</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Do nothing.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Embedded-ShellLauncher](microsoft-windows-embedded-shelllauncher.md) | [UserSettings](microsoft-windows-embedded-shelllauncher-usersettings.md) | [User](microsoft-windows-embedded-shelllauncher-usersettings-user.md) | **DefaultCodeReturnCodeAction**

## Valid Configuration Passes


oobeSystem

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Embedded-ShellLauncher](microsoft-windows-embedded-shelllauncher.md).

## XML example


``` syntax
<settings pass="oobeSystem">
    <component name="Microsoft-Windows-Embedded-ShellLauncher" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="NonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <UserSettings>
            <User wcm:action="add">
                <AccountName>Tester1</AccountName>
                <DefaultReturnCodeAction>0</DefaultReturnCodeAction>
                <Domain>TestDomain</Domain>
                <Key>1</Key>
                <Shell>cmd.exe</Shell>
            </User>
    </component>
</settings>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DefaultReturnCodeAction%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




