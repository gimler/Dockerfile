#++++++++++++++++++++++++++++++++++++++
# Ubuntu 15.04 Bootstrap Docker container
#++++++++++++++++++++++++++++++++++++++

FROM ubuntu:15.04
MAINTAINER info@webdevops.io

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Add common scripts (from _localscripts)
ADD scripts.tar ./

# Init bootstrap (and install ansible)
RUN export DEBIAN_FRONTEND=noninteractive \
    && set -x \
    # Fix root terminal
    && echo "export TERM=xterm" >> /root/.bashrc \
    # System update
    && /usr/local/bin/apt-upgrade \
    # Generate locales
    && ln -s /usr/share/i18n/SUPPORTED /var/lib/locales/supported.d/all \
    && locale-gen \
    # Install base stuff
    && /usr/local/bin/apt-install \
        software-properties-common \
        lsb-release \
    && apt-add-repository multiverse \
    # Install ansible
    && /usr/local/bin/apt-install \
        python-dev \
        python-pip \
    && pip install ansible
