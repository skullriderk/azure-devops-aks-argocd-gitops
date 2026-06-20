#!/bin/bash
set -x
set -e

APP_NAME=$1
IMAGE_REPOSITORY=$2
IMAGE_TAG=$3

REPO_URL="https://<USERNAME>:<PAT_TOKEN>@dev.azure.com/<ORG>/<PROJECT>/_git/<REPO_NAME>"

rm -rf /tmp/temp_repo

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: githubproject.azurecr.io/$IMAGE_REPOSITORY:$IMAGE_TAG|g" k8s-specifications/$APP_NAME-deployment.yaml

git config user.email "azurepipeline@example.com"
git config user.name "Azure Pipeline"

git add .

git commit -m "Update $APP_NAME image to $IMAGE_TAG"

git push

rm -rf /tmp/temp_repo