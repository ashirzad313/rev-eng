FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y \
	build-essential \
	libreadline-dev \
	g++ \
	valgrind \
	gdb \
	vim \
	nano \
	git

RUN apt-get install -y \
	python3-pip python3-dev

RUN git clone https://github.com/pwndbg/pwndbg.git /pwndbg
WORKDIR /pwndbg
RUN ./setup.sh  # Run Pwndbg setup script
RUN echo source /pwndbg/gdbinit.py > ~/.gdbinit

