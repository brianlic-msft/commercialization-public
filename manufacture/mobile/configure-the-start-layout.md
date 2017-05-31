---
Description: 'You can now easily configure the default Start layout to include Web links, secondary tiles, folders, and apps. The converged Windows 10 Start layout requires that you create a LayoutModification.xml file, which we''ll create in this walkthrough.'
ms.assetid: 99238b56-5c9c-4b5e-a750-e64a10e417af
MSHAttr: 'PreferredLib:/library'
title: Configure the Start layout
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure the Start layout


You can now easily configure the default Start layout to include Web links, secondary tiles, folders, and apps. The converged Windows 10 Start layout requires that you create a LayoutModification.xml file, which we'll create in this walkthrough.

**Note**  The schema for the LayoutModification.xml file is different from the MCSF customization answer file schema or the Windows provisioning answer file schema. You will need to use the LayoutModification.xml to fully take advantage of the Start customization in Windows 10 and you can use the Start settings in either MCSF or Windows Provisioning to reference LayoutModification.xml.

 

If you are not new to Windows mobile development and were using pre-existing MCSF settings pertaining to the Start layout, we highly recommend that you switch to a LayoutModification.xml to take full advantage of the Start experience. Also note that not all pre-existing MCSF Start settings are supported in Windows 10.

In this walkthrough, we will:

-   Create two versions of the Start layout, one with a folder and another without a folder.

-   Configure the MCSF Start layout settings to specify that we are using the new layout modification XML for our layout, creating variants in the CAF file, and specifying which Start layout applies to the variants we've created.

**Note**  Make sure you've read [Start layout for Windows 10 mobile editions](https://msdn.microsoft.com/library/windows/hardware/mt171093) before doing this walkthrough. The topic provides more detailed information about each element in LayoutModification.xml, which is not covered in this walkthrough, as well as limitations and restrictions that you need to be aware of.

 

**To configure the Start layout modification file**

1.  Create a file called LayoutModification1.xml.

2.  Add the XML code to:

    -   Pin a medium-sized tile on row 6, column 0. The tile is for the MSN News app.
    -   Pin a medium-sized tile on row 6, column 2. The tile is a Web link for the Contoso home page.
    -   Pin a small-sized folder on row 6, column 4. The folder name is "Contoso apps" and it contains the following:
        -   A medium-sized tile for the MSN Apps app.
        -   A medium-sized tile for the MSN Money app.

    The following XML example shows what you need to add to the LayoutModification.xml file.

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <LayoutModificationTemplate
        xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
        xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
        xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
        Version="1">
        <DefaultLayoutOverride>
          <StartLayoutCollection>
                <defaultlayout:StartLayout>
                  <start:Group>
                      <start:Tile
                        AppUserModelID="Microsoft.BingNews_8wekyb3d8bbwe!ApplicationID"
                        Size="2x2"
                        Row="6"
                        Column="0"/>
                      <start:SecondaryTile
                        AppUserModelID="Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"
                        TileID="MyWeblinkTile"
                        Arguments="http://www.contoso.com"
                        DisplayName="Contoso Homepage"
                        Square150x150LogoUri="ms-appx:///Assets/MicrosoftEdgeSquare150x150.png" 
                        Wide310x150LogoUri="ms-appx:///Assets/MicrosoftEdgeWide310x150.png"
                        ShowNameOnSquare150x150Logo="true"
                        ShowNameOnWide310x150Logo="false"
                        BackgroundColor="#FF112233"
                        Size="2x2"
                        Row="6"
                        Column="2"/>
                      <start:Folder
                        Name="Contoso apps"
                        Size="2x2"
                        Row="6"
                        Column="4">
                        <start:Tile
                          AppUserModelID="Microsoft.BingMaps_8wekyb3d8bbwe!ApplicationID"
                          Size="2x2"
                          Row="0"
                          Column="0"/>
                        <start:Tile
                          AppUserModelID="Microsoft.BingFinance_8wekyb3d8bbwe!ApplicationID"
                          Size="2x2"
                          Row="0"
                          Column="2"/>
                        <!-- Remove these comments if you have an app that you can preload and want to add to the folder
                        <start:Tile
                          AppUserModelID="TBD"
                          Size="2x2"
                          Row="0"
                          Column="4"/>
                        -->
                      </start:Folder>
                  </start:Group>
                </defaultlayout:StartLayout>
          </StartLayoutCollection>
        </DefaultLayoutOverride>
    </LayoutModificationTemplate>
    ```

3.  Save the xml file and note the location of the file; for example, *C:\\Contoso\\Customizations\\LayoutModification1.xml*.

4.  Using the same xml file, now save it as *LayoutModification2.xml*.

5.  Modify the contents of the new *LayoutModification2.xml* file by deleting everything within the **start:Folder** element and replacing that folder tile location with the MSN Money app.

    The contents of your XML file should look like this:

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <LayoutModificationTemplate
        xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
        xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
        xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
        Version="1">
        <DefaultLayoutOverride>
          <StartLayoutCollection>
                <defaultlayout:StartLayout>
                  <start:Group>
                      <start:Tile
                        AppUserModelID="Microsoft.BingNews_8wekyb3d8bbwe!ApplicationID"
                        Size="2x2"
                        Row="6"
                        Column="0"/>
                      <start:SecondaryTile
                        AppUserModelID="Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"
                        TileID="MyWeblinkTile"
                        Arguments="http://www.contoso.com"
                        DisplayName="Contoso Homepage"
                        Square150x150LogoUri="ms-appx:///Assets/MicrosoftEdgeSquare150x150.png" 
                        Wide310x150LogoUri="ms-appx:///Assets/MicrosoftEdgeWide310x150.png"
                        ShowNameOnSquare150x150Logo="true"
                        ShowNameOnWide310x150Logo="false"
                        BackgroundColor="#FF112233"
                        Size="2x2"
                        Row="6"
                        Column="2"/>
                      <start:Tile
                        AppUserModelID="Microsoft.BingFinance_8wekyb3d8bbwe!ApplicationID"
                        Size="2x2"
                        Row="6"
                        Column="4"/>
                  </start:Group>
                </defaultlayout:StartLayout>
          </StartLayoutCollection>
        </DefaultLayoutOverride>
    </LayoutModificationTemplate>
    ```

6.  Save the xml file and note the location of the file; for example, *C:\\Contoso\\Customizations\\LayoutModification2.xml*.

7.  Add the layout modification files and configure the Start layout settings in the MCSF CAF or Windows Provisioning answer file (WPAF).

    -   For MCSF: See *Configure the Start layout* in [Configure customization settings](configure-customization-settings.md).
    -   For Windows Provisioning: If you are using the Windows Imaging and Configuration Designer (ICD) UI, see *Configure the Start layout* in [Use the Windows ICD UI to customize and build a mobile image](use-the-windows-icd-ui-to-customize-and-build-a-mobile-image.md). If you are using the Windows ICD CLI (hybrid method), see *Configure the Start layout* in [Use the Windows ICD CLI to customize and build a mobile image](use-the-windows-icd-cli-to-customize-and-build-a-mobile-image.md).

 

 



