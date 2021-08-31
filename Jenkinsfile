pipeline {

  agent { label 'cicdtest' }

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/marjook/hello-world.git'
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "valaxydeploy.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
