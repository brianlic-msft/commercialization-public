---
title: Use the flashing tools provided by Microsoft
description: Use the flashing tools provided by Microsoft
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: deb8960a-18b0-447d-ba6d-5611def266c0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use the flashing tools provided by Microsoft


Microsoft provides a tool set for flashing images to devices. This tool set includes ffutool.exe, a command-line tool that runs on the development computer, and ffuloader.efi, a device-side UEFI flashing application. This topic describes how to set up your device and development computer to use this tool set, and provides usage instructions.

**Important**  
-   In Windows 10, version 1607, ffutool.exe is installed by the Assessment and Deployment Kit (ADK). In earlier versions of Windows 10, ffutool.exe is installed by the Windows Driver Kit (WDK), Enterprise WDK (EWDK), or Windows Hardware Lab Kit (HLK).

-   The device-side UEFI flashing application from Microsoft is automatically included in all images. This application must be included in all retail devices.

-   For flashing images to devices during manufacturing, OEMs can build their own flashing tools by using the information provided in [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md) or by using ffutool.exe. If you use ffutool to flash your image, it might be slower than other flashing tools.

 

## <a href="" id="initialdevicesidesetup"></a>Initial device-side setup


To prepare a device for flashing with a Windows 10 Mobile image, perform the following steps:

1.  Use tools provided by the SoC vendor to get a UEFI onto any device that needs to be flashed. Devices must be bootable at least to the UEFI for flashing to work.

    Typically, this is performed with the eMMC software downloader. This UEFI should be the same UEFI that is included in device images.

2.  After a bootable UEFI is in place, the flashing application (ffuloader.efi) and supporting simple I/O driver (efisimpleio.dll) must be added to the device and run on boot. To do this, run the apply-ffubinaries.bat script while the device is connected to the development computer. All of these files are provided the kit in %ProgramFiles(x86)%\\Windows Kits\\10\\Tools\\bin\\i386.

    The apply-ffubinaries.bat script copies ffuloader.efi and efisimpleio.dll to the root of the ESP directory on the device and sets up the boot configuration database to immediately enter flashing mode on boot. This script requires bcdedit.exe in the path.

**Note**  
These steps only need to be performed once on each device. After these steps are completed, you will be able to flash different images to the device

 

## <a href="" id="hostsidesetup"></a>Host-side setup


Flashing on the host side is performed by using a connection established with WinUSB, the Microsoft generic USB device driver. The necessary drivers are included by default in Windows 8 and later.

In Windows 7, the necessary drivers can be installed from Windows Update. To configure a Windows 7 computer to install the necessary drivers:

1.  Click Start.

2.  Type **Device Installation Settings**.

3.  Select **Yes, do this automatically (recommended)**.

4.  Click **Save Changes**.

## <a href="" id="flashingprocedure"></a>Flashing procedure


After the device-side and host-side setup is complete, perform the following steps to flash a device:

1.  Boot the device into the FFU download mode while it is connected to the host computer. There are several ways to force the device into the FFU download mode during boot:

    -   Include the Microsoft.BCD.Lab.spkg package in your image by specifying the **LABIMAGE** optional feature when generating the test image. When this package is included in the test image, the device automatically enters the FFU download mode when it is booted. For more information about generating an image, see [Building a phone image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).

    -   To force the device into the FFU download mode manually, press and release the power button to boot the device, and then immediately press and hold the volume up button. This option is available only after an initial FFU has been flashed to the device.

2.  Run ffutool.exe from the command line to flash an image. This program is in %ProgramFiles(x86)%\\Windows Kits\\10\\Tools\\bin\\i386. The following is a usage example.

    ``` syntax
    ffutool -flash <FFU file>
    ```

    The following table describes the command-line parameters for ffutool.exe.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Parameter</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><strong>-flash</strong> <em>FFU file</em></p></td>
    <td><p>Specifies the path to the FFU file to be flashed to the device.</p></td>
    </tr>
    <tr class="even">
    <td><p><strong>-skip</strong></p></td>
    <td><p>For devices that include the <strong>LABIMAGE</strong> optional feature to automatically boot into the FFU download mode, this parameter boots into the main OS (skipping the FFU download mode).</p></td>
    </tr>
    </tbody>
    </table>

     

You can flash more than one device at a time by using ffutool.exe. To do this, make sure that all devices are connecting before running ffutool.exe. Also, we recommend that you use a USB card that contains a dedicated root hub per port so an issue flashing one device does not affect all devices.

**Note**  
Flashing speed will decrease as you add devices.

 

## <a href="" id="validatingplatformid"></a>Validations performed by the Microsoft flashing tool


Before flashing an image, the device-side UEFI flashing application provided by Microsoft performs the following validations on the image:

-   The application validates the image signatures against the Platform Key (PK) certificate and the Microsoft Windows Phone Production PCA 2012 certificate (for retail images) or Microsoft Test Root Authority certificate (for non-retail images).

-   The application validates the hashes of each chunk of data in the image against the table of hashes signed by the catalog file.

-   The application validates that the image supports the current device platform. To perform this validation, the application compares several values in the SMBIOS system information structure with corresponding values in the device platform package. These checks help to ensure that an image can be flashed to a particular device only if it was built for the corresponding device platform. More details about these checks are provided below.

### Device platform validation checks

To validate that the image supports the current device platform before flashing, the application performs the following tasks:

