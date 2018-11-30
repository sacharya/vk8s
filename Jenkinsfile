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
                withCredentials([usernamePassword(credentialsId: 'vsphere_user_credentials_id', usernameVariable: 'vsphere_user', passwordVariable: 'vsphere_password'), usernamePassword(credentialsId: 'vsphere_vcp_user_credentials_id', usernameVariable: 'vsphere_vcp_user', passwordVariable: 'vsphere_vcp_password'), usernamePassword(credentialsId: 'vm_user_credentials_id', usernameVariable: 'vm_user', passwordVariable: 'vm_password')]) {
                  
                  sh '''
                    echo "vm_user_credentials_id is $vm_user $vm_password" >> output
                    echo "vsphere_user_credentials_id is $vsphere_user $vsphere_password" >> output
                    echo "vsphere_vcp_user_credentials_id is $vsphere_vcp_user $vsphere_vcp_password" >> output
                    TF_VAR_vsphere_vcp_user="$vsphere_vcp_user" TF_VAR_vsphere_vcp_password="$vsphere_vcp_password" TF_VAR_vsphere_user="$vsphere_user" TF_VAR_vsphere_password="$vsphere_password" TF_VAR_vm_user="$vm_user" TF_VAR_vm_password="$vm_password" make -e plan-init
                  '''
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
