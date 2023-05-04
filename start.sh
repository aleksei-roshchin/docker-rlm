#!/bin/bash

echo "IP ADDRESS:"
hostname -i

# Store the licese file inside the container for later reuse.
cp /opt/rlm/licenses/license.lic /opt/license.lic

# Run the license server directly with the copied license file.
/usr/local/rlm/rlm -c /opt/license.lic
