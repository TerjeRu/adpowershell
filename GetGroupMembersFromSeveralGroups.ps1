# THIS SCRIPT WILL GO THROUGH A LIST OF AD GROUPS LISTED IN A CSV FILE
# AND LIST ALL MEMBERS INLCUDING THOSE IN NESTED GROUPS
# OUTPUT IS SENT TO A CSV FILE WITH NAME, TITLE AND EMAIL

# Import the Active Directory module
Import-Module ActiveDirectory

# Function to recursively get group members
function Get-ADGroupMembersRecursive {
    param (
        [Microsoft.ActiveDirectory.Management.ADGroup]$Group
    )

    $groupMembers = @()
    $members = Get-ADGroupMember -Identity $Group -ErrorAction SilentlyContinue

    foreach ($member in $members) {
        if ($member.objectClass -eq "group") {
            $nestedGroup = Get-ADGroup -Identity $member.DistinguishedName
            $groupMembers += Get-ADGroupMembersRecursive -Group $nestedGroup
        } else {
            $userInfo = Get-ADUser -Identity $member.DistinguishedName -Properties Name, Title, Mail
            if ($userInfo) {
                $groupMembers += [PSCustomObject]@{
                    GroupName = $Group.Name
                    Name      = $userInfo.Name
                    Title     = $userInfo.Title
                    Mail      = $userInfo.Mail
                }
            }
        }
    }

    return $groupMembers
}

# Read group names from the CSV file
$groupList = Import-Csv -Path "PATH TO CSV FILE WITH GROUP NAMES"

# Initialize a list to store group and member information
$groupsWithMembers = @()

# Iterate through each group and get all members
foreach ($group in $groupList) {
    $adGroup = Get-ADGroup -Filter "Name -eq '$($group.Name)'"
    if ($adGroup) {
        $groupsWithMembers += Get-ADGroupMembersRecursive -Group $adGroup
    }
}

# Export the group and member information to CSV
$groupsWithMembers | Export-Csv -Path "PATH TO OUTPUT CSV FILE" -NoTypeInformation
