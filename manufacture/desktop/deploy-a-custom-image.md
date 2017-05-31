---
author: Justinha
Description: Deploy a Custom Image
ms.assetid: 7eb6bc78-d1ce-42f2-bf1a-b34c4b14ed66
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Deploy a Custom Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy a Custom Image


In this topic you create a reference installation, capture an image of the installation, and rerun Windows® Setup with an answer file that points to your custom image. Deploying a custom image using Windows Setup provides several benefits over applying an image using an image capture tool.

Setup supports the following:

-   Applying another answer file for additional customizations during deployment.

-   Reconfiguring disk configuration.

-   Adding additional drivers.

-   Replacing a product key.

-   Selecting a different language to install.

-   Selecting from a list of images to install, if your image file contains more than one image.

-   Installing to a different drive location.

-   Upgrading an existing Windows installation.

-   Configuring the computer to dual-boot operating systems.

-   Ensuring that the hardware can support Windows 8.

There are some limitations to installing a custom image using Windows Setup. For more information, see [Windows Setup Scenarios and Best Practices](windows-setup-scenarios-and-best-practices.md).

In this topic:

-   [Copy the Windows product DVD source files to a network share](#bkmk-1)

-   [Create a master installation](#bkmk-2)

-   [Capture an image of the installation](#bkmk-3)

-   [Create a custom answer file](#bkmk-4)

-   [Deploy the image by using Windows Setup](#bkmk-5)

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete this walkthrough, you need the following:

-   A technician computer. A technician computer is any computer that has the Windows Assessment and Deployment Kit (Windows ADK) tools installed..

-   A Windows 8 product DVD.

-   A master computer on which you will install and capture your custom image.

-   Bootable Windows PE media. There are several types of Windows PE media that you can create. For more information about these options, see [WinPE for Windows 10](winpe-intro.md).

-   Access to a network share to store your custom image and Windows Setup source files.

## <span id="bkmk-1"></span><span id="BKMK-1"></span>Step 1: Copy the Windows product DVD source files to a network share


On your technician computer, copy the entire content of the Windows product DVD to a network share. For example:

``` syntax
net use N: \\server\share\
xcopy D: N:\WindowsDVD\ /s
```

where D: is the DVD-ROM drive on your local computer.

## <span id="bkmk-2"></span><span id="BKMK-2"></span>Step 2: Create a master installation


1.  Create a master installation by using one of the following methods:

    -   [Boot from a DVD](boot-from-a-dvd.md)

    -   [Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

2.  After the installation is complete, shut down the computer.

## <span id="bkmk-3"></span><span id="BKMK-3"></span>Step 3: Capture an image of the installation


In this step, you will capture an image of the reference installation by using the Deployment Image Servicing and Management (**DISM**) tool and then store the custom image on a network share.

1.  Boot the reference computer by using your bootable Windows PE media.

2.  At a command prompt, capture an image of the installation. You specify a name and description as part of your image capture. All values are required by Windows Setup. If a .wim file does not include these values, then the image will not install correctly. For example:

    ``` syntax
    Dism /Capture-Image /ImageFile:C:\myimage.wim /CaptureDir:c:\ /Compress:fast /CheckIntegrity /ImageName:"x86_Ultimate" /ImageDescription:"x86 Ultimate Compressed"
    ```

3.  Replace the default Install.wim on the network share with your custom image. The image must be called Install.wim. For example:

    ``` syntax
    net use N: \\server\share\
    copy C:\myimage.wim N:\WindowsDVD\sources\install.wim
    ```

    If necessary, provide network credentials for appropriate network access.

For more information, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="bkmk-4"></span><span id="BKMK-4"></span>Step 4: Create a custom answer file


In this step, you will create an answer file that points to your custom image. This step assumes that you have already built an answer file and have a working catalog.

1.  On your technician computer, open **Windows System Image Manager**.

2.  On the **File** menu, click **New Answer File**.

3.  In the **Windows Image** pane of Windows SIM, expand the **Components** node to display available settings.

4.  Add the following components to your answer file by right-clicking the component and then selecting the appropriate configuration pass.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Component</th>
    <th align="left">Configuration Pass</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\CreatePartitions\ CreatePartition</strong></p></td>
    <td align="left"><p><strong>windowsPE</strong></p></td>
    </tr>
    <tr class="even">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\ModifyPartitions\ ModifyPartition</strong></p></td>
    <td align="left"><p><strong>windowsPE</strong></p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\ImageInstall\OSImage\InstallTo</strong></p></td>
    <td align="left"><p><strong>windowsPE</strong></p></td>
    </tr>
    </tbody>
    </table>

    **Note**  
    Expand the component list until you see the lowest setting listed in the previous table, and then add that setting to your answer file. This shortcut will add the setting and all parent settings to your answer file in one step.

5.  All of the settings that you added must appear in the **Answer File** pane. Select and configure each setting as specified in the following table.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Component</th>
    <th align="left">Value</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>WillShowUI = OnError</code></pre></td>
    </tr>
    <tr class="even">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>DiskID = 0
    WillWipeDisk = true</code></pre></td>
    </tr>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\CreatePartitions\CreatePartition</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>Extend = false
    Order = 1
    Size = 300</code></pre>
    <pre class="syntax" space="preserve"><code>Type = Primary</code></pre></td>
    </tr>
    <tr class="even">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\CreatePartitions\CreatePartition</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>Extend = true
    Order = 2</code></pre>
    <pre class="syntax" space="preserve"><code>Type = Primary</code></pre></td>
    </tr>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\ModifyPartitions\ModifyPartition</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>Active = true
    Extend = false
    Format = NTFS
    Label = System
    Letter = S
    Order = 1
    PartitionID = 1</code></pre></td>
    </tr>
    <tr class="even">
    <td align="left"><p><strong>Microsoft-Windows-Setup\DiskConfiguration\Disk\ModifyPartitions\ModifyPartition</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>Extend = false
    Format = NTFS
    Label = Windows
    Letter = C
    Order = 2
    PartitionID = 2</code></pre>
    <p></p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p><strong>Microsoft-Windows-Setup\ImageInstall\OSImage\</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>WillShowUI = OnError</code></pre></td>
    </tr>
    <tr class="even">
    <td align="left"><p><strong>Microsoft-Windows-Setup\ImageInstall\OSImage\InstallTo</strong></p></td>
    <td align="left"><pre class="syntax" space="preserve"><code>DiskID = 0
    PartitionID = 2</code></pre></td>
    </tr>
    </tbody>
    </table>

6.  In a command prompt window copy the answer file to a network location. For example:

    ``` syntax
    net use N: \\server\share\
    md N:\AnswerFiles
    copy C:\deploy_unattend.xml N:\AnswerFiles\
    ```

    If necessary, provide network credentials for appropriate network access.

## <span id="bkmk-5"></span><span id="BKMK-5"></span>Step 5: Deploy the image by using Windows Setup


In this step, you will deploy your custom image from a network share onto a destination computer.

1.  Boot the destination computer by using your bootable Windows PE media.

2.  Connect to the network share that you specified in [Step 4: Create a custom answer file](#bkmk-4), and then run Setup with your answer file. For example:

    ``` syntax
    net use N: \\server\share
    N:\WindowsDVD\setup /unattend:N:\AnswerFiles\deploy_unattend.xml
    ```

    If necessary, provide network credentials for appropriate network access.

## <span id="Next_Steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next Steps


You can further customize your answer file to include additional options. You can also build a DVD deployment media that contains the same content that you put on the network share. A single deployment DVD provides a portable installation solution that requires no network or any additional resources. The process includes building a configuration set and recapturing all source files into a single DVD.

**Important**  
The DVD media that you create is for internal deployment use only. You cannot redistribute this media.

 

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Boot from a DVD](boot-from-a-dvd.md)

[Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md)

 

 






