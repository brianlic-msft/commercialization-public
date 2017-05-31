---
author: Justinha
Description: 'WinPE: Storage Area Network (SAN) Policy'
ms.assetid: fb9b42b2-432e-4c88-9973-4d9d832645df
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Storage Area Network (SAN) Policy'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Storage Area Network (SAN) Policy


Storage area network (SAN) functionality enables a computer to mount disks and other storage devices automatically from other computers. By configuring the SAN policy on a Windows Preinstallation Environment (Windows PE) image, you can control whether or not disks are automatically mounted and which disks can be mounted. You can also disable the policy to automatically mount disks.

## <span id="Configuring_the_SAN_policy_on_a_Windows_PE_image"></span><span id="configuring_the_san_policy_on_a_windows_pe_image"></span><span id="CONFIGURING_THE_SAN_POLICY_ON_A_WINDOWS_PE_IMAGE"></span>Configuring the SAN policy on a Windows PE image


For Windows PE images that are available in the Windows Assessment and Deployment Kit (Windows ADK), the default SAN policy is to mount available disks automatically. But if the SAN environment has many available disks, automatically mounting them might reduce the performance of Windows PE. The container ID determines the external and internal disk status. If the device container ID of a disk is the same as the root container ID, the disk is internal. Otherwise, it's an external disk. You can use the Setsanpolicy.cmd file in the Windows PE tools path to configure the SAN policy on a Windows PE image.

**To configure the SAN policy on a Windows PE image**

1.  Mount the Windows PE image to an available mount point. For example:

    ``` syntax
    Dism /mount-image /imagefile:C:\winpe_x86\ISO\sources\boot.wim /index:<image_index> /mountdir:C:\winpe_x86\mount
    ```

    where *&lt;image\_index&gt;* is the number of the selected image in the .wim file.

2.  Run the **setsanpolicy** command. For example:

    ``` syntax
    Setsanpolicy.cmd <image_path> <policy_number>
    ```

    where *&lt;image\_path&gt;* is the path of a mounted Windows PE image, and *&lt;policy\_number&gt;* is the SAN policy number.

    These values are valid *&lt;policy\_number&gt;* values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">SAN policy number</th>
    <th align="left">Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>1</p></td>
    <td align="left"><p>Mounts all available storage devices.</p>
    <p>This is the default value.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>2</p></td>
    <td align="left"><p>Mounts all storage devices except those on a shared bus.</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>3</p></td>
    <td align="left"><p>Doesn't mount storage devices.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>4</p></td>
    <td align="left"><p>New for Windows 8. Makes internal disks offline.</p>
    <div class="alert">
    <strong>Note</strong>  
    <p>All external disks and the boot disk are online.</p>
    </div>
    <div>
     
    </div></td>
    </tr>
    </tbody>
    </table>

    This example shows how to configure the SAN policy on a Windows PE image to mount all disks except those disks on a shared bus:

        Setsanpolicy C:\winpe_x86\mount <2>

    where *&lt;2&gt;* is the SAN policy number that mounts all storage device except those on a shared bus.

3.  Unmount the image and commit the changes. For example:

    ``` syntax
    Dism /unmount-image /mountdir:C:\winpe_x86\mount /commit
    ```

## <span id="Configuring_the_SAN_Policy_on_a_Windows_Image"></span><span id="configuring_the_san_policy_on_a_windows_image"></span><span id="CONFIGURING_THE_SAN_POLICY_ON_A_WINDOWS_IMAGE"></span>Configuring the SAN Policy on a Windows Image


You can change the default SAN policy of a Windows image by using Windows System Image Manager (Windows SIM) to customize the Microsoft-Windows-PartitionManager component. You use the `SanPolicy` setting to configure the Windows image during an unattended installation.

**To configure the SAN policy by using an answer file**

1.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**.

2.  Create a new answer file, or update an existing answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085) and [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073).

3.  On the **Insert** menu, click **RunSynchronous**.

4.  Select the configuration pass where you want to install the command. This can be the [auditUser](audituser.md) or [oobeSystem](oobesystem.md) configuration pass.

    **Note**  
    Don't use the **RunSynchronousNetsh advfirewall** command during the [specialize](specialize.md) configuration pass.

    The **Create Synchronous Command** dialog box appears.

5.  Enter the **Netsh advfirewall firewall** commands to add them to the answer file, and then click **OK**.

    For more information, see the [Network Shell (Netsh) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=234733). You can convert **Netsh** commands to Windows PowerShell® commands. For more information, see the [Netshell to Powershell Conversion Guide](http://go.microsoft.com/fwlink/?LinkId=234734).

6.  In the **SynchronousCommand Properties** pane, in the **Settings** section next to **Description**, enter a description like **Enable Windows Messenger**.

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[WinPE Network Drivers: Initializing and adding drivers](winpe-network-drivers-initializing-and-adding-drivers.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Configure Network Settings in an Unattended Installation](configure-network-settings-in-an-unattended-installation.md)

[Windows Deployment Options](windows-deployment-options.md)

 

 






