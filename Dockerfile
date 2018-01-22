FROM maven:3

#RUN echo "deb http://ftp.debian.org/debian/ jessie main" > /etc/apt/sources.list \
# && echo "deb http://ftp.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list \

## Prereq
RUN apt-get --quiet update \
 && apt-get --quiet install --yes --no-install-recommends apt-transport-https ca-certificates \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && echo "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" >> /etc/apt/sources.list \
 && curl -fsSL http://updatesite.sierrawireless.com/legato-spm/debian/legato-spm.key | apt-key add - \
 && echo "deb http://updatesite.sierrawireless.com/legato-spm/debian release/" >> /etc/apt/sources.list \
 && apt-get --quiet update \
 && apt-get --quiet install --yes --no-install-recommends \
			make gcc g++ xmlindent tofrodos devscripts fakeroot build-essential debhelper mini-dinstall docker-ce python-jinja2 python-pkg-resources ninja-build zip autoconf automake \
			python3 python3-apt python3-requests \
			swicwe \
 && apt-get clean
