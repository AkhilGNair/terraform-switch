#!/bin/bash -eu

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

TERRAFORM_VERSION="$1"

# Platform versions available from https://releases.hashicorp.com/terraform/*/
PLATFORM_VERSION="linux_amd64"

TERRAFORM_CACHE="${HOME}/.cache/terraform-versions"
mkdir -p "${TERRAFORM_CACHE}"

cache_miss=$(ls "${TERRAFORM_CACHE}/terraform${TERRAFORM_VERSION}" > /dev/null 2>&1; echo $?)

if [ "${cache_miss}" -ne 0 ];
then
  msg "Downloading terraform $1"
  mkdir -p /tmp/terraform/
  wget --quiet --output-document=/tmp/terraform.zip \
    https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${PLATFORM_VERSION}.zip \
    && unzip -qo /tmp/terraform.zip -d /tmp/terraform \
    && mv /tmp/terraform/terraform "${TERRAFORM_CACHE}/terraform${TERRAFORM_VERSION}" \
    && rm -rf /tmp/terraform.zip /tmp/terraform/ \
    && chmod +x "${TERRAFORM_CACHE}/terraform${TERRAFORM_VERSION}"
fi

msg "Switching to terraform $1"
tf_bin="/usr/local/bin/terraform"
rm -f ${tf_bin} && ln -s "${TERRAFORM_CACHE}/terraform${TERRAFORM_VERSION}" ${tf_bin}

msg "Done!"
