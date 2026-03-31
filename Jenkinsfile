pipeline {
    agent any
    environment {
        // This maps your Jenkins credentials to Terraform variables
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY')
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init -reconfigure'
            }
        }
        stage('Terraform Apply') {
            steps {
                // -auto-approve is key so Jenkins doesn't wait for you to type 'yes'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
