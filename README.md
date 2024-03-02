# AD PowerShell Scripts

## Overview

This repository, `adpowershell`, is a collection of PowerShell scripts designed for managing and automating tasks in Active Directory (AD). These scripts cover a range of functionalities such as file operations, group management, and user account handling in an AD environment.
I have created this repo to share my learing journey and hopefully help others that are new to this. The scripts have extensive comments on purpose so users with little formal background can understand the steps. Most scripts will only aim to extract information, those should be fairly harmless to try.


OBS!
The scripts that actually change anything on the AD opbjects should be used with care. They work in my production environment, but may have unintended consequences in your set-up. Read the comments and make sure you understand what it does.
## Prerequisites

Before you start using these scripts, ensure you have the following:

- PowerShell 5.1 or higher.
- Active Directory module for PowerShell.
- Appropriate permissions to execute Active Directory operations.

## Getting Started

Just copy or download the .ps1 script and enter them in Powershell ISE

Usage

Each script in this repository is tailored for specific AD tasks. Here's what they do:

    Group Management: 
    GetGroupMembersFromSeveralGroups.ps1 - retrieves all members, including nested group members from a list of groups in a .csv
    
    
    File Operations:


    User Account Handling: 
    SetAutoReply.ps1 - Set Out of Office message for several mailboxes at once
    checkForEmail.ps1 - Check if a user listed in a .txt file has an email

Remember to modify the file, group, user names, and file paths in the scripts as applicable to your AD environment.



Most scripts will require some level of customization to work in your environment. Look for comments in the scripts indicating where changes are likely needed.


License

This project is licensed under the MIT License.
Contact

For any queries or assistance, feel free to open an issue in this repository.
