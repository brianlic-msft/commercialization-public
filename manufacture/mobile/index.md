---
author: kpacquer
Description: 'After you have a completed the steps covered in the other guides to prepare the device, the focus shifts to preparing the device for the final retail configuration.'
ms.assetid: f781b171-d37c-4b03-8e8b-da6d2e5d35b4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Mobile manufacturing
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mobile manufacturing


After you have a completed the steps covered in the other guides to prepare the device, the focus shifts to preparing the device for the final retail configuration.

During this process, you set the final configuration values, remove debug logging, and optimize the OS for shipment. Next, you determine how the OS will be transferred to the device hardware in the manufacturing line.

## <span id="Manufacturing_acronyms"></span><span id="manufacturing_acronyms"></span><span id="MANUFACTURING_ACRONYMS"></span>Manufacturing acronyms


Here are some common acronyms that might come in handy.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>ATE</strong></p></td>
<td align="left"><p>automated test equipment</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>BER</strong></p></td>
<td align="left"><p>bit error rate</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>BIST</strong></p></td>
<td align="left"><p>built-in self-test</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>COT</strong></p></td>
<td align="left"><p>cost of test</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>CIT Testing</strong></p></td>
<td align="left"><p>computer interactive testing—semi-automated testing of the device. During this stage, the device is connected to a PC or workstation</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>DIB</strong></p></td>
<td align="left"><p>device interface board</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>DFT</strong></p></td>
<td align="left"><p>designed for test</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>DUT</strong></p></td>
<td align="left"><p>device under test</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>ESD</strong></p></td>
<td align="left"><p>electrostatic discharge</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>EVM</strong></p></td>
<td align="left"><p>error vector magnitude</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>FA</strong></p></td>
<td align="left"><p>final assembly</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>FQC</strong></p></td>
<td align="left"><p>final quality check</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>NIST</strong></p></td>
<td align="left"><p>National Institute of Standards and Technology</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>OOBT</strong></p></td>
<td align="left"><p>out-of-the-box test</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>PIB</strong></p></td>
<td align="left"><p>probe interface board</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>RTC</strong></p></td>
<td align="left"><p>real-time clock—on-board hardware clock used to track the current time</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>SCM</strong></p></td>
<td align="left"><p>subcontract manufacturer</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>SOC</strong></p></td>
<td align="left"><p>system on a chip</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>UPH</strong></p></td>
<td align="left"><p>units per hour</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>UUT</strong></p></td>
<td align="left"><p>unit under test</p></td>
</tr>
</tbody>
</table>

 

## <span id="General_manufacturing_guidance"></span><span id="general_manufacturing_guidance"></span><span id="GENERAL_MANUFACTURING_GUIDANCE"></span>General manufacturing guidance


The goal for Windows 10 Mobile is that partners are successful in establishing efficient and effective processes that span manufacturing, testing, and servicing. To that end, Microsoft will provide guidance on the tools and process that are used for manufacturing and support of a Windows 10 Mobile device. This guidance describes the tools and techniques that are available to OEMs during the manufacturing process.

