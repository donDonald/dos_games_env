FROM ubuntu:20.04
MAINTAINER Pavel Taranov <pavel.a.taranov@gmail.com>




#To skip setting itimezonei, to set timezone: echo "Australia/Adelaide" | sudo tee /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive




# Basic tools and dosbox itself
RUN apt update \
 && apt install -y wget \
                   curl \
                   tree \
                   gawk \
                   zip \
                   lsof \
                   mc \
                   vim \
                   net-tools \
                   iproute2 \
                   x11-apps \
                   alsa-base \
                   alsa-utils \
                   pulseaudio \
                   libsndfile1-dev \
                   mplayer \ 
                   dosbox \
 && apt clean \
# Setup mc \
 && echo "regex/i/\.(md|log|txt|js|json|ejs|yml|j2|cfg|xml|sql|py|ipynb|sh)$\n    Include=editor" | tee -a /etc/mc/mc.ext




# Create user
####ARG UID=2100
####ARG GID=2100
####ENV USER=dos_games_env
####ENV USER_NAME=$USER
####RUN groupadd --gid $GID $USER_NAME \
#### && useradd --uid $UID --gid $GID --shell /bin/bash --create-home $USER_NAME
ENV USER=dos_games_env
ENV USER_NAME=$USER
RUN useradd --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME

# Setup vim
RUN echo "set tabstop=4\nset shiftwidth=4\nset softtabstop=4\nset expandtab" | tee -a /home/$USER_NAME/.vimrc \
 && echo "export EDITOR=vim" | tee -a /home/$USER_NAME/.bashrc




COPY --chown=$USER_NAME:$USER_NAME \
     files/entrypoint.sh \
     files/sysinfo.sh \
     files/test.sh \
     files/bash.sh \
     files/test_sound.sh \
     /home/$USER_NAME/




ENTRYPOINT /home/$USER_NAME/entrypoint.sh

