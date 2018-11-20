# https://hub.docker.com/_/fedora
FROM fedora:latest

LABEL MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>


# We don't fair it will be fat - it intended to start faster many times. So, single download time have no many sence.
RUN yum install -y \
	docker \
	java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
	ruby \
	git \
	jq \
	httpie \
	python2*-pip \
	chromium Xvfb which xauth \
		&& yum clean all \
	&& pip2 install docker-compose==1.22.0 --upgrade `# unfortunately no rpm in EPEL repository`

# workaround of @issue https://gitlab.com/gitlab-org/gitlab-ce/issues/22299
RUN sed -i.bak -- "s/OPTIONS='--selinux-enabled --log-driver=journald.*$/OPTIONS='--selinux-enabled --log-driver=journald --add-registry docreg.taskdata.work'/" /etc/sysconfig/docker
