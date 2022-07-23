#!/bin/bash

set -e

pwd

ARCH=$(uname -m)

if [ -z "${IMAGE_ORG}" ]; then
  IMAGE_ORG="openebs"
fi

# Specify the date of build
DBUILD_DATE=$(date +'%Y-%m-%dT%H:%M:%SZ')

# Specify the docker arg for repository url
if [ -z "${DBUILD_REPO_URL}" ]; then
  DBUILD_REPO_URL="git@github.com:brezezee/libcstor.git"
fi

# Specify the docker arg for website url
if [ -z "${DBUILD_SITE_URL}" ]; then
  DBUILD_SITE_URL="https://openebs.io"
fi

if [ -z "${CSTOR_ORG}" ]; then
  CSTOR_ORG="brezezee"
fi

DBUILD_ARGS="--build-arg CSTOR_ORG=${CSTOR_ORG} --build-arg DBUILD_DATE=${DBUILD_DATE} --build-arg DBUILD_REPO_URL=${DBUILD_REPO_URL} --build-arg DBUILD_SITE_URL=${DBUILD_SITE_URL} --build-arg ARCH=${ARCH}"

REPO_NAME="$IMAGE_ORG/cstor-base-amd64"
DOCKERFILE_BASE="cstor-base.Dockerfile"
DOCKERFILE="Dockerfile"

## Building image for cstor-base
echo "Build image ${REPO_NAME}:ci with BUILD_DATE=${DBUILD_DATE}"
cd docker
pwd
 docker build -f ${DOCKERFILE_BASE} -t ${REPO_NAME}:ci ${DBUILD_ARGS} ../.. && \
 cd ..

if [ "${ARCH}" = "x86_64" ]; then
	REPO_NAME="$IMAGE_ORG/cstor-pool-amd64"
elif [ "${ARCH}" = "aarch64" ]; then
	REPO_NAME="$IMAGE_ORG/cstor-pool-arm64"
fi 

echo "Build image ${REPO_NAME}:ci with BUILD_DATE=${DBUILD_DATE}"
pwd
cd docker && \
 docker build -f ${DOCKERFILE} -t ${REPO_NAME}:ci ${DBUILD_ARGS} . && \
 cd ..