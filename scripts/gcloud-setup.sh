#!/usr/bin/env bash

set -eu

PROJECT_USER=$1
PROJECT_ID=$2
PROJECT_REGION=$3
GCP_CREDENTIALS=$4

gcloud auth activate-service-account "$PROJECT_USER"@"$PROJECT_ID".iam.gserviceaccount.com --key-file="$GCP_CREDENTIALS" --project="$PROJECT_ID"
gcloud auth configure-docker "$PROJECT_REGION"-docker.pkg.dev
# gcloud config set disable_prompts true
gcloud config set compute/region "$PROJECT_REGION"
gcloud container clusters get-credentials "$PROJECT_ID"-gke
