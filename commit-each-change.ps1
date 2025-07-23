# This PowerShell script will commit each changed file one by one with the message 'inspect'
$changes = git status --porcelain | ForEach-Object { $_.Substring(3) }
foreach ($file in $changes) {
    git add "$file"
    git commit -m "inspect"
}
