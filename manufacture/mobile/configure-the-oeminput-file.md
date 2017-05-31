---
Description: 'An OEMInput file specifies the device platform, the feature manifest files, the release type, device model, build type, languages you want to support, boot UI language, device resolutions, and other attributes like optional features that you want to include as part of your image.'
ms.assetid: 67dc279e-a7f6-4686-bebf-6d0098d0f782
MSHAttr: 'PreferredLib:/library'
title: Configure the OEMInput file
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure the OEMInput file


Now that you've configured your customization settings in the MCSF CAF and added custom OEM features in the OEM manifest file, you'll need to create an OEMInput file that specifies the device platform, the feature manifest files, the release type, device model, build type, languages you want to support, boot UI language, device resolutions, and other attributes like optional features that you want to include as part of your image.

For more information about each element in the OEMInput file, see [OEMInput file contents](https://msdn.microsoft.com/library/windows/hardware/dn756778).

In this walkthrough, we will add the two features we defined in [Adding a package to an OEM manifest file](add-a-package-to-an-oem-manifest-file.md), specifying the languages that we want to support, and defining the rest of our image.

**To configure the OEMInput file**

1.  Create a new OEMInput.xml file or modify an existing OEMInput file. For an example of what the OEMInput.xml file looks like, see %WPDKCONTENTROOT%\\OEMInputSamples\\Fake in your kit installation folder.

    In the following example, we copied the contents of the %WPDKCONTENTROOT%\\OEMInputSamples\\Fake\\TestOEMInput.xml file and made the following modifications:

    -   Added a new description.

    -   Added English (United Kingdom), French (France), Spanish (Spain), and Chinese (Simplified) to the list of included devices languages in addition to English (United States). We added this in the **UserInterface** section. For more information about other languages you can add to your mobile device, including how to change the default device language and regional format, see [Mobile device languages](https://msdn.microsoft.com/library/windows/hardware/dn772212).

    -   Added the ContosoOptionalFeatures.xml feature manifest file that we created in the [Adding a package to an OEM manifest file](add-a-package-to-an-oem-manifest-file.md) walkthrough and placed it under the **AdditionalFMs** section of the OEMInput file by adding a new **AdditionalFM** entry and specifying the location and name of the feature manifest file.

    -   Added the ECHO\_DRIVER and QUICK\_ACTIONS features by adding a new **OEM** subsection within the **Features** section of the OEMInput file. For each feature that we add within the **OEM** section, we add a new **Feature** entry and then specify the name of the feature that we defined in the feature manifest file.

    **Note**  If you're using a mobile reference device, make sure you update the values in the **SOC**, **SV**, and **Device** sections of the OEMInput.xml. You may also change the **ReleaseType** depending on what you're trying to do. Make sure you follow the guidance in [OEMInput file contents](https://msdn.microsoft.com/library/windows/hardware/dn756778) when specifying values for these elements.

     

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <OEMInput xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
              xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
              xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">
      <Description>Windows mobile image test FFU generation</Description>
      <SOC>FAKE_SOC_Test</SOC>
      <SV>Microsoft</SV>
      <Device>FAKE</Device>
      <ReleaseType>Test</ReleaseType>
      <BuildType>fre</BuildType>
      <SupportedLanguages>
        <UserInterface>
          <Language>en-US</Language>
          <Language>en-GB</Language>
          <Language>fr-FR</Language>
          <Language>es-ES</Language>
          <Language>zh-CN</Language>
        </UserInterface>
        <Keyboard>
          <Language>en-US</Language>
        </Keyboard>
        <Speech>
          <Language>en-US</Language>
        </Speech>
      </SupportedLanguages>
      <BootUILanguage>en-US</BootUILanguage>
      <BootLocale>en-US</BootLocale>
      <Resolutions>
        <Resolution>480x800</Resolution>
      </Resolutions>
      <AdditionalFMs>
        <AdditionalFM>%WPDKROOT%\FMFiles\arm\ContosoOptionalFeatures.xml</AdditionalFM>
        <AdditionalFM>%WPDKROOT%\FMFiles\arm\MSOptionalFeatures.xml</AdditionalFM>
      </AdditionalFMs>
      <Features>
        <Microsoft>
          <Feature>IMGFAKEMODEM</Feature>
          <Feature>TEST_DISABLE_DISK_IDLE</Feature>
          <Feature>STANDARD_FEATURE_1</Feature>
          <Feature>CODEINTEGRITY_TEST</Feature>
          <Feature>SELFHOST_AUTOMATIC_DEVICE_CONFIGURATOR</Feature>
          <Feature>LOCATIONFRAMEWORKAPP</Feature>
          <Feature>FACEBOOK</Feature>
          <Feature>COMMSENHANCEMENTGLOBAL</Feature> 
          <Feature>KDNETUSB_TEST_ON</Feature>
          <Feature>TESTINFRASTRUCTURE</Feature>
          <Feature>TEST</Feature>
          <Feature>STARTUPOVERRIDES</Feature>
          <Feature>GWPCERTTESTPROV</Feature>
          <Feature>MOBILECORE_TEST</Feature>
          <Feature>DRIVERS_WDTFINFRA</Feature>
          <Feature>SKYPE</Feature>
          <Feature>BOOTSEQUENCE_TEST</Feature>
          <Feature>SKIPOOBE</Feature>
          <Feature>CORTANADBG_TEST_PROTECTED</Feature>
          <Feature>TEST_PROTECTED</Feature>
          <Feature>PSEUDOLOCALES</Feature>
        </Microsoft>
        <OEM>
          <Feature>ECHO_DRIVER</Feature>
          <Feature>QUICK_ACTIONS</Feature>
        </OEM>
      </Features>
      <Product>Windows Phone</Product>
    </OEMInput>
    ```

2.  Name and save your OEMInput.xml file. For our example, we named it ContosoTestOEMInput.xml and saved it in a %WPDKCONTENTROOT%\\ContosoOEMInput folder.

 

 



