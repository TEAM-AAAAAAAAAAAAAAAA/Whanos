#!/usr/bin/env bash

set -e

GCP_PROJECT_ID=$1
REPO_LANGUAGE=$2

[ -f Dockerfile ] && \
sudo docker build . -t "$GCP_PROJECT_ID"/whanos-"$REPO_LANGUAGE" ||
sudo docker build . -t "$GCP_PROJECT_ID"/whanos-"$REPO_LANGUAGE" -f images/"$REPO_LANGUAGE"/Dockerfile.standalone

sudo docker push "$GCP_PROJECT_ID"/whanos-"$REPO_LANGUAGE"
