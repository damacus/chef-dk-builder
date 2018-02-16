#!/bin/sh
set +o pipefail

export DESCRIPTION="Docker image for building ChefDK based builds"

if ! [[ -e .docker/external_functions.sh ]];then
  wget -O ".docker/external_functions.sh" "https://raw.githubusercontent.com/damacus/docker-build-scripts/master/functions.sh"
fi

source ".docker/external_functions.sh"
