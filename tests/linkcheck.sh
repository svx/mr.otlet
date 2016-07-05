#!/bin/bash
set -e
bash tests/check_commits.sh | while read -r line ; do docker run -i --rm -v ${PWD}/docs:/build/docs:rw -u $(id -u):$(id -g) quay.io/tiramisu/mr.docs linkcheck $line; done
