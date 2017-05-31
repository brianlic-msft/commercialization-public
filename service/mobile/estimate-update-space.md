---
author: kpacquer
Description: Estimate update space
ms.assetid: dfd2eed9-3202-4a08-87d1-d1f4f132b7c5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Estimate update space
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Estimate update space


The amount of memory that is needed on the device to download and apply an update can vary considerably. The principle considerations for estimating the requirements are the type of update and the processing workspace required to download, prepare, and install it.

**Important**  
Because of factors such as compression, the targeted packages, and the specific binary contents of the updates, the estimation process is imprecise. OEMs must individually test an update to determine the exact size required.

 

## <span id="Factors_that_affect_update_space_requirements"></span><span id="factors_that_affect_update_space_requirements"></span><span id="FACTORS_THAT_AFFECT_UPDATE_SPACE_REQUIREMENTS"></span>Factors that affect update space requirements


There are three stages in the update process, each of which has its own space considerations: downloading, processing, and completion.

### <span id="Compression_for_downloading"></span><span id="compression_for_downloading"></span><span id="COMPRESSION_FOR_DOWNLOADING"></span>Compression for downloading

Updates are compressed for delivery to the device. As part of the update staging process, the updates are decompressed. Binary executables, text files, and map data can be compressed to variable degrees. Because of this, the amount of compression can vary.

### <span id="Update_processing"></span><span id="update_processing"></span><span id="UPDATE_PROCESSING"></span>Update processing

When updates are staged for installation, they are decompressed during validation. Additional space is required for staging and validation. In the last phase of the update, when the device boots into the update OS, the updates are applied and the temporary workspace is returned to the OS, when the update completes.

All updates require a set amount of space for processing. The workspace is located on the Main OS partition. The SD card and user data store are not used during the update process. The size of the workspace is approximately 50 MB.

### <span id="Updated_state"></span><span id="updated_state"></span><span id="UPDATED_STATE"></span>Updated state

Depending on the content of the update, the final size that it consumes on the image can vary. If the update overwrites existing packages, there may be either a decrease or an increase in the amount of free space available on the device. For example, if the update adds new files to the OS, the final size would reflect the size of the new files.

## <span id="Estimating_size_requirements"></span><span id="estimating_size_requirements"></span><span id="ESTIMATING_SIZE_REQUIREMENTS"></span>Estimating size requirements


Differential updates contain just the differences that are required to update a package. Nondifferential updates are inclusive and self-contained. To apply a differential update to a package, an intermediate package is created that the differences are then applied to. This means that a fairly small differential update can take significant additional space to stage and apply if the targeted package is large. Most Microsoft OS updates are differential and are incrementally targeted to specific OS versions.

### <span id="Differential_updates"></span><span id="differential_updates"></span><span id="DIFFERENTIAL_UPDATES"></span>Differential updates

To estimate the space required for a differential update, the size of the package that the update targets must be determined.

*(The targeted packages measured in MB \* 1.5) + working space = Estimated update space required in MB.*

For example, if the target package was 4 MB in size, the calculation would be as follows:

*(4 \* 1.5) + 50 MB = 62 MB.*

Note that the size of the package that contains the differential update is not used in the estimation.

### <span id="Nondifferential_updates"></span><span id="nondifferential_updates"></span><span id="NONDIFFERENTIAL_UPDATES"></span>Nondifferential updates

To estimate the space required for a typical nondifferential OEM update, use this formula:

*(The update measured in MB \* 1.5) + Working space in MB = Estimated update space required in MB.*

### <span id="SV_partition_updates"></span><span id="sv_partition_updates"></span><span id="SV_PARTITION_UPDATES"></span>SV partition updates

Contact the silicon vendor for information on size estimation of SV partition updates.

## <span id="related_topics"></span>Related topics


[Update](index.md)

 

 






