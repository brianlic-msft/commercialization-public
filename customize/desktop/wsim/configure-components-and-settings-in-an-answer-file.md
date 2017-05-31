---
title: Configure Components and Settings in an Answer File
description: Configure Components and Settings in an Answer File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 649ef6a0-019e-4e98-bb2d-e737537d84cc
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure Components and Settings in an Answer File


The following procedure describes how to do the following:

-   Add a component to an answer file

-   Customize a setting value in an answer file

-   Add a list item to an answer file

List items are settings that can be declared multiple times, and each declaration contains different values. For example, the Windows Internet Explorer **FavoritesList** setting is used to specify multiple Favorites links. For each new Favorites link that you want to add to Internet Explorer, you add a new **FavoritesList** setting.

**To add a component to an answer file**

1.  Open Windows System Image Manager (Windows SIM).

2.  Open a Windows image. For more information, see [Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md).

3.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

4.  In the **Windows Image** pane, locate the component or package that you want to add to the answer file.

5.  Right-click the component, and then select a configuration pass.

    The component is added to the answer file in the specified configuration pass.

    **Note**  
    To search the entire Windows image (.wim) file, press Ctrl+F.

     

**To customize a setting value in an answer file**

1.  Open Windows SIM.

2.  Open a Windows image. For more information, see [Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md).

3.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

4.  In the **Answer File** pane, find the configuration pass that contains the component for the setting that you want to change.

5.  Select the component or package that contains the setting that you want to change.

6.  In the **Settings** section of the **Properties** pane, change the value of the setting to update it. Depending on the type of setting, you can enter a new setting or select from a drop-down list of possible settings.

    For more information about the various settings and properties, see [Component Settings and Properties Reference](component-settings-and-properties-reference.md).

**To add a list item to an answer file**

1.  Open Windows SIM.

2.  Open a Windows image. For more information, see [Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md).

3.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

4.  In the **Windows Image** pane, add the component or setting to the answer file.

5.  In the **Answer File** pane, right-click the list item, and then click **Insert**.

    Windows SIM inserts a new list-item type. For example, right-click the **DriverPaths** setting, and then click **Insert new PathAndCredentials**. A new **PathAndCredentials** setting is added to the answer file.

6.  To add more list items, repeat the previous step.

    **Important**  
    Each list item should contain a unique **Key** value to differentiate the list item from other list items of the same type.

     

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Create or Open an Answer File](create-or-open-an-answer-file.md)

[Validate an Answer File](validate-an-answer-file.md)

[Hide Sensitive Data in an Answer File](hide-sensitive-data-in-an-answer-file.md)

[Add a Device Driver Path to an Answer File](add-a-device-driver-path-to-an-answer-file.md)

[Add a Package to an Answer File](add-a-package-to-an-answer-file.md)

[Add a Custom Command to an Answer File](add-a-custom-command-to-an-answer-file.md)

[Find a Component, Setting, or Package in Windows SIM](find-a-component-setting-or-package-in-windows-sim.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Configure%20Components%20and%20Settings%20in%20an%20Answer%20File%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





