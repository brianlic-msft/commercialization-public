---
title: Microsoft-Windows-TwinUI
description: Microsoft-Windows-TwinUI
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 62B05D59-7F90-4917-A4E4-90AA21A7A2D8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-TwinUI


The `Microsoft-Windows-TwinUI` component specifies advanced pen settings.

Starting with Windows 10, build 1607, Windows provides a way for you to link to your advanced Pen settings application from directly within the Settings app. The end user sees the setting in **Settings** -&gt; **Devices** -&gt; **Pen**. This page will display a link to your advanced settings application only when the you have set the correct registry entries during sysprep.

## Ink Workspace


All of Windows Ink Workspace is available above lock. This functionality is off by default for privacy reasons; it is under the control of Windows customers. Once turned on via Settings, the user can utilize pen click functionality to launch Ink Workspace or any of its experiences directly depending on how they have configured their pen clicks. By default on a new system, it is:

-   **Single click** – Ink Workspace Home
-   **Double click** – Screen Sketch
-   **Press and Hold** (only supported on some pens) – Sticky Notes

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[CustomProtocol](microsoft-windows-twinui-customprotocol.md)</p></td>
<td><p><code>CustomProtocol</code> specifies that you are using your own advanced Pen settings application.</p></td>
</tr>
</tbody>
</table>

 

## Applies to


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Unattend Example


```
<?xml version="1.0" encoding="UTF-8"?><unattend xmlns="urn:schemas-microsoft-com:unattend">
<settings pass="offlineServicing">
<component language="neutral" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" versionScope="nonSxS" publicKeyToken="31bf3856ad364e35" processorArchitecture="amd64" name="Microsoft-Windows-TwinUI">
<CustomProtocol>bingsports</CustomProtocol>
<DoubleClickBelowLockOverride>0</DoubleClickBelowLockOverride>
<LongPressBelowLockOverride>0</LongPressBelowLockOverride>
<SingleClickBelowLockOverride>0</SingleClickBelowLockOverride>
</component>
</settings>
<cpi:offlineImage xmlns:cpi="urn:schemas-microsoft-com:cpi" cpi:source="wim:d:/install.wim#Windows 10 Enterprise Technical Preview"/>
</unattend>
```

## Set advanced Pen settings using DISM


1.  Open a command prompt with administrator privileges.
2.  Mount the image. You will need to customize the following example to point to your install.wim directory.

    `dism /mount-wim /wimfile:c:\bootmedia\sources\install.wim /index:1 /MountDir:c:\wim`

3.  Enable the feature.

    `Dism /online /Enable-Feature /FeatureName:Microsoft-Windows-Twinui`

4.  Commit the change.

    `dism /unmount-wim /MountDir:c:\wim /Commit`

## Set advanced Pen settings app using Windows System Image Manager (WSIM)


1.  Open Windows SIM.
2.  On the **File** menu, click **Select Windows Image**.
3.  In the **Select a Windows Image** dialog box, select the file type in the **Files of type** drop-down list, and then browse to a Windows image( \*.wim) file.
4.  If there is more than one type of Windows image in the file, select a specific Windows image in the **Select an Image** box.

    The Windows image file or catalog file appears in the **Windows Image** pane.

5.  Click **Open**. If you have not previously opened that Windows image file or have not refreshed the catalog file recently, Windows SIM prompts you to create or re-create the catalog file.
6.  In the **Answer File** pane, find the offline services pass that contains the component for the setting that you want to change, in this case Microsoft-Windows-TwinUI.
7.  Select the Microsoft-Windows-TwinUI component.
8.  In the **Settings** section of the **Properties** pane, provide a value for “oem-app” for [CustomProtocol](microsoft-windows-twinui-customprotocol.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-TwinUI%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




