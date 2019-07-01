#!/bin/bash -eux

set -euo pipefail

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
#COL_RED=$ESC_SEQ"31;01m"
#COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"

# Functions
# Update
extensions() {
    echo
    echo -en "${COL_YELLOW} ==> Installing VSCode extensions ${COL_RESET}\n"
    code --install-extension pnp.polacode
}


# Run functions
extensions
