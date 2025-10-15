# LambdaTest Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that opens a [LambdaTest tunnel](https://www.lambdatest.com/support/docs/testing-locally-hosted-pages/).

It contains a [pre-command hook](hooks/pre-command), [pre-exit hook](hooks/pre-exit), and [tests](tests/command.bats) using [plugin-tester](https://github.com/buildkite-plugins/plugin-tester).

## Configuration

### `tunnelName`

To use a particular tunnel, you can get `LT_TUNNEL_NAME` from the environment variables in your test scripts (`BUILDKITE_JOB_ID`).

```yml
steps:
  - command: 'yarn && yarn LT test'
    plugins:
      - lambdatest/lambdatest#v1.0.0
```

## Development

### Installing `bats` for Running Hook Tests

The hook tests (like `pre-command` and `pre-exit`) use [`bats`](https://github.com/bats-core/bats-core) (Bash Automated Testing System). You'll need to install `bats` before running the tests.

#### Installation Options:

**macOS (using Homebrew):**
```bash
brew install bats-core
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install bats
```

**Fedora/RHEL:**
```bash
sudo dnf install bats
```

**Using npm:**
```bash
npm install -g bats
```

**From source:**
```bash
git clone https://github.com/bats-core/bats-core.git
cd bats-core
sudo ./install.sh /usr/local
```

For more installation options and detailed instructions, see the [official bats-core installation guide](https://bats-core.readthedocs.io/en/stable/installation.html).

## Tests

To run the tests, run `.ci/test.sh`

## Lint

* Plugin: `.ci/lint-plugin.sh`
* Shell files `.ci/lint-shell.sh`