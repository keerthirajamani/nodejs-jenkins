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
                dockerImage = docker.build registry
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
                    sh "docker run -p 3000:3000 $registry"
                }
            }
        }
    }
    /*
    stage('Cleaning up') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
    */
    stage('Pull Mysql and Deploy') {
        agent {
            docker {
                image 'mysql/mysql-server'
                args '--name jenkins-mysql -e MYSQL_ROOT_PASSWORD=mysql_password -d'
                }
            }
            steps {
                sh 'mvn test -DforkCount=0'
                sh '''
                    docker exec some-mysql sh -c 'exec mysql < ./db/dump.sql
                    '''
            }
            /*post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }*/
        }
    }
}

