FROM ubuntu

MAINTAINER Andreas Wålm <andreas@walm.net>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
      build-essential \
      git \
      luajit \
      luarocks \
      libreadline-dev \
      libconfig-dev \
      libssl-dev \
      lua5.2 \
      liblua5.2-dev \
      libevent-dev \
      libjansson-dev \
      libpython-dev \
      python3-urwid \
      python3-psutil \
      python3-pip \
      libnotify-bin \
      caca-utils \
  && \
  git clone --recursive https://github.com/vysheng/tg.git /tg && \
  cd /tg && \
  ./configure && \
  make && \
  mv -v /tg/bin/* /usr/bin/ && \
  mkdir -vp /etc/telegram-cli/ && \
  mv -v /tg/tg-server.pub /etc/telegram-cli/server.pub && \
  cd / && rm -rf /tg/ \
  && \
  pip3 install --upgrade https://github.com/Nanoseb/ncTelegram/archive/master.tar.gz \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get purge -y --auto-remove \
      build-essential \
      git \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ \
  && \
  useradd --uid 72356 -m telegram

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER telegram

CMD ["nctelegram"]

