foreach ($file in Get-ChildItem -Path "$PSScriptRoot\factory")
{
    Remove-Item -Path $file.FullName
}

foreach ($file in Get-ChildItem -Path "$PSScriptRoot\linkedService" -Filter "lsDomain*.json")
{
    Remove-Item -Path $file.FullName
}