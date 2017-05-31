---
author: kpacquer
Description: Microsoft Manufacturing OS
ms.assetid: 8a46f749-6405-40e8-b3a5-32955e1c0070
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Microsoft Manufacturing OS
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft Manufacturing OS


Microsoft Manufacturing OS (MMOS), an optimized configuration of the operating system, facilitates efficient manufacturing. MMOS is intended to provide the following capabilities:

-   Fast boot time resulting from a smaller image that contains only the code necessary to support manufacturing test execution. The smaller OS image can be flashed quickly, accelerating the manufacturing process.

-   The ability to create an OEM-customized MMOS image that includes unique drivers and test applications.

-   Support for OEM-developed component-level testing, in addition to full-function quality and calibration testing.

-   Access to low-level native APIs for direct testing of phone hardware components.

-   The ability to create a mechanism to remotely control the test application and retrieve test logs over a USB communication channel.

-   No dependency on display or touch hardware, to allow for headless operation.

-   The ability to directly boot into MMOS in a manufacturing environment.

-   Automated launch of OEM test applications when MMOS is booted.

-   The ability to write to the DPP partition to store unique, per-phone data.

-   Battery charging is supported in both UEFI and MMOS. It is set using a feature setting, so partners can turn it on and off as desired. For more info, see [MMOS image definition](mmos-image-definition.md).

## <span id="Working_with_MMOS"></span><span id="working_with_mmos"></span><span id="WORKING_WITH_MMOS"></span>Working with MMOS


This section describes how to build and flash an MMOS image.

To work with MMOS, complete the following tasks:

1.  Create your test application or other manufacturing tools as packages. For more info, see [Creating packages](https://msdn.microsoft.com/library/dn756642).

2.  Create a flashing protocol and add packages to support that functionality to MMOS. For more info, see [Flashing tools](flashing-tools.md).

3.  Create the MMOS image. For more info, see [MMOS image definition](mmos-image-definition.md).

4.  Flash the MMOS image to the device. For more info, see [Flash MMOS to the device](flash-mmos-to-the-phone.md).

5.  Deploy manufacturing applications. For more info, see [Deploy and test a user-mode test application in MMOS](deploy-and-test-a-user-mode-test-application-in-mmos.md).

6.  Evaluate if you want to create a WIM to be able to run MMOS in RAM. For more info, see [Working with WIM MMOS images](working-with-wim-mmos-images.md).

## <span id="Developing_user_mode_test_applications"></span><span id="developing_user_mode_test_applications"></span><span id="DEVELOPING_USER_MODE_TEST_APPLICATIONS"></span>Developing user mode test applications


To create a user mode test applications to test the device in manufacturing, complete the following tasks:

1.  Develop the user mode test application using the MMOS library. For more info, see [Manufacturing test environment supported APIs](manufacturing-test-environment-supported-apis.md) and [Develop MMOS test applications](develop-mmos-test-applications.md).

2.  A service can be used to start a user mode test application. If desired, the test application can communicate with a test controller on a PC to control the testing process and to log results.

    To configure the service to start automatically when the OS boots, set the **Start** attribute to "Auto" in the service package configuration file.  

    ``` syntax
      <Components>
        <Service
          Name="SampleMMOSSvc"
          Start="Auto"
          …
    ```

    This capability is only available in MMOS.

3.  Some apps should only be allowed to run in MMOS. You can use an API to determine if MMOS is running or not. For more info, see [Determine if MMOS is running](determine-if-mmos-is-running.md).

4.  To cause the device to enter the connected standby power state, call the SetScreenOff function. For more info, see [Calling SetScreenOff to enter connected standby](calling-setscreenoff-to-enter-connected-standby.md).

## <span id="related_topics"></span>Related topics


[Develop MMOS test applications](develop-mmos-test-applications.md)

 

 






