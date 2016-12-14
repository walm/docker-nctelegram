ncTelegram in Docker
====================

[Docker](https://docs.docker.com/installation/) containerized version of [ncTelegram](https://github.com/Nanoseb/ncTelegram)

### Usage

First authenticate with Telegram using `telegram-cli`

    $ mkdir -p $HOME/.telegram-cli && chmod -R go+rw $HOME/.telegram-cli && \
      docker run --rm -it -v $HOME/.telegram-cli:/home/telegram/.telegram-cli walm/nctelegram telegram-cli

Once authenticated just do

    $ docker run --rm -it -v $HOME/.telegram-cli:/home/telegram/.telegram-cli walm/nctelegram

Note: It runs as user with UID `72356` to avoid running as `root`.

### Feedbacks

Having more issues? [Report a bug on GitHub](https://github.com/walm/docker-nctelegram/issues).

There is still stuff left to get working, like open file and notifications, but it's a start ;)



