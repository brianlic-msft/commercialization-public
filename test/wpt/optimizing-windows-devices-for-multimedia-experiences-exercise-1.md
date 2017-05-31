---
title: Exercise 1 - Assess the Device's Audio Latency Performance for Communications Scenarios
description: In this exercise, we’ll run the following matrix of audio latency tests that generate latency stats for various latency modes supported in Windows.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2264F1B3-27BC-4140-9A90-0532604298BC
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Exercise 1 - Assess the Device's Audio Latency Performance for Communications Scenarios


In this exercise, we’ll run the following matrix of audio latency tests that generate latency stats for various latency modes supported in Windows. The modes that the test can be run in include:

-   Default mode – Generates default out-of-box audio latency.

-   Raw mode – Removes Audio Processing Objects (APOs).

-   Low Period – New low latency mode for near real-time scenarios such as Skype.

The test renders test sounds that are captured by the microphone.

**Note**  This step-by-step guide is also available to view as a lab video on Channel 9, which features videos for developers from the people building Microsoft Products and Services: <https://channel9.msdn.com/Events/WinHEC/2015/OWDHOL301>

 

## Step 1: Prepare the system to run the tests


1.  Install the Hardware Lab Kit (HLK) controller.

2.  Right-click on the **Start** menu and click on **Command Prompt (Admin)**.

3.  Navigate to the **\\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\TE** folder.

4.  Copy the following tests and tools from the Hardware Lab Kit (HLK) controller to your test machine in: C:\\Performance\\Media
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\nttest\\multimediatest\\wmmftest\\glitchfreetaeftests.dll
    -   \\\\&lt;controller-name&gt;\\TaefBinaries\\&lt;processor architecture&gt;\\\*
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\Performance\\WindowsXRay\\tools\\EtwPattern.dll
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\test\\MediaEngineTest.exe
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\audio-test\\bin\\audiospew.exe
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\audio-test\\bin\\audiostreaming.dll
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\nttest\\multimediatest\\wmmftest\\rws.exe
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\nttest\\multimediatest\\wmmftest\\audio-fidelity-stress.xml
    -   \\\\&lt;controller-name&gt;\\Tests\\&lt;processor architecture&gt;\\audio-test\\bin\\LatencyTest.dll

5.  Set the volume level on the speakers to 100%.

## Step 2: Run the test in default mode


1.  Run the following command:

    ``` syntax
    te.exe latencytest.dll /name:LatencyTest::Vanilla
    ```

2.  View the **Average**, **Max**, and **Min** delay values that are sent to the command prompt window.

## Step 3: Run the test in raw mode


1.  Run the following command:

    ``` syntax
    te.exe latencytest.dll /name:LatencyTest::Raw
    ```

2.  View the **Average**, **Max**, and **Min** delay values that are sent to the command prompt window.

## Step 4: Run the test in low latency mode


1.  Run the following command:

    ``` syntax
    te.exe latencytest.dll /name:LatencyTest::LowPeriod
    ```

2.  View the **Average**, **Max**, and **Min** delay values that are sent to the command prompt window.

 

 