-   [Manufacturing workflow](#manufacturing-workflow)

-   [Example test area by manufacturing phase](#example-test)

-   [Using a host computer to reboot a phone to flashing mode and get version information](using-a-host-computer-to-reboot-a-phone-to-flashing-mode-and-get-phone-version-information.md)

## <span id="Manufacturing_security_requirements"></span><span id="manufacturing_security_requirements"></span><span id="MANUFACTURING_SECURITY_REQUIREMENTS"></span>Manufacturing security requirements


Final retail images must be configured to meet a set of security requirements. To help OEMs ensure that their retail images meet these requirements, Windows 10 Mobile automatically checks for some of these requirements during first boot. Other requirements must be verified by OEMs.

## <span id="Mobile_deployment_and_imaging"></span><span id="mobile_deployment_and_imaging"></span><span id="MOBILE_DEPLOYMENT_AND_IMAGING"></span>Mobile deployment and imaging


Getting ready to build and test Windows 10 for mobile editions? Here's a lab that walks through building new mobile devices and customizing them to meet your customers' needs.

-   [Mobile deployment and imaging](mobile-deployment-and-imaging.md)

## <span id="Manufacturing_mode_of_the_full_operating_system"></span><span id="manufacturing_mode_of_the_full_operating_system"></span><span id="MANUFACTURING_MODE_OF_THE_FULL_OPERATING_SYSTEM"></span>Manufacturing mode of the full operating system


Manufacturing mode is a mode of the full operating system that can be used for manufacturing-related tasks, such as component and support testing.

-   [Manufacturing Mode](manufacturing-mode.md)

-   [Boot mode management UEFI protocol](boot-mode-management-uefi-protocol.md)

## <span id="Microsoft_Manufacturing_OS__MMOS_"></span><span id="microsoft_manufacturing_os__mmos_"></span><span id="MICROSOFT_MANUFACTURING_OS__MMOS_"></span>Microsoft Manufacturing OS (MMOS)


Microsoft Manufacturing OS (MMOS) is an optimized configuration of the operating system that facilitates efficient manufacturing.

-   [Microsoft Manufacturing OS](microsoft-manufacturing-os.md)

-   [MMOS image definition](mmos-image-definition.md)

-   [Flash MMOS to the device](flash-mmos-to-the-phone.md)

-   [Develop MMOS test applications](develop-mmos-test-applications.md)

-   [Manufacturing test environment supported APIs](manufacturing-test-environment-supported-apis.md)

-   [Deploy and test a user-mode test application in MMOS](deploy-and-test-a-user-mode-test-application-in-mmos.md)

-   [Working with WIM MMOS images](working-with-wim-mmos-images.md)

## <span id="Flashing_tools"></span><span id="flashing_tools"></span><span id="FLASHING_TOOLS"></span>Flashing tools


You can develop a custom flashing tool to address the life cycle needs of the device

-   [Flashing tools](flashing-tools.md)

-   [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md)

<a name="manufacturing-workflow"></a>
## Manufacturing workflow


OEMs need to determine the manufacturing process to use to implement MMOS in their manufacturing facilities.

To discuss the manufacturing process, a simplified model of the manufacturing line workflow will be used. Note that each OEM will have a unique process; this simplified model is used as a common reference point.

### <span id="Simple_factory_flow"></span><span id="simple_factory_flow"></span><span id="SIMPLE_FACTORY_FLOW"></span>Simple factory flow

![oem\-manu\-simple\-factory\-flow\-apollo](images/oem-manu-simple-factory-flow-apollo.png)

**Board tests/SMT** – Image is flashed via gang programmer.

**Final assembly, Boot** – Marry board with plastic; the first time the device is booted on the manufacturing floor.

**Manual tests** – Line worker runs device tests such as sound, vibration, camera, keyboard, and so on.

**RF/Call testing** – Automated testing in which the device is tethered to enable power and the recording of test data.

**Final provisioning** – Automated process where IMEI data is written, customizations are loaded, and labeling is completed.

**Final QA/Packaging** – Final manual verification of the device, then packaging.

**Random sample testing** – A specified number of devices are removed from packaging and tested. If failures reach a certain threshold, the entire line may be recalled.

### <span id="Manufacturing_process_options"></span><span id="manufacturing_process_options"></span><span id="MANUFACTURING_PROCESS_OPTIONS"></span>Manufacturing process options

Each manufacturer has different techniques and tooling that they use to manufacture Windows 10 Mobile devices. Two options are described here, but the OEM is encouraged to combine approaches and innovate as needed. The best technical expertise regarding manufacturing resides with those who built the OEM manufacturing line. Select the guidance that works for your manufacturing processes and business.

A summary of two example manufacturing processes is provided here.

### <span id="Manufacturing_process_option_1__boot_from_WIM_MMOS_image"></span><span id="manufacturing_process_option_1__boot_from_wim_mmos_image"></span><span id="MANUFACTURING_PROCESS_OPTION_1__BOOT_FROM_WIM_MMOS_IMAGE"></span>Manufacturing process option 1: boot from WIM MMOS image

You can temporarily copy a WIM (Windows Imaging) Microsoft Manufacturing OS (MMOS) image over to a device and then boot to that image that is running in volatile RAM memory. For more information about MMOS, see [Microsoft Manufacturing OS](microsoft-manufacturing-os.md).

Because the test WIM MMOS image that will never ship is used on the device, this approach enables the provisioning of additional manufacturing tools (transports, extenders). Also, OEMs can use any functional native APIs in the test image. Additional factory test-only drivers or other software can be included in the WIM MMOS image.

One advantage of using this approach is that booting from a WIM Image in RAM is faster than flashing the image.

![oem\-manu\-factory\-processes\-wim\-mmos](images/oem-manu-factory-processes-wim-mmos.png)

For more info, see [Working with WIM MMOS images](working-with-wim-mmos-images.md).

### <span id="Manufacturing_process_option_2__reflash_the_device"></span><span id="manufacturing_process_option_2__reflash_the_device"></span><span id="MANUFACTURING_PROCESS_OPTION_2__REFLASH_THE_DEVICE"></span>Manufacturing process option 2: reflash the device

This process uses two images: one for factory testing, and a final golden image for the final shipping device. Like the MMOS WIM image, the test image that will never ship is used on the device. This mean that additional manufacturing tools (transports, extenders) can be included and manufacturing only native APIs can be called.

![oem\-manu\-simple\-refresh\-flow\-apollo](images/oem-manu-simple-refresh-flow-apollo.png)

This approach makes it possible, if appropriate, to use a different version of the operating system for testing. This may be a useful interim measure as test applications are being migrated to Windows 10 Mobile.

One tradeoff in this approach is that the manufacturing line must be designed to accommodate the reflashing time that occurs near the end of the manufacturing process.

For more info on working with the flashing tools, see [Flashing tools](flashing-tools.md).


<a name="example-test"></a>
## Example test area by manufacturing phase


Test area by manufacturing phase is provided only as an example; each manufacturer may wish to sequence the tests differently.

**Modem testing (RF / cellular testing)**

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>Modem RF calibration</p></td>
</tr>
<tr class="even">
<td align="left"><p>Wi-Fi RX/TX Power</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bluetooth RX/TX Power</p></td>
</tr>
</tbody>
</table>

 

**Device testing**

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>Display</p></td>
</tr>
<tr class="even">
<td align="left"><p>Keypad</p></td>
</tr>
<tr class="odd">
<td align="left"><p>SIM interface</p></td>
</tr>
<tr class="even">
<td align="left"><p>Storage card</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Camera</p></td>
</tr>
<tr class="even">
<td align="left"><p>RTC</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Speaker</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microphone</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sensor – ALS</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sensor – Magnetometer</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sensor – Proximity</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sensor – Accelerometer</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Handset interface</p></td>
</tr>
<tr class="even">
<td align="left"><p>Power - stand by current</p></td>
</tr>
</tbody>
</table>

 

**Device provisioning**

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>IMEI</p></td>
</tr>
<tr class="even">
<td align="left"><p>SIM Lock</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bluetooth MAC</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sensors calibration</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Security provisioning</p></td>
</tr>
<tr class="even">
<td align="left"><p>MO provisioning</p></td>
</tr>
</tbody>
</table>

 

 

 





