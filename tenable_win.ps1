[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# replace [TENABLE-ID] with ID corresponding to your OS
Invoke-WebRequest -Uri 'https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/[TENABLE-ID]/download?i_agree_to_tenable_license_agreement=true' -OutFile "$env:TEMP\agent.msi"
# replace [GROUP-NAME] with group name corresponding to AWS account deployed into
(Start-Process -FilePath msiexec -ArgumentList "/i $env:TEMP\agent.msi NESSUS_GROUPS=`"[GROUP-NAME]`" NESSUS_SERVER=`"cloud.tenable.com:443`" NESSUS_KEY=a521b5ff16a5d5272109d675bba8d84bd07e7126d686c1966ec8e1fce13abd16 /qn" -Wait -PassThru).ExitCode 
net start "Tenable Nessus Agent"
