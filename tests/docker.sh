#!/usr/bin/env bash

set -e

test_whanos() {
    local repo_url=$1
    local repo_dest=$2
    local lang=$3
    [ -d "$repo_dest" ] || git clone "$repo_url" "$repo_dest"
    cd "$repo_dest"
    pwd
    sudo docker build ~/dev/Whanos/jenkins/images/"$lang" -t whanos-"$lang" \
    -f ~/dev/Whanos/jenkins/images/"$lang"/Dockerfile.base
#    sudo docker push whanos-"$lang"
}

test_whanos https://github.com/TEAM-AAAAAAAAAAAAAAAA/Whanos-test-c.git /tmp/Whanos-test-c c
test_whanos https://github.com/TEAM-AAAAAAAAAAAAAAAA/Whanos-test-python.git /tmp/Whanos-test-python python
