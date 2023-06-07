pipeline {
    agent any
    tools{
        jdk 'jdk20'
    }

    stages {
        stage('Build JAR') {
            steps {
                script {
                    // This will print the final name of the artifact
                    def mavenOutput = sh(script: 'mvn help:evaluate -Dexpression=project.build.finalName -q -DforceStdout', returnStdout: true).trim()
                    // Store the JAR name for late stages
                    env.JAR_NAME = "${mavenOutput}.jar"
                }
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                //This runs any tests in th projec
               sh 'mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Copy the JAR to the Docker context
                sh "cp target/${env.JAR_NAME} ."
                // Build the Docker image
                sh 'docker build -t pet-clinic .'
            }
        }
    }
}