---
title: Find the Application User Model ID of an installed app
description: In order to use assigned access with Mobile Device Management (MDM), you must know the Application User Model ID (AUMID) of Windows Store apps installed on a device. You can find the AUMID by either using Windows PowerShell or querying the registry.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: BD8BD003-887D-4EFD-9C7A-A68AB895D8CD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Find the Application User Model ID of an installed app


In order to use assigned access with Mobile Device Management (MDM), you must know the Application User Model ID (AUMID) of Windows Store apps installed on a device. You can find the AUMID by either using Windows PowerShell or querying the registry.

## To identify the AUMID of an installed app by using Windows PowerShell


At a Windows PowerShell command prompt, type the following commands to list the AUMIDs for all Windows Store apps installed for the current user on your device:

```
$installedapps = get-AppxPackage

$aumidList = @()
foreach ($app in $installedapps)
{
    foreach ($id in (Get-AppxPackageManifest $app).package.applications.application.id)
    {
        $aumidList += $app.packagefamilyname + "!" + $id
    }
}

$aumidList
```

You can add the –user &lt;username&gt; or the –allusers parameters to the get-AppxPackage cmdlet to list AUMIDs for other users. You must use an elevated Windows PowerShell prompt to use the –user or –allusers parameters.

## To identify the AUMID of an installed app for the current user by using the registry


Querying the registry can only return information about Windows Store apps that are installed for the current user, while the Windows PowerShell query can find information for any account on the device.

At a command prompt, type the following command:

```
reg query HKEY_CURRENT_USER\Software\Classes\ActivatableClasses\Package /s /f AppUserModelID | find "REG_SZ"
```

## Example


The following code sample creates a function in Windows PowerShell that returns an array of AUMIDs of the installed apps for the specified user.

```
function listAumids( $userAccount ) {

    if ($userAccount -eq "allusers")
    {
        # Find installed packages for all accounts. Must be run as an administrator in order to use this option.
        $installedapps = Get-AppxPackage -allusers
    }
    elseif ($userAccount)
    {
        # Find installed packages for the specified account. Must be run as an administrator in order to use this option.
        $installedapps = get-AppxPackage -user $userAccount
    }
    else
    {
        # Find installed packages for the current account.
        $installedapps = get-AppxPackage
    }

    $aumidList = @()
    foreach ($app in $installedapps)
    {
        foreach ($id in (Get-AppxPackageManifest $app).package.applications.application.id)
        {
            $aumidList += $app.packagefamilyname + "!" + $id
        }
    }

    return $aumidList
} 

```

The following Windows PowerShell commands demonstrate how you can call the listAumids function after you have created it.

```
# Get a list of AUMIDs for the current account:
listAumids

# Get a list of AUMIDs for an account named “CustomerAccount”:
listAumids(“CustomerAccount”)

# Get a list of AUMIDs for all accounts on the device:
listAumids(“allusers”)
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Find%20the%20Application%20User%20Model%20ID%20of%20an%20installed%20app%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




