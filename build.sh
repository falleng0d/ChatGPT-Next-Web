#!/usr/bin/env bash
# set -e # halt script on error
# set -x # print commands as they are executed
# set pipefail # when a command in a pipeline fails, that return code will be used as the return code of the whole pipeline
# set -o posix # more strict failures in subshells

rm -rf build/app/*
yarn build
mkdir -p build/app/.next
cp -r public build/app/public
cp -r .next build/app/
mv build/app/.next/standalone/* build/app
cp .env build/app/.env
