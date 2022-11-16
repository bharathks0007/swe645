pipeline {
    stages{
        stage('Build Docker Image'){
            steps{
                script{
			  checkout scm
			  sh 'rm -rf *.war'
			  sh 'jar -cvf sweassignment2.war -C WebContent/ .'
                    def customImage = docker.build("bharathks007/swe645survey:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Image To Hub'){
            steps{
                script{
                    sh "docker login -u bharathks007 -p Iamactivating_4"
                    sh "docker push bharathks007/swe645survey:${env.BUILD_NUMBER}"
				}
			}
		}
		stage("Deploying to Kubernetes"){
			steps{
				script{
					sh "kubectl set image deployment/assignment2dep swe645survey=bharathks007/swe645survey:${env.BUILD_NUMBER}"
				}
			}
		}
	}
}pipeline {
    agent any
    tools {
        maven '3.8.6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/imran1609/SWE645Assign2']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    def customImage = docker.build("imran1609/sweassign2:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Image To Hub'){
            steps{
                script{
                    sh "docker login -u imran1609 -p imran1609"
                    sh "docker push imran1609/sweassign2:${env.BUILD_NUMBER}"
				}
			}
		}
		stage("Deploying to Kubernetes"){
			steps{
				script{
					sh "kubectl set image deployment/assignment2dep sweassign2=imran1609/sweassign2:${env.BUILD_NUMBER}"
				}
			}
		}
	}
}
