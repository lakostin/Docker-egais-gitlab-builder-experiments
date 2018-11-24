# https://hub.docker.com/_/fedora
FROM fedora:latest

LABEL MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

# We don't fair it will be fat - it intended to start faster many times. So, single download time have no many sence.
RUN dnf install -y 'dnf-command(copr)' \
	&& dnf copr enable -y ycollet/linuxmao \
	&& dnf install -y \
		docker docker-compose \
		helm kubernetes-client \
		java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
		ruby \
		git \
		httpie \
		chromium \
	&& dnf clean all

# workaround of @issue https://gitlab.com/gitlab-org/gitlab-ce/issues/22299
RUN sed -i.bak -- "s/OPTIONS='--selinux-enabled --log-driver=journald.*$/OPTIONS='--selinux-enabled --log-driver=journald --add-registry docreg.taskdata.work'/" /etc/sysconfig/docker
