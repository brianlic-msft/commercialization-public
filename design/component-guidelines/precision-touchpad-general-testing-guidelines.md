---
title: General Testing Guidelines
description: This topic provides general guidelines for testing a Windows Precision Touchpad device, using the Windows Hardware Lab Kit (HLK) for Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F6AA763C-48EC-4FC9-8528-8E112D4CF3A6
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# General Testing Guidelines


This topic provides general guidelines for testing a Windows Precision Touchpad device, using the Windows Hardware Lab Kit (HLK) for Windows 10.

## Testing Guidelines


-   Unless otherwise specified, the device should always have AC power when performing HLK tests.

-   Unless otherwise specified, all tests should be run with "Test Signing Mode" set to ON. To do this, perform the following steps:

    1. Open a **Command Prompt** window as an Administrator.

    2. Enter this command: **bcdedit -set testsigning on**

    3. Restart the computer.

-   Unless otherwise specified, use 7mm diameter contacts for tests requiring use of the PT3 ([Precision Touch Testing Tool](touchscreen-hardware-requirements-and-vendor-information.md)).

-   Unless otherwise specified, all numbers in error messages which report distance or location are in himetric units (0.01mm).

-   The grids in the PTLogo visualization help align vertices (for tests like [Linearity](linearity.md)) and graph distances. The distance from one line to the next 200 himetric units (in other words, is 2mm).

-   Unless otherwise specified, multiple contacts should maintain a minimum separation distance: For all alignments, contacts should be at least 8mm apart, edge to edge during test.

-   Regarding the GetThqaBlob test, note the following:

    o Path to *GetThqaBlob.exe*: C:\\Program Files (x86)\\Windows Kits\\10\\Hardware Lab Kit\\Tests\\x86\\digitizer\\Win8Touch.

    o File location management: All necessary files are copied to test machines when the HLK client is installed.

-   Due to the nature of customization drivers, it is likely that they will cause test failures for devices during compatibility tests. The HLK tests are intended to test hardware capabilities, and the filter driver may interrupt the expected data flow to the tests.

    If you want to ship your devices with customization, then you should include the customization components during testing. But you must make sure that these custom behaviors can be disabled during testing, if they would otherwise block the device from passing certification.

## PTLogo Interface


-   To manually pass an iteration (where applicable), press “P” on the keyboard.

-   To manually fail an iteration (where applicable), press “F” on the keyboard.

-   To manually restart the test (where applicable), press “R” on the keyboard.

-   To manually fail the test (where applicable), press “T” on the keyboard.

-   To manually advance to the next iteration (where applicable), press “N” on the keyboard.

-   To exit PTLogo, press “E” on the keyboard.

 

 






