#!/bin/sh
# Get the registration token from:
# http://localhost:8080/$user/$project/-/settings/ci_cdsettings/ci_cd -> Runners -> Expand

registration_token=CUV3hzmSvdnFNbbgXy_s
tag_list="docker"
docker exec -it gitlab-runner \
  gitlab-runner register \
    --docker-privileged \
    --tag-list ${tag_list} \
    --non-interactive \
    --registration-token ${registration_token} \
    --description docker-stable \
    --url http://gitlab.local \
    --clone-url http://gitlab.local \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab-network