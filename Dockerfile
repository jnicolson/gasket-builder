FROM ubuntu:24.04 AS build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends git curl devscripts dkms dh-dkms build-essential debhelper

RUN git clone https://github.com/google/gasket-driver.git
RUN cd gasket-driver && curl -L https://github.com/heitbaum/gasket-driver/commit/4b2a1464f3b619daaf0f6c664c954a42c4b7ce00.patch | git apply -v
RUN cd gasket-driver && debuild -us -uc -tc -b

FROM scratch AS export-stage
COPY --from=build-stage *.deb .
