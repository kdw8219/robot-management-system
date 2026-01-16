#!/bin/bash
kubectl delete configmap -n robot-system kafka-broker-env kafka-ui-env timescaledb-env ingress-env auth-env robots-env user-env django-env realtime-control-gateway-env grpc-robot-gateway-env redis-env redis-config nginx-config kafka-scripts timescale-init

kubectl delete -f ../k8s/base/workloads.yaml -n robot-system
