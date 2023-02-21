#!/usr/bin/env bash

set -e

curl -L https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c "echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"
sudo apt update
sudo apt install jenkins -y
service jenkins restart
