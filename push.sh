#!/usr/bin/env bash

project="$1"
hub_user="$2"

# Ensure we have a project id.
if [[ "$#" -lt 2 ]]; then
    printf "Usage: $0 \e[4mGCP_PROJECT\e[0m \e[4mHUB_USER\e[0m\n"
    exit 1
fi

# Change into this directory.
cd "$(cd "$(dirname "$0")" && pwd)"

# Submit the build.
printf "\n\e[38;5;116mSubmitting build.\e[0m\n"
gcloud builds submit \
    --project "$project" \
    --substitutions "_DOCKER_HUB_REPO=${hub_user}" \
    --config ./cloudbuild.yaml .
