FROM ubuntu:14.04
MAINTAINER Alex McLain <alex@alexmclain.com>
RUN apt-get -qq update
RUN apt-get -y install git wget
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
ENV PATH $HOME/.rbenv/bin:$PATH
ENV PATH $HOME/.rbenv/shims:$PATH
# RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
CMD /bin/bash
