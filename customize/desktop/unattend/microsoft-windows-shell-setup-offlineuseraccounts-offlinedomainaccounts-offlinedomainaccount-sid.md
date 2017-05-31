---
title: SID
description: SID specifies the security identifier of the domain account.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D79DBAFD-B570-4C89-8148-AE71EF83D95A
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SID


`SID` specifies the security identifier of the domain account.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>SID</em></p></td>
<td><p>Specifies the security identifier of the domain account. <em>SID</em> is a string with a maximum length of 256 characters.</p>
<p>For information on how to determine the security identifier for an Active Directory user account using PowerShell, see this [Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=533300).</p>
<pre class="syntax" space="preserve"><code>$objUser = New-Object System.Security.Principal.NTAccount(&quot;fabrikam&quot;, &quot;kenmyer&quot;)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value</code></pre>
<p>The following XML example shows the format for the <code>SID</code> value:</p>
<pre class="syntax" space="preserve"><code>&lt;OfflineUserAccounts&gt;
   
     &lt;OfflineDomainAccounts&gt;
         &lt;OfflineDomainAccount&gt;
             &lt;SID&gt;S-1-5-21-1454471165-1004335555-1606985555-5555&lt;/SID&gt;
             &lt;Groups&gt;Administrators&lt;/Group&gt;
         &lt;/OfflineDomainAccount&gt;  
       
         &lt;OfflineDomainAccount&gt;
             &lt;SID&gt;S-1-5-21-1454471165-1004335555-1606985555-5999&lt;/SID&gt;
             &lt;Groups&gt;Administrators;BackupOperators&lt;/Group&gt;
         &lt;/OfflineDomainAccount&gt;
    &lt;/OfflineDomainAccounts&gt;

&lt;/OfflineUserAccounts&gt;</code></pre></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OfflineUserAccounts](microsoft-windows-shell-setup-offlineuseraccounts.md) | [OfflineDomainAccounts](microsoft-windows-shell-setup-offlineuseraccounts-offlinedomainaccounts.md) | [OfflineDomainAccount](microsoft-windows-shell-setup-offlineuseraccounts-offlinedomainaccounts-offlinedomainaccount.md) | **SID**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

Windows Server 2016

For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




