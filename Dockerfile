FROM centos:centos6
MAINTAINER Leandro Guillen <leandro.guillen@imdea.org>

# Setup FIWARE repo
RUN echo -e "[testbed-fi-ware]\n\
name=Fiware Repository\n\
baseurl=http://repositories.testbed.fi-ware.org/repo/rpm/x86_64/\n\
gpgcheck=0\n\
enabled=1\n" > /etc/yum.repos.d/testbed-fi-ware.repo

# Install Orion
RUN yum -y install contextBroker

EXPOSE 1026
ENTRYPOINT ["/usr/bin/contextBroker"]
