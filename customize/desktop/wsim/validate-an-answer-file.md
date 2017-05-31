---
title: Validate an Answer File
description: Validate an Answer File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 82389009-0a96-4213-a2b1-17209ba670c2
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Validate an Answer File


Before you can save an answer file, you must validate the settings. After you successfully validate an answer file, you can apply all the setting values in the answer file to the Windows® image.

**To validate the settings in an answer file**

1.  Open Windows System Image Manager (Windows SIM).

2.  Open a Windows image. For more information, see [Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md).

3.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

4.  On the **Tools** menu, click **Validate Answer File**.

    Windows SIM compares the setting values in the answer file with the available settings in the Windows image.

    If the answer passes validation, a message appears in the **Messages** pane on the **Validation** tab. This message verifies that no warnings or errors occurred in the answer file. Otherwise, error messages appear in the same location.

    If an error occurs, double-click the error in the **Messages** pane to browse to the setting.

    If no modifications have been made to component settings, the values of the component settings are not saved in the answer file.

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Create or Open an Answer File](create-or-open-an-answer-file.md)

[Configure Components and Settings in an Answer File](configure-components-and-settings-in-an-answer-file.md)

[Hide Sensitive Data in an Answer File](hide-sensitive-data-in-an-answer-file.md)

[Add a Device Driver Path to an Answer File](add-a-device-driver-path-to-an-answer-file.md)

[Add a Package to an Answer File](add-a-package-to-an-answer-file.md)

[Add a Custom Command to an Answer File](add-a-custom-command-to-an-answer-file.md)

[Find a Component, Setting, or Package in Windows SIM](find-a-component-setting-or-package-in-windows-sim.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Validate%20an%20Answer%20File%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





