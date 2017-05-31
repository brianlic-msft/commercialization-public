---
title: FaviconURL
description: FaviconURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0920cd93-d757-4213-b582-bd0797eddc62
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FaviconURL


`FaviconURL` specifies the path to an icon for a specific Internet Explorer Search Scope.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>path</em></p></td>
<td><p>Specifies the path to an icon to be used as a Search Suggestion.</p>
<p><em>Path</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md) | [Scope](microsoft-windows-ie-internetexplorer-searchscopes-scope.md) | `FaviconURL`

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to specify paths to icons used for the Search Suggestions.

``` syntax
<SearchScopes>
   <Scope wcm:action="add">
      <ScopeDefault>true</ScopeDefault>
      <ScopeDisplayName>MyFirstSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider1</ScopeKey>
      <ScopeUrl>http://www.contoso.com/search?q={searchTerms}</ScopeUrl>
      <FaviconURL>http://www.fabrikam.com/fabrikam.jpg</FaviconURL>
   </Scope>
   <Scope wcm:action="add">
      <ScopeDisplayName>MySecondSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider2</ScopeKey>
      <ScopeUrl>http://search.fabrikam.com/results.aspx?q=&quot;{searchTerms}&quot;</ScopeUrl>
      <FaviconURL>http://www.contoso.com/search/search.ico</FaviconURL>
   </Scope>
</SearchScopes>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FaviconURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





