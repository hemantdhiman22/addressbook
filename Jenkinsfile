pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
    }

    environment {
        ArtifactId = readMavenPom().getArtifactId()
        GroupId = readMavenPom().getGroupId()
        Version = readMavenPom().getVersion()
    }
    stages {
        // Specify various stage with in stages

        // stage 1. Build
        stage ('Build'){
            steps {
                sh 'mvn clean install package'
            }
        }

        // Stage2 : Testing
        stage ('Test'){
            steps {
                echo ' testing......'

            }
        }

         // Stage3 : artifacts to nexus
        stage ('publish to nexus'){
            steps {
                nexusArtifactUploader artifacts: 
                [[artifactId: "${ArtifactId}", 
                classifier: '', 
                file: 'target/addressbook.war', 
                type: 'war']], 
                credentialsId: '2', 
                groupId: "${GroupId}",
                nexusUrl: '10.0.151.68:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'addressbook-RELEASE',
                version: "${Version}"
            }
        }
    }

}