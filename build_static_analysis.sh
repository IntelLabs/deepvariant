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
 cov-build --dir tmp -bazel ~/bin/bazel build -c opt \
  --output_filter=DONT_MATCH_ANYTHING \
  --noshow_loading_progress \
  --show_result=0 \
  ${DV_COPT_FLAGS} \
  --build_python_zip \
  :coverity-target
#Analyze files
#cov-analyze --dir tmp --concurrency --security --rule --enable-constraint-fpp --enable-fnptr 
#Format results as html
#cov-format-errors --dir tmp --html-output html-dir
