# https://hub.docker.com/_/centos/
FROM centos:latest

MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

RUN yum install -y \
	java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
	ruby \
	git \
		&& yum clean all