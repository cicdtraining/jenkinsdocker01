FROM centos:centos6.10

SHELL ["/bin/bash", "-x", "-c"]

RUN echo "out release" && ( cat /etc/redhat-release || echo OUCH )
RUN echo "out env" && ( env | sort || echo OUCH )
RUN echo "out pwd" && ( pwd || echo OUCH )
RUN echo "out whoami" && ( whoami || echo OUCH )
RUN echo "out id" && ( id || echo OUCH )
RUN echo "out touch" && ( touch /tmp/fromdocker-root || echo OUCH )
RUN echo "out list" && ( /bin/ls -la /tmp/fromdocker-user || echo OUCH )
RUN echo "out ls workspace" && ( /bin/ls -la /opt/tomcat/jenkins-master-b/jenkins-home/workspace/docker-as-user* || echo OUCH )

RUN echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@ CHANGE USER @@@@@@@@@@@@@@@@@@@@@@@@@@@"
RUN groupadd -g 1100 buildgrp ; \
    useradd  -u 1100 -m -g buildgrp buildusr ; \
    yum install -y sudo ; \
    echo "buildusr ALL=(ALL) NOPASSWORD: ALL" >> /etc/sudoers
WORKDIR /home/buildusr
USER buildusr

RUN echo "out pwd" && ( pwd || echo OUCH )
RUN echo "out whoami" && ( whoami || echo OUCH )
RUN echo "out id" && ( id || echo OUCH )
RUN echo "out touch" && ( touch /tmp/fromdocker-buildusr || echo OUCH )
RUN echo "out list" && ( /bin/ls -la /tmp/fromdocker-buildusr || echo OUCH )

CMD ["/bin/bash"]
