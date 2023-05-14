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
                sh 'mvn clean package'
            }
        }
        stage ('Deploy to Kubernetes') {
            steps {
                sh 'echo ${BUILD_ID}'
               sh 'kubectl apply -f deployment.yaml  -l BUILD_ID=${BUILD_ID} '
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}