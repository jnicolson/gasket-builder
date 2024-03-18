# Coral Gasket Driver builder

The Google [Coral AI Accelerators](https://coral.ai) require a driver called Gasket.  The version linked from the Coral website does not work on recent kernel versions, an updated version is available at https://github.com/google/gasket-driver/ but no pre-built packages exist.

This repository contains a Docker file to build the deb package to install on recent kernel versions, to avoid installing development dependencies on production servers.

## Instructions

```
git clone https://github.com/jnicolson/gasket-builder
cd gasket-builder
docker build --output . .
```

Docker will download and build the driver and then output a .deb file into the current directory
