#!/bin/bash

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "${WORKING_DIRECTORY}" ]; then
    echo "WORKING_DIRECTORY is missing"
    exit 1
fi

cd ${WORKING_DIRECTORY} && firebase deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --project ${FIREBASE_PROJECT} \
    --only hosting
