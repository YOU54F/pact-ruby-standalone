#!/bin/bash -e
#
# Usage:
#   $ curl -fsSL https://raw.githubusercontent.com/you54f/pact-ruby-standalone/ruby_3.1.2_upgrade/install.sh | bash
# or
#   $ wget -q https://raw.githubusercontent.com/you54f/pact-ruby-standalone/ruby_3.1.2_upgrade/install.sh -O- | bash
#

case $(uname -sm) in
  'Linux x86_64')
    os='linux-x86_64'
    ;;
  'Linux aarch64')
    os='linux-arm64'
    ;;
  'Darwin arm64')
    os='osx-arm64'
    ;;
  'Darwin x86' | 'Darwin x86_64')
    os='osx-x86_64'
    ;;
  *)
  echo "Sorry, you'll need to install the pact-ruby-standalone manually."
  exit 1
    ;;
esac

tag=$(basename $(curl -fs -o/dev/null -w %{redirect_url} https://github.com/you54f/pact-ruby-standalone/releases/latest))
filename="pact-${tag#v}-${os}.tar.gz"

curl -LO https://github.com/you54f/pact-ruby-standalone/releases/download/${tag}/${filename}
tar xzf ${filename}
rm ${filename}

