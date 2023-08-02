pipeline {
    agent any
    
    environment {
        // Set your Artifactory credentials here
        ARTIFACTORY_USER = credentials('ARTIFACTORY_USER')
        ARTIFACTORY_PASS = credentials('ARTIFACTORY_PASSWORD')
        ARTIFACTORY_URL = 'https://benatl.jfrog.io/artifactory/'
        MAVEN_HOME = tool 'Maven'
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Use any necessary checkout step for your version control system
                // e.g., git or svn
            }
        }
        
        stage('Compile and Package') {
            steps {
                sh "${MAVEN_HOME}/bin/mvn -B -s settings.xml clean package -Dmaven.test.skip=true"
            }
        }
        
        stage('Publish to Artifactory') {
            steps {
                script {
                    def buildInfoProperties = readProperties file: 'target/classes/META-INF/build-info.properties'
                    def buildName = "spring-petclinic"
                    def buildNumber = buildInfoProperties['build.number']
                    
                    def deployParams = [
                        server: [
                            id: 'artifactory',
                            username: ARTIFACTORY_USER,
                            password: ARTIFACTORY_PASS,
                            url: ARTIFACTORY_URL
                        ],
                        deployer: [
                            releaseRepo: 'libs-release-local',
                            snapshotRepo: 'libs-snapshot-local'
                        ],
                        buildInfo: [
                            name: buildName,
                            number: buildNumber,
                            started: currentBuild.startTimeInMillis,
                            durationMillis: currentBuild.durationInMillis,
                            principal: currentBuild.cause.first().userId,
                            artifactoryPluginVersion: "3.14.1"
                        ]
                    ]
                    
                    // Deploy the artifacts to Artifactory
                    rtMavenRun deployerId: 'artifactory', goals: "deploy", deployer: deployParams.deployer, deployerResolver: deployParams.deployer, deployerServer: deployParams.server
                    
                    // Publish build info to Artifactory
                    rtPublishBuildInfo serverId: 'artifactory', buildInfo: deployParams.buildInfo
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}

