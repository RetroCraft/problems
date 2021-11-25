FROM gitpod/workspace-full

RUN sudo apt-get -q update && \
    sudo apt-get install -yq texlive-full && \
    sudo rm -rf /var/lib/apt/lists/*
