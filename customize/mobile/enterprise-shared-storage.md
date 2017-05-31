---
title: Enterprise shared storage
description: Enterprise shared storage
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7C2FFA0E-416B-40F9-8FFC-0FE1F59EFB49
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enterprise shared storage


Enterprise shared storage defines local data locations for line of business apps to share data.

The shared storage consists of two locations, where apps with the restricted capability **enterpriseDeviceLockdown** and an Enterprise certificate have full read and write access. Note that the **enterpriseDeviceLockdown** capability allows apps to use the device lock down API and access the enterprise shared storage folders. For more information about the API, see [Windows.Embedded.DeviceLockdown](http://go.microsoft.com/fwlink/?LinkId=699331) namespace.

These locations are set on the local drive:

-   \\Data\\SharedData\\Enterprise\\Persistent
-   \\Data\\SharedData\\Enterprise\\Non-Persistent

### Scenarios

Enterprise shared storage provides support for the following scenarios.

-   You can share data within an instance of an app, between instances of the same app, or even between apps assuming they both have the appropriate capability and certificate.
-   You can store data on the local hard drive in the \\Data\\SharedData\\Enterprise\\Persistent folder and it persists even after the device has been reset. 
-   -   Manipulate files, including read, write, and delete of files on a device via Mobile Device Management (MDM) service. For more information on how to use enterprise shared storage through the MDM service, see [EnterpriseExtFileSystem CSP](http://go.microsoft.com/fwlink/?LinkId=699333).

### Access enterprise shared storage

The following example shows how to declare the capability to access enterprise shared storage in the package manifest, and how to access the shared storage folders by using the Windows.Storage.StorageFolder class.

In your app package manifest, include the following capability:

```
<Package
  xmlns="http://schemas.microsoft.com/appx/manifest/foundation/windows10"
  xmlns:mp="http://schemas.microsoft.com/appx/2014/phone/manifest"
  xmlns:uap="http://schemas.microsoft.com/appx/manifest/uap/windows10"
  xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"
  IgnorableNamespaces="uap mp rescap">

…

<Capabilities>
    <rescap:Capability Name="enterpriseDeviceLockdown"/>
</Capabilities>
```

To access the shared data location, your app would use the following code.

```
using System;
using System.Collections.Generic;
using System.Diagnostics;
using Windows.Storage;

…

// Get the Enterprise Shared Storage folder.
var enterprisePersistentFolderRoot = @"C:\Data\SharedData\Enterprise\Persistent";

StorageFolder folder =
    await StorageFolder.GetFolderFromPathAsync(enterprisePersistentFolderRoot);

// Get the files in the folder.
IReadOnlyList<StorageFile> sortedItems =
    await folder.GetFilesAsync();

// Iterate over the results and print the list of files
// to the Visual Studio Output window.
foreach (StorageFile file in sortedItems)
    Debug.WriteLine(file.Name + ", " + file.DateCreated);
```



 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_mobile_customizations\p_mobile_customizations%5D:%20Enterprise%20shared%20storage%20%20RELEASE:%20%2810/19/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





