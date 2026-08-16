pipeline {

  agent any

  stages {

    stage('checkout') {
      steps {
        echo "chaeckout"
        checkout scm
      }
    }

  stage('Install') {
      steps {
        echo "install"
        sh "npm ci"
      }
    }  

    stage('Test') {
      steps {
        echo "run tests"
        sh "npm test"
      }
    }  

    stage('Build image') {
      steps {
        echo "build docker image"
        sh 'Docker build -t jenkins:${BUILD_NUMBER} -t jenkins:latest .' // name of project
      }
    }  

    stage('Deploy') {
      steps {
        echo "run new version on port 8001"
        sh 'docker run -d --name greets-live -p 8001:8000 jenkins:latest'
      }
    }  
  }

  post {
    success {
      echo "the pipleline was success"
    }

    failure {
      echo "something is wrong"
    }
  }
  
}