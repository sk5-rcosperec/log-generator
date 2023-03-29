# log-generator
A quick log-generator easily customizable.

## To run in docker
```
docker run -e "LOGS_GENERATOR_LINES_TOTAL=10" -e "LOGS_GENERATOR_DURATION=5s" -e "LOGS_GENERATOR_MODE=json" ghcr.io/sk5-rcosperec/log-generator:v0.33
```

## To run in kubernetes in a deployment (recommended approach for stress test)
Custom the env variable in kube-manifest/log-deployment to tune the number of log lines.
```
kubectl apply -f kube-manifest/log-deployment.yaml -n $YOURNAMESPACE
```

