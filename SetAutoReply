# Auto-reply message configuration
$autoReplyMessage = "Hello,`n`nThis message has not been delivered to its recipient. Please contact [Support Email] if you need assistance.`nWe will respond as soon as possible.`n`nThank you."

# List of mailboxes to configure
$mailboxes = @(
    "user1@example.com",
    "user2@example.com",
    "user3@example.com",
    "user4@example.com",
    "user5@example.com",
    "user6@example.com",
    "user7@example.com",
    "user8@example.com",
    "user9@example.com",
    "user10@example.com",
    "user11@example.com",
    "user12@example.com",
    "user13@example.com",
    "user14@example.com",
    "user15@example.com"
)

# Loop through each mailbox and set the auto-reply configuration
foreach ($mailbox in $mailboxes) {
    Set-MailboxAutoReplyConfiguration -Identity $mailbox `
        -AutoReplyState Enabled `
        -InternalMessage $autoReplyMessage `
        -ExternalMessage $autoReplyMessage

    # Confirmation message for each mailbox
    Write-Host "Auto-reply set for $mailbox"
}
