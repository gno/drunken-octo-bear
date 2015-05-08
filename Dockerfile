FROM ubuntu-debootstrap:precise
# 
MAINTAINER cmtg@digitalguardian.com

# nodejs repos

ADD . /opt/armor5/rp

RUN apt-get -q update && \
    apt-get -q -y install --no-install-recommends \
    daemontools \
    iptables  \
    lsof \
    pwgen \
    runit \
    socklog \
    isc-dhcp-client \
    net-tools \
    && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/* ; echo ok
   

RUN apt-get -q update  \
    && apt-get -q -y install --no-install-recommends apt-transport-https wget \
    && echo 'deb https://deb.nodesource.com/node precise main' > /etc/apt/sources.list.d/nodesource.list\
    && wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && apt-get -q update  \
    && apt-get -q -y install --no-install-recommends libxml2 nodejs build-essential python2.7 





RUN  cd /opt/armor5/rp && \
     npm install \
     && apt-get -q -y --purge install build-essential- perl- \
     && apt-get -q -y --purge autoremove \
     && rm -r /tmp/npm* \
     && rm -r /root/.npm\
     && rm -f /var/lib/apt/lists/*  




