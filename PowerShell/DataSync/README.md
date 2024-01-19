# <a name="title">DataSync Migration with Robocopy PowerShell Script</a>

## <a name="TOC">Table of Contents</a>
- [Overview](#overview)
- [Prerequisites](#prereq)
- [Usage](#usage)
- [Important Notes](#important-notes)

## <a name="overview">Overview</a>
This PowerShell script automates the migration of data using DataSync and Robocopy. It is designed to synchronize data from a source directory to an Amazon FSx for Windows File Server (FSx). The script iterates through subdirectories in the source directory, initiating individual DataSync migrations using Robocopy for each subdirectory.

### <a name="prereq">Prerequisites</a>
<b>Before using this script, ensure the following:</b>

<b>AWS Tools for PowerShell:</b> Install the AWS Tools for PowerShell module.
```Install-Module -Name AWS.Tools.DataSync```

<small>In modern PowerShell (version 3.0 and later), modules are automatically imported when you use a cmdlet from the module. Therefore, in some cases, you may not need to explicitly use Import-Module if you're running a command that is part of the module. However, for clarity and to explicitly specify dependencies, it's recommended to include the Import-Module command at the beginning of your script or session.</small>

<b>Permissions:</b> Ensure that the AWS credentials used by the script have the necessary permissions to perform DataSync migrations and write to the FSx destination.

## <a name="Usage">Usage</a>
<b>Configure Paths:</b>
- Open the script (DataSyncMigrationScript.ps1) in a text editor.
- Set the ```$sourceDirectory``` variable to the path of the source directory containing data to be migrated.
- Set the ```$fsxDestinationDirectory``` variable to the destination directory on FSx.

<b>Run the Script:</b>

- Open a PowerShell console.
- Navigate to the directory containing the script.
- Update key values.
- Run the script:
    ```powershell
    .\DataSyncMigrationScript.ps1
    ```
- Review Output:
The script will iterate through each subdirectory in the source directory and initiate DataSync migrations using Robocopy.
Review the console output for migration status.


## <a name="important-notes">Important Notes</a>
<b>Testing:</b> Thoroughly test the script in a controlled environment before using it in a production setting.

<b>DataSync Configuration:</b> Ensure that DataSync tasks are correctly configured for each subdirectory in the source directory before running the script.

<b>Permissions:</b> Verify that the AWS credentials used by the script have the necessary permissions.
