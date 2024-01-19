# Install the AWS Tools for PowerShell module if not already installed
Install-Module -Name AWSPowerShell -Force -AllowClobber

# Import the AWS module
Import-Module AWSPowerShell

# Set access key
$accessKey = "YOUR_ACCESS_KEY"

# Prompt for the secret key securely
$secretKey = Read-Host "Enter your AWS Secret Key" -AsSecureString

# Set region
$region = "us-east-1"

# Set AWS credentials
Set-AWSCredentials -AccessKey $accessKey -SecretKey $secretKey -Region $region

# S3 bucket and object key
$bucketName = "your-s3-bucket"

# Set S3 lifecycle configuration
$configuration = @{
    Rules = @(
        @{
            Id = "TransitionToGlacier"
            Prefix = ""
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

# Set S3 lifecycle configuration
Set-S3BucketLifecycleConfiguration -BucketName $bucketName -Configuration $configuration
