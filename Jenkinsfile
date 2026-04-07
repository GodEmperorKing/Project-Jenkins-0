pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_IN_AUTOMATION   = 'true'
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
        stage('Terraform Plan') {
            steps {
                // Generates the blueprint and saves it as 'tfplan'
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Applies ONLY the exact plan generated in the previous step
                // -parallelism=1 keeps the t3.micro from freezing!
                sh 'terraform apply -parallelism=1 tfplan'
            }
        }
    }
}
