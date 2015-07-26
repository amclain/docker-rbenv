FROM ubuntu:14.04
MAINTAINER Alex McLain <alex@alexmclain.com>
RUN apt-get -qq update && \
    apt-get -y install git wget build-essential libssl-dev libreadline-dev
# For some reason the rbenv "install" command is only available when cloning to /root.
ENV RBENV_PATH /root/.rbenv
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_PATH
RUN git clone https://github.com/sstephenson/ruby-build.git ${RBENV_PATH}/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
ONBUILD RUN cd $RBENV_PATH; git pull
ONBUILD RUN cd ${RBENV_PATH}/plugins/ruby-build; git pull
