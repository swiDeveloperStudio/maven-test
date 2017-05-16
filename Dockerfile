FROM maven:3

## Prereq
RUN echo "deb http://ftp.debian.org/debian/ jessie main" > /etc/apt/sources.list \
 && echo "deb http://ftp.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list \
 && apt-get --quiet update \
 && apt-get --quiet install --yes --no-install-recommends apt-transport-https ca-certificates \ 
 && echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list \
 && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && apt-get --quiet update \
 && apt-get --quiet install --yes --no-install-recommends \
			make gcc g++ xmlindent tofrodos devscripts fakeroot build-essential debhelper mini-dinstall docker-engine python-jinja2 python-pkg-resources ninja-build zip autoconf automake \ 
 && apt-get clean
