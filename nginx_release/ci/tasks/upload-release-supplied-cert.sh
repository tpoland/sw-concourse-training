#!/usr/bin/env bash
set -x
#For the purpose of this tutorial, there are credentials being commited here.
#This is on purpose and will be covered in the security tutorial.
#The director is expected to be secured and only locally available for this lab session
#But this does not demonostrate a best practice

export BOSH_DEPLOYMENT=tpoland-nginx
export BOSH_DIRECTOR='https://10.4.1.4:25555'
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=kDuaJ8nD0Ky5GGLXntsFeg88M934a3
export BOSH_ENVIRONMENT='training'

ls ./
ls /tmp/build/get

bosh alias-env ${BOSH_ENVIRONMENT} --ca-cert /tmp/build/get/training-bosh.pem -e ${BOSH_DIRECTOR}
bosh login

cd source-code/nginx_release
bosh upload-release releases/release.gz
