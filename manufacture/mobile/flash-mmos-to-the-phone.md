---
author: kpacquer
Description: Flash MMOS to the device
ms.assetid: 23b741e6-ba15-4a81-a78e-9545ff62c3af
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Flash MMOS to the device
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Flash MMOS to the device


After the MMOS image definition is complete, the image can be flashed to the device

1.  Flashing on the host side is accomplished through a connection established with WinUSB, the Microsoft generic USB device driver. The necessary drivers are included by default in Windows 8 and Windows 10. In Windows 7, the necessary drivers can be installed from Windows Update. To configure a Windows 7 computer to install the necessary drivers, click **Start**, type “Device Installation Settings”, select **Yes, do this automatically (recommended)**, and then click **Save Changes**.

2.  Put the device in flashing mode by holding the volume up button while powering up the device. After the device is in flashing mode, connect the USB cable to your computer.

3.  Verify that the device is detected in Device Manager as *WinUsb Device*.

4.  To be able to use the ffutool, sign, and ImageSigner tools, add %WPDKCONTENTROOT%\\Tools\\bin\\i386 to your environment **Path** variable.

5.  Prior to flashing the FFU file to the device, you must sign the FFU file using the following syntax in the command prompt. The cat file is generated with the FFU, when using the ImgGen tool.

    ``` syntax
    c:\>sign <path to cat file>
    c:\>ImageSigner SIGN <path to ffu> <path to cat file>
    ```

    For example:

    ``` syntax
    c:\>sign MMOS.cat
    c:\>ImageSigner SIGN MMOS.ffu MMOS.cat
    ```

6.  At a command prompt, run the ffutool command, which uses the following syntax:

    ``` syntax
    c:\>ffutool -flash <path to ffu image file>
    ```

    For example:

    ``` syntax
    c:\>ffutool -flash C:\MMOS\MMOS.ffu
    ```

7.  You should see output similar to the following.

    ``` syntax
    Logging to ETL file: C:\Users\Nancy\AppData\Local\Temp\ffutool8276.etl 
    Found device: 
    Name: Contoso.DCD6000 Phone.DCD6000 
    ID: 00000045-14ca-3016-8fbe-120000000000 
    Flashing: MMOS.ffu 
    [==================================================] 100.00% 
    Transferred 157.88 MB in 50.56 seconds, overall rate 3.12 MB/s.
    ```

8.  The device will reboot into MMOS. The display on the device will show a small rotating graphic.

 

 





