pipeline{
    agent any
	stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bharathks0007/swe645']]])
            }
        }
		stage('Build Docker Image'){
			steps{
				script{
					sh 'rm -rf *.war'
					sh 'jar -cvf sweassignment2.war css images index.html'
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
}
