#!/bin/sh -eu
set -eu # This needs to be here for windows bash, which doesn't read the #! line above

detected_os=$(uname -sm)
echo detected_os = $detected_os
BINARY_OS=${BINARY_OS:-}
BINARY_ARCH=${BINARY_ARCH:-}
FILE_EXT=${FILE_EXT:-}

if [ "$BINARY_OS" == "" ] || [ "$BINARY_ARCH" == "" ] ; then 
    case ${detected_os} in
    'Darwin arm64')
        BINARY_OS=osx
        BINARY_ARCH=arm64
        ;;
    'Darwin x86' | 'Darwin x86_64' | "Darwin"*)
        BINARY_OS=osx
        BINARY_ARCH=x86_64
        ;;
    "Linux aarch64"* | "Linux arm64"*)
        BINARY_OS=linux
        BINARY_ARCH=arm64
        ;;
    'Linux x86_64' | "Linux"*)
        BINARY_OS=linux
        BINARY_ARCH=x86_64
        ;;
    "Windows"* | "MINGW64"*)
        BINARY_OS=windows
        BINARY_ARCH=x86_64
        ;;
    "Windows"* | "MINGW"*)
        BINARY_OS=windows
        BINARY_ARCH=x86
        ;;
      *)
      echo "Sorry, os not determined"
      exit 1
        ;;
    esac;
fi


tools=(
  # pact 
  pact-broker
  pact-message
  pact-mock-service
  pact-plugin-cli
  pact-provider-verifier
  pact-stub-service
  pactflow
)

for tool in ${tools[@]}; do
  echo testing $tool
  if [ "$BINARY_OS" != "windows" ] ; then echo "no bat file ext needed for $(uname -a)" ; else FILE_EXT=.bat; fi
  if [ "$BINARY_OS" = "windows" ] && [ "$tool" = "pact-plugin-cli" ] ; then  FILE_EXT=.exe ; else echo "no exe file ext needed for $(uname -a)"; fi
  echo executing ${tool}${FILE_EXT} 
  if [ "$BINARY_ARCH" = "x86" ] && [ "$tool" = "pact-plugin-cli" ] ; then  echo "skipping for x86" ; else ${tool}${FILE_EXT} help; fi
done


