#!/bin/bash
# set -e # halt script on error
# set -x # print commands as they are executed
# set pipefail # when a command in a pipeline fails, that return code will be used as the return code of the whole pipeline
# set -o posix # more strict failures in subshells

powershell.exe -Command "nssm stop gptweb"
echo "Successfully stopped gptweb"

rm -rf build/app/*
echo "Successfully removed build/app/*"

powershell.exe -Command "yarn build"
echo "Successfully built the project with yarn"

mkdir -p build/app/.next
echo "Successfully created directory build/app/.next"

cp -r public build/app/public
echo "Successfully copied public to build/app/public"

cp -r .next build/app/
echo "Successfully copied .next to build/app/"

mv build/app/.next/standalone/* build/app
echo "Successfully moved build/app/.next/standalone/* to build/app"

cp .env build/app/.env
echo "Successfully copied .env to build/app/.env"

powershell.exe -Command "nssm start gptweb"
echo "Successfully started gptweb"
