---
author: kpacquer
Description: Developing custom OEM flashing tools
ms.assetid: 121f6c72-5d87-4391-9b40-dbd89e57a826
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Developing custom OEM flashing tools
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Developing custom OEM flashing tools


OEMs can use the full flash update (FFU) image format and simple UEFI USB protocols to create custom flashing tools. An OEM custom flashing tool can integrate in with existing systems and support a range of scenarios discussed in [Flashing tools](flashing-tools.md).

## <span id="UEFI_flashing_application"></span><span id="uefi_flashing_application"></span><span id="UEFI_FLASHING_APPLICATION"></span>UEFI flashing application


The OEM must flash the device from a UEFI application using a specific image layout that is discussed in [FFU image format](ffu-image-format.md).

This diagram summarizes the communication flow from the PC flashing tool to the device using the UEFI simple Windows Phone I/O protocol.

![oem\-manu\-simpleio](images/oem-manu-simpleio.png)

For more info on available USB APIs see, [UEFI flashing protocols](https://msdn.microsoft.com/windows/hardware/dn917884.aspx).

## <span id="PC_flashing_application"></span><span id="pc_flashing_application"></span><span id="PC_FLASHING_APPLICATION"></span>PC flashing application


The image is transferred to the device that is running the UEFI flashing application using a simple PC side client program. The PC application establishes a USB connection to the device and writes the data over that connection. The validation and verification of the image occurs in the UEFI flashing application running on the device.

The following diagram summarizes the overall flow of the OEM custom flashing PC application and the UEFI application.

![oem\-manu\-pc\-flashing](images/oem-manu-pc-flashing.png)

**Note**  
This diagram illustrates one possible solution. The OEM is encouraged to modify this approach to create an optimal solution that best suits their needs.

 

## <span id="Checking_SMBIOS_values_before_flashing"></span><span id="checking_smbios_values_before_flashing"></span><span id="CHECKING_SMBIOS_VALUES_BEFORE_FLASHING"></span>Checking SMBIOS values before flashing


To ensure that the correct image is flashed to the proper device, the OEM must check the SMBIOS system information structure values on the device. The check must confirm that the device platform ID values in the image, matches the SMBIOS system information structure values on the phone. Either the Manufacturer.Family.ProductName.Version or Manufacturer.Family.ProductName from SMBIOS must match the value in the image before flashing can proceed.

The device platform ID string is shown below.

**Manufacturer.Family.ProductName.Version**

### <span id="Engineering_devices_and_blank_device_IDs"></span><span id="engineering_devices_and_blank_device_ids"></span><span id="ENGINEERING_DEVICES_AND_BLANK_DEVICE_IDS"></span>Engineering devices and blank device IDs

With a new engineering device, the OEM can use the SMBIOS values to determine if it is acceptable to flash an image that contains test signed certificates. The OEM may determine that test signed images may have blank system information structure values, where production signed images must have SMBIOS system information structure values that have been populated.

## <span id="Implementing_signed_image_validation"></span><span id="implementing_signed_image_validation"></span><span id="IMPLEMENTING_SIGNED_IMAGE_VALIDATION"></span>Implementing signed image validation


FFU images contain elements such as hashes, signatures and catalogs, which must be used to validate the image. For more info, see [Implementing image integrity validation in custom flashing tools](implementing-image-integrity-validation-in-custom-flashing-tools.md).

## <span id="UEFI_flashing_protocols"></span><span id="uefi_flashing_protocols"></span><span id="UEFI_FLASHING_PROTOCOLS"></span>UEFI flashing protocols


<span id="UEFI_USB_function_protocol"></span><span id="uefi_usb_function_protocol"></span><span id="UEFI_USB_FUNCTION_PROTOCOL"></span>[UEFI USB function protocol](https://msdn.microsoft.com/library/windows/hardware/dn789231)  
Describes the **EFI\_USBFN\_IO\_PROTOCOL**.

<span id="UEFI_simple_I_O_protocol"></span><span id="uefi_simple_i_o_protocol"></span><span id="UEFI_SIMPLE_I_O_PROTOCOL"></span>[UEFI simple I/O protocol](https://msdn.microsoft.com/library/windows/hardware/dn772121)  
Describes the **EFI\_SIMPLE\_WINPHONE\_IO\_PROTOCOL**.

<span id="UEFI_check_signature_protocol"></span><span id="uefi_check_signature_protocol"></span><span id="UEFI_CHECK_SIGNATURE_PROTOCOL"></span>[UEFI check signature protocol](https://msdn.microsoft.com/library/windows/hardware/dn772115)  
Describes the **EFI\_CHECKSIG\_PROTOCOL**.

## <span id="related_topics"></span>Related topics


[Flashing tools](flashing-tools.md)

[Manufacturing](index.md)

 

 






