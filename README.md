# 🚀 Project Jenkins-0: Automated S3 Deployment
    **Authored by:** GodEmperorKing (Samael)
    
    ## 📖 Overview
    This project demonstrates a fully automated CI/CD pipeline integrating **GitHub**, **Jenkins**, and **Terraform** to deploy secure AWS infrastructure. The goal was to establish a 'Green Light' deployment process triggered by code commits, ensuring infrastructure-as-code (IaC) best practices.
    
    ## 🛠️ Tech Stack
    * **Cloud:** AWS (S3, IAM, EC2)
    * **IaC:** Terraform
    * **CI/CD:** Jenkins (running on Amazon Linux 2023)
    * **Automation:** GitHub Webhooks
    
    ## 🏗️ Architecture & Security
    * **IAM Least Privilege:** The execution is handled by a dedicated `JenkinsAdminRole` attached to the EC2 instance, removing the need for hardcoded AWS credentials.
    * **Validation Stage:** A custom Groovy validation stage was injected into the pipeline to verify the trigger source and user identity before execution.
    
    ## 📊 Project Deliverables
![Jenkins Console Output Artifact](![S3 Bucket Created](s3-bucket.png)
![GitHub Webhook Trigger](webhook-trigger.png)
![Terraform Deployment in Jenkins](tf-deployment.png)
![Manual Approval Gate](t.i.q.s-greenlight-approval.png.webp)
![Jenkins Console Output Artifact](jenkins-output-console.png) 
    
    ## 🏁 Key Accomplishments
    1. **Webhook Integration:** Successful automated trigger from local development (ASUS Z13) to AWS.
    2. **State Management:** Managed S3 bucket creation and policy application via Terraform.
    3. **Clean Teardown:** Automated destruction of resources via a manual approval gate to optimize cloud costs.
