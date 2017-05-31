---
title: System builder deployment of Windows 10 for desktop editions
author: Justinha
description: Get step-by-step guidance for system builders to deploy Windows 10 to desktop computers, laptops, and 2-in-1s.   
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# System builder deployment of Windows 10 for desktop editions 

You can use this guide to deploy Windows 10 to a line of computers. It provides prescriptive guidance for Windows 10 deployment, including online and offline customizations, and optional steps for specific scenarios. It is intended to help system builders (level 200 technicians) with both 64-bit and 32-bit configurations, and applies to Windows 10 for desktop editions (Home, Pro, Enterprise, and Education). 

If you're a system builder, you can also use the [Express Deployment Tool](https://dpcenter.microsoft.com/en/Windows/Build/dp-express-deployment-tool-windows-10) (EDT) to build a custom Windows deployment. The EDT simplifies the process of installing and configuring Windows for a consistent brand and customized end-user experience. 

## Prepare your lab environment

The first step is to set up your lab environment, which includes installing the latest Windows Assessment and Deployment Kit (Windows ADK) tools onto your designated Technician computer. The Technician computer must run Windows 10 x64 if you are going to deploy x64 images, or run Windows 10 x86 for x86 image deployment. Incorrect configurations may result in supported architecture mismatch while using deployment tools in the Windows ADK. Where noted, follow the appropriate guidelines for either a 64-bit vs 32-bit deployment.

