pipeline {
  agent any
  environment {
    REPO="centos610"
    PRIVATE_REPO="jc7.srmstar.org:5000/${REPO}"
  }
  stages {
    stage ('Env Dump') {
      steps {
        script {

         COMMIT = "${GIT_COMMIT.substring(0,8)}"
         TAG = 'latest'
        }
        sh 'printenv | sort'
      }
    }
    stage ('Docker Build') {
      steps {
        sh "docker build --no-cache -f Dockerfile -t ${REPO}:${COMMIT} ./"
      }
      post {
        success {
          println "tag image"
          sh "docker image tag ${REPO}:${COMMIT} ${PRIVATE_REPO}:${TAG}"
        }
      }
    }
    stage ('Docker Run') {
      steps {
        sh "docker run -d --name 'jenkins-${BUILD_NUMBER}' ${REPO}:${COMMIT}"
      }
    }
    stage ('Software Build') {
      // agent {
      //   docker {
      //     image "${REPO}:${COMMIT}"
      //   }
      // }
      steps {
        sh "docker exec jenkins-${BUILD_NUMBER} /bin/bash -c 'touch /tmp/fromjenkins'"
        sh "docker exec jenkins-${BUILD_NUMBER} /bin/bash -c '/bin/ls -la /tmp/fromjenkins'"
        // sh 'cat /etc/redhat-release || echo OUCH'
        // sh 'env | sort || echo OUCH '
        // sh 'pwd || echo OUCH'
        // sh 'whoami || echo OUCH'
        // sh 'id || echo OUCH'
        // sh 'touch /tmp/fromjenkins || echo OUCH'
        // sh '/bin/ls -la /tmp/fromjenkins || echo OUCH'
        sh
      }
    }
  }
}
