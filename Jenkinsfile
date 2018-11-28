// Environment variables don't work within agent docker. So defining a variable outside the pipeline.
def DEPLOYMENT_TOOLS_IMAGE="dreamoid/deployment-tools:latest"
pipeline {
    // https://issues.jenkins-ci.org/browse/JENKINS-51307
    agent {
        dockerfile {
            args '--entrypoint=\'\''
        }
    }

    stages {
        stage('Checkout') {
          agent any
          steps {
            deleteDir()
              checkout scm
          }
        }
        stage('Plan') {
            environment {
                VSPHERE_CREDENTIALS_ID=""
            }
            agent {
                docker {
                    image "$DEPLOYMENT_TOOLS_IMAGE"
                    registryUrl "https://registry.hub.docker.com"
                }
            }
            steps {
                echo 'Planning..'
                sh "make -e plan"
            }
        }
        stage('Apply') {
            environment {
                VSPHERE_CREDENTIALS_ID=""
            }
            agent {
                docker {
                    image "$DEPLOYMENT_TOOLS_IMAGE"
                    registryUrl "https://registry.hub.docker.com"
                }
            }
            steps {
                echo 'Applying..'
                sh "make -e apply"
            }
        }
        stage('Validate') {
            environment {
                VSPHERE_CREDENTIALS_ID=""
            }
            agent {
                docker {
                    image "$DEPLOYMENT_TOOLS_IMAGE"
                    registryUrl "https://registry.hub.docker.com"
                }
            }
            steps {
                echo 'Validating..'
            }
        }
    }
}
