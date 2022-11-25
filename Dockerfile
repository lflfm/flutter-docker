# syntax=docker/dockerfile:1

# ##
# ## Flutter SDK
# ##
FROM ubuntu:20.04 as fluttersdk

RUN apt-get update 
RUN apt-get install -y curl git wget unzip
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Disable analytics
RUN flutter config --no-analytics

# Run flutter doctor
RUN flutter doctor

# Ensure master channel & flutter is up-to-date
RUN flutter channel master
RUN flutter upgrade
# RUN flutter config --enable-web - don't think this is needed
RUN flutter precache
