---
title: CTraceMergeProperties
description: CTraceMergeProperties
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d7991df7-574a-4b48-9e2c-a76bb5da1cd3
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CTraceMergeProperties


Represents policies that are applied when the library merges the event trace log (ETL) files for Event Tracing for Windows (ETW) sessions that were previously started using the profiles. It implements the [ITraceMergeProperties](itracemergeproperties.md) and the [IParsingErrorInfo](iparsingerrorinfo.md) interfaces. The client instantiates a new instance for every merge properties that it needs to apply for merging the ETL files. When the client loads the XML merge properties, the instance validates against the schema. If the validation fails, the instance stores the error information and returns an error code. In case of an error, the client obtains an interface pointer to **IParsingErrorInfo** and retrieves the error information.

## Syntax


``` syntax
{
  [default] interface ITraceMergeProperties;
  interface IParsingErrorInfo;
};
```

## Related topics


[Classes](classes.md)

 

 







