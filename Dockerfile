FROM centos:centos6.10

SHELL ["/bin/bash", "-x", "-c"]

RUN echo "out release" && ( cat /etc/redhat-release || echo OUCH )
RUN echo "out env" && ( env | sort || echo OUCH )
RUN echo "out pwd" && ( pwd || echo OUCH )
RUN echo "out whoami" && ( whoami || echo OUCH )
RUN echo "out id" && ( id || echo OUCH )

CMD ["/bin/bash"]
