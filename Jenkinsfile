pipeline {
    agent any
    tools {
  maven 'Maven'
}
    stages {
        stage ('Git Clone') {
            steps {
                git 'https://github.com/SOHAN-cyber/java-repo.git'
            }
        }
        stage ('Creating a Docker Image') {
            steps{
               sh 'docker build -t dogra21703/tomcat_test:${BUILD_ID} .'
               sh 'docker image tag dogra21703/tomcat_test:${BUILD_ID} dogra21703/tomcat_test:latest'
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([string(credentialsId: '30', variable: 'password')]) {
                 sh 'docker login -u dogra21703 -p $password'
                 sh 'docker push dogra21703/tomcat_test:${BUILD_ID}'
                 sh 'docker push dogra21703/tomcat_test:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
             ansiblePlaybook become: true, inventory: '/etc/ansible/hosts', playbook: 'docker.yaml'   
            }
        }
    }
    post {
        always{
            cleanWs()
        }
    }
}
