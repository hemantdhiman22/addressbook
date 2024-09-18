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
        // stage 2: codeDeploy
        stage('codedeploy'){
          steps {
            step([$class: 'AWSCodeDeployPublisher', applicationName: 'cicdApp', deploymentGroupAppspec: false, deploymentGroupName: 'cicdAppDeploymentGroup', excludes: '', iamRoleArn: '', includes: 'target/*.war', proxyHost: '', proxyPort: 0, region: 'ap-south-1', s3bucket: 'cicdapp', s3prefix: 'cicd-app-', subdirectory: '', versionFileName: '', waitForCompletion: false])
           }
        }
        
    }
}
