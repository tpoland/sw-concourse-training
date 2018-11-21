#!/usr/bin/env bash
#set -x
#For the purpose of this tutorial, there are credentials being commited here.
#This is on purpose and will be covered in the security tutorial.
#The director is expected to be secured and only locally available for this lab session
#But this does not demonostrate a best practice
vault login 966f2023-2835-ccec-b543-030071abb959
vault read -tls-skip-verify secret/training/concourse/tpoland/tpoland-pipeline

set -x
cd source-code/nginx_release
bosh upload-release releases/release.gz
