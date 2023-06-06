pipeline {
    agent any 
        tools {
        jdk 'JDK 17'
    }

    stages {
        stage('Compile stage') {
            steps {
                sh './mvnw clean compile'
            }
        }

        stage('Testing stage') {
            steps {
                sh './mvnw test'
            }
        }

        stage('Docker Build stage') {
            steps {
                script {
                    docker.build("spring-petclinic")
                }
            }
        }
    }
}
