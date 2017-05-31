---
title: services
description: services
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 139a09db-6c62-449a-9369-2219cc99e823
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# services


This action produces a text file that summarizes metrics related to services.

``` syntax
-a services [-range T1 T2] [-poiThreshold_ContainerInit <t>] [-poiThreshold_ImageLoad <t>] [-poiThreshold_ServiceInit <t>]
```

## Parameters


<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows data between times *T1* and *T2*, both in microseconds.

<a href="" id="-poithreshold-containerinit-t-"></a>**-poiThreshold\_ContainerInit***&lt;t&gt;*  
Flags any container initialization time greater than *t*, in microseconds, as a point of interest.

<a href="" id="-poithreshold-imageload-t-"></a>**-poiThreshold\_ImageLoad***&lt;t&gt;*  
Flags any image load time greater than *t*, in microseconds, as a point of interest.

<a href="" id="-poithreshold-serviceinit-t-"></a>**-poiThreshold\_ServiceInit***&lt;t&gt;*  
Flags any service initialization time greater than *t*, in microseconds, as a point of interest.

## Remarks


The default is to not flag any services as points of interest. All times are displayed in milliseconds.

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







