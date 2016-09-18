# https://hub.docker.com/_/centos/
FROM centos:latest

MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

RUN yum install -y \
	docker \
	java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
	ruby \
	git \
		&& yum clean all

# First attempt workaround of https://gitlab.com/gitlab-org/gitlab-ce/issues/22299
RUN sed -i.bak -- "s/OPTIONS='--selinux-enabled --log-driver=journald.*$/OPTIONS='--selinux-enabled --log-driver=journald --add-registry docreg.taskdata.work:5000'/" /etc/sysconfig/docker