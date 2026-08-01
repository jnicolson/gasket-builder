FROM ubuntu:24.04 AS build-stage

COPY ./patches /patches

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends git curl devscripts dkms dh-dkms build-essential debhelper

RUN git clone https://github.com/google/gasket-driver.git
RUN cd gasket-driver && git apply /patches/*
RUN cd gasket-driver && debuild -us -uc -tc -b

FROM scratch AS export-stage
COPY --from=build-stage *.deb .
