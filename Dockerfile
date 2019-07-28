FROM centos:centos6.10

SHELL ["/bin/bash", "-x", "-c"]

RUN echo "out release" && ( cat /etc/redhat-release || echo OUCH )
RUN echo "out env" && ( env | sort || echo OUCH )
RUN echo "out pwd" && ( pwd || echo OUCH )
RUN echo "out passwd" && ( cat /etc/passwd || echo OUCH )
RUN echo "out who" && ( who || echo OUCH )
RUN echo "out whoami" && ( whoami || echo OUCH ) 

CMD ["/bin/bash"]
