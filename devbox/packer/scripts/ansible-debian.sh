#!/usr/bin/env bash
set -u
set -e
set -x

# Install pip.
apt -y install libffi-dev python-setuptools python-dev sshpass
easy_install pip


# Install Ansible.
apt -y update
apt -y -t jessie-backports install ansible
