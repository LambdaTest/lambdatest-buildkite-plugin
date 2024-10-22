#!/usr/bin/env bash

REPO_DIR=$(git rev-parse --show-toplevel)

pushd "${REPO_DIR}" >/dev/null

docker run \
  --rm \
  -v "$(pwd):/plugin" \
  buildkite/plugin-linter \
    --id lambdatest/lambdatest

EXIT_CODE=$?

popd >/dev/null

exit $EXIT_CODE
