# Copyright 2023 Intel Corporation
# SPDX-License-Identifier: MIT License

#!/bin/bash
# C

# NOLINT
set -eux -o pipefail

source settings.sh

# bazel should have been installed in build-prereq.sh, but the PATH might
# need to be added in this script.
if ! bazel; then
  PATH="$HOME/bin:$PATH"
fi



echo 'Expect a usage message:'
(python3 bazel-out/k8-opt/bin/deepvariant/call_variants.zip --help || : ) | grep '/call_variants.py:'
