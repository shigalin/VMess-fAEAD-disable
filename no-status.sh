#!/usr/bin/env bash

serFile=$1
[ -z "$serFile" ] && serFile="/etc/systemd/system/XrayR.service"
sed -i '/Environment="XRAY_VMESS_AEAD_FORCED=false"/d' $serFile
sed -i '/ExecStart/i\Environment="XRAY_VMESS_AEAD_FORCED=false"' $serFile
systemctl daemon-reload
systemctl restart XrayR
echo Done.
exit
