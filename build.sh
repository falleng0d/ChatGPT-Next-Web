#!/usr/bin/env bash
docker build --tag gptweb .
docker run -d --name gptweb gptweb
mkdir -p ./build/app
docker cp gptweb:/app ./build
docker stop gptweb
docker rm gptweb
scp -r build/app dark-neon.local:/C:/tools/gptweb
