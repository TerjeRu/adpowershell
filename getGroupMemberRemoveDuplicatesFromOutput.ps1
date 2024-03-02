# Import the Active Directory module
Import-Module ActiveDirectory

# Define the groups to query
$groupNames = @('Intune.Client.MSI.ThinkCell_Available', 'Intune.Client.MSI.ThinkCell')

# Define the output file path
$csvPath = "C:\TempTerje\ADGroupMembers.csv"

# Initialize an empty array to hold user details
$users = @()

# Process each group
foreach ($groupName in $groupNames) {
    $groupMembers = Get-ADGroupMember -Identity $groupName -Recursive | Where-Object { $_.objectClass -eq 'user' }
    
    foreach ($member in $groupMembers) {
        # Ensure we're dealing with user objects only
        if ($member.objectClass -eq 'user') {
            # Get additional properties of the user
            $userDetails = Get-ADUser -Identity $member.distinguishedName -Properties DisplayName, Title, Mail
            
            # Create a custom object with the necessary properties
            $userObject = [PSCustomObject]@{
                DisplayName = $userDetails.DisplayName
                JobTitle = $userDetails.Title
                Email = $userDetails.Mail
            }
            
            # Add the custom object to the users array
            $users += $userObject
        }
    }
}

# Remove duplicate users based on DisplayName
$uniqueUsers = $users | Group-Object -Property DisplayName | ForEach-Object { $_.Group | Select-Object -First 1 }

# Export the unique users to a CSV file
$uniqueUsers | Export-Csv -Path $csvPath -NoTypeInformation

Write-Host "Export complete. Check the file at $csvPath"
