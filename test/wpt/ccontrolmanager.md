---
title: CControlManager
description: CControlManager
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1952f739-e610-4bc3-938f-8ffad3875aec
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CControlManager


Represents the control manager that runs a profile collection. The class implements the [IControlManager](icontrolmanager.md), [IOnOffTransitionManager](ionofftransitionmanager.md), [IControlErrorInfo](icontrolerrorinfo.md), and [IEnumControlWarningInfo](ienumcontrolwarninginfo.md) interfaces. To run profiles, the client instantiates an instance of the class. The library maintains only a single, static instance of the manager. If the client tries to instantiate multiple times, the library returns the original instance and increments its reference count.

## Syntax


``` syntax
{
  [default] interface IControlManager;
  interface IOnOffTransitionManager;
  interface IControlErrorInfo;
  interface IEnumControlWarningInfo;
};
```

## Related topics


[Classes](classes.md)

 

 







