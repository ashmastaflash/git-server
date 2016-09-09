FROM centos:7
MAINTAINER Ash Wilson

COPY config/cloudpassage.repo /etc/yum/repos.d/
RUN rpm --import http://packages.cloudpassage.com/cloudpassage.packages.key

RUN yum install -y epel-release

RUN yum install -y \
    cgit \
    cphalo \
    git \
    httpd

COPY config/cgit-web.conf /etc/httpd/conf.d/

RUN useradd -d /opt/git -s /usr/bin/git-shell git && \
    echo "scan-path=/opt/git/" >> /etc/cgitrc

CMD /usr/sbin/httpd
