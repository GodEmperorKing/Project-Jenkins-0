pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
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
                // -parallelism=1 keeps the t3.micro from freezing!
                sh 'terraform apply -auto-approve -parallelism=1'
            }
        }
    }
}
