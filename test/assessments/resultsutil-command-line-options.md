---
title: ResultsUtil Command-Line options
description: ResultsUtil Command-Line options
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7cf8c26e-50b5-4634-9e60-80ff7d69c22d
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ResultsUtil Command-Line options


The ResultsUtil command is used when you want to store assessment results in a SQL Server database. By default the results are stored on the Windows Assessment Services server in a results store. The ResultsUtil command is used to configure the Windows Assessment Services server (or an independent server) to store job results from the results share into a SQL database. It is also used to import existing results into a SQL database. After you install Windows Assessment Services on a server, use the ResultsUtil commands to initialize the results database on a SQL Server instance before you import individual results or configure Windows Assessment Services to post results to the database automatically.

**Warning**  
Results that are stored in a SQL Server database do not include the Assessment Platform presentation layer and cannot be viewed in the Windows Assessment Services - Client (Windows ASC). A custom reporting solution is required to view the results.

 

## Remarks


Starting with Windows 8.1, you can now batch import a set of results into the database and delete the batch from the database. The tracking mechanism used to tag the results in an import batch is the batch ID. Batch importing (/B) lets you point to a folder with a set of results and import them with a single command. The output of this command provides a batch ID that can later be used to delete the batch if any importing errors occur—if there is a typo in the metadata, for example.

**Note**  
The /tags option is no longer supported.

 

**Note**  
When using a database connection string, either with the /db option or when saving to ResultsUtil.exe.config with the /FileSave option, you must specify **RelaxResults** as the initial catalog. See the table of options below for examples.

 

### Metadata

Metadata is useful when comparing results or reporting on a collection of results. There are three types of metadata that can be used to align data imported into the database. See the corresponding entries in the full options table below for examples.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Type</th>
<th>Option</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Project</strong></p></td>
<td><p>/p</p></td>
<td><p>A grouping that represents a set of machines</p></td>
</tr>
<tr class="even">
<td><p><strong>Test Pass</strong></p></td>
<td><p>/t</p></td>
<td><p>A set of results created by a single test pass or on a specific build</p></td>
</tr>
<tr class="odd">
<td><p><strong>Run Tag</strong></p></td>
<td><p>/rt</p></td>
<td><p>The configuration used during the run of a test pass. For example, you may run before and after a driver update to measure the performance</p></td>
</tr>
</tbody>
</table>

 

## System Requirements


The following are system requirements for running the ResultsUtil command:

-   Windows Assessment Services

-   Windows Server 2008 R2, Windows Server 2012, or Windows Server 2012 R2

-   A full version of SQL Server 2008 R2 or later

## Configuration Overview


ResultsUtil uses a configuration file that is stored in the same directory as the executable. The individual configuration options are described in the sections below. Sections of the configuration file that are not listed below are specific to SQL server and should be edited only by an experienced administrator.

## ResultsUtil.exe Command-Line Options


To initialize the database, use the following syntax:

**ResultsUtil /InitializeDatabase \[/DB &lt;database connection string&gt;\] \[/User &lt;database user name&gt;\] \[/FileSave\]**

To import results, use the following syntax:

**ResultsUtil.exe /I \[/s &lt;file path&gt;\] \[/b &lt;folder path&gt;\] \[/a\] \[/db &lt;database connection string&gt;\] \[/user &lt;database user name&gt;\] \[/p &lt;project name&gt;\] \[/t &lt;test pass name&gt;\] \[/rt &lt;run tag&gt;\] \[/tags &lt;user defined tags&gt;\]**

To delete a batch of results that have been imported into the database, use the following syntax:

**ResultsUtil /D /BID &lt;result batch ID&gt; \[DB &lt;database connection string&gt;\] \[/User &lt;database user name&gt;\]**

