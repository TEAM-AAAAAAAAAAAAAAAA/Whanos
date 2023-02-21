#!/usr/bin/env bash

set -e

curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
echo "b6769d8ac6a0ed0f13b307d289dc092ad86180b08f5b5044af152808c04950ae  kubectl" | shasum -c
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
