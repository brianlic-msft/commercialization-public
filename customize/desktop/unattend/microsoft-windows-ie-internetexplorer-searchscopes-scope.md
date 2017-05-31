---
title: Scope
description: Scope
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: beac7cab-43ea-41c3-8af0-6d1a75f1dc74
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Scope


`Scope` specifies a search provider.

## Child Elements


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Setting name</th>
<th>Description</th>
<th>Applies to which versions of Windows Internet Explorer</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[FaviconURL](microsoft-windows-ie-internetexplorer-searchscopes-scope-faviconurl.md)</p></td>
<td><p>Specifies the path to an icon for a specific Search Scope item.</p></td>
<td><p>Internet Explorer 8 through Internet Explorer 11</p></td>
</tr>
<tr class="even">
<td><p>[PreviewURL](microsoft-windows-ie-internetexplorer-searchscopes-scope-previewurl.md)</p></td>
<td><p>Specifies the URL where previews are shown in the <strong>Accelerator</strong> window.</p></td>
<td><p>Internet Explorer 8 through Internet Explorer 11</p></td>
</tr>
<tr class="odd">
<td><p>[ScopeDefault](microsoft-windows-ie-internetexplorer-searchscopes-scope-scopedefault.md)</p></td>
<td><p>Specifies whether the Search Scope item is the default search provider.</p></td>
<td><p>Internet Explorer 7 through Internet Explorer 11</p></td>
</tr>
<tr class="even">
<td><p>[ScopeDisplayName](microsoft-windows-ie-internetexplorer-searchscopes-scope-scopedisplayname.md)</p></td>
<td><p>Specifies the display name for the search provider.</p></td>
<td><p>Internet Explorer 7 through Internet Explorer 11</p></td>
</tr>
<tr class="odd">
<td><p>[ScopeKey](microsoft-windows-ie-internetexplorer-searchscopes-scope-scopekey.md)</p></td>
<td><p>Specifies the unique string for the search provider.</p></td>
<td><p>Internet Explorer 7 through Internet Explorer 11</p></td>
</tr>
<tr class="even">
<td><p>[ScopeUrl](microsoft-windows-ie-internetexplorer-searchscopes-scope-scopeurl.md)</p></td>
<td><p>Specifies the URL for the search provider.</p></td>
<td><p>Internet Explorer 7 through Internet Explorer 11</p></td>
</tr>
<tr class="odd">
<td><p>[ShowSearchSuggestions](microsoft-windows-ie-internetexplorer-searchscopes-scope-showsearchsuggestions.md)</p></td>
<td><p>Specifies whether Search Suggestions are shown.</p></td>
<td><p>Internet Explorer 8 through Internet Explorer 11</p></td>
</tr>
<tr class="even">
<td><p>[SuggestionsURL](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl.md)</p></td>
<td><p>Specifies suggestions that appear to the user during a search, by using a search that is based on XML.</p></td>
<td><p>Internet Explorer 8 through Internet Explorer 11</p></td>
</tr>
<tr class="odd">
<td><p>[SuggestionsURL_JSON](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl-json.md)</p></td>
<td><p>Specifies suggestions that appear to the user during a search, by using a search that is based on JavaScript Object Notation (JSON).</p></td>
<td><p>Internet Explorer 8 through Internet Explorer 11</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md) | **Scope**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following example shows how to set search providers.

``` syntax
<SearchScopes>
   <Scope wcm:action="add">
      <ScopeDefault>true</ScopeDefault>
      <ScopeDisplayName>MyFirstSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider1</ScopeKey>
      <ScopeUrl>http://www.contoso.com/search?q={searchTerms}</ScopeUrl>
   </Scope>
   <Scope wcm:action="add">
      <ScopeDisplayName>MySecondSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider2</ScopeKey>
      <ScopeUrl>http://search.fabrikam.com/results.aspx?q=&quot;{searchTerms}&quot;</ScopeUrl>
   </Scope>
</SearchScopes>
```

## Related topics


[SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Scope%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





