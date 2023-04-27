#!/usr/bin/env bash

set -e
set -o pipefail
set -u

export GCP_SECRET_ENV_NAME=secret_name
export GCP_SECRET_ENV_VALUE=secret_value

for var_name in "${!GCP_SECRET@}"; do
  echo "##### var name"
  echo $var_name

  echo "##### var value"
  echo "${!var_name}"
done
