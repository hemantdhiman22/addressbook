pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
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
                nexusArtifactUploader artifacts: [[artifactId: 'addressbook', classifier: '', file: 'target/addressbook.war', type: 'war']], credentialsId: '2', groupId: 'com.edurekademo.tutorial', nexusUrl: '10.0.151.68:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'addressbook-SNAPSHOT', version: '2.1'
            }
        }
    }

}