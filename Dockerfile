#FROM ubuntu
#RUN apt-get update && apt-get install -y tzdata
#RUN apt-get -y install apache2
#ADD index.html /var/www/html
#ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
#ENV name shubhamdeloitte
FROM ubuntu:20.04

# Prevent interactive tzdata configuration
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    rm -rf /var/lib/apt/lists/*

# Copy index.html into Apache's default web root
COPY index.html /var/www/html/index.html

# Expose Apache's port
EXPOSE 80

# Run Apache in the foreground
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

# Custom environment variable
ENV name=shubhamdeloitte
