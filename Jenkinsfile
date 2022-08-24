node {
  withEnv(['PATH_DOCKER=/usr/local/bin']) {
    sh echo 'My name is $PATH_DOCKER'
  }
     def app 
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
        sh 'env'
      //app = docker.build("keerthirajamani/jenkins_test")
    }
     stage('Test Image'){ //scan image
       app.inside {
         sh 'echo "TEST Success"'
      }  
    }
     stage('Push Image'){
       docker.withRegistry('https://registry.hub.docker.com', 'git') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")   
   }
}
}
