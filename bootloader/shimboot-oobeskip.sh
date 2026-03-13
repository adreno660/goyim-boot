#!/bin/bash
#shimboot-oobeskip
cd /home/chronos/
curl -LO https://raw.githubusercontent.com/HarryJarry1/shimboot-skipoobe/main/oobeskip_state
rm 'Local State'
mv oobeskip_state 'Local State'
echo "Rebooting..."

