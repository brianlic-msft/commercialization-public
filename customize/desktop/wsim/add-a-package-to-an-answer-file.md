---
title: Add a Package to an Answer File
description: Add a Package to an Answer File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e2c075b2-330e-4bbc-80a3-4221e6d7274b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a Package to an Answer File


The following procedures describe how to add a package to an answer file by using Windows® System Image Manager (Windows SIM).

You can add a package to an answer file by using one of three options: from the **Insert** menu, from the **Windows Image** pane, or from an open distribution-share folder in the **Distribution Share** pane.

**To add a package from the Insert menu**

1.  Open Windows SIM.

2.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

3.  Open a distribution share. For more information, see [Create or Open a Distribution Share](create-or-open-a-distribution-share.md).

4.  On the **Insert** menu, click **Package(s)**.

    The **Select Package(s) to Insert** window opens.

5.  Browse to the package that you want to add, and then click **Open**.

6.  In the **Properties** pane, under **Settings**, select one of the following values for **Action**: **Install**, **Remove**, **Configure**, or **Stage**.

**To add a package from the Windows Image pane**

1.  Open Windows SIM.

2.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

3.  Open a distribution share. For more information, see [Create or Open a Distribution Share](create-or-open-a-distribution-share.md).

4.  In the **Windows Image** pane, select the **Packages** node. Expand the node, right-click the package that you want to add to the answer file, and then click **Add to Answer File**.

5.  In the **Properties** pane, under **Settings**, choose one of the following values for **Action**: **Install**, **Remove**, **Configure**, or **Stage**.

**To add a package from a distribution share**

1.  Open Windows SIM.

2.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

3.  Open a distribution share. For more information, see [Create or Open a Distribution Share](create-or-open-a-distribution-share.md).

4.  Right-click the package that you want to add to the distribution share packages directory, and then click **Add to Answer File**.

    The package is added to the answer file in the packages section.

5.  In the **Properties** pane, under **Settings**, choose one of the following values for **Action**: **Install**, **Remove**, **Configure**, or **Stage**.

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Create or Open an Answer File](create-or-open-an-answer-file.md)

[Configure Components and Settings in an Answer File](configure-components-and-settings-in-an-answer-file.md)

[Validate an Answer File](validate-an-answer-file.md)

[Hide Sensitive Data in an Answer File](hide-sensitive-data-in-an-answer-file.md)

[Add a Device Driver Path to an Answer File](add-a-device-driver-path-to-an-answer-file.md)

[Add a Custom Command to an Answer File](add-a-custom-command-to-an-answer-file.md)

[Find a Component, Setting, or Package in Windows SIM](find-a-component-setting-or-package-in-windows-sim.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Add%20a%20Package%20to%20an%20Answer%20File%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





