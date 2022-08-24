pipeline {
environment {
registry = "keerthirajamani/nodejsrepo"
registryCredential = 'e6f03bbc-a426-42d7-b8d9-eced80a1e6d7'
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

stage('Pull docker image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.pull()
//sh "docker run -p 1257:1257 ${registry}:$BUILD_NUMBER"
}
}
}
}

stage('Invoke New Pipeline') {
        steps{
                build job: 'Git'
        }
    }




/*
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
*/
}
}