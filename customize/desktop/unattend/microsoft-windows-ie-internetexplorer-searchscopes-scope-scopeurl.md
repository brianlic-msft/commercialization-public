---
title: ScopeUrl
description: ScopeUrl
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0adaa51b-626d-46c9-baf5-02adda44d174
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ScopeUrl


`ScopeUrl` specifies the URL for the search provider.

To find the URL for a search provider:

1.  Open Internet Explorer.

2.  Open the provider's web page where the web search is performed.

3.  Search on the word `TEST`. Note the new URL that appears.

4.  Optional: In the address bar, remove any obvious extra characters from the resulting URL. Search again, and repeat, until you have the minimum URL required for searching.

    Example: `http://search.fabrikam.com/results.aspx?q="TEST"&language=en`: remove `language=en` to become `http://search.fabrikam.com/results.aspx?q="TEST"`

5.  Copy the URL, and paste it into .

6.  Replace `TEST` with {searchTerms}.

    Example: `http://search.fabrikam.com/results.aspx?q="TEST"` becomes `http://search.fabrikam.com/results.aspx?q="{searchTerms}"`

7.  Replace XML-reserved characters: &lt; &gt; " ' &. See the table below, **XML-Reserved Characters**, for a list of replacement characters.

    Example: `http://search.fabrikam.com/results.aspx?q="{searchTerms}"` becomes `http://search.fabrikam.com/results.aspx?q=&quot;{searchTerms}&quot;`

8.  Copy the URL and paste it into Windows System Image Manager.

**XML-Reserved Characters:**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Replace this character</th>
<th>With this text</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>&gt;</p></td>
<td><p><code>&amp;gt;</code></p></td>
</tr>
<tr class="even">
<td><p>&lt;</p></td>
<td><p>&amp;lt;</p></td>
</tr>
<tr class="odd">
<td><p>&quot;</p></td>
<td><p>&amp;quot;</p></td>
</tr>
<tr class="even">
<td><p>'</p></td>
<td><p>&amp;apos;</p></td>
</tr>
<tr class="odd">
<td><p>&amp;</p></td>
<td><p>&amp;amp;</p></td>
</tr>
</tbody>
</table>

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>URL</em></p></td>
<td><p>Specifies the URL for the search provider. <em>URL</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md) | [Scope](microsoft-windows-ie-internetexplorer-searchscopes-scope.md) | **ScopeUrl**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to set search providers.

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


[Scope](microsoft-windows-ie-internetexplorer-searchscopes-scope.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ScopeUrl%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





