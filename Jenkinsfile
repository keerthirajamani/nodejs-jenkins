/*node {
  withEnv(['PATH_DOCKER=/usr/local/bin']) {
    sh echo 'My name is $PATH_DOCKER'
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
*/

pipeline {
environment {
registry = "keerthirajamani/nodejsrepo"
registryCredential = 'Aug1995!'
dockerImage = ''
}
agent any
stages {
stage('Cloning our Git') {
steps {
git 'https://github.com/keerthirajamani/nodejs-jenkins.git'
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
}
}
}
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}