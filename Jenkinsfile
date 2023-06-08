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

        stage('Dependency Check') {
            steps {
                //runs owasp dependency check
                sh 'mvn org.owasp:dependency-check-maven:check'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Copy the JAR to the Docker context
                sh "cp target/${env.JAR_NAME} ."
                // Build the Docker image
                sh "docker build --build-arg JAR_FILE=${env.JAR_NAME} -t pet-clinic ."
            }
        }
        // another check i would add. We don't always know what is in the base image
        /* stage('Container Security Scan') {
            steps {
                script {

                    def anchoreImage = docker.build('pet-clinic')
                    sh "echo 'docker.io/library/${anchoreImage.id}' > anchore_images"
                    sh 'anchore-cli image add docker.io/library/${anchoreImage.id}'
                    sh 'anchore-cli evaluate check docker.io/library/${anchoreImage.id}'
                }
            }
        } */
        
    }
}
