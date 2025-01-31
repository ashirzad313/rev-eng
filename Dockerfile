FROM debian:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
	gdb \
	python3 \
	python3-pip \
	python3-dev \
	build-essential \
	git \
	sed \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	zip \
	sleuthkit \
	wget \
	strings \
	less \
	file \
	zip

RUN python3 -m pip install --upgrade pip --break-system-packages

RUN git clone https://github.com/pwndbg/pwndbg.git /pwndbg

RUN sed -i '56d' /pwndbg/pwndbg/commands/version.py

WORKDIR /pwndbg

RUN sed -i 's|pip install|pip install --break-system-packages|g' setup.sh

RUN python3 -m pip install --upgrade . --break-system-packages && \
	./setup.sh

WORKDIR /work

