pipeline {
    agent any
tools {
  maven 'MAVEN-3.9'
}
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/SOHAN-cyber/java-repo.git'
            }
        }
        stage ('Building Docker Image') {
            steps {
                sh 'docker build -t dogra21703/java_code:latest .'
                sh 'docker image tag dogra21703/java_code:latest dogra21703/java_code:${BUILD_NUMBER}'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '10', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push dogra21703/java_code:latest'
                    sh 'docker push dogra21703/java_code:${BUILD_NUMBER}'
}
            }
        }
        stage ('Deploy to EC2') {
            steps {
               sh 'echo done'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}