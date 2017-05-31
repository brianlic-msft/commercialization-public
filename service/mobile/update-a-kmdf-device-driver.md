---
author: kpacquer
Description: Update a KMDF device driver
ms.assetid: e391e00a-b764-4d47-8e14-30b4446ddfb2
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Update a KMDF device driver
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update a KMDF device driver


Like all other components that are added to the OS, KMDF (Kernel-Mode Driver Framework) drivers are included in the OS image by using .spkg package files that are referenced by an OEMInput.xml file when OEMs builds the image.

Similarly, driver updates are published by using .spkg package files. Like all package updates, the package version must be incremented for each update; for more information, see [Update requirements](update-requirements.md). When driver updates are prepared, the value of the **DriverVer** directive in the driver INF file must also be incremented. This walkthrough shows how to prepare a KMDF device driver update and confirm that the updated driver is loaded by the OS.

This topic assumes that you are familiar with the general concepts associated with Windows device driver installation and the use of the INF file. For more information, see [Device and driver installation](https://msdn.microsoft.com/library/windows/hardware/ff549731).

## <span id="Driver_INF_files_and_updates"></span><span id="driver_inf_files_and_updates"></span><span id="DRIVER_INF_FILES_AND_UPDATES"></span>Driver INF files and updates


Visual Studio automatically generates an INF file when building a Windows 10 Mobile KMDF driver project. In Windows, driver installation uses the INF file directly. However, in Windows 10 Mobile, the INF file is converted to a registry entries (.reg) file. The .reg file is included in the .spkg file when the driver is packaged.

When creating a KMDF driver update, two version numbers must be incremented: the version number of the .spkg package file and the **DriverVer** value in the INF file.

**Package version**

The package version number must be incremented to cause the update to be applied to the OS. If the update package version is not greater than the existing version, the update will not be applied.

**INF driver version**

The INF driver version number must be incremented to cause the updated driver data to be applied to the active driver registry key in the System hive. The driver version is specified in the following format:

*MM*/*DD*/*YYYY*, *n*. *n*. *n*. *n*

*MM* is month, *DD* is day, and *YYYY* is year, followed by the version number. The first digit of the version number is the major version, followed by the minor versions. For driver updates, the entire string is evaluated as the version number. If just the date (*MM*/*DD*/*YYYY*) is incremented, it is considered to be a newer version of the driver.

## <span id="Driver_walkthrough_introduction"></span><span id="driver_walkthrough_introduction"></span><span id="DRIVER_WALKTHROUGH_INTRODUCTION"></span>Driver walkthrough introduction


The driver update walkthrough covers the following tasks:

-   [Build the version 1 driver package](#buildtheversion1)

-   [Add the version 1 driver to the OS](#addingtheversion1)

-   [View the driver registry settings](#viewtheregistry)

-   [Examine the registry keys to confirm that the driver is active](#examinetheregistrykeys)

-   [Build the version 2 driver package](#buildingtheversion2)

-   [Add the version 2 driver to the OS](#addingtheversion2)

-   [Confirm that the updated driver is active](#confirmthattheupdateddriver)

In this example, the following version numbers are used:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Driver version in INF file</th>
<th align="left">Package version</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>11/01/2012,1.00.00.00</p></td>
<td align="left"><p>8.00.9907.12</p></td>
</tr>
<tr class="even">
<td align="left"><p>02/19/2013,1.32.00.00</p></td>
<td align="left"><p>8.00.10211.25</p></td>
</tr>
</tbody>
</table>

 

The driver file is named XKmdfDriver.sys, and the INF file is XKmdfDriver.inf.

**Note**  
Replace these file names with the name of the driver that you want to use in this walkthrough.

 

The original driver will be located in the \\Version1 folder, and the updated version will be located in \\Version2.

The walkthrough assumes that the following environmental variables are similar to what is shown here:

``` syntax
set AK_ROOT=C:\Program Files (x86)\Windows Kits\10
set WINKIT_ROOT=C:\Program Files (x86)\Windows Kits\10
PATH=%AK_ROOT%\Tools\bin\i386;%WINKIT_ROOT%\bin\x86;%PATH%
```

## <span id="BuildTheVersion1"></span><span id="buildtheversion1"></span><span id="BUILDTHEVERSION1"></span>Build the version 1 driver package


Use the following steps to include the version 1 driver in the OS.

1.  Copy the driver files to the \\Version1 directory:

    -   XKmdfDriver.inf

    -   XKmdfdriver.pkg.xml

    -   XKmdfDriver.sys

2.  In the XKmdfDriver.inf file, set the `DriverVer` directive in the `[Version]` section as shown here. The highlighted string "11/01/2012,1.00.00.00" is the version number of the driver.

    ``` syntax
    …
    [Version]
    Signature="$WINDOWS NT$"
    Class=System
    ClassGuid={4d36e97d-e325-11ce-bfc1-08002be10318}
    Provider=%MSFT%
    DriverVer=11/01/2012,1.00.00.00
    BootCritical=1

    [DestinationDirs]
    DefaultDestDir = 12
    …
    ```

3.  The package XML (XKmdfdriver.pkg.xml) for the version 1 driver, is shown below. Specify an OEM `Owner` name.

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
      Owner="OEMName"
      OwnerType="OEM"     
      ReleaseType="Test"
      Platform="QC8960"           
      Component="Phone.Test.BaseOS"
      SubComponent="XKmdfDriver"
      Partition="MainOS"
      BinaryPartition="false">
      <Components>
        <OSComponent>
            <Files>
                <File Source="XKmdfDriver.sys" DestinationDir="$(runtime.system32)\drivers"/>
            </Files>
        </OSComponent>
        <Driver InfSource="XKmdfDriver.inf">
            <Reference Source="XKmdfDriver.sys"/>
        </Driver>
      </Components>
    </Package>
    ```

4.  Move to the \\Version1 directory, set the package version as shown, and build the driver package.

    ``` syntax
    cd \Version1
    set PKGVER=8.00.9907.12
    pkggen  XKmdfDriver.pkg.xml /version:%PKGVER% /build:fre /cpu:ARM /config:"%AK_ROOT%\Tools\bin\i386\pkggen.cfg.xml" /output:. /variables:"HIVE_ROOT=%AK_ROOT%\CoreSystem"
    ```

5.  Confirm that the *OEMName*.Phone.Test.BaseOS.XKmdfDriver.spkg package was built.

## <span id="AddingTheVersion1"></span><span id="addingtheversion1"></span><span id="ADDINGTHEVERSION1"></span>Add the version 1 driver to the OS


Use the following steps to include the version 1 driver in the OS by using IUTool and a production or test build. Alternatively, include the package in an image and then flash that image to the phone.

1.  Connect the device to the PC by using a USB cable.

2.  Use IuTool to add the version 1 driver package to an existing image.

    ``` syntax
    IuTool -p OEMName.Phone.Test.BaseOS.XKmdfDriver.spkg
    ```

3.  Confirm that the IuTool was able to deploy the package to the device

## <span id="ViewTheRegistry"></span><span id="viewtheregistry"></span><span id="VIEWTHEREGISTRY"></span>View the driver registry settings


Use the following process to mount the device in mass storage mode and view the registry.

1.  Reboot the device to USB mass storage mode. This is done by using a specific key sequence on the phone—for example, holding the camera button down when powering up.

2.  Connect the device to the PC with a USB cable.

3.  When the device is connected to the PC in USB mass storage mode, it will appear as a logical drive on the PC.

4.  Open a Command Prompt window as an administrator.

5.  Locate the registry SYSTEM hive under the folder **\\WINDOWS\\SYSTEM32\\CONFIG**.

6.  Start the Registry Editor (Regedit.exe) on the PC.

7.  In the Registry Editor, click **File** &gt; **Load Hive** and load the SYSTEM hive.

8.  Provide a name for the imported hive—for this example, DRIVER\_VERSION1

9.  Proceed to the next section to examine the contents of the imported registry hive.

## <span id="ExamineTheRegistryKeys"></span><span id="examinetheregistrykeys"></span><span id="EXAMINETHEREGISTRYKEYS"></span>Examine the registry keys to confirm that the driver is active


When Windows 10 Mobile installs the driver, the following registry keys appear in the SYSTEM hive:

-   A driver-specific registry key is created under `SYSTEM\DriverDatabase`.

-   An active driver subkey is created under `SYSTEM\ControlSet001\Enum\ROOT\XKmdfDriver`.

Each of these two areas is discussed in the following sections. Use this information in the registry to determine if the driver is ready to be installed and if the OS has recognized the hardware and installed the proper version of the driver.

### <span id="Driver_database"></span><span id="driver_database"></span><span id="DRIVER_DATABASE"></span>Driver database

Driver settings are staged for later installation in `SYSTEM\DriverDatabase`. The OS uses this subkey to install drivers when the new hardware is identified. It contains:

-   Information about the XKmdfDriver.inf

-   A specific GUID `{4d36e97d-e325-11ce-bfc1-08002be10318}` that identifies the XKmdfDriver as a SYSTEM class driver, not a driver that uses a dynamically enumerable bus (such as ACPI or USB). This example uses a system class driver to simplify the walkthrough, but the concepts illustrated are similar with other types of drivers.

When the package is installed, the XKmkdfDriver.inf is added to `[SYSTEM\DriverDatabase\DeviceIds\{4d36e97d-e325-11ce-bfc1-08002be10318}]`, where `{4d36e97d-e325-11ce-bfc1-08002be10318}` is the system driver GUID.

The following shows the system driver GUID in the `[SYSTEM\DriverDatabase\DeviceIds\Root\XKmdfDriver]` registry subkey.

``` syntax
[SYSTEM\DriverDatabase\DeviceIds\Root\XKmdfDriver]
"XKmdfDriver.inf"=hex:01,ff,00,00
[SYSTEM\DriverDatabase\DeviceIds\{4d36e97d-e325-11ce-bfc1-08002be10318}]
..
"XKmdfDriver.inf"=hex(0):
```

Under the `[SYSTEM\DriverDatabase\DriverInfFiles\XKmdfDriver.inf]` subkey, the active INF file is specified with the entry `"Active"="xkmdfdriver.inf_arm_c8e7ab79be6b088b"`.

The `"Active"` entry is pointing to the active driver INF. When the driver package is updated, there are multiple INF settings, and `"Active"` points to the latest one.

``` syntax
[SYSTEM\DriverDatabase\DriverInfFiles\XKmdfDriver.inf]
"Active"="xkmdfdriver.inf_arm_c8e7ab79be6b088b"
@=hex(7):78,00,6b,00,6d,00,64,00,66,00,64,00,72,00,69,00,76,00,65,00,72,00,2e,\
00,69,00,6e,00,66,00,5f,00,61,00,72,00,6d,00,5f,00,63,00,38,00,65,00,37,00,\
61,00,62,00,37,00,39,00,62,00,65,00,36,00,62,00,30,00,38,00,38,00,62,00,00,\
00,00,00
"Configurations"=hex(7):58,00,4b,00,4d,00,44,00,46,00,44,00,52,00,49,00,56,00,\
45,00,52,00,2e,00,4e,00,54,00,00,00,00,00
```

The `[SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b]` subkey contains a replication of the XKmdfDriver.inf contents.

``` syntax
[SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b]
@="XKmdfDriver.inf"
"BootCritical"=dword:00000001
"Provider"="Microsoft"
"SignerName"=""
"SignerScore"=dword:0d000003
"Version"=hex:ff,ff,05,00,00,00,00,00,7d,e9,36,4d,25,e3,ce,11,bf,c1,08,00,2b,\
e1,03,18,00,40,f9,d5,c3,b7,cd,01,00,00,00,00,00,00,01,00,00,00,00,00,00,00,\
00,00
```

This subkey references the service associated with the system driver:

``` syntax
[SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b\Configurations\XKMDFDRIVER.NT]
"ConfigFlags"=dword:00000000
"Service"="XKmdfDriver"
```

This subkey sets the driver description strings:

``` syntax
[SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b\Descriptors\Root\XKmdfDriver]
"Configuration"="XKMDFDRIVER.NT"
"Description"="%xkmdfdriver_devdesc%"
"Manufacturer"="%StdMfg%"
```

This subkey sets the value of the driver description string:

``` syntax
[SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b\Strings]
"xkmdfdriver_devdesc"="X KMDF Driver"
```

### <span id="Control_set_enumeration"></span><span id="control_set_enumeration"></span><span id="CONTROL_SET_ENUMERATION"></span>Control set enumeration

`[SYSTEM\ControlSet001\Enum\ROOT\XKmdfDriver]` is created when the OS successfully installs the matching device driver with the INF file. For more information, see [HKLM\\SYSTEM\\CurrentControlSet\\Enum Registry Tree](http://msdn.microsoft.com/library/windows/hardware/ff546173.aspx) on MSDN.

The `Control` subkey contains information for controlling system startup and some aspects of device. For more information, see [HKLM\\SYSTEM\\CurrentControlSet\\Control Registry Tree](http://msdn.microsoft.com/library/windows/hardware/ff546165.aspx) on MSDN.

`SYSTEM\ControlSet001\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}\0120` indicates that the driver has the 120th rank among SYSTEM class drivers. This subkey includes the driver date and version as shown here:

``` syntax
[SYSTEM\ControlSet001\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}\0120]
"DriverDesc"="X KMDF Driver"
"ProviderName"="Microsoft"
"DriverDateData"=hex:00,40,f9,d5,c3,b7,cd,01
"DriverDate"="11-1-2012"
"DriverVersion"="1.0.0.0"
"InfPath"="XKmdfDriver.inf"
"InfSection"="XKMDFDRIVER.NT"
"MatchingDeviceId"="ROOT\\XKmdfDriver"
```

The DeviceClasses subkey includes the device instance ID:

``` syntax
[SYSTEM\ControlSet001\Control\DeviceClasses\{5cdce65b-f1bc-4e15-a1f8-c541f21c43f2}\##?#ROOT#XKmdfDriver#0000#{5cdce65b-f1bc-4e15-a1f8-c541f21c43f2}]
"DeviceInstance"="ROOT\\XKmdfDriver\\0000"
```

This next subkey associates the XKmdfDriver with the system containerId 00000000-0000-0000-ffff-ffffffffffff:

``` syntax
[SYSTEM\ControlSet001\Control\DeviceContainers\{00000000-0000-0000-FFFF-FFFFFFFFFFFF}\BaseContainers\{00000000-0000-0000-FFFF-FFFFFFFFFFFF}]
..
"ROOT\\XKmdfDriver\\0000"=hex(0):
..
```

`[SYSTEM\ControlSet001\Enum\ROOT\XKmdfDriver\0000]` contains information about the installed driver. It has one instance, `XKmdfDriver\0000`:

``` syntax
[SYSTEM\ControlSet001\Enum\ROOT\XKmdfDriver\0000]
"HardwareID"=hex(7):52,00,4f,00,4f,00,54,00,5c,00,58,00,4b,00,6d,00,64,00,66,\
  00,44,00,72,00,69,00,76,00,65,00,72,00,00,00,00,00
"ConfigFlags"=dword:00000000
"DeviceReported"=dword:00000001
"Service"="XKmdfDriver"
"Capabilities"=dword:00000000
"ClassGUID"="{4d36e97d-e325-11ce-bfc1-08002be10318}"
"DeviceDesc"="@XKmdfDriver.inf,%xkmdfdriver_devdesc%;X KMDF Driver"
"Driver"="{4d36e97d-e325-11ce-bfc1-08002be10318}\\0120"
"Mfg"="@XKmdfDriver.inf,%StdMfg%;"
"ContainerID"="{00000000-0000-0000-FFFF-FFFFFFFFFFFF}"
```

`[SYSTEM\ControlSet001\services\XKmdfDriver]` contains the driver file "ImagePath" value; it is ASCII characters encoded in hexadecimal binary format. The actual value is "ImagePath" = REG\_EXPAND\_SZ: "\\SystemRoot\\System32\\drivers\\XKmdfDriver.sys". For more information, see [Registry Value Types](http://msdn.microsoft.com/library/windows/desktop/ms724884.aspx) on MSDN.

``` syntax
[SYSTEM\ControlSet001\services\XKmdfDriver]
"DisplayName"="@XKmdfDriver.inf,%xkmdfdriver_DevDesc%;X KMDF Driver"
"ErrorControl"=dword:00000001
"ImagePath"=hex(2):5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,\
74,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,72,\
00,69,00,76,00,65,00,72,00,73,00,5c,00,58,00,4b,00,6d,00,64,00,66,00,44,00,\
72,00,69,00,76,00,65,00,72,00,2e,00,73,00,79,00,73,00,00,00
"Start"=dword:00000001
"Type"=dword:00000001
"Owners"=hex(7):58,00,4b,00,6d,00,64,00,66,00,44,00,72,00,69,00,76,00,65,00,72,\
00,2e,00,69,00,6e,00,66,00,00,00,00,00
```

`[SYSTEM\ControlSet001\services\XKmdfDriver\Parameters\Wdf]` contains the WDF version number:

``` syntax
[SYSTEM\ControlSet001\services\XKmdfDriver\Parameters\Wdf]
"WdfMajorVersion"=dword:00000001
"WdfMinorVersion"=dword:0000000b
"TimeOfLastSqmLog"=hex(b):20,41,89,d7,2c,c0,cd,01
```

## <span id="CloseTheTools"></span><span id="closethetools"></span><span id="CLOSETHETOOLS"></span>Close the tools and eject the device


1.  In the Registry Editor, click **File** &gt; **Unload Hive** to unload the `DRIVER_VERSION1` hive, so that the PC registry is restored to its previous state.

2.  Close the Registry Editor.

3.  Close the Command Prompt window and any open instances of Windows Explorer that were used to view the temp folder.

4.  Eject the phone (use **Safely Remove Hardware and Eject Media** in the notification area or the Windows Explorer **Eject** command), and then disconnect the device from the PC.

## <span id="BuildingTheVersion2"></span><span id="buildingtheversion2"></span><span id="BUILDINGTHEVERSION2"></span>Build the version 2 driver package


As described earlier, the new driver version will be 2/19/2013,1.32.00.00, which will be contained in a new package version, 8.00.10211.25.

1.  Create a second copy of the driver files in the \\Version2 directory.

2.  Edit the XKmdfDriver.inf file and change `DriverVer` to 02/19/2013,1.32.00.00.

3.  Add a new registry value named "DW123", of type DWORD. The presence of this key is used as an additional indication that the version 2 driver is active.

    ``` syntax
    [Version]
    Signature="$WINDOWS NT$"
    Class=System
    ClassGuid={4d36e97d-e325-11ce-bfc1-08002be10318}
    Provider=%MSFT%
    DriverVer=02/19/2013,1.32.00.00
    [XKMDFDRIVER.NT.HW]
    AddReg=XKMDFDRIVER.AddReg

    [XKMDFDRIVER.AddReg]
    HKR,," DW123",    %REG_DWORD%, 0x4567
    ...
    ```

4.  Move to the \\Version2 directory, set the package version, and build the package.

    ``` syntax
    cd \Version2
    set PKGVER=8.00.10211.25
    pkggen  XKmdfDriver.pkg.xml /version:%PKGVER% /build:fre /cpu:ARM /config:"%AK_ROOT%\Tools\bin\i386\pkggen.cfg.xml" /output:. /variables:"HIVE_ROOT=%AK_ROOT%\CoreSystem"
    ```

## <span id="AddingTheVersion2"></span><span id="addingtheversion2"></span><span id="ADDINGTHEVERSION2"></span>Add the version 2 driver to the OS


Use the following steps to include the version 2 driver in the OS using IUTool and a production or test build:

1.  Connect the device to the PC by using a USB cable.

2.  Use IuTool to add the version 2 driver package to an existing image.

    ``` syntax
    IuTool -p OEMName.Phone.Test.BaseOS.XKmdfDriver.spkg
    ```

3.  Confirm that the IUTool was able to deploy the package to the device

## <span id="ConfirmThatTheUpdatedDriver"></span><span id="confirmthattheupdateddriver"></span><span id="CONFIRMTHATTHEUPDATEDDRIVER"></span>Confirm that the updated driver is active


Use the following process to confirm that the updated driver is active.

1.  Use the process described previously in [View the driver registry settings](#viewtheregistry) to load and view the system registry hive.

2.  DriverPackages should have two INF registry key sets: one for the previously installed driver and the one for the updated driver.

    ``` syntax
    [SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_6ec7dae5e1ab5fd5]
    [SYSTEM\DriverDatabase\DriverPackages\xkmdfdriver.inf_arm_c8e7ab79be6b088b]
    ```

3.  `Active` in XKmdfDriver.inf should point to the newer INF key:

    ``` syntax
    [SYSTEM\DriverDatabase\DriverInfFiles\XKmdfDriver.inf]
    "Active"="xkmdfdriver.inf_arm_6ec7dae5e1ab5fd5"
    ```

4.  The driver still has the 120th rank under SYSTEM Class driver, but the date and version should be updated.

    -   "DriverDate"="2-19-2013"

    -   "DriverVersion"="1.32.0.0"

    ``` syntax
    [SYSTEM\ControlSet001\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}\0120]
    "DriverDate"="2-19-2013"
    "DriverDateData"=hex:00,c0,69,0f,34,0e,ce,01
    "DriverDesc"="X KMDF Driver"
    "DriverVersion"="1.32.0.0"
    "InfPath"="XKmdfDriver.inf"
    "InfSection"="XKMDFDRIVER.NT"
    "MatchingDeviceId"="ROOT\\XKmdfDriver"
    "ProviderName"="Microsoft"
    ```

5.  The newly added DWORD registry value DW123 should appear under the `Device Parameters` subkey.

    ``` syntax
    [SYSTEM\ControlSet001\Enum\ROOT\XKmdfDriver\0000\Device Parameters]
    "DWORD123"="0x4567"
    ```

6.  Use the process described earlier in [Close the tools and eject the phone](#closethetools) to safely disconnect the device

## <span id="related_topics"></span>Related topics


[Update](index.md)

 

 






