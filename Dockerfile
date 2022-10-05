FROM brunneis/python:3.7.7-ubuntu-bionic

COPY ./requirements.txt /tmp/requirements.txt
COPY . .

RUN apt-get update && apt-get install -y build-essential && apt-get install -y git

RUN pip3 install -r /tmp/requirements.txt && \
    rm -rf /tmp

RUN git clone https://github.com/radareorg/radare2 && cd radare2 && ./sys/install.sh && \
    git clone https://github.com/matrix1001/welpwn && cd welpwn && python3 setup.py install

RUN git clone https://github.com/matrix1001/glibc-all-in-one.git && \
    cd glibc-all-in-one && \
    ./update_list
