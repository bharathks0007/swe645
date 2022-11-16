pipeline{
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
}
