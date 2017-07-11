FROM       centos:7
MAINTAINER Jose Castro Leon <jose.castro.leon@cern.ch>

ENV PLUGINS ep_adminpads ep_headings ep_markdown git+https://github.com/Piotr-Pht-Jasiek/ep_padlist.git#b48973cb49a0f55a46ee32db3d4ab800be4ad887 git+https://gitlab.cern.ch/cloud-infrastructure/ep_oauth2.git

# Install epel-release & then the rest
RUN yum -y install epel-release && \
    yum -y install openssl npm node git

WORKDIR   /var/lib/etherpad

# Grab the latest Git version and install deps and plugins
RUN cd /var/lib && \
    git clone https://gitlab.cern.ch/cloud-infrastructure/etherpad-lite.git etherpad
RUN /var/lib/etherpad/bin/installDeps.sh
RUN npm --silent install $PLUGINS

# Add settings.json
COPY settings.json ./
# Add startup script
COPY docker-entrypoint.sh ./

# A few workarounds so we can run as non-root on openshift
COPY fix-permissions.sh ./
RUN  mkdir /.npm && \
     ./fix-permissions.sh /.npm && \
     ./fix-permissions.sh /var/lib/etherpad

# Run as a random user. This happens on openshift by default so we
# might as well always run as a random user
USER 1001

# Listens on 9001 by default
EXPOSE 9001
ENTRYPOINT ["./docker-entrypoint.sh"]
