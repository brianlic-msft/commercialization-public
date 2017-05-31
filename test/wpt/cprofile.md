---
title: CProfile
description: CProfile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 046b4559-0408-4766-8bb5-d50a695138b9
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CProfile


Represents a **Profile** object and contains data to configure Event Tracing for Windows (ETW) sessions and providers. This class implements the [IProfile](iprofile.md) and [IParsingErrorInfo](iparsingerrorinfo.md) interfaces. The client instantiates a new instance for every profile that it needs to run. When the client loads the profile, the instance validates against the schema. If the validation fails, the instance stores the error information and returns an error code. In case of an error, the client receives an interface pointer to **IParsingErrorInfo** and retrieves the error information.

## Syntax


``` syntax
{
  [default] interface IProfile;
  interface IParsingErrorInfo;
};
```

## Related topics


[Classes](classes.md)

 

 







