#!/bin/bash


# compiler ubuntu
cd docker && \
    docker build -f compiler.Dockerfile -t compiler-ubuntu:ci . && \
    cd ..

# cstor ubuntu
cd docker && \
    docker build -f base.Dockerfile -t cstor-ubuntu:ci . && \
    cd ..

