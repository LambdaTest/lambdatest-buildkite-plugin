#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"

@test "Ensure TMP_DIR is not removed if it existed before" {
  export TMP_DIR=$(mktemp -d)

  run "${PWD}/hooks/pre-exit"

  assert_success
  assert_output --partial "Not removing given TMP_DIR (${TMP_DIR})"
  
  rm -rf "$TMP_DIR"
  unset TMP_DIR
}

@test "Ensure TMP_DIR is removed if didnt exist" {
  run "${PWD}/hooks/pre-exit"
  assert_success
  assert_output --partial "Removing TMP_DIR"
}

@test "Ensure tunnel is stopped" {
  export TMP_DIR=$(mktemp -d)
  touch "${TMP_DIR}/pid.$$" 
  
  run "${PWD}/hooks/pre-exit"

  assert_success
  assert_output --partial "Stopping LambdaTest Tunnel"
  assert_output --partial "Tunnel Successfully Stopped"
  

  unset TMP_DIR
  rm -rf "$TMP_DIR"
}
