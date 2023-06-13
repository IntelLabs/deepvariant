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

# shellcheck disable=SC2086
bazel build -c opt \
  --output_filter=DONT_MATCH_ANYTHING \
  --noshow_loading_progress \
  --show_result=0 \
  ${DV_COPT_FLAGS} \
  --build_python_zip \
  :binaries

echo 'Expect a usage message:'
(python3 bazel-out/k8-opt/bin/deepvariant/call_variants.zip --help || : ) | grep '/call_variants.py:'
