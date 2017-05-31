---
title: sysconfig
description: sysconfig
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bd020833-a2fe-4619-8d9d-d049fd4e543c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# sysconfig


This action produces a text file that has detailed information about the system on which the trace was taken.

``` syntax
-a sysconfig [-xml] [-netidentity] [-cpu] [-memory] [-build] [-etw] [-power] [-disk] [-idechannel] [-video] [-nic] [-irq] [-services] [-pnp]
```

## Options


<a href="" id="-xml"></a>**-xml**  
Output is in XML format.

<a href="" id="-netidentity"></a>**-netidentity**  
Displays network identity information.

<a href="" id="-cpu"></a>**-cpu**  
Displays CPU configuration.

<a href="" id="-memory"></a>**-memory**  
Displays memory configuration.

<a href="" id="-build"></a>**-build**  
Displays build information.

<a href="" id="-etw"></a>**-etw**  
Displays ETW version information.

<a href="" id="-power"></a>**-power**  
Displays power state support information.

<a href="" id="-disk"></a>**-disk**  
Displays disk configuration.

<a href="" id="-idechannel"></a>**-idechannel**  
Displays Integrated Drive Electronics (IDE) channel configuration.

<a href="" id="-video"></a>**-video**  
Displays video configuration.

<a href="" id="-nic"></a>**-nic**  
Displays network interface controller configuration.

<a href="" id="-irq"></a>**-irq**  
Displays interrupt request (IRQ) configuration.

<a href="" id="-services"></a>**-services**  
Displays services information.

<a href="" id="-pnp"></a>**-pnp**  
Displays Plug and Play configuration.

## Remarks


If no activity is selected, all activities are selected by default.

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







