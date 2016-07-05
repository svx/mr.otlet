#!/bin/bash
set -e
docker run -i --rm -v ${PWD}/docs:/build/docs:rw -u $(id -u):$(id -g) quay.io/tiramisu/mr.docs html
