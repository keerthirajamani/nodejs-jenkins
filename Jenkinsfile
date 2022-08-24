node {
  withEnv(['PATH+JAVA=/usr/local/bin']) {
    ...
  }
     def app 
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
        sh 'env'
      app = docker.build("keerthirajamani/jenkins_test")
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
<<<<<<< HEAD:jenkinsfile

/usr/local/bin
=======
>>>>>>> 65238c54453dda5d7481ab633e8dcfc9026019de:Jenkinsfile
