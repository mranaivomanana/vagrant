#!/bin/bash

echo "[TASK 1] Create venkatn user account"
useradd -m -c "mranaivomanana" mra
echo -e "admin\admin" | passwd mra >/dev/null 2>&1
