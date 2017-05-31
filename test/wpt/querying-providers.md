---
title: Querying Providers
description: Querying Providers
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: abe58e3b-4050-4d42-ad71-a0c702492f8d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Querying Providers


Displays trace and providers query options.

``` syntax
xperf {-providers [options] | -loggers | -boottrace | -profint | -profiles | -profileswithdetails | -profilesessions | -profileproviders | -profileloggers}
```

## Parameters


<a href="" id="-providers-options----"></a>**-providers***\[options...\]*  
Query all installed/known and registered providers, as well as all known kernel flags and groups. For details, see [providers](providers-wpa.md).

<a href="" id="-loggers"></a>**-loggers**  
Query all active logging sessions.

<a href="" id="-boottrace"></a>**-boottrace**  
Query the boot trace configuration.

<a href="" id="-profint"></a>**-profint**  
Query the current profile interval.

<a href="" id="-profiles-profilefilename---profilename-"></a>**-profiles***{ProfileFileName | ProfileName}*  
Query the profile names defined in *ProfileFileName* or *ProfileName*. If no parameters are specified, query the names of the built-in profiles.

<a href="" id="-profileswithdetails-profilefilename---profilename-"></a>**-profileswithdetails***{ProfileFileName | ProfileName}*  
Query the profile names defined in *ProfileFileName* or detailed properties in *ProfileName*. If no parameters are specified, query the names of the built-in profiles.

<a href="" id="-profilesessions-profilefilename---sessionname-"></a>**-profilesessions***{ProfileFileName | SessionName}*  
Query the profile session names defined in *ProfileFileName* or *SessionName*. If no parameters are specified, query the names of the built-in profile sessions.

<a href="" id="-profileproviders-profilefilename---providername-"></a>**-profileproviders***{ProfileFileName | ProviderName}*  
Query the profile provider names defined in *ProfileFileName* or *ProviderName*. If no parameters are specified, query the names of the built-in profile providers.

<a href="" id="-profileloggersprofilename"></a>**-profileloggers***ProfileName*  
Query logging sessions specified in *ProfileName*.

## Related topics


[Xperf Options](xperf-options.md)

 

 







