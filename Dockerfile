FROM ubuntu:24.04 as build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends git devscripts dkms dh-dkms build-essential debhelper

COPY patch.diff ./
RUN git clone https://github.com/google/gasket-driver.git
RUN cd gasket-driver && patch -p1 < /patch.diff && debuild -us -uc -tc -b

FROM scratch AS export-stage
COPY --from=build-stage *.deb .