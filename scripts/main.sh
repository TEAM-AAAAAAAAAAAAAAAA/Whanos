#!/usr/bin/env bash

set -e

bash /var/lib/jenkins/scripts/install-docker.sh
bash /var/lib/jenkins/scripts/install-kubectl.sh
bash /var/lib/jenkins/scripts/install-helm.sh