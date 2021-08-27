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
    }
    agent {
        docker {
            image 'tomcat:8-jre8'
            }
          steps{
             sh './webapp.war /usr/local/tomcat/webapps'  
        }
    }
    
 }
}