The following table provides a description of how each option can be used. These options are not case sensitive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>/InitializeDatabase</p></td>
<td><p>Installs the results database on the specified instance of SQL Server.</p>
<p>Connection strings can be used to configure connections to the database. If no command line options are provided, then the /InitializeDatabase command uses what is in the configuration file.</p>
<div class="alert">
<strong>Note</strong>  
<p>The two configurations in the default file are not used and can be removed.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>ResultsUtil /InitializeDatabase /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /filesave</strong></p></td>
</tr>
<tr class="even">
<td><p>/ImportResults</p>
<p>/I</p></td>
<td><p>Imports the specified results file into the results database.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /project MyProject /testpass Milestone1 /runtag Run1 /tags M1Results</strong></p></td>
</tr>
<tr class="odd">
<td><p>/ConfigureWASserver</p>
<p>/C</p></td>
<td><p>Configures the specified instance of Windows Assessment Services to store results to the specified results database.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ConfigureWASserver /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /WasServer http://WASserver:8000/relax/service</strong></p></td>
</tr>
<tr class="even">
<td><p>/InputFile <em>&lt;filename&gt;</em></p>
<p>/S</p></td>
<td><p>Identifies a results file to be imported into the results database. The full path to the results file must be specified.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml</strong></p></td>
</tr>
<tr class="odd">
<td><p>/B</p></td>
<td><p>Bulk import results files from a folder. The batch ID can be used later to delete this data from the database.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /B C:\WAS\Results\ /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /project MyProject /testpass Milestone1 /runtag Run1 /tags M1Results</strong></p></td>
</tr>
<tr class="even">
<td><p>/DB <em>&lt;database_connection_string&gt;</em></p></td>
<td><p>A connection string that includes the instance of SQL Server and the database to be created.</p>
<p>Example:</p>
<p><strong>ResultsUtil /InitializeDatabase /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /filesave</strong></p></td>
</tr>
<tr class="odd">
<td><p>/User <em>&lt;user_name&gt;</em></p></td>
<td><p>A user name for the SQL server connection.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName</strong></p></td>
</tr>
<tr class="even">
<td><p>/Project <em>&lt;project_name&gt;</em></p>
<p>/P</p></td>
<td><p>Associates a project name with the data being imported or overwrites it if it already exists. For assessment results imported from a job that ran in the Windows Assessment Console on a local computer, the project name does not exist. If the results were generated from a job that ran in a lab environment that uses Windows Assessment Services, the project name already exists.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /project Project1</strong></p></td>
</tr>
<tr class="odd">
<td><p>/TestPass <em>&lt;test_pass_name&gt;</em></p>
<p>/T</p></td>
<td><p>Creates a test pass metadata tag or overwrites it if one already exists. The test pass metadata helps you organize results for a specific milestone or test cycle.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /project Project1 /testpass Milestone1</strong></p></td>
</tr>
<tr class="even">
<td><p>/RunTag <em>&lt;run_tag_name&gt;</em></p>
<p>/RT</p></td>
<td><p>Creates run tag metadata or overwrites it if it already exists. Run tag metadata helps you identify a specific job run instance when you search for results.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /project MyProject /testpass Milestone1 /runtag Run1</strong></p></td>
</tr>
<tr class="odd">
<td><p>/BID &lt;result_batch_ID&gt;</p></td>
<td><p>Specifies the batch ID of the results you want to delete.</p>
<p>Example:</p>
<p><strong>ResultsUtil /D /BID &lt;Result batch ID&gt;</strong></p></td>
</tr>
<tr class="even">
<td><p>/Archive</p>
<p>/A</p></td>
<td><p>Archive results before importing them.</p>
<p>The archive path is specified by using the <code>archivePath</code> node in the configuration file. You must configure the archive path in order to archive files.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ImportResults /inputfile C:\WAS\Results\JobResultsComputerGUID.xml /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /project MyProject /testpass Milestone1 /runtag Run1 /tags M1Results /archive</strong></p></td>
</tr>
<tr class="odd">
<td><p>/D</p></td>
<td><p>Delete a batch of results imported into the database.</p>
<p>Example:</p>
<p><strong>ResultsUtil /D /BID &lt;Result batch ID&gt;</strong></p></td>
</tr>
<tr class="even">
<td><p>/FileSave</p></td>
<td><p>Saves the database configuration file, resultsutil.exe.config, to the same location as the ResultsUtil. The database configuration file is prepopulated with the database connections string and user name so that you don’t have to enter it every time that you import results.</p>
<div class="alert">
<strong>Note</strong>  
<p>There is only one database configuration file. If you have multiple results databases the command-line options will take precedence over the configuration file.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>ResultsUtil /InitializeDatabase /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /user MyName /filesave</strong></p></td>
</tr>
<tr class="odd">
<td><p>/Quiet</p></td>
<td><p>Suppresses status messages.</p>
<p>Example:</p>
<p><strong>ResultsUtil /ConfigureWASserver /db &quot;Data Source=localhost\WAS_SQLSERVER;Initial Catalog=RelaxResults;Integrated Security=True&quot; /User MyName /WasServer http://MyServer:8000/relax/service /Quiet</strong></p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

 

 







