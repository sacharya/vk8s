// Environment variables don't work within agent docker. So defining a variable outside the pipeline.
def DEPLOYMENT_TOOLS_IMAGE="dreamoid/deployment-tools:latest"
pipeline {
    agent any

    stages {
        stage('Plan') {
            environment {
                VSPHERE_CREDENTIALS_ID=""
            }
            agent {
                docker {
                    image "$DEPLOYMENT_TOOLS_IMAGE"
                    registryUrl "https://hub.docker.com"
                    
                }
            }
            steps {
                echo 'Planning..'
                sh '''
                    make -e plan
                '''
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
