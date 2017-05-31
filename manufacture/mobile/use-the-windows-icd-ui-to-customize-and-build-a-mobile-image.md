---
Description: 'You can use the Windows Imaging and Configuration Designer (ICD) UI to create a new Windows 10 Mobile image and customize it by adding settings and some assets.'
ms.assetid: bf897b96-2ab4-42c0-b825-34e7979b3761
MSHAttr: 'PreferredLib:/library'
title: Use the Windows ICD UI to customize and build a mobile image
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use the Windows ICD UI to customize and build a mobile image


You can use the Windows Imaging and Configuration Designer (ICD) UI to create a new Windows 10 Mobile image and customize it by adding settings and some assets.

**Note**: This method is not supported in Windows 10, version 1607.

This imaging method requires a pre-installed OS kit so you must have all the necessary Microsoft OS packages and feature manifest files in your default install path. A configuration data file (BSP.config.xml), which contains information about the hardware component packages for your board support package (BSP), is also required. For the BSP.config.xml file, you can:

-   Use the BSP.config.xml file you downloaded as part of the BSP kit, or,

-   Generate your own BSP.config.xml by running the BSP kit configuration tools from the SoC vendor and selecting your component drivers.

## <span id="to_build_a_mobile_image_using_the_windows_icd_ui"></span><span id="TO_BUILD_A_MOBILE_IMAGE_USING_THE_WINDOWS_ICD_UI"></span>Build a mobile image using the Windows ICD UI


This walkthrough shows how to use the Windows ICD UI to customize, build, and flash a mobile image.

1.  From the Windows ICD Start page, select **New Windows image customization**.

    Or, you can also select **New Project...** from the **File** menu.

2.  In the **Enter Project Details** window, specify a **Name** and **Location** for your project. Optionally, you can also enter a brief **Description** to describe your project.

3.  Click **Next**.

4.  If you created the project from the Start page, skip this step.

    In the **Select project workflow** window, select **Imaging** from the list of available project workflows and then click **Next**.

5.  In the **Select imaging source format** window, select **The Windows image is based on Microsoft packages**, and then click **Next**.

    You will be prompted to specify a BSP.config.xml file.

6.  In the **Select hardware component drivers** window, click **Browse** to launch File Explorer and search for the location of your BSP.config.xml file.

7.  Click **Finish**.

    This loads all the customizations that you can configure based on the Windows edition that you selected. Once all the available customizations are loaded, you can see the **Customizations Page**.

