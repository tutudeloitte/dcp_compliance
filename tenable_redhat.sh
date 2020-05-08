wget 'https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/10982/download?i_agree_to_tenable_license_agreement=true' -O /tmp/nesus.rpm

sudo rpm -ivh /tmp/nesus.rpm

sudo /opt/nessus_agent/sbin/nessuscli agent link --host=cloud.tenable.com --port=443 --key=a521b5ff16a5d5272109d675bba8d84bd07e7126d686c1966ec8e1fce13abd16 --groups="aws-prd-doccxd"

sudo /sbin/service nessusagent start
sudo systemctl status nessusagent.service 
sudo systemctl start nessusagent.service
