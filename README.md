# AWS X-Ray Spring Boot Sample

## Introduction

AWS X-Ray setup with sample Spring Boot Application

## AWS X-Ray Configuration

1. Install `cert-manager`

```shell
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml
```

2. Install X-Ray EKS add-on

```shell
aws eks create-addon --addon-name adot --cluster-name cluster-01
```

3. Create Service Account for Otel Collector

```shell
eksctl utils associate-iam-oidc-provider \
  --region=eu-central-1 \
  --cluster=cluster-01 \
  --approve
```

```shell
eksctl create iamserviceaccount \
    --name adot-collector \
    --namespace default \
    --cluster cluster-01 \
    --region eu-central-1 \
    --attach-policy-arn arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess \
    --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy \
    --approve \
    --override-existing-serviceaccounts
```

4. Install Collector Configuration

```shell
kubectl apply -f deployment/02-collector-config-xray.yaml
```

## References

* https://aws-otel.github.io/docs/getting-started/adot-eks-add-on/requirements
* https://aws-otel.github.io/docs/getting-started/adot-eks-add-on/installation
* https://aws-otel.github.io/docs/getting-started/adot-eks-add-on/config-xray
* https://aws-otel.github.io/docs/getting-started/adot-eks-add-on/config-auto-instrumentation
