#!/bin/bash

echo "IP ADDRESS:"
hostname -i

# Store the licese file inside the container for later reuse.
cp /opt/rlm/licenses/speedtree.lic /opt/speedtree.lic

# Run the license server directly with the copied license file.
/x64_l1.admin/rlm -c /opt/speedtree.lic