8.  In the **Customizations Page**, select the settings you want to customize from the **Available Customizations** pane.

    For this walkthrough, see [Configure customizations in the Windows ICD UI](#configure-customizations-in-the-windows-icd-ui) for a list of the settings we're using as examples. Once you're done configuring the settings, proceed to the next step.

9.  Although optional, export a provisioning package to encapsulate the settings you just configured and allow you to reuse all or most of the customizations for another project.

    To do this, click the **Export** dropdown in the main menu, select **Provisioning Package**, add the required package information.

    -   **Name** - Name to use for the package, for example, *Contoso\_ppkg*.
    -   **ID** - Auto-generated package GUID.
    -   **Owner** - Package owner. Set to *OEM*.
    -   **Version** - Version info. This is pre-populated with the latest package version number or "1.0". Leave it set to the default, *1.0*, although you can set it to any version that you want.
    -   **Rank** - Package rank, which is a value between 0 and 99 (inclusive). Leave it set to the default, *0*.

    Click **Next** until you get to the **Build the provisioning package** screen. Click **Build** to build the package and then click **Finish**.

10. Select **Create** from the main menu and then choose **FFU**.

11. In the **Select image type** screen, choose **Test** for the image type.

    Although there are other image types, a Test image type is good when your image is not yet final and you are still testing various components in your image. The image is also unlocked and doesn't contain any security enforcements.

12. Click **Next**.

13. In the **Describe the image** screen, select the languages that you want to include as part of your image.

    If you went through [Part 1: Classic mobile deployment](lab-1--classic-mobile-deployment.md), the settings in this step are similar to how you would set the device languages in [Configure the OEMInput file](configure-the-oeminput-file.md).

    -   **User Interface Languages** - These are the display language(s) to install on the device.

        Select *en-gb*, *en-us*, *es-es*, *fr-fr*, and *zh-cn*.

    -   **Keyboard Languages** - These are additional keyboard languages to use for text correction and suggestions while typing on the device.

        Select *en-us*.

    -   **Speech Languages** - These are the speech languages that you want to install on your device.

        Select *en-us*.

14. Because we selected multiple languages in **User Interface Languages**, we need to select the default display language that the device will use when it is first turned on by the user. To do this, choose **Boot Language** and select the default device language that you want to set. For example, set this to *en-us*.

15. To set the country or region, choose **Boot Locale** and select the locale for the default region or country. Any locale can be used as the regional format, but only the country (GeoID) value is used. For example, set this to *en-us*.

16. Click **Next**.

17. To change the location where the files are saved, click **Browse...** under **Select where to save the files**.

    You may change the location where the files are saved, but typically the default location is fine.

18. Optional. If you created a CAF file by following [Configure customization settings](configure-customization-settings.md), you can include this by selecting **Browse...** under **Customization answer file (optional)** and specifying the location where you saved the CAF.

    For example, *C:\\Contoso\\Customizations\\MobileCustomizations.xml*.

19. To change the default location where you want to save the image, click **Browse...** to launch File Explorer and specify a new location.

    To use the default location, click **Next**.

20. Click **Build** to start building the image. The project information is displayed in the build page and the progress bar indicates the build status.

    If you need to cancel the build, click **Cancel**. This cancels the current build process, closes the wizard, and takes you back to the **Customizations Page**.

21. During the image build process, a lot of what's happening during the build process is shown in the build output window. This window shows:

    -   Warnings that might appear while the image is building.

    -   Verbose build messages to indicate the phases within the image build process.

    -   Error messages such as when the input files have schema errors or when the image fails to build.

    If your build fails, an error message will be displayed. You can review the build log to identify the issue by clicking **View in Notepad**.

    If your build is successful, the name of the image and its location will be displayed.

    -   If you choose, you can build the image again by picking a different image type, selecting different languages, and then starting another build. To do this, click **Back** to select what you want to change, and then click **Next** to start another build.

    -   Boot the device into image or FFU download mode. To force your phone into image or FFU download mode manually, press and release the power button to reboot the phone and then immediately press and hold the volume up button. Note that this option is available only after an initial FFU has been flashed to the phone.

        If this doesn't work, check and follow the device flashing instructions provided by the SoC vendor.

    -   If you are ready to flash the built image to your device, click **Flash** and select the target device to flash the FFU. If you don't find the device listed in the list of available target device(s), click **Refresh**.

        If you want to flash the image to the device later, follow the steps in [Deploy an image to a mobile device](#deploy-an-image-to-a-mobile-device) when you are ready to flash the image to your device.

        It will take a few minutes for the image to be fully flashed to the device. Once flashing is done, go through device setup and verify that your customizations appear as part of the image.

    -   If you are done, click **Finish** to close the wizard and go back to the **Customizations Page**.

<a name="configure-customizations-in-the-windows-icd-ui"></a>
## Configure customizations in the Windows ICD UI


**Note**  When configuring customizations using Windows ICD, do not use the **Image time settings**, use the **Runtime settings** instead. If you configure the image-time settings, this will cause an error due to a settings collision if the setting is configured in both WPAF and MCSF CAF.

 

If you haven't done so already, you must first create the LayoutModification.xml files as shown in [Configure the Start layout](configure-the-start-layout.md) before proceeding with the steps in this section.

**To configure the Start layout**

1.  In the **Available customizations** pane in Windows ICD, expand **Runtime settings**, select **Start**, and then select **StartLayout**.

2.  In the middle pane, click **Browse** to open File Explorer.

3.  In the File Explorer window, navigate to the location where you saved LayoutModification1.xml from step 1; for example, *C:\\Contoso\\Customizations*.

4.  Select LayoutModification1.xml and then click **Open**.

    This sets the value of **StartLayout** and the setting should appear in the **Selected customizations** page.

Enterprise policies and enrollment settings are some of the customizations available only through Windows Provisioning. Here, we'll configure a few of these policies to include as part of the image. For more information about the other policies that you can configure, see [Policies](https://msdn.microsoft.com/library/windows/hardware/dn965797) (for the Windows Provisioning settings). Note that the Windows Provisioning settings topics do not provide a detailed description of each policy; instead, each topic links to the more detailed information in [Policy CSP](https://msdn.microsoft.com/library/windows/hardware/dn904962).

**To set policies**

1.  In the **Available customizations** pane, expand **Runtime settings**, and select **Policies**.

2.  Find **Policies/DeviceLock** and set **MaxInactivityTimeDeviceLock** to "15".

    This specifies that after the device has been idle for 15 minutes, the device will become PIN or password locked.

3.  Find **Policies/DeviceLock** and set **ScreenTimeoutWhileLocked** to "15".

    This specifies the duration, in seconds, for the screen timeout while on the lock screen. For this example, the duration is 15 seconds.

<a name="deploy-an-image-to-a-mobile-device"></a>
## Deploy an image to a mobile device


Follow these steps if you deferred flashing the image to the device after it was built.

1.  Boot the device into image or FFU download mode. To force your phone into image or FFU download mode manually, press and release the power button to reboot the phone and then immediately press and hold the volume up button. Note that this option is available only after an initial FFU has been flashed to the phone.

    If this doesn't work, check and follow the device flashing instructions provided by the SoC vendor.

2.  Using a USB cable, connect your phone to the host computer.

3.  Click **Deploy** from the main menu and choose **To USB connected device** to deploy the FFU image to the device.

4.  In the **Select an FFU image** window, click **Browse...** to launch File Explorer and select the FFU that you want to flash to your target device, and then click **Next**.

5.  Choose the target device or drive from the list. If your device or drive is not listed, click **Refresh**.

6.  Click **Next**.

7.  In the **Deploy to device** window, choose **Flash** to start flashing the image.

8.  Click **Finish** to close the **Deployment** page.

 

 



