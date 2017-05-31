---
title: SuggestionsURL
description: SuggestionsURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a7163e33-d03e-465d-9d81-af0abf47e83f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SuggestionsURL


The `SuggestionsURL` setting specifies the URL where suggestions can be retrieved by using a search based on XML.

**Note**  
To specify search suggestions by using a search based on JavaScript Object Notation (JSON), use the [SuggestionsURL\_JSON](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl-json.md) setting instead.

 

For information on creating Search Scopes, see [Search Provider Extensibility](http://go.microsoft.com/fwlink/?LinkId=137666).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>URL</em></p></td>
<td><p>Specifies the URL where search suggestions can be retrieved by using a search based on XML.</p>
<p><em>URL</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md) | [Scope](microsoft-windows-ie-internetexplorer-searchscopes-scope.md) | `SuggestionsURL`

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to specify a URL to provide search suggestions by using a search based on XML.

``` syntax
<SearchScopes>
   <Scope wcm:action="add">
      <ScopeDisplayName>MySecondSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider2</ScopeKey>
      <ScopeUrl>http://search.fabrikam.com/results.aspx?q=&quot;{searchTerms}&quot;</ScopeUrl>
      <SuggestionsURL>http://suggestions.fabrikam.com/qsml.aspx?query={searchTerms}</SuggestionsURL>
   </Scope>
</SearchScopes>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

[SuggestionsURL\_JSON](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl-json.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SuggestionsURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





