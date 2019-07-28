FROM centos:centos6.10

SHELL ["/bin/bash", "-x", "-c"]

RUN cat /etc/redhat-release ; \
        env | sort ; \
        pwd ; \
        cat /etc/passwd ; \
        who ; \
        whoami ; \

CMD ["/bin/bash"]
