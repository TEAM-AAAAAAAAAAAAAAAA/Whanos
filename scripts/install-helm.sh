#!/usr/bin/env bash

set -e

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 -o get_helm.sh
sudo bash get_helm.sh
