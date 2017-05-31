---
title: Field Medic
description: Field Medic
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9f55f2a3-582d-48a1-9cd3-a259bd05cd00
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Field Medic


Field Medic is an app that you can use to gather Event Tracing for Windows (ETW) log files for selected information categories. You can also use Field Medic to gather general information about the phone. Field Medic saves the ETW log files and the general information in a folder that is accessible using the USB Media Transfer Protocol (MTP).

**Note**  MTP is enabled on all retail devices by default. It allows for the easy extraction of output files such as Field Medic reports without requiring TShell or other test tools to be enabled. However, you must disable kernel debugging interfaces over USB (KDNET, KDUSB) for MTP to work correctly.

 

## Installing Field Medic


There are two ways to install the Field Medic app.

1.  Download it from the Store using the following link from your device: [Field Medic app download](http://www.windowsphone.com/store/app/field-medic/73c58570-d5a7-46f8-b1b2-2a90024fc29c).

2.  Preload the app. The app is included with the MobileOS packages (in the FieldMedic folder) with a license and provisioning XML for partners who want to preload the app.

 

 






