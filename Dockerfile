# https://hub.docker.com/_/fedora
FROM fedora:latest

LABEL MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>


# We don't fair it will be fat - it intended to start faster many times. So, single download time have no many sence.
RUN dnf install -y \
		docker docker-compose \
		kubernetes-client https://copr-be.cloud.fedoraproject.org/results/jwendell/helm/fedora-29-x86_64/00687734-helm/helm-2.7.2-1.fc28.x86_64.rpm \
		java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
		jq \
		nc \
		ruby \
		git \
		gzip which `# For sencha installer` \
		httpie \
		chromium-75.0.3770.100 \
	&& dnf clean all

# workaround of @issue https://gitlab.com/gitlab-org/gitlab-ce/issues/22299
RUN sed -i.bak -- "s/OPTIONS='--selinux-enabled --log-driver=journald.*$/OPTIONS='--selinux-enabled --log-driver=journald --add-registry docreg.taskdata.work'/" /etc/sysconfig/docker
