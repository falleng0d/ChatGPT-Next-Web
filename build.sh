#!/usr/bin/env bash
docker build --tag gptweb .
docker run -d --name gptweb gptweb
docker cp gptweb:/app ./build/app
docker stop gptweb
docker rm gptweb
