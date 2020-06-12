#!/bin/bash

[[ -z "${ENVIRONMENT}" ]] && environ='local' || environ="${ENVIRONMENT}"
cp "./src/config/environ.${environ}.js" "./src/config/environ.js"