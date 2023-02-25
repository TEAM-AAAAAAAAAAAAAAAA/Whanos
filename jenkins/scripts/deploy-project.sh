#!/usr/bin/env bash

set -e

GCP_PROJECT_ID=$1
REPO_LANGUAGE=$2

[ -f whanos.yml ] && \
helm upgrade whanos-"$REPO_LANGUAGE" /var/lib/jenkins/kubernetes \
--set image.name=whanos-"$REPO_LANGUAGE" \
--set image.image=eu.gcr.io/"$GCP_PROJECT_ID"/whanos-"$REPO_LANGUAGE" \
-f whanos.yml --install
