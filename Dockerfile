FROM centos:centos6.10

SHELL ["/bin/bash", "-x", "-c"]

RUN echo "out release" && ( cat /etc/redhat-release || echo OUCH ) ; \
    "out env" && ( env | sort || echo OUCH ) ; \
    "out pwd" && ( pwd || echo OUCH ) ; \
    "out passwd" && ( cat /etc/passwd || echo OUCH ) ; \
    "out who" && ( who || echo OUCH ) ; \
    "out whoami" && ( whoami || echo OUCH ) ; \

CMD ["/bin/bash"]
