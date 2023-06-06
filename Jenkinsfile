pipeline {
    agent any 
        tools {
        jdk 'JDK 17'
    }

    stages {
        stage('Compile stage') {
            steps {
                sh './mvnw clean compile'
                echo "The JAR file should be at ${WORKSPACE}/target/spring-petclinic-3.1.0-SNAPSHOT.jar"
            }
        }

        stage('List and Display File Contents') {
            steps {
                sh '''
                    find ${WORKSPACE}/subdirectory -type f -exec cat {} \;
                '''
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
