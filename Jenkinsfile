pipeline {
    agent any
    environment {
        // This maps your Jenkins credentials to Terraform variables
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY')
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY')
    }
    stage('Terraform Init') {
            steps {
                sh 'terraform init -reconfigure'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -reconfigure -auto-approve'
            }
        }
    } 
} 
