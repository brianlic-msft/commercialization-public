---
author: kpacquer
Description: 'These tools are part of the Windows 10 IoT Core (IoT Core) ADK Add-Ons, in the \\Tools folder. To learn more about these tools, see What''s in the Windows ADK IoT Core Add-ons.'
ms.assetid: ae043bb0-656e-4439-bdbe-a8d370629ab7
MSHAttr: 'PreferredLib:/library'
title: 'IoT Core Add-ons command-line options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IoT Core Add-ons command-line options

These tools are part of the [Windows 10 IoT Core (IoT Core) ADK Add-Ons](http://go.microsoft.com/fwlink/?LinkId=735028), in the [\\Tools folder](iot-core-adk-addons-command-line-options.md). To learn more about these tools, see [What's in the Windows ADK IoT Core Add-ons](iot-core-adk-addons.md).

## appx2pkg.cmd

Creates the folder structure and copies the template files for a new package.

## BuildAgent.cmd

Builds FFUs for all OEMInputSamples under the Addon Kit directory. Can be used to automate nightly builds.

## BuildBSP.cmd

Builds BSP packages after signing all the required binaries.

**Usage**:

```
buildbsp {bspname/all} [version]
```

| Parameters | Description                                                                 |
| ---------- | --------------------------------------------------------------------------- |
| BSPName    | Name of the build BSP directory.                                            |
| All        | Builds all BSP directories.                                                 |
| Version    | Optional. Specifies package version. If not specified, it uses bsp_version. |

**Examples**

```
buildbsp rpi2
buildbsp rpi2 10.0.1.0
buildbsp all
buildbsp all 10.0.2.0
```

## BuildFM.cmd

Builds feature merger files.

**Usage**:

```
buildfm {oem/bsp/all} [bspname] [version]
```

| Parameters | Description                                                                 |
| ---------- | --------------------------------------------------------------------------- |
| OEM        | Builds OEMFM/OEMCommonFM files                                              |
| BSP        | Builds BSP files                                                            |
| All        | Builds both OEM and BSP files                                               |
| BSPName    | Required for BSP. Name of the BSP. Not required with OEM or All             |
| Version | Optional. Specifies package version. If not specified, it uses bsp_version. |

**Examples**

```
buildfm oem
buildfm bsp Rpi2
buildfm all
```

## BuildImage.cmd

[Builds an image file (FFU)](create-a-basic-image.md), using the product-specific packages. Uses CreateImage.cmd, includes additional options.

**Usage**: 

```
buildimage [ProductName]/[All]/[Clean] [BuildType] [Version]
```

| Parameters | Description |
| --- | --- |
| ProductName | Required, Name of the product to be created. |
| All | All Products under the \Products directory are built. |
| Clean | Cleans the output directory.  One of the above should be specified. |
| BuildType | Optional, Retail/Test, if not specified both types are built. |
| Version | Optional, Package version. If not specified, it uses BSP_VERSION. |
| /? | Displays this usage string. |

**Examples**:

``` syntax
buildimage SampleA Test
buildimage SampleA Retail
buildimage SampleA
buildimage All Test
buildimage All
buildimage Clean
```

## buildpkg.cmd

Builds a package from \Sources-\<arch\>\Packages.

Buildpkg saves the package in the \Build\\<arch\>\pkgs folder as a .cab file (example: Contoso.Provisioning.Auto.cab).

For troubleshooting, Buildpkg saves logs at \Build\\<arch\>\pkgs\logs. 


**Usage**: 

```
buildpkg [CompName.SubCompName]/[packagefile.pkg.xml]/[All]/[Clean] [version]
```

| Parameters | Description |
| ----- | ----- |
| CompName.SubCompName | Use this to refer to the package by its ComponentName.SubComponent Name. |
| packagefile.pkg.xml | Use this to refer to the package by its package definition XML file. |
| All | Builds all packages in the \Sources-\<arch\>\Packages folder. This is the same as the `BuildPkg All` command. |
| Clean | Use this to erase everything in the \Build\\<arch\>\pkgs folder. Recommended before building all packages. |
| version | Optional, used to specify a version number. If you don't specify one, the default is to use the version defined in the variable %BSP\_VERSION%. |

**Examples**:

``` syntax
buildpkg Appx.Main
buildpkg Appx.Main 10.0.1.0
buildpkg sample.pkg.xml
buildpkg sample.pkg.xml 10.0.1.0
buildpkg All
buildpkg All 10.0.2.0
buildpkg Clean
```

## exportpkgs.cmd

Exports all the packages used in a product configuration to a directory.

**Usage**:

```
exportpkgs DestDir Product BuildType [OwnerType]
```

| Parameters | Description |
| ----- | ----- |
| DestDir | Required. Destination directory to export. |
| Product | Required. Name of the product to be created. |
| Buildtype | Required. Can be Retail or Test. |
| Owner | Optional. Can be MS, OEM, or All. Default value is All. |

**Examples**:

```
exportpkgs C:\Temp SampleA Test OEM
exportpkgs C:\Temp SampleA Retail ALL
```

## flashsd.cmd

Flashes an image to a specified SD card. FlashSD.cmd requires you to specify a physical drive number. Connect your SD card to your PC, and then open diskmgr.msc to see the physical drive number of the SD card.

**Usage**:

```
flashsd product buildtype drivenr
```

| Parameters | Description |
| ----- | ----- |
| product | Name of the product. |
| buildtype | Retail or Test. Specifies the buildtype. |
| drivenr | Physical drive number of the SD card. |

**Example**:

```
flashSD SampleA test 2
```

## GetAppXInfo.exe

Extracts appx package-related information for a given .appx package.

**Usage**:

```
GetAppxInfo.exe appxfile
```

**Example**:

```
GetAppXInfo.exe IOTCoreDefaultApp_1.1.0.0_ARM.appx
```

## inf2cab.cmd

Converts a .inf driver package to a .cab file.

Inf2cab saves the package in the \Build\\<arch\>\pkgs folder  (example: Drivers.GPIO.cab).

Usage 

```
inf2cab filename.inf [CompName.SubCompName]
```

| Parameters | Description |
| ----- | ----- |
| filename.inf | Required, input file for the driver. |
| CompName.SubCompName | Optional, refers to the driver package by its ComponentName.SubComponent Name. |

**Examples**:

``` syntax
inf2cab C:\test\gpiodriver.inf
inf2cab C:\test\gpiodriver.inf Drivers.GPIO
```

## inf2pkg.cmd

Creates the folder structure and copies the template files for a new package

**Usage**: 

```
inf2pkg input.inf [CompName.SubCompName]
```

| Parameters | Description |
| ----- | ----- |
| input.inf | Required, input .inf file |
| CompName.SubCompName | Optional, default is Drivers.input |
| /? | Displays this usage string. |

**Example**:
``` syntax
inf2pkg C:\test\testdriver.inf
```

<a name="iotcoreshell"></a>
## IoTCoreShell.cmd

Opens the IoT Core Shell as an administrator. (This file is in the root folder, and uses LaunchTool.cmd)

After you open IoTCoreShell, you'll be prompted to choose a default architecture (ARM or x86) for the devices you'll be building. This sets your default starting set of system variables.  

## LaunchTool.cmd

Configures the command shell with required settings. 

## newappxpkg.cmd

Creates a new package folder to help you convert Appx packages to .cab files. 

This command creates the working folder in the \Source-\<arch\>\Packages\ folder.

If you run this command without any variables, you'll also see the other working folders in the \Source-\<arch\>\Packages\ folder.

**Usage**: 

```
newappxpkg filename.appx [fga]/[bgt]/[none] [CompName.SubCompName]
```

| Parameters | Description |
| ----- | ----- |
| filename.appx | Required, input file for the Appx package. |
| fga/bgt/none | Required, chooses the app's behavior on startup. **fga**-App will be forground app. **bgt**-App will start in background. **none**-App will not run on startup. |
| CompName.SubCompName | Optional, creates the working folder using the name: ComponentName.SubComponent. |

**Example**:

``` syntax
newappxpkg C:\test\MainAppx_1.0.0.0_arm.appx fga AppX.Main
```

To learn more, see [Lab 1b: Add an app to your image](deploy-your-app-with-a-standard-board.md).

## newbsp.cmd

Creates the folder structure and copies the template files for [creating a new board support package (BSP)](create-a-new-bsp.md).

**Usage**: 

```
newbsp BSPName
```

| Parameter | Description |
| ----- | ----- |
| BSPName | Required, Name of the BSP to be used. |

**Example**:

``` syntax
newbsp CustomRPi2
```


## newcommonpkg.cmd

Creates a new working folder to help you [add files, folders, registry keys, and provisioning packages](add-a-registry-setting-to-an-image.md) as .cab files. After using this command, use the buildpkg command to create your final .cab file.

This command creates the working folder in the \Common\Packages\ folder.

If you run this command without any variables, you'll also see the other working folders in the \Common\Packages\ folder.

**Usage**: 

```
newcommonpkg CompName.SubCompName
```

| Parameter | Description |
| ----- | ----- |
| CompName.SubCompName | Required, creates the working folder using the name ComponentName.SubComponent. |

**Example**:

``` syntax
newcommonpkg Registry.FilesAndRegKeys
```

To learn more, see [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md).



## newdrvpkg.cmd

Used to [add a driver to an image](add-a-driver-to-an-image.md). Creates a new working folder to help you convert driver packages to .cab files. After using this command, use the buildpkg command to create your final .cab file.

This command creates the working folder in the \Source-\<arch\>\Packages\ folder.

If you run this command without any variables, you'll also see the other working folders in the \Source-\<arch\>\Packages\ folder.

**Usage**: 

```
newdrvpkg filename.inf [CompName.SubCompName]
```

| Parameters | Description |
| ----- | ----- |
| filename.inf | Required, input .inf file for the driver package. |
| CompName.SubCompName | Optional, creates the working folder using the name: ComponentName.SubComponent. The default is Drivers.\<filename\>. |

**Example**:

``` syntax
newdrvpkg C:\test\GPIO.inf Drivers.GPIO
```

## newproduct.cmd

Used to [create new product configuration](create-a-basic-image.md). Creates a new working product directory under \Products and copies the contents from the template file.

**Usage**: 

```
newproduct <productname> bsp
```

| Parameter | Description |
| ----- | ----- |
| productname | Name of the product to be created. |
| bsp | Name of the BSP to be used. |

**Example**:

``` syntax
newproduct ProductA rpi2
```

## retailsign.cmd

Toggles between using cross-certifications for signing and enabling OEM test-signing of certificates

**Usage**: 

```
retailsign {On/Off}
```

| Parameters | Description |
| ----- | ----- |
| On | Enables Cross Cert for signing. |
| Off | Disables Cross Cert for signing and enables OEM Test Signing. |

**Examples**:

```syntax
retailsign On
retailsign Off
```


## setenv.cmd

Resets your environment variables, including **IOTADK\_ROOT**, **COMMON\_DIR**, **SRC\_DIR**, **BLD\_DIR**, **PKGBLD\_DIR**, **TOOLS\_DIR**, and more. 

Open setenv.cmd in a text editor to see the full list of variables set.

**Usage**: 

```
setenv {arm|x86|x64}
```

| Parameter | Description |
| ----- | ----- |
| arch | Architecture to be set (`arm`, `x86`, or `x64`). |

**Example**:

``` syntax
setenv.cmd arm
```

## setOEM.cmd

Sets your OEM company name. Edit this file with a text editor.

Example: 

``` syntax
set OEM_NAME=Fabrikam
```
Where _Fabrikam_ is the OEM company name.

## setsignature.cmd

Sets the [Cross-Certificates for kernel-mode code signing](https://msdn.microsoft.com/windows/hardware/drivers/install/cross-certificates-for-kernel-mode-code-signing)

## setversion.cmd

Sets the [version numbers](https://msdn.microsoft.com/windows/hardware/commercialize/service/mobile/update-requirements) used when creating a package with **createpkg.cmd** or a provisioning package with **createprovpkg.cmd**.

This version information is stored in **%PRJ\_DIR%\\versioninfo.txt** and loaded back when the IoT Core Shell is launched again. Whenever the package contents are changed, the version has to be updated and all packages need to be recreated.

**Usage**: 

```
setversion x.y.z.a
```

| Parameters | Description |
| ----- | ----- |
| x.y.z.a | Four-part version number to be used for packages. |

**Example**:

``` syntax
setversion 10.0.0.1
```
## SignBinaries.cmd

Signs different file types in a directory

**Usage**:

```
signbinaries {bsp/all/file extension} dir
```

| Parameters | Description |
| ----- | ------ |
| bsp | Signs all .sys/.dll files. |
| all | Signs all .dll, .sys, and .ppkg files.
| file extension | Signs all files of a specified type. For example, .cab, .dll, .sys,etc. |
| dir | Directory with files to be signed. |

**Example**:

```
signbinaries bsp %BSPSRC_DIR%
signbinaries all %BSPSRC_DIR%
signbinaries exe %BSPSRC_DIR%
```
## Related topics

[IoT Core Add-ons](iot-core-adk-addons.md)

[IoT Core manufacturing guides](iot-core-manufacturing-guide.md)
