FROM ubuntu:16.04

# Locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8

# Colors and italics for tmux
COPY xterm-256color-italic.terminfo /root
RUN tic /root/xterm-256color-italic.terminfo
ENV TERM=xterm-256color-italic

COPY  tmux.conf_back /root/.tmux.conf
COPY  vimrc_back /root/.vimrc

#insicando apt utils
RUN apt-get update && apt-get install -y apt-utils software-properties-common

# Common packages
RUN apt-get update && apt-get install -y \
      gcc \
      gpp \ 
      gdb \
      tmux \
      vim \
      npm \
      git \
      python-pip \
      wget \
      curl \
      g++ \
      htop


RUN npm -g i n
RUN n lts
#RUN rm /usr/bin/odejs
#RUN ln -s 'which node' /usb/bin/nodejs


# Install docker
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&\
      echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list &&\
      apt-get install -y apt-transport-https &&\
      apt-get update &&\
      apt-get install -y docker-engine
RUN  curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)" &&\
     chmod +x /usr/local/bin/docker-compose


RUN pip install --upgrade pip 
RUN npm -g i npm



#addons vim
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/scrooloose/nerdtree.git /root/.vim/bundle/nerdtree