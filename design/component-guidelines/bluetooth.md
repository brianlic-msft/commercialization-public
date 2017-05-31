---
title: Bluetooth
description: This topic provides a list of new features and recommendations for Bluetooth in Windows.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 64026D6A-75CB-4D3A-A467-6140F93CBAA4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Bluetooth


This topic provides a list of new features and recommendations for Bluetooth in Windows 10. For power-efficient support for Bluetooth LE beacons and related scenarios, we recommend that OEMs use Bluetooth components capable of Hardware Offload and able to support the [Microsoft-defined Host Controller Interface (HCI) extension](https://msdn.microsoft.com/library/windows/hardware/dn917903.aspx).

## What's new in Windows 10


Additional features that were added after Windows 10, version 1507 are marked as follows: 

-   (1511) - The feature is new for the Windows 10, version 1511 release

-   (1607) - The feature is new for the Windows 10, version 1607 release

-   (1703) - The feature is new for the Windows 10, version 1703 release


### QD IDs

| QD ID                                                  | Name                                                                   | Product type      | Date         |
|--------------------------------------------------------|------------------------------------------------------------------------|-------------------|--------------|
| [72550](http://go.microsoft.com/fwlink/?LinkId=823549) | Windows 10 Mobile                                                      | Profile Subsystem | 31-July-2015 |
| [70587](http://go.microsoft.com/fwlink/?LinkId=823550) | Windows 10 for Desktop editions (Home, Pro, Enterprise, and Education) | Host Subsystem    | 14-July-2015 |
| [84637](http://go.microsoft.com/fwlink/?LinkId=823551) | Windows 10 Mobile updated AVRCP                                        | Profile Subsystem | 17-June-2016 |
| [94254](http://go.microsoft.com/fwlink/?LinkId=848229) | Windows 10 Creators Update                                             | Host Subsystem    | 14-March-2017 |

 

### Bluetooth features

-   Converged Bluetooth Core stack. Audio profiles differ in behavior between Windows 10 for Desktop editions (Home, Pro, Enterprise, and Education) and Windows 10 Mobile. 

-   Compliant to the standard Bluetooth 4.1 (for all mandatory spec requirements, not for optional requirements)

-   Support for the following features:

    -   [Hardware Offload (HCI)](https://msdn.microsoft.com/library/windows/hardware/dn917903.aspx): Microsoft defines vendor-specific HCI commands and events that are consumed by Windows

    -   Dual mode support (except in Windows 10 Mobile): Dual mode support for Bluetooth BR/EDR and Bluetooth LE. For example, a Jabra Sport Pulse can transfer heart rate data over Bluetooth LE and stream music over a BR/EDR profile. Bluetooth BR/EDR, the older standard, is still needed for higher data-rate or long-range applications.

    -   LE privacy 1.1: Windows protects the user’s privacy by randomizing the Bluetooth address whenever it is broadcast.

    -   Enterprise Management

        -   Turn Bluetooth on/off

        -   Allow/Block the device going into discoverable mode

        -   Change the friendly name of the Bluetooth device

        -   Allow/Block advertisements

        -   (1511) Allow/Block connections and pairings based off of the profiles supported. For example, block file transfers while allowing keyboards and mice.

    -   Windows Phone General Distribution Release (GDR) features ported to Windows 10 (Cortana address book entry, LE HID, MAP)

    -   (1607) [Pre-pair Bluetooth devices during manufacturing](bluetooth-prepairing.md): Allows for a seamless out-of-box experience that allows Bluetooth devices to just work. 

    -   (1703) Hands-Free Profile (HFP) 1.6 specification with Wideband speech on Windows 10 for Desktop editions.

-   APIs/Profiles

    -   [Advertisement API](http://go.microsoft.com/fwlink/p/?LinkId=723573): Support for scanning of Bluetooth LE advertisement packets for beacons and other similar scenarios.

    -   Existing Windows Phone Background support converged to Desktop.

    -   Bluetooth audio enhancements (Wideband speech, aptX®) - High Definition sound while limiting Lip Sync and latency issues.

    -   (1511) In App Pairing: Allows apps to discover, pair, and connect to devices all without leaving the app in question. See this [GitHub code sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/DeviceEnumerationAndPairing) and [DeviceInformationPairing class](https://msdn.microsoft.com/library/windows/apps/windows.devices.enumeration.deviceinformationpairing.aspx) for more information.

    -   (1607) Non-paired support for connections over RFCOMM: Apps can now communicate with Windows over RFCOMM without having to pair the device.

    -   (1607) Map apps can now use Cortana's voice for navigation.

    -   (1703) Support for [Call Control APIs](https://docs.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.Calls) on Windows 10 for Desktop editions.

    -   (1703) Support for GATT Server, Bluetooth LE Peripheral role and non-paired support for Bluetooth LE. See our [developer post](http://aka.ms/bluetoothgatt) for more details.

### Bluetooth features list by edition

The following table provides a summary of the Bluetooth features in the Windows 10 for Desktop editions and Windows 10 Mobile editions.

<table>
<thead valign="bottom">
<tr>
<th>Feature</th>
<th>Windows 10 for Desktop editions</th>
<th>Windows 10 Mobile</th>
</tr>
</thead>
<tbody valign="top">
<tr class="even">
<td>Advertisement API</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>In App Pairing API</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="even">
<td>Non-paired support over RFCOMM</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>Existing Windows Phone Background support converged to Desktop</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="even">
<td>Hardware Offload (HCI)</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>Dual mode, LE Privacy 1.1 (Bluetooth Spec updates)</td>
<td>Yes</td>
<td>Dual mode - Yes
<p>(Only while using pairing APIs)<sup>*</sup></p></td>
</tr>
<tr class="even">
<td>Enterprise Management</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>Bluetooth audio enhancements – Wideband speech</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="even">
<td>Bluetooth audio enhancements – aptX® audio codec</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>Interop Improvements</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="even">
<td>WP GDR Features ported to Windows 10 – Cortana address book entry</td>
<td>No</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>WP GDR Features ported to Windows 10 – LE HID (Mobile)</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr class="even">
<td>WP GDR Features ported to Windows 10 – Message Access Profile (MAP)</td>
<td>No</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>WP GDR Features ported to Windows 10 – AVRCP</td>
<td>Yes (v1.3)</td>
<td>Yes (v1.4)</td>
</tr>
<tr class="even">
<td>MAP apps access to Cortana's voice</td>
<td>No</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td>Pre-pair Bluetooth devices during manufacturing</td>
<td>Yes</td>
<td>No</td>
</tr>
<tr class="even">
<td>Background Bluetooth process content</td>
<td>Yes</td>
<td>Yes</td>
</tr>
</tbody>
</table>

 

<sup>\*</sup> The settings page doesn't allow this. You need to implement something programmatically using In App Pairing APIs. For more information, see [aka.ms/btdevdocs](http://aka.ms/btdevdocs).

## Upgrade Process


### Upgrading from Windows 10

During upgrade, Windows will migrate Bluetooth drivers, applications, and profile packs. There is still the ability to check Windows Update for a more current driver, and install during the upgrade process. If Bluetooth is not working or missing after upgrade, please file feedback in the Feedback Hub with details of what is happening. Users may need to check their hardware manufacturer's or OEM's website to install Windows 10 compatible drivers.

### Upgrading from Windows 7, Windows 8, or Windows 8.1

During upgrade, Windows 10 will not migrate existing Bluetooth drivers, applications, and profile packs. During the upgrade process, Windows setup will check Windows Update to download and install a Windows 10 Bluetooth filter driver to re-enable Bluetooth radio functionality with the inbox profile support listed in the table above. Users will have to check their hardware manufacturer's or OEM's website for updated profile packs if desired.

## Maintained guidelines from Windows 8.1


This section cover guidelines from Windows 8.1 that are maintained for Windows 10.

### Hardware

If implemented, Bluetooth controllers must support the Bluetooth 4.0+LE specification, complying with both Basic Rate (BR) and Low Energy (LE).

The following table summarizes the supported peripheral buses and driver support.

| Bus (HCI) | Driver support | SCO support                                   |
|-----------|----------------|-----------------------------------------------|
| Non-USB   | WDK sample     | Sideband I2S/PCM connection only (HCI bypass) |
| USB       | In-box         | In-band (SCO over HCI)                        |

 

The [WDK Bluetooth Serial HCI Bus Driver sample](https://github.com/Microsoft/Windows-driver-samples/tree/master/bluetooth/serialhcibus) is based on the UART (H4) standard as defined in the Bluetooth SIG specification. A vendor will be required to adopt and enhance the sample for any vendor-specific device requirements around device initialization and/or power management. If desired, the vendor can adopt the sample and develop for a non-UART interface as well, i.e.: non-UART controllers will also be supported by the Bluetooth stack (given a proper vendor-supplied driver).

A vendor supplied serial controller driver is necessary for UART-based controllers. For UART-specific features, see [Simple Peripheral Bus (SPB)](simple-peripheral-bus--spb-.md).

**Note**   A non-USB connected Bluetooth controller must use a sideband channel for SCO applications, i.e.: SCO over I2S/PCM interface. Furthermore, SCO over HCI (in-band) will not be supported for non-USB controllers.

 

### Transport bus driver

The Windows Driver Kit (WDK) sample is available for the UART (H4) transport. A vendor can enhance it for any vendor-specific feature, including for any non-UART transports as well. There will be no limitations around the stack’s ability to support a particular transport.

There will be no changes to the existing in-box Bluetooth USB driver. We recommend using UART (H4) as the connectivity interface, since the WDK sample will be UART-based and due to UART’s lower power consumption. Voice (SCO) support must go through a “sideband” audio channel for non-USB controllers, such as an I2S/PCM interface.

### Initialization and power handling

For non-USB based Bluetooth controllers that require initialization, see [Transport Bus Driver for Bluetooth Power Handling Guidelines](http://msdn.microsoft.com/library/windows/hardware/hh770515.aspx).

### Radio management

The 3rd-party Bluetooth radio management plugin is not supported as Bluetooth Radio Management support is now provided inbox. Transport drivers must respond to being D3 by turning off power to the radio.

### Mechanical

We do not recommend an external switch for controlling the on/off state of the Bluetooth radio.

### Third-party Bluetooth software

3rd party software can be added to x86/x64 Windows PCs to provide additional Bluetooth profile functionality not natively shipped in Windows. To avoid impacting the Windows user experience, causing incompatibilities with other Windows PCs, and creating serviceability issues on upgrade, Windows recommends the following:

1.  Make them installable by INF so they can be easily serviced to support Windows as a Service.
2.  Do not replace inbox profiles, icons, or user interfaces.
3.  When adding profiles and/or other software, use the native Windows APIs.
4.  Use Wi-Fi Direct for high bandwidth peer-to-peer scenarios instead of Bluetooth High Speed (HS).
5.  Optimal app footprint to minimize impact on manufacturing time.
6.  Optimal app performance to minimize impact on off to on transitions (boot, resume from S3/S4) and energy efficiency.

## Related topics


[Advertising API](http://go.microsoft.com/fwlink/p/?LinkId=723573)

[Background support](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.background.aspx)

[GattCharacteristicNotificationTrigger](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.background.gattcharacteristicnotificationtrigger.aspx)

[RfcommConnectionTrigger](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.background.rfcommconnectiontrigger.aspx)

[Hardware Offload (HCI)](https://msdn.microsoft.com/library/windows/hardware/dn917903.aspx)

[Dual mode, LE Privacy 1.1 (Bluetooth Core Spec updates)](https://www.bluetooth.org/DocMan/handlers/DownloadDoc.ashx?doc_id=282159)

[Bluetooth audio enhancements - aptX® audio codec](http://www.csr.com/products/aptx)

 

 







