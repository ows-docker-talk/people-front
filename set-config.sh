#!/bin/bash

[[ -z "${ENVIRONMENT}" ]] && environ='local' || environ="${ENVIRONMENT}"
cp "./public/config.${environ}.json" "./public/config.json"