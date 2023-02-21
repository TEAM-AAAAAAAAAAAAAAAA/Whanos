#!/usr/bin/env bash

set -e

curl https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c "echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"
apt-get update
apt-get install jenkins -y
service jenkins restart