Before starting the deployment procedure, you need to download the kits that will be used throughout the guide. Go to the [Device Partner Center](http://www.microsoft.com/oem/en/pages/index.aspx#fbid=7JcJYKYGEfo) > **Downloads and Installation** > **Understanding ADKs and OPKs**. For a list of resources and kits that will be used and where to obtain them, see [What you will need and where to get it](#what-you-will-need-and-where-to-get-it).

You will need two USB drives. USB-A will be used to boot the system in Windows Preinstallation Environment (WinPE). USB-B will be used to move files between computers, store deployment and recovery scripts, and store and apply created images.

<table>
<th>USB Hard Drive Name</th>
<th>Format</th>
<th>Minimum Size</th>
<tr>
<td>USB-A</td>
<td>FAT32</td>
<td>~4GB</td>
</tr>
<tr>
<td>USB-B</td>
<td>NTFS</td>
<td><p>~16GB x86</p><p>~32GB amd64</p></td>
</tr>
</table>

### Creating my USB-B

-   Format your USB drive and name it as follows:

    ![Extract USB](images/extract-usb.png) 

-   Then download [USB-B.zip](http://download.microsoft.com/download/5/8/4/5844EE21-4EF5-45B7-8D36-31619017B76A/USB-B.zip) from the Microsoft Download Center. Save the .zip file to USB-B and extract the contents there. 

-   The contents of the configuration files included in USB-B are examples that you may change according to your branding and manufacturing choices. However, file names and hierarchy of the folders and files must be the same as demonstrated below in order to align your deployment procedure with this guide.

## Customizations throughout the document

| **Pass**        | **Setting**                              | **Action**                                                            |
|-----------------|------------------------------------------|-----------------------------------------------------------------------|
| **WinPE**       | Setup UI Language                        | EN-US                                                                 |
|                 | User Data                                | Preinstallation Product Key for ODR - Defined                         |
| **Specialize**  | Internet Explorer Home Page              | in the answer file                                                    |
|                 | OEM Name                                 | Defined in the answer file                                            |
|                 | OEM Logo                                 | Defined in the answer file                                            |
|                 | Model                                    | Defined in the answer file                                            |
|                 | Support Info                             | Defined in the answer file                                            |
| **OOBE System** | Reseal                                   | Audit/OOBE                                                            |
|                 | StartTiles                               | Square Tiles / SquareOrDesktopTiles set to pin only desktop apps      |
|                 | TaskbarLinks (up to 6 pinned .lnk files) | Paint and Control Panel shortcuts have been set                       |
|                 | Themes                                   | Custom Theme with the OEM logo as the desktop background has been set |
|                 | Visual Effects                           | SystemDefaultBackground set                                           |

## Additional customizations

### Product deployment

-   Office Single Image v16.3 OPK preloaded

### Image customization

- Adding language interface packs to Windows

- Adding drivers and update packages

- Adding OEM-specific logo and background files to Windows

- Image size optimization

- Pinning desktop applications to start sceen

<a name="create-a-usb-drive-that-can-boot-to-winpe"></a>
## Create a USB drive that can boot to WinPE

You must use the matching version of Windows ADK for the images being customized. If building an image using the RTM image, use Windows ADK for Windows 10. If using a Windows 10, version 1511 image, use the Windows ADK for Windows 10, version 1511.
For more details about the Windows ADK, see the [Windows 10 ADK Documentation Homepage](https://technet.microsoft.com/library/mt297512.aspx).

|  Windows version  | Link to run ADKSetup.exe      |
|-------------------|-------------------------------|
| Windows 10, version 1703    | [**Windows ADK**](https://developer.microsoft.com/en-us/windows/hardware/windows-assessment-deployment-kit)  |



1.  Follow the on-screen instructions to install the Windows ADK, including the **Deployment Tools**, **Windows Preinstallation Environment**, and **Windows Assessment Toolkit** features.

    **Note**: If you have Secure Boot enabled, disable it before installing the ADK.

    ![Select ADK Features](Images/adk-select-features.png)

1.  Press the Windows key to display the **Start** menu. Type:
    
        Deployment and Imaging Tools Environment

    Right-click the name of the tool, and then click **Run as administrator**.

2.  Windows ADK allows you to create **Windows PreInstallation Environment**. Copy base WinPE to new folder.

    If you use an **x64** Windows 10 image, copy the x64 WinPE folder structure:

    ```
    Copype amd64 C:\winpe_amd64
    ```

    If you use an **x86** Windows 10 image, copy the x86 WinPE folder structure:
    ```
    Copype x86 C:\winpe_x86
    ```

1.  You may add packages and/or drivers to WinPE here.

2.  Connect a USB drive that is at least 4 GB. Format it as shown in this diagram:

    ![Connect USB](Images/connect-usb.png)

3.  Make the inserted USB a new WinPE bootable USB.

    If you use an **x64** Windows 10 image, make an x64 WinPE USB:

    ```
    MakeWinPEMedia /UFD C:\winpe_amd64 F:
    ```

    If you use an **x86** Windows 10 image, make an x86 WinPE USB:
    ```
    MakeWinPEMedia /UFD C:\winpe_x86 F:
    ```
    (Where F: is the drive letter of USB)

## Install Windows with basic customizations

Please obtain Windows 10 x86/x64 DVD media from a Microsoft Authorized Distributor.

For a document to help you tailor the customizations defined in your unattend.xml file, see the [Windows Guidelines for System Builders](http://www.microsoft.com/oem/en/pages/download.aspx?wpid=w_w8_129) and [Windows Policy for System Builders](https://oem.microsoft.com/downloads/worldwide/windows_10/Windows_10_Policy_SB.pdf).

1.  Copy the sources\\Install.wim file from the directory in the Windows 10 media that you will be deploying to your local Desktop (~3gb).

    ![Copy WIM](Images/copy-wim.png)

2.  Run **Windows System Image Manager** to start creating an answer file from scratch. This tool allows you to create or manage your answer files in an easy and organized manner.

    ![Run SIM](Images/run-sim.png)

3.  Navigate to **File** &gt; **Select Windows Image**. Browse to your local desktop and select **Install.wim**. Catalog file will be created (.clg file) for that specified wim.

    Troubleshoot: Catalog creation may fail due to several reasons. Please make sure install.wim has read/write permissions. If you continue getting error, make sure correct architecture (x86 or x64) Windows 10 is installed on technician computer. If you are creating catalog for x64 Windows 10 image, you are required to use x64 Windows 10 installed on x64 Windows 10 computer. Install.wim image and Windows 10 ADK versions must be the same.

4.  Open a sample answer file or create a new one.

    -   This is the sample answer file included in the USB-B:

        USB-B\AnswerFiles\Unattend.xml

5.  Click **OK** to associate the answer file with the Windows Image. 

6.  To add a driver to Windows PE, click **Insert** select **Driver Path** and select pass **1 windowsPE** and then browse to the driver. Note: This step is optional and only required if a third-party driver is needed for use in the Windows Preinstallation Enviornment. 

7.  To add a package, click **Insert**, select **Package**, and then browse to the package you want to add. This step is optional.

### Customize the answer file

Troubleshoot: A blank character in **specialize | Microsoft-Windows-Shell-Setup | Computer Name** will result in Windows installation failure.

1.  Please see an example of an answer file for basic customizations:

    -   USB-B\AnswerFiles\Unattend.xml

    You may use the sample answer file and modify relevant parts or start from scratch by specifying some basic customizations.

    Please see and use the Windows 10 default product key from [Device Partner Center](https://www.microsoft.com/OEM/en/products/windows/Pages/windows-10-build.aspx#fbid=nV7H02bHHiv) listed under **Default product keys** tab.

2.  Add a product key that matches the Windows edition. This key isn't used to activate Windows, so you can reuse the same key for multiple installations:

    -   In the **Answer File** pane, select **Components\1 windowsPE\amd64_Microsoft-Windows-Setup_neutral\UserData\ProductKey**. In the **ProductKey Properties** pane, under **Settings**, enter the value next to Key.

    Important: These product keys *cannot* be used for activation. You will need to type a software product key during the installation process for activation. These keys will be removed when sysprep generalize is run. The end user will be required to type the unique product key from the Certificate of Authenticity (COA) label when first booting Windows 10.

3.  Add your support information:

    In the **Answer File** pane, select **Components\4 specialize\amd64_Microsoft-Windows-Shell-Setup_neutral\OEMInformation**.

    In the **OEMInformation Properties** pane, in the **Settings** section, update the following values: company name (Manufacturer), hours (SupportHours), phone number (SupportPhone), and website (SupportURL).

4.  Prepare your computer to boot to audit mode after the Windows installation is complete:

    In the **Windows Image** pane, expand **Components**, right-click **amd64_Microsoft-Windows-Deployment**, and then select **Add Setting to Pass 7 oobeSystem**.

    In the **Answer File** pane, select **Components\7 oobeSystem\amd64_Microsoft-Windows-Deployment _neutral\Reseal**.

    In the **Reseal Properties** pane, in the **Settings** section, add the following value: Mode =Audit.

5.  Set the Internet Explorer home page:

    In the **Windows Image** pane, right-click **amd64_Microsoft-Windows-IE-InternetExplorer**, and then select **Add Setting to Pass 4 specialize**.

    In the **Answer File** pane, select **Components\4 specialize\amd64_Microsoft-Windows-Microsoft-Windows-IE-InternetExplorer_neutral**.

    In the **IE-InternetExplorer Properties** pane, in the **Settings** section, select Home_page, and add the URL of your website.

6.  OEMs can specify **Disk Configuration** which is used to create/modify disk partitions and set image installation partition. This step is optional and configuration is included in the sample answer file USB-B\AnswerFiles\Unattend.xml.

    Save the answer file to USB-B\AnswerFiles\Unattend.xml and close Windows SIM.


## Update images for each model: offline servicing

Before mounting and editing the image please take a backup copy in the same directory and rename the image which will be modified as ModelSpecificImage.wim.

```
Dism /export-image /sourceimagefile:e:\images\install.wim /sourceindex:2 /destinationimagefile:e:\images\modelspecificimage.wim
```

### Mount images

1.  Mount Windows image (ModelSpecificImage.wim). This process extracts the contents of the image file to a location where you can view and modify the mounted image.
    ```
    Md C:\mount\windows
    Dism /Mount-Wim /WimFile:E:\Images\ModelSpecificImage.wim /index:1 /MountDir:C:\mount\windows
    ```
    Where E:\ is the drive letter of USB-B.

2.  Mount Windows RE Image file.

    ```
    Md c:\mount\winre
    Dism /Mount-Image /ImageFile:C:\mount\windows\Windows\System32\Recovery\winre.wim /index:1 /MountDir:C:\mount\winre
    ```

    Troubleshoot: If mounting operation fails, make sure that you are using the Windows 10 version of DISM that is installed with the Windows ADK and not an older version from your technician computer. Don’t mount images to protected folders, such as your User\Documents folder. If DISM processes are interrupted, consider temporarily disconnecting from the network and disabling virus protection.

    ![Mount](Images/mount.png)

    ![Windows folder](Images/windows-folder.png)

### Modify images

#### Add drivers

If you use an x64 Windows 10 image, add x64 drivers; if you use an x86 Windows 10 image, add x86 drivers.

1.  Adding driver packages one by one. (.inf files) SampleDriver\driver.inf is a **sample** driver package that is specific to the computer model. Type your own specific driver path. If you have multiple driver packages, skip to the next step.
    ```
    Dism /Add-Driver /Image:C:\mount\windows /Driver:"C:\SampleDriver\driver.inf"
    Dism /Add-Driver /Image:C:\mount\winre /Driver:"C:\SampleDriver\driver.inf"
    ```

2.  Multiple drivers can be added on one command line if you specify a folder instead of an .inf file. To install all of the drivers in a folder and all its subfolders, use the **/recurse** option.
    ```
    Dism /Image:C:\mount\windows /Add-Driver /Driver:c:\drivers /Recurse
    ```

3.  Review the contents of the %WINDIR%\Inf\ (C:\mount\windows\Windows\Inf\) directory in the mounted Windows image to ensure that the .inf files were installed. Drivers added to the Windows image are named Oem\*.inf. This is to ensure unique naming for new drivers added to the computer. For example, the files MyDriver1.inf and MyDriver2.inf are renamed Oem0.inf and Oem1.inf.

4.  Verify your driver has been installed for both images.
    ```
    Dism /Image:C:\mount\windows /Get-Drivers
    Dism /Image:C:\mount\winre /Get-Drivers
    ```

Important: If the driver contains only the installer package and doesn’t have an .inf file, you may choose to install the driver in AUDIT mode by double-clicking the corresponding installer package. Some drivers may be incompatible with Sysprep tool; they will be removed after sysprep generalize even if they have been injected offline.

In this case, you need to add an extra parameter to USB-B\AnswerFiles\UnattendSysprep.xml in order to persist the drivers in the image when the image will be generalized.

&lt;PersistAllDeviceInstalls&gt;true&lt;/PersistAllDeviceInstalls&gt;

This property must be added to USB-B\AnswerFiles\UnattendSysprep.xml during generalize pass in order to persist the drivers in the image. For more information about the details of this property and how to add it to an answer file, see [PersistAllDeviceInstalls](http://technet.microsoft.com/library/ff716298.aspx).

#### Add language interface packs

Obtain the Windows 10 Language Interface Packs from [Device Partner Center](https://www.microsoft.com/OEM/en/installation/downloads/Pages/Windows-10-v1511-Language-Interface-Packs.aspx#fbid=nV7H02bHHiv) under the **LIPs** tab.

For more information about LIPs, see [Add Language Interface Packs to Windows 10](add-language-interface-packs-to-windows.md).

**Important: LIP Versions must match other Windows component versions, for both the image and the ADK.**

If you use an x64 Windows 10 image, install x64 LIPs; if you use an x86 Windows 10 image, install x86 LIPs.

1.  Copy the LIP folder to the USB-B\LanguagePack\x64 or USB-B\LanguagePack\x86 folder:

    ![Copy LIP](Images/copy-lip.png)

2.  Apply the LIP to mounted image.

    *Amd64 architecture*
    ```
    Dism /image:C:\mount\windows /add-package /packagepath:e:\LanguagePacks\x64\Microsoft-Windows-Client-Language-Interface-Pack_x64_as-in.cab
    ```

    *X86 architecture*
    ```
    Dism /image:C:\mount\windows /add-package /packagepath:e:\LanguagePacks\x86\Microsoft-Windows-Client-Language-Interface-Pack_x86_as-in.cab
    ```

**Important: If you install an update (hotfix, general distribution release [GDR], or service pack [SP]) that contains language-dependent resources prior to installing a language pack, the language-specific changes in the update won't be applied when you add the language pack. You need to reinstall the update to apply language-specific changes. To avoid reinstalling updates, install language packs before installing updates.**

#### Add update packages

If you use an x64 Windows 10 image, add x64 update packages; if you use an x86 Windows 10 image, add x86 update packages.

To obtain update packages, download them from [Microsoft Update Catalog](http://catalog.update.microsoft.com/v7/site/Home.aspx).

1.  Run Internet Explorer and navigate to the [Microsoft Update Catalog](http://catalog.update.microsoft.com/v7/site/Home.aspx) webpage. See [What you will need and where to get it](#what-you-will-need-and-where-to-get-it) for more information about which packages you should obtain from Microsoft Update Catalog.

2.  Type every single update package one by one into the search box and click **Search**.

    ![Update catalog](Images/sb-update-catalog.png)

3.  After search completes, click **Add** next to the version and architecture of the package you wish to download.

    ![Add Update Catalog](Images/sb-add-update-catalog.png)

4.  After you add all of the following updates, click **view basket** and then **Download**.

    ![Download Update Catalog](Images/download-update-catalog.png)
    
    ![Download complete](Images/download-update-catalog-complete.png)

    **Troubleshoot:** IF you encounter an error as “The website has encountered a problem” after clicking “Download”, try turning off the pop-up blocker in IE or disabling Protected Mode in IE temporarily

    ![Enable Protected Mode](Images/enable-protected-mode.png)

5.  After downloading all the listed essential updates, add **update packages** (KB packages) to the image one by one by using the following command:

    *Amd64 architecture*

    ```
    Dism /Add-Package /Image:C:\mount\windows /PackagePath:"C:\windows10.0-kb4016871-x64_27dfce9dbd92670711822de2f5f5ce0151551b7d.msu"
    ```
    
    *X86 architecture*

    ```
    Dism /Add-Package /Image:C:\mount\windows /PackagePath:"C:\windows10.0-kb4016871-x86_5901409e58d1c6c9440e420d99c42b08f227356e.msu"
    ```

6.  Add updates to winre.wim (where they apply; not all updates apply to winre.wim)

    *Amd64 architecture*

    ```
    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\windows10.0-kb4016871-x64_27dfce9dbd92670711822de2f5f5ce0151551b7d.msu"
    ```

    *X86 architecture*
    
    ```
    Dism /Add-Package /Image:C:\mount\winre /PackagePath:"C:\ windows10.0-kb4016871-x86_5901409e58d1c6c9440e420d99c42b08f227356e.msu"
    ```

#### Add OEM specific visual customizations

1.  Create OEM folder under C:\mount\windows\Windows\system32\ directory.

2.  Copy the OEM logo to C:\mount\windows\Windows\system32\OEM\**FabrikamLogo.bmp** directory which will be mapped in unattend file in **OEM Information | Logo** property.

    See the following image to add OEM logo in an answer file.

    -   %windir%\system32\OEM\FabrikamLogo.bmp

    **REFERENCE:** OEM Logo file must be in .bmp format and in 120px x 120px size. Please see Windows Guidelines for System Builders for OEM Logo details.

    ![OEM Logo details](Images/oem-logo-details.png)

3.  To display an OEM specific desktop background picture, the image file must be placed in %windir%\system32\OEM\**Fabrikam.bmp** directory. Verify that the path is same in answer file corresponding to oobeSystem &gt; Microsoft-Windows-Shell-Setup &gt; Themes &gt; DesktopBackground property. See the below image to add desktop background in an answer file.

    ![Add desktop background](Images/add-desktop-background.png)

#### Modify Start layout

The Start tile layout in Windows 10 provides OEMs the ability to append tiles to the default Start layout to include Web links, secondary tiles, Windows desktop applications, and universal Windows apps. OEMs can use this layout to make it applicable to multiple regions or markets without duplicating a lot of the work. In addition, OEMs can add up to three default apps to the frequently used apps section in the system area, which delivers sytem-driven lists o the user including important or frequently accessed system locations and recently installed apps.

1.  Create Layoutmodification.xml.

    Note: It is recommended to start with the sample on **USB-B**\StartLayout\layoutModification.xml as it conforms to the samples in this guide (Example Only).

    The Sample LayoutModification.xml shows two groups called “Fabrikam Group 1” and “Fabrikam Group 2”, which contain tiles that will be applied if the device country/region matches what’s specified in Region (in this case, the regions are Germany and United States). Each group contains three tiles and the various elements you need to use depending on the tile that you want to pin to Start.

    Keep the following in mind when creating your LayoutModification.xml file:

    - If you are pinning a Windows desktop application using the **start:DesktopApplicationTile** tag and you don’t know the application’s application user model ID, you need to create a .lnk file in a legacy Start Menu directory before first boot.

    - If you use the **start:DesktopApplicationTile** tag to pin a legacy .url shortcut to Start, you must create a .url file and add this file to a legacy Start Menu directory before first boot.

    For the above scenarios, you can use the following directories to put the .url or .lnk files:

    - %APPDATA%\Microsoft\Windows\Start Menu\Programs\

    - %ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\

2.  Save the LayoutModification.xml file.

3.  Add your LayoutModification.xml file to the Windows image. You’ll need to put the file in the following specific location before first boot. If the file exists, you should replace the LayoutModification.XML that is already included in the image.

    ```
    Copy E:\StartLayout\layoutmodification.xml c:\mount\windows\users\default\AppData\Local\Microsoft\Windows\Shell\
    ```
    Where E: is the drive letter of USB-B.

4.  If you pinned tiles that require .url or .lnk files, add the files to the following legacy Start Menu directories:

    1.  %APPDATA%\Microsoft\Windows\Start Menu\Programs\

    2.  %ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\

        ```
        Copy e:\StartLayout\Bing.url "C:\mount\windows\ProgramData\Microsoft\Windows\Start Menu\Programs\"
        Copy e:\StartLayout\Paint.lnk "C:\mount\windows\ProgramData\Microsoft\Windows\Start Menu\Programs"
        Copy E:\StartLayout\Bing.url "C:\mount\windows\users\All Users\Microsoft\Windows\Start Menu\Programs"
        Copy E:\StartLayout\Paint.lnk "C:\Mount\Windows\Users\All Users\Microsoft\Windows\Start Menu\Programs"
        ```
        Note: If you don’t create a LayoutModification.xml file and you continue to use the Start Unattend settings, the OS will use the Unattend answer file and take the first 12 SquareTiles or DesktoporSquareTiles settings specified in the Unattend file. The system then places these tiles automatically within the newly-created groups at the end of Start. The first six tiles are placed in the first OEM group, and the second set of six tiles are placed in the second OEM group. If OEMName is specified in the Unattend file, the value for this element is used to name the OEM groups that will be created.

#### Copy the answer file

A system builder may want to make additional customizations through an unattend file. The sample unattend file on USB-B contains additional common customizations.

```
Copy /y E:\AnswerFiles\Unattend.xml C:\Mount\Windows\Windows\Panther
```

Where E:\ is USB-B.

### Optimize WinRE

1.  Increase scratchspace size.

    ```
    Dism /image:c:\mount\winre /set-scratchspace:512
    ```

2.  Cleanup unused files and reduce size of winre.wim

    ```
    Dism /image:"c:\mount\winre" /Cleanup-Image /StartComponentCleanup /Resetbase
    ```
### Unmount images

1.  Close all applications that might access files from the image

2.  Comit the changes and unmount the Windows RE image:

        Dism /Unmount-Image /MountDir:"C:\mount\winre" /Commit

    where C is the drive letter of the drive that contains the image.

    This process can take a few minutes.

1.  Make a backup copy of the updated Windows RE image.

    Troubleshoot: If you cannot see winre.wim under the specified directory, use the following command to set the file visible:

    ```
    attrib -h -a -s C:\mount\windows\Windows\System32\Recovery\winre.wim
    Dism /export-image /sourceimagefile:c:\mount\windows\windows\system32\recovery\winre.wim /sourceindex:1 /DestinationImageFile:e:\images\winre_bak.wim
    Del c:\mount\windows\windows\system32\recovery\winre.wim
    Copy e:\images\winre_bak.wim c:\mount\windows\windows\system32\recovery\winre.wim
    ```

    When prompted, specify **F** for file

1.  Check the new size of the Windows RE image.

    ```
    Dir "C:\mount\windows\Windows\System32\Recovery\winre.wim"
    ```

    Use the following partition layout size guidance to determine the size of your recovery partition in createpartitions-&lt;firmware&gt;.txt files. The amount of free space left is after you copy winre.wim to the hidden partition.

    Please reference [Disk Partition rules](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/desktop/configure-uefigpt-based-hard-drive-partitions#diskpartitionrules) for more information.

    - If the partition is less than 500 MB, it must have at least 50 MB of free space.

    - If the partition is 500 MB or larger, it must have at least 320 MB of free space.

    - If the partition is larger than 1 GB, we recommend that it should have at least 1 GB free.

    ```
    rem == Windows RE tools partition =============== 
    create partition primary size=500
    ```

    Optional: This section assumes you’d rather keep winre.wim inside of install.wim to keep your languages and drivers in sync. If you’d like to save a bit of time on the factory floor, and if you’re OK managing these images separately, you may prefer to pull winre.wim from the image and apply it separately.

1.  Commit the changes and unmount the Windows image:

    ```
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

    Where C is the drive letter of the drive that contains the image.

    This process may take several minutes.

<a name="deploy-the-image-to-new-computers-windows-installation"></a>
## Deploy the image to new computers (Windows installation)

1.  On the technician computer, locate the following files in USB-B/Deployment. Please see [Creating My USB-B](#creating-my-usb-b) to create and place the files in correct paths. 

    ![Locate USB files](Images/locate-usb-files.png)

2.  Boot the reference computer and connect USB-A.

3.  After WinPE starts, connect USB-B.

4.  Type *diskpart* and hit enter to start Diskpart. Then type *list volume* to identify volume label of USB-B (For example: E:\). 

    ```
    E:\Deployment\Walkthrough-Deploy.bat E:\Images\ModelSpecificImage.wim
    ```

    Note: There are several pauses in the script. You will be prompted Y/N for the Apply operation if this is a Compact OS deployment.

**Note**: Only use Compact OS on Flash drive based devices because Compact OS performance depends on the storage device capabilities. Compact OS is NOT recommend on rotational devices. For more information, see [Compact OS](compact-os.md).

5. Remove USB-A and USB-B, and then type:

    ```
    Exit
    ```

<a name="update-images-manually-by-using-audit-mode-online-servicing"></a>
## Update images manually by using AUDIT MODE (online servicing)

Important: Connecting the computer to internet is not recommended during manufacturing stages. We don't recommend getting updates from Windows Update in audit mode, as it will likely generate errors when you generalize + sysprep the machine from audit mode.


### Preload Microsoft Office 2016

This guide provides information for licensed original equipment manufacturers (OEMs) about how to use the Office Deployment Tool to preinstall Office 2016 on to devices that are running the Windows operating system.

Note: This guide doesn’t cover the PIPC scenarios for OEMs in Japan. 

#### Prepare Office files on Technician PC

Obtain Office Deployment Tool from from X21-32422 Office 2016 Deployment Tool for OEM OPK v16.3.

1.  Mount X21-32422 Office 2016 v16 Deployment Tool for OEM OPK v16.3\Software - DVD\X21-32464 SW DVD5 Office v16.3 Deployment Tool for OEM\X21-32464.img.
2.	Copy files from mounted the drive to USB-B (where E:\ is driver letter for USB-B) E:\OfficeV16.
3.	Double click e:\Officev16\officedeploymenttool.exe.
4.	Provide folder path to extract files E:\Officev16.

    Setup.exe and configuration.xml are extracted to E:\Officev16.

    ![Setup and configuration.xml](Images/setup-and-configuation.png)
    
    Obtain Office v16 in the desired language; this sample uses Engish X21-05414 Office 2016 v16 32-BIT X64 English OPK.
    
5. Copy the folder Office from mounted drive X21-32392 Office v16.3 English OPK\Software – DVD\X21-32434 SW DVD5 Office Pro 2016 32 64 English C2ROPK Pro HS HB OEM v16.3\ X21-32434.img to USB-B (where E:\ is drive letter for USB-B) E:\OfficeV16.

    ![Office folder](Images/office-folder.png)
    
    [Optional] If you applied a language interface pack, you may want to add the language interface pack for Office 2016 as well. The below samples will show with the Language interface pack applied.    

6. Notepad E:\Officev16\ConfigureO365Home.xml

7. Add language ID and verify SourcePath as in the following screenshot.

    ![Language ID](Images/language-id.png)
    
8. Close and save ConfigureO365Home.xml.

9. Open an elevated command prompt as administrator.

10. From E:\Officev16, type and run setup.exe /download ConfigureO365Home.xml:
    ```
    CD E:\Officev16
    Setup.exe /download ConfigureO365Home.xml
    ```   
    This will download the language packs for German and Japanese.
    
11. Type and run echo %errorlevel% and verify return code is 0.

12. Unplug USB-B from the technician computer. 

#### Install Office 2016 on Reference PC

1.  Plug USB-B into the reference computer, which is in Audit mode.
2.	Find the drive letter for USB-B; for this example USB-B is E:\.
3.	Notepad ConfigureO365Home.xml.
4.	Configure the SourcePath to point to USB-B E:\Officev16.

    ![Configure the source path](Images/configure-source-path.png)
    
    Note: the only Product ID that needs to be specified in the configuration.xml file is O365HomePremRetail. If the user enters a key for another product, such as for Office Home & Student 2016, then Office will automatically be configured as the product associated with that key.
    
5.	Close and Save ConfigureO365Home.xml.
6.	Open a command prompt and navigate to d:\Officev16.
7.  Type:

    Setup.exe /configure ConfigureO365Home.xml

#### Pin Office tiles to the Start menu

You must pin the Office tiles to the Start menu, otherwise Windows will remove the Office files during OOBE boot phase.

Note: You must be using at least version Windows 10, version 1607.

1. Open a command prompt and type:

    ```
    notepad C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\layoutmodification.xml.
    ```

2. Add &lt;AppendOfficeSuiteChoice Choice="Desktop2016" /&gt; to layoutmodification as you see highlighted in the following example:

    ![Layout Modification](Images/layoutmodification.png)

    Note: The Choice attribute is new. This allows different versions of Office to be pinned to the Start screen at the same time. For now, Desktop2016 is the only valid value. Other values will be available in the future.

3. Close and save layoutmodification.xml.

    Note: for recovery purposes the layoutmodification.xml will need to be copied during recovery. 
    
4.  Open a command prompt and type:

    ```
    copy C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\layoutmodification.xml c:\recovery\OEM   
    ```

    Once the machine is booted to desktop after going through OOBE, the Start menu will have these three tiles appended as shown in the following diagram: 
    
    ![Office tiles pinned to the Start menu](Images/office-tiles-pinned-to-start-menu.png)
    
<a name="prepare-the-system-for-recovery-with-push-button-reset"></a>
## Prepare the system for Push Button Reset

This section provides guidance for setting up the recovery environment for Push Button Reset (PBR) scenarios.

Please reference Push-button reset and Windows Recovery Environment (Windows RE) and Hard Drives and Partitions for more information.

Push-button reset, is a built-in recovery tool which allows users to recover the OS while preserving their data and important customizations, without having to back-up their data in advance. It reduces the need for custom recovery applications by providing users with more recovery options and the ability to fix their own PCs with confidence. 

In Windows 10, the Push-button reset features have been updated to include the following improvements: 

The Push-button reset user experience offers customization opportunities. Manufacturers can insert custom scripts, install applications or preserve additional data at available extensibility points. 
The following Push-button reset features are available to users with Windows 10 PCs: 

  - Refresh your PC 

    Fixes software problems by reinstalling the OS while preserving the user data, user accounts, and important settings. All other preinstalled customizations are restored to their factory state. In Windows 10, this feature no longer preserves user-acquired Universal Windows apps. 

  - Reset your PC

    Prepares the PC for recycling or for transfer of ownership by reinstalling the OS, removing all user accounts and contents (e.g. data, Classic Windows applications, and Universal Windows apps), and restoring preinstalled customizations to their factory state. 

  - Bare metal recovery 

    Restores the default or preconfigured partition layout on the system disk, and reinstalls the OS and preinstalled customizations from external media.

### Prepare ScanState 

To start working with Push Button Reset, you'll need to copy ScanState to _Data_.

Use scanstate to capture Classic Windows applications and settings on your image.

**Note**: You'll use your technician PC to prepare ScanState. 

1.	On Technician PC Insert USB-B
2.	Open Deployment and Imaging tools command prompt as administrator
3.	Run the copydandi.cmd script file pointing to USB-B key

    OEMs using an x64 Windows 10 image, make x64 Scanstate directory

    ```
    Copydandi.cmd amd64 e:\scanstate_amd64
    ```
    Where E: is the letter of USB-B drive.

    If you're using an x86 Windows 10 image, make x86 Scanstate directory:

    ```
    Copydandi.cmd x86 e:\scanstate_x86
    ```

    Where E: is the letter of USB-B drive.

### Create recovery package using Scanstate

**On your reference PC:**

Use ScanState to capture installed customizations into a provisioning package, and then save it to c:\Recovery\customizations. We'll use samples from _USB-B_\Recovery\RecoveryImage to create the provisioning package.

**Important:** For PBR to work properly, packages have to be .ppkg files that are stored in C:\Recovery\Customizations.

1.	Create the recovery OEM folder and copy contents of USB-B\Recovery\RecoveryImage

    **Important:** To retain the customized start layout menu during recovery the layoutmodification.xml needs to be copied again during recovery process. We'll copy it here and then use EnableCustomizations.cmd to copy it during recovery.
    ```
    Copy E:\Recovery\recoveryimage c:\recovery\OEM
    Copy E:\StartLayout\layoutmodification.xml c:\recovery\OEM
    ```

2.	Run ScanState to gather app and customizations

    For x64 Windows 10 PCs:

    ```
    mkdir c:\recovery\customizations
    E:\ScanState_amd64\scanstate.exe /apps /ppkg C:\Recovery\Customizations\apps.ppkg /i:c:\recovery\oem\regrecover.xml /config:E:\scanstate_amd64\Config_AppsAndSettings.xml /o /c /v:13 /l:C:\ScanState.log
    ```

    Where E: is the drive letter of USB-B

    For x86 Windows 10 PCs:
    ```
    E:\ScanState_x86\scanstate.exe /apps /ppkg C:\Recovery\Customizations\apps.ppkg /i:c:\recovery\oem\regrecover.xml /config:e:\scanstate_x86\Config_AppsAndSettings.xml /o /c /v:13 /l:C:\ScanState.log
    ```

    Where E: is the drive letter of USB-B

3. When ScanState completes successfully, delete scanstate.log and miglog.xml files:
    ```
    del c:\scanstate.log
    del c:\miglog.xml
    ```

### Create Extensibility scripts to restore additional settings

You can customize the Push-button reset experience by configuring extensibility points. This enables you to run custom scripts, install additional applications, or preserve additional user, application, or registry data.

During recovery, PBR calls EnableCustomizations.cmd which we'll configure to do 2 things:

1.	Copy the unattend.xml file used for initial deployment to the \windows\panther.
2.	Copy the layoutmodification.xml to the system.

**Note:** The Win10DepWhiPapForOEMsv1.01July2015 sample extensibility script used a command which no longer is needed. Please use the extensibility script from USB-B as sample for point for creating a new extensibility script.

This will restore the additional layout settings from these 2 answer files during PBR. 

**Important:** Recovery scripts and unattend.xml must be copied to c:\Recovery\OEM for PBR to pickup and restore settings defined in the unattend.xml.

### Copy a backup of WinRE

During a PC deployment, winre gets moved. Before you caputre a final image, you have to copy the backup of winre.wim back into Windows.

```
Copy e:\images\winre_bak.wim c:\windows\system32\recovery\winre.wim
```

## Reseal the image

1.  Delete the installation folders and files you have created for the preloaded applications. Extra folders may increase the size of the .wim when the Windows image gets captured.

2.  If Sysprep is open, close it and open an elevated command prompt.

3.	Copy unattend.xml to the recovery folder to enable recovery of unattend settings during Push Button Reset.

    ```
    copy USB-B\answerfiles\unattendsysprep.xml c:\Recovery\OEM\unattend.xml
    ```

4.  Generalize the image by using the answer file which reflects the changes made in the section [Update images manually by using AUDIT MODE (online servicing)](#update-images-manually-by-using-audit-mode-online-servicing).

    These changes include Microsoft Office tile component pinned to the Start screen.

    ```
    Cmd /c C:\Windows\System32\Sysprep\sysprep /unattend:c:\Recovery\OEM\Unattend.xml /generalize /oobe /shutdown
    ```

5.  Boot reference computer and connect USB-A.

6.  After WinPE has been booted connect USB-B.

7.  Type *diskpart* and hit enter to start Diskpart. Then type *list volume* to identify volume label of Windows Installation volume labelled “Windows” (For example: E:\). Finally type *exit* to quit Diskpart.

8.  Start cleanup of the image.

    Important: By default, non-major updates (such as ZDPs, or LCUs) are not restored. To ensure that updates preinstalled during manufacturing are not discarded after recovery, they should be marked as permanent by using the /Cleanup-Image command in DISM with the /StartComponentCleanup and /ResetBase options. Updates marked as permanent are always restored during recovery. 

    ```
    MD e:\scratchdir
    dism /Cleanup-Image /Image:e:\ /StartComponentCleanup /resetbase /scratchdir:e:\scratchdir
    ```

9.  Capture the image of the windows partition. This process takes several minutes.
    ```
    dism /Capture-Image /CaptureDir:E:\ /ImageFile:F:\Images\ModelSpecificImage.wim /Name:"myWinImageWithMSIUpdated" /scratchdir:e:\scratchdir
    ```
    Where E: is the volume label of Windows and F is the volume label of USB-B.

    This will overwrite the image created in the section [Deploy the image to new computers](#deploy-the-image-to-new-computers-windows-installation).

## Deploy the image 

Use the deployment script to layout the partitions on the device and apply the image. The walkthrough-deploy.bat in USB-B\deployment folder will partition the device based on device mode.

**Important: The Recovery partition must be the partition after the Windows partition to ensure winre.wim can be kept up-to-date during the life of the device.**

In Windows 10 Version 1703, we are changing our recommendation to have the WinRE partition placed after the OS partition. This allows future growth of the WinRE partition during updates. Today with the WinRE partition at the front of the disk, the size of it can never be changed, making it difficult to update WinRE when needed. We will continue to support having the WinRE partition located in different parts of the disk, but we encouraging you to follow the new recommendation.

Run the following command to deploy your image to the reference PC:
```    
E:\Deployment\walkthrough-deploy.bat E:\Images\modelspecificimage.wim
```

Note: There are several pauses in the script. You will be prompted Y/N for the Apply operation if this is a Compact OS deployment.

Note: Only use Compact OS on high end storage devices because Compact OS performance depends on the storage device capabilities. Compact OS is NOT recommend on rotational devices or storage greater than 32 GB. For more information, see [Compact OS](compact-os.md).

Remove USB-A and USB-B and type *exit* to reboot your computer with Windows 10.

## Finalize deployment

1.  Upon deploying your model specific image to destination computers, boot the computer with master image for the first time in AUDIT mode

    Important: In order to minimize the first boot time, (Boot > Specialize > OOBE > Start screen) specialize pass must be completed in the factory. Specialize pass will configure hardware specific information which Windows will run on.

    For more information about the first boot time requirements, see [Windows Policy for System Builders](http://www.microsoft.com/oem/en/pages/download.aspx?wpid=w_w8_008).

1.  Please note that at the end of the section [Update images manually by using AUDIT MODE (online servicing)](#update-images-manually-by-using-audit-mode-online-servicing), the system was sealed with OOBE mode. Please proceed with Audit. If the system boots in OOBE, press Ctrl+Shift+F3 in order to pass OOBE and boot in audit mode.

2.  If you want to apply additional steps, such as executing OEM diagnostics tests and so on, apply them here.

3.  Finally, run the Sysprep tool (C:\Windows\System32\Sysprep\sysprep.exe) and seal the system back to **OOBE** and **Shutdown** but *without* **Generalize**.

4.  The system is ready to ship.

    Important: If you are manufacturing a small amount of devices without using an image managing tool such as disk duplicators or Windows Deployment Service, you can choose to use the following practice:

    1. You can manufacture those devices by first booting in WinPE - inserting USB-A. 
    2. Then insert USB-B where final manufacturing image is contained. 
    3. Run Walktrough-Deploy script to apply the image. 
    4. After you applied the image, follow the steps in this Finalize deployment section. 
    5. Now the device is ready to be shipped with your final manufacturing image and PBR feature implemented. 
    6. Finally, replicate the same procedure with the other devices.

## Appendix

### Differences between 64-bit and 32-bit deployment

It is recommended to consider 64-bit deployment versus 32-bit deployment disk footprint according to the storage of the device you are manufacturing.

The overall deployment flow mentioned in this guide doesn’t differ between 64-bit and 32-bit deployment. Only some of the resource versions and the way those resources are created differs. The following table covers the x64/x86 distinctions.

| **Distinction**                         | **Description**                                                                                                                                                                                                                                                                              | **Related Section**                  |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------|
| Windows installed on Technican Computer | When Windows ADK gets installed on a technican computer the the deployment tools in the ADK would be installed according to the architecture of the Windows on technician computer. In short if ADK is installed on Windows x64, the tools would be installed 64-bit version, or vice-versa. | [Prepare your lab environment](#prepare-your-lab-environment)         |
| Creating WinPE folder structure         | WinPE differs between x64 and x86 architecture, so you have to use different commands to create a different WinPE folder for each architecture.                                                                                                                                                    | [Create WinPE bootable USB](#create-a-usb-drive-that-can-boot-to-winpe) |
| Drivers                                 | Driver versions differ between different architectures. If you are manufacturing a 64-bit Windows image, please use x64 drivers, and vice-versa for 32-bit Windows.                                                                                                                                                   | [Add drivers](#add-drivers)         |
| Update Packages for Windows Image       | Update package versions differ between different architectures. If you are manufacturing a 64-bit Windows image please use x64 update packages, and vice-versa for 32-bit Windows.                                                                                                                                   | [Add update packages](#add-update-packages) |
| Language Interface Packs                | IF you will be using x64 Windows 10 image, install x64 LIPs or if you will be using x86 Windows 10 image install x86 LIPs.                                                                                                                                                                    | [Prepare the system for recovery with Push-button reset](#prepare-the-system-for-recovery-with-push-button-reset)                          |

### What you will need and where to get it

Before starting the deployment procedure OEM requires to download certain kits which will be used throughout the guide, such as Microsoft Office Single Image v15.4, update packages, language interface packs etc… Below is the complete list of resources/kits an OEM requires to download and where they download them.

| Resource/Kit  |   Available at    | Related section   |
|---------------|-------------------|-------------------|
| Windows 10 ADK|   [Download the Windows ADK](https://developer.microsoft.com/en-us/windows/hardware/windows-assessment-deployment-kit) | [Create WinPE bootable USB](#create-a-usb-drive-that-can-boot-to-winpe) |
| Windows 10 x64/x86 DVD Media (desired language) | Obtain Windows 10 media which you will be customizing from Microsoft Authorized Distributor | [Install Windows with basic customizations](#install-windows-with-basic-customizations) |
| Windows 10 Default Product Keys | Default Product Keys are located at [Device Partner Center](https://dpcenter.microsoft.com/en/Windows/Build/cp-windows-10-build) listed under **Default product keys** tab | [Customize the answer file](#customize-the-answer-file) |
| Language interface packs | LIPs are located at [Device Partner Center](https://dpcenter.microsoft.com/en/Windows/Build/cc-windows-10-v1703-lip) listed under **LIPs** tab | [Prepare the system for recovery with Push Button Reset](#prepare-the-system-for-push-button-reset) |
| Update Packages | Obtain update packages by downloading from [Microsoft Update Catalog](http://catalog.update.microsoft.com/v7/site/Home.aspx). The detailed procedure downloading update packages is mentioned in the releated section. | [Add language interface packs](#add-language-interface-packs) |
| Microsoft Office v16.3 | Obtain Microsoft Office v15.4 by downloading from [Device Partner Center](https://dpcenter.microsoft.com/en/Office/Build/cc-microsoft-office-v16-3-opk) | [Preload Microsoft Office single image v15.4 OPK](https://dpcenter.microsoft.com/en/Office?tag=%7b889D6CB8-8AC1-4D27-85F8-7DDE73EF3DAF%7d&mode=0#filters) |


## References

[Windows Guidelines for System Builders](http://www.microsoft.com/oem/en/pages/download.aspx?wpid=w_w8_129)

[Windows Policy for System Builders](http://www.microsoft.com/oem/en/pages/download.aspx?wpid=w_w8_008)


