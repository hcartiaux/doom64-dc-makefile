FROM ubuntu:24.04

RUN apt-get update && apt-get install -y make

ADD . /build

RUN make -C /build/01_kallistios
RUN make -C /build/02_mkdcdisc
RUN make -C /build/03_doom64 clone

ENTRYPOINT ["/build/docker-entrypoint.sh"]
