---
author: kpacquer
ms.assetid: a6243b16-54fd-4a3d-8901-4b15cebdaf40
MSHAttr: 'PreferredLib:/library'
title: Get the tools needed to customize Windows IoT Core
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get the tools needed to customize Windows IoT Core


Here's the software you'll need to create OEM images using the Windows 10 IoT Core (IoT Core) ADK Add-Ons:

## <span id="PCs_and_devices"></span><span id="pcs_and_devices"></span><span id="PCS_AND_DEVICES"></span>PCs and devices


Here's how we'll refer to them:

-   **Technician PC**: Your work PC. This PC should have at least 15GB of free space for installing the software and for modifying IoT Core images.

    We recommend either Windows 10 or Windows 8.1 with the latest updates. The minimum requirement is Windows 7 SP1, though this may require additional tools or workarounds for tasks such as mounting .ISO images.

-   **IoT device**: A test device or board that represents all of the devices in a single model line.

    For our examples, you'll need a Raspberry Pi 3. To see more options, see [Device options](https://developer.microsoft.com/windows/iot/explore/deviceoptions).

-   An **HDMI cable**, and a **monitor or TV** with a dedicated HDMI input. We'll use this to verify that the image is loaded and that our sample apps are running.

## <span id="Storage"></span><span id="storage"></span><span id="STORAGE"></span>Storage


-   A **Micro SD card**. (Note, we just use this for our guide. You can build devices with other drives. Learn more about existing [supported storage](https://developer.microsoft.com/windows/iot/docs/hardwarecompatlist#Storage) options.)

    If your technician PC doesn't include a Micro SD slot, you may also need an adapter.

## <span id="Software"></span><span id="software"></span><span id="SOFTWARE"></span>Software

**Install the following tools on your technician PC**

1.  [Windows Assessment and Deployment Kit (Windows ADK)](http://go.microsoft.com/fwlink/?LinkId=526803) including at least the **Deployment Tools** and **Imaging and Configuration Designer (ICD)** features. You'll use these tools to create images and provisioning packages.

2.  [Windows Driver Kit (WDK) 10](http://developer.microsoft.com/windows/hardware/windows-driver-kit)

3.  [IoT Core .iso package](https://www.microsoft.com/download/confirmation.aspx?id=55031). The .iso package adds the IoT Core packages and feature manifests used to create IoT Core images. You'll need to sign in with your Microsoft account. By default, these packages are installed to **C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail**.

4.  [IoT Core ADK Add-Ons](https://github.com/ms-iot/iot-adk-addonkit/).  Click **Clone or Download** > **Download ZIP**, and extract it to a folder, for example, **C:\\IoT-ADK-AddonKit**. This kit includes the sample scripts and base structures you'll use to create your image. To learn about the contents, see [What's in the Windows ADK IoT Core Add-ons](iot-core-adk-addons.md)).

5.  [Windows 10 IoT Core Dashboard](http://go.microsoft.com/fwlink/p/?LinkId=708576).

6.  [The Raspberry Pi BSP](https://github.com/ms-iot/iot-adk-addonkit/releases/download/RPiBSP/rpibsp.zip). Since this lab uses a Raspberry Pi, you'll need to download the Raspberry Pi BSP. If you're working with a device other than Raspberry Pi, visit the [Windows 10 IoT Core BSP](https://developer.microsoft.com/en-us/windows/iot/docs/bsp) page to download other BSPs.

Other helpful software:

-   **A text editor such as Notepad++**. You can also use the Notepad tool, though for some files, you won't see the line breaks unless you open each file as a UTF-8 file.

-   **A compression program such as 7-Zip**, which can uncompress Windows app packages.

-   [Visual Studio 2017](http://go.microsoft.com/fwlink/?LinkId=715695), used to create an app in [Lab 1b: Add an app to your image](deploy-your-app-with-a-standard-board.md).


## <span id="Other_software"></span><span id="other_software"></span><span id="OTHER_SOFTWARE"></span>Other software


-   **An app built for IoT Core**. Our samples use the [IoT Core Default](https://github.com/ms-iot/samples/tree/develop/IoTCoreDefaultApp) app, though you can use your own.

-   **A driver built for IoT Core**. Our samples use the [Hello, Blinky](https://developer.microsoft.com/windows/iot/samples/helloblinky) driver, though you can use your own.

## <span id="Next_steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next steps

[Lab 1a: Create a basic image](create-a-basic-image.md)