param(
    [Parameter(Mandatory = $true)]
    [string] $WorkspaceName,

    [Parameter(Mandatory = $true)]
    [string] $RepositoryAccount,

    [Parameter(Mandatory = $true)]
    [string] $RepositoryName
)

$workspaces = az synapse workspace list | ConvertFrom-Json



foreach($workspace in $workspaces)
{
    $wsName = $workspace.name
    $rgName = $workspace.resourceGroup

    if($workspace.name.EndsWith($WorkspaceName))
    {
        az synapse workspace update `
            --name "$wsName" `
            --resource-group "$rgName" `
            --repository-type "GitHub" `
            --account-name "$RepositoryAccount" `
            --repository-name "$RepositoryName" `
            --root-folder "/synapse" `
            --collaboration-branch "synapse"
    }
}