\# AWS Terraform Remote State Project



\## Overview



In this project I configured Terraform to use remote state storage instead of local state. The state file is stored in an S3 bucket and state locking is handled using a DynamoDB table.



This setup is commonly used in team environments to allow multiple engineers to work on the same infrastructure safely without corrupting the Terraform state file.



\---------------------------------------------------------------------------------------------------------------------------------------



\## Infrastructure Created



This project provisions the following AWS resources:



\- S3 bucket for Terraform remote state storage

\- S3 bucket versioning to protect state history

\- DynamoDB table for Terraform state locking



\---------------------------------------------------------------------------------------------------------------------------------------



\## Why Remote State Matters



By default, Terraform stores state locally on a machine. This can be dangerous in team environments because:



\- The state file can be lost if a machine is lost

\- Multiple engineers can overwrite the state file

\- There is no locking to prevent concurrent changes



Using S3 and DynamoDB solves these problems by storing the state remotely and locking the state during Terraform runs.



\---------------------------------------------------------------------------------------------------------------------------------------



\## Terraform Backend Configuration



This project uses an S3 backend with DynamoDB locking. After creating the backend resources, the Terraform state was migrated from local storage to the S3 backend.



\---------------------------------------------------------------------------------------------------------------------------------------



\## Terraform Workflow Used



terraform init  

terraform fmt  

terraform validate  

terraform plan  

terraform apply  



After backend migration:



terraform init (backend migration)  

terraform plan  



\---------------------------------------------------------------------------------------------------------------------------------------



\## What I Learned



This project helped me understand how Terraform state works, why remote state is important, and how teams collaborate safely using Terraform with state locking.



\---------------------------------------------------------------------------------------------------------------------------------------



\## Project Structure



