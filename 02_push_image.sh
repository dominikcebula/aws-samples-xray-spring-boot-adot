#!/bin/bash

docker tag aws-xray-spring-boot-sample:latest 748487307014.dkr.ecr.eu-central-1.amazonaws.com/samples/aws-xray-spring-boot-sample:latest
docker push 748487307014.dkr.ecr.eu-central-1.amazonaws.com/samples/aws-xray-spring-boot-sample:latest
