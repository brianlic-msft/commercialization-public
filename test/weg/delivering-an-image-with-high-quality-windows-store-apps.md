---
title: Delivering an image with high quality Windows Store apps
description: Measuring quality in Windows Store apps that are deployed with a Windows image
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Delivering an image with high quality Windows Store apps

For more information about deploying Windows Store apps in your Windows images, see the Windows Engineering Guide for Apps and Store. After the apps are deployed, you can measure the activation and resume times of every app that is preloaded on the image.

## Recommended goals

The following table shows the minimum targets for app activation, based on our user research.

| Scenario/workload                            | Target |
|----------------------------------------------|----------------------------|
| App activation time (launch from cold state) | Between 1 and 3 seconds |
| App resume time                              | Between 500 ms and 1 second |


## Validation and testing

You can use the Windows Assessment Toolkit to improve the performance of your apps beyond the minimum requirements. To measure the app resume times, use the default recommended settings in the Windows Store apps performance assessment. To measure the app activation (launch from cold state) times, select the *Restart each Windows Store app* option in the assessment parameters.

## Tools and technical reference

| Resource title and link        | Content type | Description                       | 
|-------------------------------|--------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Windows Store App Performance](https://msdn.microsoft.com/en-us/library/windows/hardware/dn246955.aspx) | Article      | Official Assessment Documentation | 


