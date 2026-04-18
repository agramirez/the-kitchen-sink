FROM debian:trixie-20260316

RUN apt update && apt upgrade -y

RUN mkdir /workspace
WORKDIR /workspace

# install basic tools
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y git
RUN apt install -y libclang-dev clang

# install rocq tools
RUN apt-get install -y linux-libc-dev
RUN apt-get install -y m4
RUN apt-get install -y opam
RUN apt-get install -y time
RUN apt-get install -y zip
RUN apt-get install -y zsh
RUN apt-get install -y libgmp3-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pkg-config

# install erlang v27.3 and compatible elp version
ARG ELP_VERSION=elp-linux-x86_64-unknown-linux-gnu-otp-27.3
ENV ELP_URL=https://github.com/WhatsApp/erlang-language-platform/releases/download/2026-02-27
ENV ELP_DIR=/usr/local/elp

RUN apt install -y erlang=1:27.3.4.1+dfsg-1+deb13u1
RUN mkdir $ELP_DIR \
    && wget $ELP_URL/$ELP_VERSION.tar.gz -P $ELP_DIR \
    && tar -xzf $ELP_DIR/$ELP_VERSION.tar.gz -C $ELP_DIR \
    && chmod +rx $ELP_DIR/elp \
    && ln -s $ELP_DIR/elp /usr/local/bin

ENV REBAR_DIR=/usr/local/rebar3
RUN wget https://s3.amazonaws.com/rebar3/rebar3 -P $REBAR_DIR \
    && chmod +rx $REBAR_DIR/rebar3 \
    && ln -s $REBAR_DIR/rebar3 /usr/local/bin

# install rust
RUN apt install -y build-essential rustup

# install rocq
ARG USERNAME=cis5000
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update -y

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME --shell /bin/zsh \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

COPY hack.sh /tmp/hack.sh
RUN chmod +x /tmp/hack.sh
RUN /tmp/hack.sh
COPY .zshrc /home/$USERNAME/
USER $USERNAME

RUN opam init -y --disable-sandboxing --compiler=5.3.0
RUN opam switch 5.3.0
RUN opam install -y num
RUN opam repo add -y coq-released https://coq.inria.fr/opam/released
RUN opam pin add -y coq 9.0.0
RUN opam install -y coq-simple-io
RUN opam install -y vscoq-language-server
RUN opam update -y
RUN opam upgrade -y
RUN eval `opam config env`

RUN rustup default stable

# install latex
RUN sudo apt install -y texlive-full 

# install graphviz
RUN sudo apt install -y graphviz

# install plantuml
ARG PLANTUML_VERSION=1.2026.2
ENV PLANTUML_URL=https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar
ENV PLANTUML_DIR=/usr/share/plantuml
RUN sudo apt install -y plantuml
RUN sudo wget ${PLANTUML_URL}  -O /usr/share/plantuml/plantuml.jar

# install dotnet
RUN wget https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb
RUN sudo apt-get update && sudo apt-get install -y dotnet-sdk-10.0
RUN sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-10.0

CMD ["sleep","infinity"]