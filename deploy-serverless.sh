#!/bin/bash

./mvnw clean package \
	-Dquarkus.container-image.build=true \
	-Dquarkus.kubernetes-client.trust-certs=true \
	-Dquarkus.kubernetes.deploy=true \
	-Dquarkus.openshift.route.expose=true \
	-Dquarkus.openshift.name=greeting-native-serverless \
	-Dquarkus.openshift.readiness-probe.http-action-path=/greeting \
	-Dquarkus.openshift.liveness-probe.http-action-path=/greeting \
	-Pnative \
	-Dquarkus.native.container-build=true \
	-Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-mandrel:21.1-java11 \
	-Dquarkus.kubernetes.deployment-target=knative \
	-Dquarkus.container-image.group=quarkus-test \
	-Dquarkus.container-image.registry=image-registry.openshift-image-registry.svc:5000
