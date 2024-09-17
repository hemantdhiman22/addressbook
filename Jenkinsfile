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

         // Stage3 : artifacts to AWS S3
        stage ('publish to AWS S3'){
            steps {
                withAWS(region:'ap-south-1', credentials:'cicdApp'){
                s3Upload(bucket:"cicdapp", workingDir:'target', includePathPattern:'**/*.war'); 
            }
            }
        }
        
    }
}
