---
title: Pen Validation Overview
description: This topic presents a brief overview of the assumed device test conditions for pen validation, and outlines critical pre-test requirements.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C6E6B1DC-F3EC-4D63-9FF2-AB80F332BB6B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Pen Validation Overview


This topic presents a brief overview of the assumed device test conditions for pen validation, and outlines critical pre-test requirements.

In order to ensure that all Windows Hardware Lab Kit (HLK) tests run successfully, it is important to follow the guidelines in this document as closely as possible.

## Device Test conditions


This Pen Validation Guide makes the following assumptions about the testing conditions of the device:

-   HLK tests are being run on a device with Windows 10 installed.
    
    Only the Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) are supported by the HLK tests at this time. See the [Appendix: Frequently Asked Questions](appendix.md) section for additional information.
-   Device under test has a diagonal screen size of 4.5” - 30.”
    
    See the [Appendix: Frequently Asked Questions](appendix.md) section for additional information.
-   Device reports HID usages as described in the [Pen Implementation Guide](pen-implementation-guide.md).

-   Testing setup has all the required equipment detailed in [Hardware Requirements and Vendor Information](hardware-requirements-and-vendor-information.md).

-   For each HLK test, the user follows the [General Testing Guidelines](general-testing-guidelines.md), as well as the notes and instructions that are specific to the test - as outlined in [Active Pen Tests](active-pen-tests.md).

If your device or testing setup does not meet the above criteria, you will not be able to run and pass the Windows 10 HLK tests.

## Critical Pre-Testing Requirement


**Note**  Failure to follow these steps will cause tests to crash on launch, or fail to receive input.

 

These steps must be performed on the device under test before running the pen HLK tests.

-   Put the device into Developer Mode:
    
    To put your device into Developer Mode, navigate to the **Settings** &gt; **Update & security** dialog window. Then select **For developers** in the left-hand pane, and click **Developer Mode** in the right-hand window.
-   Enable test signing:
    
    To enable test signing, open an Administrator Command Prompt and Enter the command "**bcdedit /set testsigning on**", then restart the system.

The remaining topics in the Pen Validation Guide, provide more detailed information about the setup and other procedures for performing the pen-related tests in the HLK.
