FROM centos:6
RUN yum install -y openssh-clients
ADD entrypoint.sh /entrypoint.sh
ADD ssh-login /ssh-login
RUN chmod +x /ssh-login /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]