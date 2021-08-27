pipeline {
    agent {
        docker {
            image 'maven:3.3-jdk-8'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Start Tomcat') { 
        docker {
            image 'tomcat:8-jre8'
            }
        }
        stage('Build'){
            steps{
             sh './webapp.war /usr/local/tomcat/webapps'  
          }
        }   
    }
}
 
