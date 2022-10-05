FROM ubuntu:18.04

COPY ./requirements.txt /tmp/requirements.txt
COPY . .

RUN apt-get update && apt-get install -y build-essential

RUN apt-get install zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz && \
    tar -xf Python-3.7.4.tgz && \
    cd Python-3.7.4 && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

RUN pip3 install -r /tmp/requirements.txt && \
    rm -rf /tmp

RUN git clone https://github.com/radareorg/radare2 && cd radare2 && ./sys/install.sh && \
    git clone https://github.com/matrix1001/welpwn && cd welpwn && python setup.py install

RUN git clone https://github.com/matrix1001/glibc-all-in-one.git && \
    cd glibc-all-in-one && \
    ./update_list
