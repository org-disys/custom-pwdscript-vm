# Get the Azure credentials from GitHub Actions secrets
$AzureUsername = $env:AZURE_USERNAME
$AzurePassword = $env:AZURE_PASSWORD | ConvertTo-SecureString -AsPlainText -Force
$AzureCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AzureUsername, $AzurePassword

# Set the Azure context
Connect-AzAccount -Credential $AzureCredential -TenantId $env:AZURE_TENANT_ID -ServicePrincipal

# Set the Azure VM properties
$ResourceGroupName = "YourResourceGroupName"
$VMName = "YourVMName"
$PublicIpAddress = "YourPublicIpAddress"

# Create a session with the Azure VM
$VMIPAddress = (Resolve-DnsName -Name $PublicIpAddress).IPAddress
$Session = New-PSSession -ComputerName $VMIPAddress -Credential (Get-Credential) -UseSSL

# Upload the file to the Azure VM
$SourceFile = "YourSourceFileName"
$DestinationFolder = "YourDestinationFolderName"
Copy-Item -Path $SourceFile -Destination "$DestinationFolder" -ToSession $Session

# Close the session with the Azure VM
Remove-PSSession $Session

























# $myUserName = "rafi"
# $myPlainTextPassword = "Terraform@123"
# $myPassword = $MyPlainTextPassword | ConvertTo-SecureString -AsPlainText -Force
# $credential = New-Object System.Management.Automation.PSCredential($MyUserName, $myPassword)

# # New-PSSession -VMName $myUserName -Credential $credential

# $networkCredential = $credential.GetNetworkCredential()
# $networkCredential | Select-Object UserName, Password

# $ipAddress = "98.70.0.67"

# $sessionOption = New-PSSessionOption `
#   -SkipCACheck `
#   -SkipCNCheck `
#   -SkipRevocationCheck

#   $psSession = @{
#     ComputerName = $ipAddress
#     UseSSL = $true
#     Credential = $credential
#     SessionOption = $sessionOption
#   }
 
#  Enter-PSSession @psSession
