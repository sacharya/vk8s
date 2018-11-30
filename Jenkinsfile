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
                withCredentials([
                usernamePassword(credentialsId: 'vsphere_user_credentials_id', vsphere_user: 'USERNAME', vsphere_password: 'PASSWORD'),
                usernamePassword(credentialsId: 'vsphere_vcp_user_credentials_id', vsphere_vcp_user: 'USERNAME', vsphere_vcp_password: 'PASSWORD'),
                usernamePassword(credentialsId: 'vm_user_credentials_id', vm_user: 'USERNAME', vm_password: 'PASSWORD')
                ]) {
                  echo "username is $USERNAME"
                  echo "password is $PASSWORD"

                  sh "make -e plan-init"
                }
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
