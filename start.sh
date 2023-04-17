#!/bin/bash

echo "IP ADDRESS:"
hostname -i

# Store the licese file inside the container for later reuse.
cp /opt/rlm/licenses/speedtree.lic /opt/speedtree.lic