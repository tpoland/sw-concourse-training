#!/usr/bin/env bash
set -x
#For the purpose of this tutorial, there are credentials being commited here.
#This is on purpose and will be covered in the security tutorial.
#The director is expected to be secured and only locally available for this lab session
#But this does not demonostrate a best practice

export BOSH_DEPLOYMENT=${GITHUB_USERNAME}-nginx
export BOSH_DIRECTOR=$(bosh int creds.yml --path /bosh_url)
# export BOSH_CLIENT=admin
# export BOSH_CLIENT_SECRET=<replace-me>
export BOSH_ENVIRONMENT='10.4.1.4'
export CA_CERT_URL=https://s3.us-east-2.amazonaws.com/dg-training-concourse/training-bosh.pem

cd source-code/nginx_release

curl -LO ${CA_CERT_URL}
bosh alias-env --ca-cert training-bosh.pem -e ${BOSH_DIRECTOR} training-bosh

bosh login

bosh upload-release releases/release.gz
