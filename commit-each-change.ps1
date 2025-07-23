## This PowerShell script will commit each unstaged file one by one with the message 'inspect'
$changes = git status --porcelain | Where-Object { ($_.Substring(0,2) -eq 'M ' -or $_.Substring(0,2) -eq 'A ' -or $_.Substring(0,2) -eq '??') } | ForEach-Object { $_.Substring(3) }
foreach ($file in $changes) {
    git add "$file"
    git commit -m "inspect"
}
