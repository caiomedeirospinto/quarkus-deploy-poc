#!/bin/bash

./mvnw clean package \
	-Dquarkus.container-image.build=true \
	-Dquarkus.kubernetes-client.trust-certs=true \
	-Dquarkus.kubernetes.deploy=true \
	-Dquarkus.openshift.route.expose=true \
	-Dquarkus.openshift.name=greeting \
	-Dquarkus.openshift.readiness-probe.http-action-path=/greeting \
	-Dquarkus.openshift.liveness-probe.http-action-path=/greeting
