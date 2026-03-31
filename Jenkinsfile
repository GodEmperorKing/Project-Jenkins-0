pipeline {                             // 1. Opens the whole Pipeline
    agent any
    environment {                      // 2. Opens Environment
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY')
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY')
    }                                  // 2. Closes Environment

    stages {                           // 3. Opens the Stages list
        stage('Terraform Init') {      // 4. Opens Init Stage
            steps {                    // 5. Opens Init Steps
                sh 'terraform init -reconfigure'
            }                          // 5. Closes Init Steps
        }                              // 4. Closes Init Stage

        stage('Terraform Apply') {     // 6. Opens Apply Stage
            steps {                    // 7. Opens Apply Steps
                sh 'terraform apply -reconfigure -auto-approve'
            }                          // 7. Closes Apply Steps
        }                              // 6. Closes Apply Stage
    }                                  // 3. Closes the Stages list
}                                      // 1. Closes the whole Pipeline
