# Pact Standalone

![Build](https://github.com/pact-foundation/pact-standalone/workflows/Build/badge.svg)

Creates a standalone pact command line executable containing

- The rust pact implementation via cargo executables

## Package contents

This version (2.5.7) of the Pact standalone executables package contains:

  * [pact-cli](https://github.com/you54f/pact-cli)
  * [pact_mock_server_cli](https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server_cli)
  * [pact-stub-server](https://github.com/pact-foundation/pact-stub-server)
  * [pact_verifier_cli](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier_cli)
  * [pact-plugin-cli](https://github.com/pact-foundation/pact-plugins/tree/main/cli)
  * [pact-broker-cli](https://github.com/pact-foundation/pact-broker-cli)

Binaries will be extracted into `pact/bin`:

```
./pact/bin/
├── pact
├── pact-broker (legacy) - use `pact broker`
├── pactflow (legacy) - use `pact pactflow`
├── pact-message (legacy) - use `pact mock` (consumer) / `pact verifier` (provider)
├── pact-mock-service (legacy) - use `pact mock`
├── pact-provider-verifier (legacy) - use `pact verifier`
└── pact-stub-service (legacy) - use `pact stub`
```

Note: from `v2.6.0+`, the legacy commands will redirect to the new cli executables built in rust.

In `v3.0.0`, the ruby runtime will be removed completely, and all commands will link to the rust executables.

Longer term, this package is likely to be deprecated, replaced with a single `pact` cli executable.

### Windows Users

Please append `.exe` to the pact binar 

eg.

```ps1
  .\pact\bin\pact.exe
```

For old wrapper scripts, use `*.bat`, eg `pact-broker.bat` which will redirect to `pact.exe broker`

## Installation

See the [release page][releases].

[releases]: https://github.com/pact-foundation/pact-standalone/releases

## Supported Platforms

Ruby is not required on the host platform, Ruby 3.3.9 is provided in the distributable.

| OS     | Architecture   | Supported |
| -------| ------------   | --------- |
| MacOS  | x86_64         | ✅        |
| MacOS  | aarch64 (arm64)| ✅        |
| Linux  | x86_64         | ✅        |
| Linux  | aarch64 (arm64)| ✅        |
| Windows| x86_64         | ✅        |
| Windows| aarch64 (arm64)| ✅        |

