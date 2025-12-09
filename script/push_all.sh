#!/bin/bash

REGISTRY="ghcr.io/kdw8219"

docker push $REGISTRY/ingress-rust:latest
docker push $REGISTRY/robot-api-gateway:latest
docker push $REGISTRY/grpc-robot-api:latest
docker push $REGISTRY/auth-service:latest
docker push $REGISTRY/robot-service:latest
docker push $REGISTRY/user-service:latest
docker push $REGISTRY/django-ssr:latest
