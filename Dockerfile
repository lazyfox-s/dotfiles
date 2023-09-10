FROM ubuntu

ARG USERNAME

RUN apt-get update && apt-get install -y \
    sudo \
    git \
    build-essential \
    locales \
    curl \
    make \
    unzip \
    zip \
    zlib1g-dev \
    iproute2\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN localedef -f UTF-8 -i ja_JP ja_JP && localedef -f UTF-8 -i en_US en_US

RUN groupadd -g 1000 ${USERNAME} \
	&& useradd -g ${USERNAME} -G sudo -m ${USERNAME} \
	&& echo "${USERNAME}:${USERNAME}" | chpasswd

RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

RUN mkdir -p "/home/${USERNAME}/.local/bin"
RUN mkdir -p "/home/${USERNAME}/.local/share"

RUN chown -R ${USERNAME}:${USERNAME} "/home/${USERNAME}/.local"

USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ENV PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
ENV MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
ENV INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
ENV HOMEBREW_NO_AUTO_UPDATE=1

COPY Brewfile /home/${USERNAME}
RUN brew bundle

RUN sh -c "$(curl -fsLS get.chezmoi.io/lb)"
ENV PATH=$PATH:/home/${USERNAME}/.local/bin

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
