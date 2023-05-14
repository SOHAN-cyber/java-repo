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
        stage ('Approval Stage') {
            input {
               message "Do you want to proceed for production deployment?"
            }
            steps {
                sh 'echo done'
            }
        }
        stage ('Deploy to Kubernetes') {
            steps {
            sh 'export BUILD_NUMBER=${BUILD_NUMBER}'
            sh 'echo $BUILD_NUMBER'
            sh  'envsubst < deployment.yaml  | kubectl apply -f -'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}