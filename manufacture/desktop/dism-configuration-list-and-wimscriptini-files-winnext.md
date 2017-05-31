---
author: Justinha
Description: 'DISM Configuration List and WimScript.ini Files'
ms.assetid: 8e765558-4138-4215-bf53-09e46666a718
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Configuration List and WimScript.ini Files'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Configuration List and WimScript.ini Files


The Deployment Image Servicing and Management (DISM) tool is a command-line tool that you can use to capture and apply Windows images. You can create a configuration list file to determine the following:

-   Which files and folders must be excluded from the capture process when you use the **/Capture-Image** option with the DISM tool.

-   Which folders, files, and file types must be excluded from the compression process when you use the **/Compress** argument.

The **/ConfigFile** argument enables you to customize specific compression, capture, and boundary alignment actions for each file and folder when you capture an image using DISM.exe. You can create a configuration list (.ini) file by using a text editor, such as Notepad.

## <span id="Creating_a_Configuration_List_File"></span><span id="creating_a_configuration_list_file"></span><span id="CREATING_A_CONFIGURATION_LIST_FILE"></span>Creating a Configuration List File


The following sections appear in the DISM configuration list file.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Section</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><code>[ExclusionList]</code></p></td>
<td align="left"><p>Enables you to define the files and folders to exclude when you use the <strong>/Capture-Image</strong> option.</p></td>
</tr>
<tr class="even">
<td align="left"><p><code>[ExclusionException]</code></p></td>
<td align="left"><p>Enables you to override the default exclusion list when you use the <strong>/Capture-Image</strong> option.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><code>[CompressionExclusionList]</code></p></td>
<td align="left"><p>Enables you to define the specific files and folders, and also to specify file types, to exclude when you use the <strong>/Compress</strong> argument.</p>
<div class="alert">
<strong>Note</strong>  
<p>You can use file or folder matching to exclude a file from compression. You can provide a full path match, or you can use wildcard characters (*). For example, you can use <strong>\WINDOWS\inf\*.pnf</strong> to match a specific type of file, or <strong>\WINDOWS\inf\*</strong> to match a whole folder.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

### <span id="Default_Exclusion_List"></span><span id="default_exclusion_list"></span><span id="DEFAULT_EXCLUSION_LIST"></span>Default Exclusion List

By default, the DISM.exe tool will exclude the following files.

``` syntax
[ExclusionList]
\$ntfs.log
\hiberfil.sys
\pagefile.sys
\swapfile.sys
"\System Volume Information"
\RECYCLER
\Windows\CSC

[CompressionExclusionList]
*.mp3
*.zip
*.cab
\WINDOWS\inf\*.pnf
```

### <span id="Exclusion_List_Guidelines"></span><span id="exclusion_list_guidelines"></span><span id="EXCLUSION_LIST_GUIDELINES"></span>Exclusion List Guidelines

-   You can only use wildcard characters in the last component in a file path that does not begin with a backslash. For example:

    ``` syntax
    myfolder\*.txt
    ```

-   You can use a preceding backslash to limit file-matching and directory-matching relative to the root directory. For example, you can use this exclusion list:

    ``` syntax
    \myfolder
    \folder\subfolder
    ```

    This list will exclude the following files and directories when you capture the "C:\\" drive:

    ``` syntax
    C:\myfolder
    C:\folder\subfolder
    ```

    However, DISM will not exclude files or directories that are contained in the following example.

    ``` syntax
    C:\main\myfolder
    C:\data\folder\subfolder
    ```

-   You can override the default exclusion list by using the `[ExclusionException]` section. For example:

    ``` syntax
    [ExclusionException]
    \pagefile.sys
    "\System Volume Information"
    ```

-   If an explicit `[ExclusionException]` section is provided in the WIM configuration file, it will always take precedence over the `[Exclusion List]` section.

-   You cannot override the default compression exclusion list by using the `[ExclusionException]` section.

## <span id="Using_the_Configuration_File"></span><span id="using_the_configuration_file"></span><span id="USING_THE_CONFIGURATION_FILE"></span>Using the Configuration File


If you create a custom-named configuration file and store it outside the DISM directory, you can use the DISM command to run the file. At a command prompt, open the DISM directory. For example:

``` syntax
Dism /Capture-Image /ImageFile:install.wim /CaptureDir:D:\ /Name:Drive-D /ConfigFile:<configuration list>
```

or

``` syntax
Dism /Append-Image /ImageFile:install.wim /CaptureDir:D:\ /Name:Drive-D /ConfigFile:<configuration list>
```

where *&lt;configuration list&gt;* provides the complete directory location for the configuration file. For example, `c:\imaging\configuration_list.ini`. You must use either the **/Capture-Image** option to create a new .wim file or the **/Append-Image** option to append an existing .wim file.

## <span id="related_topics"></span>Related topics


[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

 

 






