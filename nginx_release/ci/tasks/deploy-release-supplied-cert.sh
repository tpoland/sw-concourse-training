#!/usr/bin/env bash

export BOSH_DEPLOYMENT=tpoland-nginx
export BOSH_DIRECTOR=https://10.4.1.4:25555/
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=kDuaJ8nD0Ky5GGLXntsFeg88M934a3
export BOSH_ENVIRONMENT=training

bosh alias-env ${BOSH_ENVIRONMENT} --ca-cert /tmp/build/get/training-bosh.pem -e ${BOSH_DIRECTOR}
bosh login

cd source-code/nginx-release
bosh deploy --non-interactive manifests/manifest.yml