1.  It retrieves the **DevicePlatformID** string from the device platform package in the image that is being flashed. For more information about this string, see [Set device platform information](set-device-platform-information.md).

2.  If the string has the format *Manufacturer*.*Family*.*Product Name*.*Version* and all four values in the string match the corresponding *Manufacturer*, *Family*, *Product Name*, and *Version* SMBIOS values on the device, the platform validation succeeds and the flashing operation continues.

3.  If the string has the format *Manufacturer*.*Family*.*Product Name* and all three values in the string match the corresponding *Manufacturer*, *Family*, and *Product Name* SMBIOS values on the device, the platform validation succeeds and the flashing operation continues.

4.  Otherwise, the platform validation fails and the image is not flashed to the device.

In a non-retail image, OEMs can disable the device platform validation for flashing by adding the DISABLE\_FFU\_PLAT\_ID\_CHECK feature to the OEMInput file that is used to generate the image.

**Important**  
The device platform validation for flashing must not be disabled in retail images.

 

## FFU tool error codes


When using the FFU tool to flash an image to your device, you may encounter an error as shown below.

``` syntax
Error: Failed to flash with device error { 0x18, 0x0, 0x0, 0x2, 0xa, 0x5 }
```

The first hexadecimal number is an event code that indicates the type of flashing failure. The following table provides a description of the FFU tool flashing errors.

**Common errors**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Error code</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0xC</p></td>
<td><p>While applying the image to disk, a read failed to return all of the blocks specified in the current data descriptor.</p>
<p>This error is typically cause by a corrupted image. The image will normally need to be rebuilt. For more information, see [Building a phone image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).</p></td>
</tr>
<tr class="even">
<td><p>0x18</p></td>
<td><p>While initializing hash checks, a catalog signature check failed.</p>
<p>When this error occurs, it is typically related to the signing of the image. For more information, see [Sign a full flash update (FFU) image](sign-a-full-flash-update--ffu--image.md).</p></td>
</tr>
<tr class="odd">
<td><p>0x1C</p></td>
<td><p>One or more write descriptors refer to invalid disk locations.</p>
<p>This error typically indicates that the image was built for a phone with more storage than the current phone actually has. Either locate the proper image or update the image that you have by reducing the MinSectorCount specified in OEMDevicePlatform.xml. For more information, see [Set device platform information](set-device-platform-information.md).</p></td>
</tr>
</tbody>
</table>

 

**Additional errors**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Error code</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>An invalid binary manifest header was read while preparing to flash the device.</p></td>
</tr>
<tr class="even">
<td><p>0x9</p></td>
<td><p>The application failed to allocate enough memory to copy the disk write descriptor table.</p></td>
</tr>
<tr class="odd">
<td><p>0xB</p></td>
<td><p>Before writing data, the flashing application failed to read all the disk write descriptors.</p></td>
</tr>
<tr class="even">
<td><p>0xD</p></td>
<td><p>While applying the image to disk, a block write operation failed.</p></td>
</tr>
<tr class="odd">
<td><p>0xE</p></td>
<td><p>A packet read by the flashing application contained an invalid checksum.</p></td>
</tr>
<tr class="even">
<td><p>0xF</p></td>
<td><p>While preparing to flash the image, the flashing application was unable to read the full security header.</p></td>
</tr>
<tr class="odd">
<td><p>0x10</p></td>
<td><p>While preparing to flash the image, the flashing application read an invalid security header.</p></td>
</tr>
<tr class="even">
<td><p>0x11</p></td>
<td><p>While preparing to flash the image, the flashing application failed to read the expected amount of padding after the security header.</p></td>
</tr>
<tr class="odd">
<td><p>0x12</p></td>
<td><p>While preparing to flash the image, the flashing application read an invalid image header.</p></td>
</tr>
<tr class="even">
<td><p>0x13</p></td>
<td><p>While preparing to flash the image, the flashing application failed to read the expected amount of padding after the image header.</p></td>
</tr>
<tr class="odd">
<td><p>0x14</p></td>
<td><p>While preparing to apply the image to disk, the block flasher failed to buffer enough bytes in the stream to flash safely.</p></td>
</tr>
<tr class="even">
<td><p>0x15</p></td>
<td><p>While applying the image to disk, the block flasher reached the end of the data stream unexpectedly. This indicates an image was built incorrectly.</p></td>
</tr>
<tr class="odd">
<td><p>0x16</p></td>
<td><p>The platform ID specified in the image does not match the ID of the device to be flashed.</p></td>
</tr>
<tr class="even">
<td><p>0x17</p></td>
<td><p>While reading image data, a hash check failed.</p></td>
</tr>
<tr class="odd">
<td><p>0x1A</p></td>
<td><p>Failed to acquire a handle to the UEFI firmware de-synchronization event.</p></td>
</tr>
<tr class="even">
<td><p>0x1B</p></td>
<td><p>Failed to query the BCD for the platform ID check settings.</p></td>
</tr>
<tr class="odd">
<td><p>0x1D</p></td>
<td><p>The image does not have Reset Protection enabled or an unsupported Reset Protection image was used.</p></td>
</tr>
<tr class="even">
<td><p>0x20</p></td>
<td><p>The image cannot be flashed on removable media.</p></td>
</tr>
<tr class="odd">
<td><p>0x21</p></td>
<td><p>Cannot use an optimized flashing method.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Building and flashing images](building-and-flashing-images.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Use%20the%20flashing%20tools%20provided%20by%20Microsoft%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





