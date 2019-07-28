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
          COMMIT = "$GIT_COMMIT.substring(0,8)"
        }
        // test
        sh 'printenv | sort'
      }
    }
    stage ('Docker Build') {
      steps {
        sh "docker build -f Dockerfile -t ${REPO}:${COMMIT} ./"
      }
    }
    stage ('Software Build') {
      steps {
        sh '/bin/ls -la /opt'
      }
    }
  }
}
