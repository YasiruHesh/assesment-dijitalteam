
param (
    [string]$resourceGroupName,
    [string]$serverName,
    [string]$databaseName,
    [int]$newDTU
)

Connect-AzAccount

$database = Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName
$database | Set-AzSqlDatabase -RequestedServiceObjectiveName "S1" -MaxSizeBytes 1073741824 -Edition "Standard" -DTU $newDTU
