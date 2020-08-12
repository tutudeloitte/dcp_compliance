$managerUrl="https://app.deepsecurity.trendmicro.com:443/"
if ( [intptr]::Size -eq 8 ) { $sourceUrl=-join($managerUrl, "software/agent/Windows/x86_64/", $agentVersion, "agent.msi") }
$WebClient = New-Object System.Net.WebClient
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$WebClient.DownloadFile($sourceUrl,  "$env:temp\agent.msi")

msiexec.exe /I "$env:temp\agent.msi" /quiet

& $Env:ProgramFiles"\Trend Micro\Deep Security Agent\dsa_control" -a dsm://agents.deepsecurity.trendmicro.com:443/ "tenantID:D2F98333-9496-3B69-8E04-227DD4325E96" "token:822B634F-B5A4-B295-7B86-F6429FC05E06" "policyid:49808’"

Get-Service -displayname 'trend*'
