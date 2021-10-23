FROM nvcr.io/nvidia/pytorch:21.08-py3


# install system
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --fix-missing -y \
    build-essential \
    clang-format \
    clang-tidy \
    curl \
    gdb \
    libxcb-xkb1 \
    git \
    pkg-config \
    python3-pip \
    swig \
    time \
    unzip \
    vim \
    wget \
    yasm \
    python3-dev \
    locales \
    zsh \
    sudo \
    bash-completion \
    ffmpeg \
    && \
    rm -rf /var/lib/apt/lists/* \
    && \
    locale-gen "en_US.UTF-8"

# symlink python3 to python
RUN ln -s /usr/bin/python3 /usr/local/bin/python


# env
ARG GID=1001
ARG UID=1001
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US \
    LC_ALL=en_US.UTF-8

RUN groupadd -g ${GID} devel && \
    useradd -ms /bin/bash -u ${UID} -g ${GID} devel && \
    echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
ENV SHELL bash
USER devel:devel
WORKDIR /home/devel
COPY --chown=devel:devel user /home/devel

RUN wget https://code-server.dev/install.sh && \
    sh install.sh --version 3.11.1 --method=standalone && \
    rm install.sh && \
    sudo chown -R devel:devel /home/devel/.local
RUN wget https://github.com/microsoft/vscode-cpptools/releases/download/1.5.1/cpptools-linux.vsix && \
    /home/devel/.local/bin/code-server --install-extension cpptools-linux.vsix && \
    /home/devel/.local/bin/code-server --install-extension twxs.cmake && \
    /home/devel/.local/bin/code-server --install-extension ms-vscode.cmake-tools && \
    /home/devel/.local/bin/code-server --install-extension ms-python.python && \
    /home/devel/.local/bin/code-server --install-extension mhutchie.git-graph && \
    /home/devel/.local/bin/code-server --install-extension christian-kohler.path-intellisense

# install python
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

