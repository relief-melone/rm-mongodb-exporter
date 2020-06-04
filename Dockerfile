FROM alpine:latest

ARG MONGO_EXPORTER_VERSION="0.11.0"

LABEL maintainer="Relief.Melone [relief.melone@gmail.com]"

# Download Exporter
RUN apk add curl && \
    curl -L --output exporter.tar.gz \
      https://github.com/percona/mongodb_exporter/releases/download/v0.11.0/mongodb_exporter-0.11.0.linux-amd64.tar.gz

# Install Exporter
RUN tar -xzvf exporter.tar.gz && \
    chgrp root mongodb_exporter && \
    chmod 770 mongodb_exporter && \
    mv mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

CMD [ "/bin/mongodb_exporter" ]