#!/bin/bash -eu

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

TERRAFORM_VERSION="$1"

msg "Installing terraform $1"

wget --quiet --output-document=/tmp/terraform.zip \
  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_darwin_amd64.zip \
  && unzip -qo /tmp/terraform.zip -d /usr/local/bin \
  && rm -f /tmp/terraform.zip \
  && chmod +x /usr/local/bin/terraform

msg "Done!"
