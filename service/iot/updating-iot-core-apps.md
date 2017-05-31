---
author: kpacquer
Description: 'OEM and enterprise customers can utilize a set of scripts and tools to deliver app updates for Windows 10 IoT Core (IoT Core) devices.'
ms.assetid: 010c4836-a8ad-4ab9-b5a8-45babcc8a3f3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Update apps on your IoT Core devices
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update apps on your IoT Core devices

**New for Windows 10, version 1607**: OEMs and enterprise customers can deliver app updates to Windows 10 IoT Core devices by submitting updates to the Windows Store. When your devices connect to the internet, they periodically check for updates from the Windows Store, and install the updates automatically. 

Before you send updates to the store, we recommend testing them first on your own devices. 

## <span id="Send_updates_to_the_Windows_Store"></span>Send updates to the Windows Store

Create updates for your apps in the same way that you create the original apps.

Use a higher version number each time. (Example, 1.0.0.0 --> 1.0.1.0.)

It's OK to reuse the existing package names and even write over the old folder names and locations. Back up your files first, in case you'd like to revert the change later.

We recommend that you [test and track the update](#Test_and_track_the_update) using the procedures in this topic.

Finally, sign and submit the app package to the Windows Store. 

To learn more, see [Installing and Servicing apps on Windows 10 IoT Core](https://developer.microsoft.com/en-us/windows/iot/docs/store)

## <span id="Test_and_track_the_update"></span><span id="test and track the update"></span><span id="TEST AND TRACK THE UPATE"></span>Test and track the update (recommended)

Try out your updates on your devices before submitting them to the Windows Store.

### <span id="Create_an_update_package"></span>Create an update package

1.  Create a working folder for your update package. 

    Use a new version number. This version number will apply to all of the packages in your projects.

    ``` syntax
    newupdate Update1 10.0.0.1
    ```

2.  Update the app with changes.

3.  Build the app using a new version number. 
	
4.  Update the package info:

    - Create a copy of the existing pacakge (for example, Appx.HelloWorld) under Update1\ folder and then update that with the version number.
	
	- Copy the new appx files to that directory.
	
	- Open  C:\\iot-adk-addonkit\\Source-arm\\Packages\\Appx.HelloWorld\\Appx.HelloWorld.pkg.xml, and update the version numbering.
		
5.  Build the update package

    ``` syntax
    createupdatepkgs Update1
    ```

	The output goes to C:\\iot-adk-addonkit\\Build\\arm\\Update1.

### <span id="Apply_the_update_directly_to_the_device"></span><span id="apply_the_update_directly_to_the_device"></span><span id="APPLY_THE_UPDATE_DIRECTLY_TO_THE_DEVICE"></span>Apply the update directly to the device

1.  Copy the .cab file to the device. You can do this using an FTP tool such as [WinSCP](http://winscp.net), or by copying the file directly to the device's drive (such as a micro SD card).

2.  On your technician PC, connect to your device using an SSH client, such as [PuTTY](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe). For example, use the IP address and port 22 to connect to the device, then log in using the Administrator account and password. (To learn more, see [Using SSH to connect and configure a device running Windows IoT Core](https://developer.microsoft.com/windows/iot/docs/ssh).)

3.  From the device command line, stage the update. You can repeat this step to stage multiple updates.
    ``` syntax
    ApplyUpdate.exe -stage <DownloadedPackageName.cab>
    ```

4.  Commit the changes. This command also triggers the Windows Update process, installing any applicable updates. 
    ``` syntax
    ApplyUpdate.exe -commit
    ```
	
	(To reject all updates, use: `ApplyUpdate.exe -clear` instead.)
	
	Troubleshooting:
	-  **Error: A certificate chain could not be built to a trusted root authority. (0x800B010A). Signature verification failed.** 
	   Possible cause: Adding test signed images to a retail image. Sign the image and try again.
	   
    -  **Error: 0x80188302.**
       Possible cause: Package version incorrect. Make sure the new version number is higher than the old version and try again. 
	
	-  **Error: Could not start update (0x8024A10F)**
       Possible cause: Windows Update is in progress. Try again after the current Windows Update is completed.
	   

### <span id="Keep_track_of_versions"></span>Keep track of versions

Open `UpdateVersion.txt` to see descriptions of your packages. The createupdatepkgs tool updates this file when creating a new update.

### <span id="Test_new_images"></span>Test new images
Create a new package using the same procedures as shown in [Lab 1b: Add an app to your image](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/iot/deploy-your-app-with-a-standard-board).
