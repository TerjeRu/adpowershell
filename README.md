# AD PowerShell Scripts

## Overview

This repository, `adpowershell`, is a collection of PowerShell scripts designed for managing and automating tasks in Active Directory (AD). These scripts cover a range of functionalities such as file operations, group management, and user account handling in an AD environment.

## Prerequisites

Before you start using these scripts, ensure you have the following:

- PowerShell 5.1 or higher.
- Active Directory module for PowerShell.
- Appropriate permissions to execute Active Directory operations.

## Getting Started

To get started with these scripts:

1. Clone this repository to your local machine or download the scripts directly.
   ```bash
   git clone https://github.com/TerjeRu/adpowershell.git

Navigate to the cloned directory: cd adpowershell

Usage

Each script in this repository is tailored for specific AD tasks. Here's how to use them:

    Group Management: 
    GetGroupMembersFromSeveralGroups.ps1 
       retrieves all members, including nested group members from a
       list of groups in a csv
    
    
    File Operations:


    User Account Handling: 

Remember to modify the file, group, user names, and file paths in the scripts as applicable to your AD environment.


Customization
Most scripts will require some level of customization to work in your environment. Look for comments in the scripts indicating where changes are likely needed.


Contributing
Contributions to this repository are welcome. To contribute:

    Fork the repository.
    Create a new branch (git checkout -b feature-branch).
    Make your changes and commit them (git commit -am 'Add some feature').
    Push to the branch (git push origin feature-branch).
    Create a new Pull Request.

License

This project is licensed under the MIT License.
Contact

For any queries or assistance, feel free to open an issue in this repository.
