# <a name="title">AWS S3 Lifecycle Configuration Script</a>

## <a name="TOC">Table of Contents</a>
- [Overview](#overview)
- [Prerequisites](#prereq)
- [Usage](#usage)
- [Important Notes](#important-note)

## <a name="overview">Overview</a>
This PowerShell script automates the setup of an Amazon S3 bucket's lifecycle configuration using the AWS Tools for PowerShell module. The script focuses on transitioning objects in the specified S3 bucket to the Glacier storage class and defining an expiration policy for object deletion after a certain number of days.

## <a name="prereq">Prerequisites</a>
Before running the script, ensure that you have the AWS Tools for PowerShell module installed. You can install it using the following command:



```powershell 
Install-Module -Name AWSPowerShell -Force -AllowClobber
```
## <a name="usage">Usage</a>
<b>Import the AWS module:</b><br>
<small>In modern PowerShell (version 3.0 and later), modules are automatically imported when you use a cmdlet from the module. Therefore, in some cases, you may not need to explicitly use Import-Module if you're running a command that is part of the module. However, for clarity and to explicitly specify dependencies, it's recommended to include the Import-Module command at the beginning of your script or session.</small><br>
<b>Import-Module AWSPowerShell</b> 
<b>Set your AWS credentials:</b>
- Replace <b>YOUR_ACCESS_KEY</b> with your AWS access key.
- The script will securely prompt for the AWS secret key.
    ```powershell
    $accessKey = "YOUR_ACCESS_KEY"
    $secretKey = Read-Host "Enter your AWS Secret Key" -AsSecureString
    $region = "us-east-1"
    Set-AWSCredentials -AccessKey $accessKey -SecretKey $secretKey -Region $region
    ```
<b>Specify the S3 bucket name:</b>
Replace your-s3-bucket with the name of your S3 bucket.
```$bucketName = "your-s3-bucket"```

<b>Set the S3 lifecycle configuration:</b>
- The script configures a rule named "TransitionToGlacier" with the following settings:
    - Enabled status
    - Transition objects to the Glacier storage class immediately (Days = 0).
    - Sets an expiration period.
        ```powershell
        $configuration = @{
            Rules = @(
                @{
                    Id = "TransitionToGlacier"
                    Prefix = "" # leaving this blank will result in LCP being applied to every object within that bucket
                    Status = "Enabled"
                    Transitions = @(
                        @{
                            Days = 0
                            StorageClass = "GLACIER"
                        }
                    )
                    Expiration = @{
                        Days = 90
                    }
                }
            )
        }
        ```
<b>Apply the S3 lifecycle configuration to the specified bucket:</b>
```powershell
Set-S3BucketLifecycleConfiguration -BucketName $bucketName -Configuration $configuration
```

## <a name="important-note">Important Note</a>
Ensure that you replace placeholder values with your actual AWS credentials, S3 bucket information, and customize the lifecycle configuration based on your requirements. The script may impact your AWS environment, so use it with caution. Review and adapt the settings to match your organization's retention policies and storage needs.
