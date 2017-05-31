---
title: Device.Imaging.Scanner
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.Imaging.Scanner

 - [Device.Imaging.Scanner.Base](#device.imaging.scanner.base)
 - [Device.Imaging.Scanner.WSD](#device.imaging.scanner.wsd)

<a name="device.imaging.scanner.base"></a>
## Device.Imaging.Scanner.Base

### Device.Imaging.Scanner.Base.dataTransfer

*WIA drivers must support specific data transfer implementations.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows Image Acquisition (WIA) drivers must do the following:

-   Use only the **Write**, **Seek**, and **SetSizeIStream** methods during downloads.

-   Use only the **Read**, **Seek**, and **StatIStream** methods during uploads.

-   Send valid **lPercentComplete** values during calls to the **IWiaMiniDrvTransferCallback::SendMessage**&lt;element&gt;.  **lPercentComplete** must be between 0 and 100 inclusive.

-   Send correct ulTransferredBytes values during calls to IWiaMiniDrvTransferCallback::SendMessage.

-   Append new data to the end of streams that the **IWiaMiniDrvTransferCallback::GetNextStream**&lt;element&gt; receives if the streams are not empty.

-   Return success values from the I**Wia  MiniDrv::drvAcquireItemData** method when the driver calls I**WiaMiniDrv::drvAcquireItemData** by using good parameters in all supported formats.

-   Release their references to the application's **IStream** object before their **IWiaMiniDrv::drvAcquireItemData** methods return or call **IWiaMiniDrvTransferCallback::GetNextStream**.

-   Send one stream that contains a multi-page file during downloads by using all supported TYMED\_MULTIPAGE\_FILE formats.

-   Send one stream for each item during downloads by using all supported TYMED\_FILE formats.

-   Return S\_FALSE from IWiaMiniDrv::drvAcquireItemData if IWiaMiniDrvTransferCallback::SendMessage returns S\_FALSE.

-   Continue to transfer any subsequent items during multi-item downloads after **IWiaMiniDrvTransferCallback::GetNextStream** returns WIA\_STATUS\_SKIP\_ITEM.

-   Return S\_OK from **IWiaMiniDrv::drvAcquireItemData** during single-item and multi-item downloads after the **IWiaMiniDrvTransferCallback::GetNextStream** returns WIA\_STATUS\_SKIP\_ITEM for any item.

-   Abort transfer of all items after **IWiaMiniDrvTransferCallback::GetNextStream** returns S\_FALSE.

-   Return from **IWiaMiniDrv::drvAcquireItemData** calls during canceled transfers in less time than during completed transfers.

-   Return a failure code from IWiaMiniDrv::drvAcquireItemData if IWiaMiniDrvTransferCallback::GetNextStream fails.

-   Return a standard COM failure code from **IWiaMiniDrv::drvAcquireItemData** if **IWiaMiniDrvTransferCallback::GetNextStream** returns a NULL stream pointer.

-   Return a failure code from IWiaMiniDrv::drvAcquireItemData if IWiaMiniDrvTransferCallback::SendMessage fails.

-   Successfully transfer items when an identical device is installed and when the identical device transfers an item simultaneously.

-   Return a failure code from **IWiaMiniDrv::drvAcquireItemData** if an **IStream** method fails.

-   Seek to the correct stream position after the driver begins the transfer or calls **IWiaMiniDrvTransferCallback::GetNextStream** or **IWiaMiniDrvTransferCallback::SendMessage**.

-   Function correctly if the WIA service terminates during a transfer and is then restarted, and a new transfer is requested.

-   Ignore calls to the **drvNotifyPnPEvent**&lt;element&gt; that contain WIA\_EVENT\_CANCEL\_IO if a transfer is not occurring, and not crash or hang.

-   Successfully transfer items after a valid WIA\_IPA\_TYMED property value is written by using a signed or unsigned variant type.

WIA drivers must not do the following:

-   Call a method of an application's **IStream** object other than the **IUnknown::Release** method after an application's transfer callback returns S\_FALSE, WIA\_STATUS\_SKIP\_ITEM, or an error.

-   Call a method of an application's **IStream** object other than the **IUnknown::Release** method after the driver's **IWiaMiniDrv::drvAcquireItemData** method returns or calls **IWiaMiniDrvTransferCallback::GetNextStream** during a multi-item transfer.

-   Call **IWiaMiniDrvTransferCallback::SendMessage** by using WIA\_TRANSFER\_MSG\_END\_OF\_STREAM and WIA\_TRANSFER\_MSG\_END\_OF\_TRANSFER messages.

-   Call IWiaMiniDrvTransferCallback::SendMessage or IWiaMiniDrvTransferCallback::GetNextStream after IWiaMiniDrvTransferCallback::SendMessage returns S\_FALSE or an error.

-   Crash or hang if a device requests an upload by using an invalid or empty stream.

 

### Device.Imaging.Scanner.Base.wia20

*Scanners and multi-function printers that have scanning ability must implement the WIA 2.0 driver architecture according to the Windows Driver Kit guidelines.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Scanners and multi-function printers that have scanning ability must implement the WIA 2.0 driver architecture according to the guidelines in the Windows Driver Kit.
Scanners support stream-based image transfers. In stream-based transfers, the application gives WIA the stream to use, and then the driver reads or writes to the stream. The stream may be a file stream, a memory stream, or any other type of stream. The stream is transparent to the driver. Using streams also provides easy integration with the image processing filter. This helps to prevent complications that occur because of the destination type (memory or file).
Scanners need to correctly implement the Windows WIA Scanner Item Architecture for flatbed, ADF, and film scanners and scanners that have storage. The Windows Driver Kit reference documents and tools outline the WIA scanner item architecture. Device manufacturers must implement WIA support as described in the Windows Driver Kit.

*Design Notes*

WIA 2.0 enables new stream-based transfer models and certain extensions that include an image-processing filter, a segmentation filter, and error handling. For more information about WIA 2.0, see "Introduction to WIA 2.0" at <http://www.microsoft.com/whdc/device/stillimage/WIA20-intro.mspx> *and "*What's new in WIA 2.0" at <http://msdn.microsoft.com/en-us/library/ms630379.aspx>*.*

### Device.Imaging.Scanner.Base.WIAProperties

*Scanners must implement support for all required WIA properties and property values.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The Windows Driver Kit (WDK) reference documents and tools outline the properties and property values for WIA. Scanners must implement WIA as described in the WDK.

<a name="device.imaging.scanner.wsd"></a>
## Device.Imaging.Scanner.WSD

### Device.Imaging.Scanner.WSD.WSScan

*Scanners that have a network connection must implement the WS-Scan protocol.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
</td></tr></table>

**Description**

This requirement applies to scanners or multifunction printers that have scanning ability, connect to the network, and have a physical scan button on the device. These scanners or multifunction printers must implement the following WS-Scan protocol requirements as outlined in the WS-Scan specification v1.0:

-   The device must correctly implement all events and operations that the specification defines.

<!-- -->

-   The device must support the **ScanAvailableEvent** so that users can initiate a scan from the scanner and push the document to a scanning application.

<!-- -->

-   The device must support the Microsoft WSD scan class driver for all device features that WS-Scan exposes.

-   If the device has ADF and plate scanning, the device must support those media over WS-Scan.

For more information, see "Implementing Web Services on Devices for Printing and Scanning" at <http://www.microsoft.com/whdc/connect/rally/wsdspecs.mspx>*.*

