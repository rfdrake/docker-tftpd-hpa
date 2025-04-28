Docker tftpd-hpa container.

# tftpd-hpa

tftpd-hpa is a very common server for tftpd.  From the tftpd manpage:

    tftpd - Trivial File Transfer Protocol server

    tftpd is a server for the Trivial File Transfer Protocol. The TFTP protocol is extensively used to support remote booting of diskless devices.  The server is normally started by inetd, but can also run standalone.


# Acknowledgements

Lots of ideas for this came from two docker projects:

    https://github.com/kalaksi/docker-tftpd/
    https://github.com/drerik/docker-tftpd/

My main motivation for yet another simple docker tftpd was to make one that
automatically updates when new package versions come out, and not have it
locked to a specific version of ubuntu/alpine/etc.

tftpd is a very stable protocol, but also insecure.  If a new vulnerability is
found I'd rather the package update immediately rather than wait until someone
sees it out of date.

# Running the container

    docker pull ghcr.io/rfdrake/tftpd-hpa
    docker run -it --rm -p "69:69/udp" -v $(pwd):/var/lib/tftpboot --name tftpd rfdrake/tftpd-hpa

# How to install

If you are running on amd64 you can get the docker container from
ghcr.io/rfdrake/tftpd-hpa.  Otherwise you can clone and build the image.

## Build

    git clone https://github.com/rfdrake/tftpd-hpa
    docker buildx build -t rfdrake/tftpd-hpa .
