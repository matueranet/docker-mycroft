FROM ubuntu:16.04

MAINTAINER  Paul Scott <pscott209@gmail.com>

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install.
RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F3B1AA8B && \
  bash -c 'echo "deb http://repo.mycroft.ai/repos/apt/debian debian main" > /etc/apt/sources.list.d/repo.mycroft.ai.list' && \
  apt-get update && \
  apt-get install -y mycroft-core && \
  apt-get clean

EXPOSE 8081

CMD ["/bin/bash"]
