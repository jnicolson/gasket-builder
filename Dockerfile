FROM ubuntu:22.04 as build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends git devscripts dkms build-essential debhelper

RUN git clone https://github.com/google/gasket-driver.git
RUN cd gasket-driver && debuild -us -uc -tc -b

FROM scratch AS export-stage
COPY --from=build-stage /build/*.deb .