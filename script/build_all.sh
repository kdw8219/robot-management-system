#!/bin/bash

REGISTRY="ghcr.io/kdw8219"

echo "Building ingress-rust..."
docker build -t $REGISTRY/ingress-rust:latest ../ingress-rust

echo "Building robot-api-gateway..."
docker build -t $REGISTRY/robot-api-gateway:latest ../robot-api-gateway

echo "Building auth-service..."
docker build -t $REGISTRY/auth-service:latest ../auth-service/auth_service

echo "Building robot-service..."
docker build -t $REGISTRY/robot-service:latest ../robot-service

echo "Building user-service..."
docker build -t $REGISTRY/user-service:latest ../user-service

echo "Building django-ssr..."
docker build -t $REGISTRY/django-ssr:latest ../django-ssr

echo "All builds complete!"
