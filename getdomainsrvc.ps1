# Import the ActiveDirectory module if not already loaded
Import-Module ActiveDirectory

# Get all domain computers
$DomainComputers = Get-ADComputer -Filter * -Server Asterdmhealthcare.local

# Loop through each computer
foreach ($Computer in $DomainComputers) {
    # Get services on the remote computer
    $Services = Get-Service -ComputerName $Computer.Name

    # Filter for running services
    $RunningServices = $Services | Where-Object {$_.Status -eq "Running"}

    # Display results
    Write-Host "Running services on $Computer.Name:"
    $RunningServices | Select-Object Name, DisplayName, Status
}
