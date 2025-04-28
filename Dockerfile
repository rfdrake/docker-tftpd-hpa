FROM debian:stable-slim

LABEL author="Robert Drake rfdrake@users.noreply.github.com"

ENV TFTPD_BIND_ADDRESS="0.0.0.0:69"
ENV TFTPD_EXTRA_ARGS="-vvv"

# this is based on the Dockerfile from Erik Kaareng-Sunde esu@enonic.com
# and another from kalaski@users.noreply.github.com.

# Build container
#   docker buildx build -t rfdrake/tftpd .

# Start the container with the following command:
#   docker run -it --rm -p "69:69/udp" -v $(pwd):/var/lib/tftpboot --name tftpd rfdrake/tftpd-hpa

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tftpd-hpa
VOLUME /var/lib/tftpboot

EXPOSE 69/udp

# this is to silence the warnings about not using JSON syntax in CMD.  JSON
# syntax won't expand the environment variables.
SHELL [ "/bin/bash", "-c" ]
CMD set -eu ; exec /usr/sbin/in.tftpd --foreground --user tftp --address \
      "$TFTPD_BIND_ADDRESS" --secure $TFTPD_EXTRA_ARGS /var/lib/tftpboot
