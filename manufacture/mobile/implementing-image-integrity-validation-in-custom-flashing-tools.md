---
author: kpacquer
Description: Implementing image integrity validation in custom flashing tools
ms.assetid: 0885d221-e9c6-4fe1-987b-34781546ba07
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Implementing image integrity validation in custom flashing tools
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Implementing image integrity validation in custom flashing tools


The FFU image contains a signed catalog file, a hash within the catalog, and a table of hashes corresponding to each chunk of the image. The hash table contents are generated using the SHA256 secure hash algorithm. Three checks must be performed before the image is flashed:

-   **Catalog signature validation** - Validating the signature of the signed catalog file helps to verify that the image came from a trusted source.

-   **Hash of the table of hashes validation** - Validating the hash of the table of hashes in the table helps to verify that the image has not been tampered with.

-   **Data chunk validation using the hash table entries** - The FFU application must check each chunk against its corresponding chunk hash before flashing the image to the device.

## <span id="Checking_the_signature_on_the_catalog_and_checking_the_hash_of_the_table_of_hashes"></span><span id="checking_the_signature_on_the_catalog_and_checking_the_hash_of_the_table_of_hashes"></span><span id="CHECKING_THE_SIGNATURE_ON_THE_CATALOG_AND_CHECKING_THE_HASH_OF_THE_TABLE_OF_HASHES"></span>Checking the signature on the catalog and checking the hash of the table of hashes


The goal in signature validation is to make sure that the signature in the catalog matches the PK certificate on the phone. This approach allows checking for a signature up front without having the full image on the device before flashing. The signature check assumes that catalog contains a SHA1 hash.

Microsoft provides a UEFI protocol which exposes a function for this purpose, EFI\_CHECK\_SIG\_AND\_HASH. For more information, see [UEFI check signature protocol](https://msdn.microsoft.com/library/windows/hardware/dn772115). This function also validates the hash of the table of hashes.

**Example code flow**

1.  Establish pointers to catalog and hash table data.

2.  Determine the size of the catalog and hash table data in bytes.

3.  Use the [UEFI check signature protocol](https://msdn.microsoft.com/library/windows/hardware/dn772115) to call EFI\_CHECK\_SIG\_AND\_HASH, passing the pointers and data sizes.

4.  Based on the EFI return code either continue to process the image, or post a security message such as EFI\_SECURITY\_VIOLATION.

**Note**  
If secure boot is not enabled on the device, a signature check in not performed.

 

## <span id="Checking_the_data_against_the_hash_table_entries"></span><span id="checking_the_data_against_the_hash_table_entries"></span><span id="CHECKING_THE_DATA_AGAINST_THE_HASH_TABLE_ENTRIES"></span>Checking the data against the hash table entries


The OEM flashing tool must check the data against the hash table entries. For info about the flashing tool, [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md).

**Example code flow**

A number of valid approaches can be used; an example is provided here to serve as a common point of reference.

1.  Get the new hash data from the hash table in the image header.

2.  Set up a loop to process chunks of data in the image.

3.  Get a pointer to the hash of the current chunk of data.

4.  Compare the hash of the current chunk of data against the hash table data using a function such as **memcmp**.

5.  If the two hashes match, increment the pointer and get ready to check the next chunk of data.

6.  If the two hashes do not match, stop all processing of the image and post a security message such as **EFI\_SECURITY\_VIOLATION**.

7.  Continue processing until there is no more data in the image to process.

For info on the FFU elements discussed here, see [FFU image format](ffu-image-format.md).

## <span id="Error_handling"></span><span id="error_handling"></span><span id="ERROR_HANDLING"></span>Error handling


Standard error handling code techniques should be used. A few common situations to handle are listed here:

-   Missing catalog data

-   Insufficient resources

-   Empty image

## <span id="Clean_up_and_exit"></span><span id="clean_up_and_exit"></span><span id="CLEAN_UP_AND_EXIT"></span>Clean up and exit


Follow standard practice and clean up any created arrays or other objects before exiting the flashing code. The exit process should return the final **EFI\_STATUS** value. For example, if the image is valid, you can return a value of `EFI_SUCCESS`.

## <span id="Encryption_library"></span><span id="encryption_library"></span><span id="ENCRYPTION_LIBRARY"></span>Encryption library


Locate and include an appropriate encryption library in the image to support hash validation, such as EFI\_HASH\_PROTOCOL.

## <span id="related_topics"></span>Related topics


[Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md)

 

 






