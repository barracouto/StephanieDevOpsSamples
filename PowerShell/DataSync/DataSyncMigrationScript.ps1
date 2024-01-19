# Function to perform DataSync migration using Robocopy
function Start-DataSyncMigration {
    param(
        [string]$sourcePath,
        [string]$destinationPath
    )
    
    $robocopyCommand = "robocopy `"$sourcePath`" `"$destinationPath`" /MIR /FFT /Z /XA:H /W:5 /R:1"
    Invoke-Expression -Command $robocopyCommand
}

# Set the source directory that holds the data that needs to be migrated
$sourceDirectory = "C:\SourceData"

# Set your FSx destination
$fsxDestinationDirectory = "\\FSxDestination\Share"

# Get a list of subdirectories
$subdirectories = Get-ChildItem -Path $sourceDirectory -Directory

# Iterate through each subdirectory and begin the datasync migration
foreach ($subdirectory in $subdirectories) {
    $sourcePath = $subdirectory.FullName
    $destinationPath = Join-Path $fsxDestinationDirectory $subdirectory.Name

    Write-Host "Initiating DataSync migration for $($subdirectory.Name)"
    
    # Call the function to begin the migration
    Start-DataSyncMigration -sourcePath $sourcePath -destinationPath $destinationPath

    Write-Host "DataSync migration completed for $($subdirectory.Name)"
}
