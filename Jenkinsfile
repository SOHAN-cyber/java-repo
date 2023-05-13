pipeline {
    agent any
    tool {
        maven 'MAVEN-3.9'
    }
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/SOHAN-cyber/java-repo.git'
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage ('Deploy to EC2') {
            steps {
                sh 'ansible-playbook -i hosts ec2-deployment.yaml'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}