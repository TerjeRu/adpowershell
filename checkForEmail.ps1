# Specify the directory containing the user files
$userFilesDirectory = "FILE PATH"

# Get all files matching 'LSIT OF USERS.txt' in the specified directory
$userFiles = Get-ChildItem -Path $userFilesDirectory -Filter "SAUusers*.txt"

# Loop through each file found
foreach ($file in $userFiles) {
    # Read the user names from the file
    $userNames = Get-Content $file.FullName
    
    # Loop through each user name to check their email
    foreach ($userName in $userNames) {
        # Attempt to find the user in Active Directory by their display name
        $user = Get-ADUser -Filter "displayName -eq '$userName'" -Properties Mail
        
        # Check if the user was found and if they have an email address
        if ($user -and $user.Mail) {
            Write-Host "$userName has an email: $($user.Mail)"
        } else {
            Write-Host "$userName does not have an email or could not be found in AD."
        }
    }
}
