// Environment variables don't work within agent docker. So defining a variable outside the pipeline.
def DEPLOYMENT_TOOLS_IMAGE="dreamoid/deployment-tools:latest"
pipeline {
    agent any

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
            steps {
                echo 'Planning..'
                sh "make -e plan-init"
            }
        }
        stage('Apply') {
            environment {
                VSPHERE_CREDENTIALS_ID=""
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
            steps {
                echo 'Validating..'
            }
        }
    }
}
