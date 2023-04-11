# custom-pwdscript-vm
a PowerShell script that can be attached to an Azure virtual machine to host a basic HTML website. The script should take in a password parameter that is stored as a secret in a GitHub repository. The script will be executed by the workflow for the repository using GitHub Actions, which will provide the script with the password parameter.
